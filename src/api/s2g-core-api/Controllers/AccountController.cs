using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Net;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using S2G.WebAPI.Helpers;
using S2G.WebAPI.Infrastructure;
using S2G.WebAPI.Model;

namespace S2G.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly ILogger<AccountController> _logger;
        private readonly AppSettings _appSettings;

        public AccountController(
            UserManager<IdentityUser> userManager,
            SignInManager<IdentityUser> signInManager,
            ILogger<AccountController> logger,
            IOptions<AppSettings> appSettings)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _logger = logger;
            _appSettings = appSettings.Value;
        }

        // POST: /Account/login
        // [ValidateAntiForgeryToken]
        [HttpPost("login")]
        [AllowAnonymous]
        public async Task<IActionResult> Login([FromBody] LoginDTO model)
        {
            var result = await _signInManager.PasswordSignInAsync(model.Name, model.Password, true, false); //_signInManager.PasswordSignInAsync(model.Email, model.Password, isPersistent: true, lockoutOnFailure: false);

            //Item1 SignInResult, Item2 IdentityUser
            if (result.Succeeded)
            {
                var claimsUser = await _userManager.FindByNameAsync(model.Name);
                var claims = _userManager.GetClaimsAsync(claimsUser);
                var id = new ClaimsIdentity(claims.Result);

                var token = GenerateToken(_appSettings.TokenExpires, id);

                return Ok(token);
            }
            else
                return StatusCode((int)HttpStatusCode.Unauthorized, "Incorrect password");
        }


        // POST: /Account/register
        [HttpPost("register")]
        [AllowAnonymous]
        public async Task<IActionResult> Register([FromBody] RegisterDTO model)
        {
            var user = new IdentityUser { UserName = model.Name, Email = model.Email };
            //user.Claims.Add(new IdentityUserClaim<string>
            //{ 
            //    ClaimType = "external",
            //    ClaimValue = "true"
            //});
            var result = await _userManager.CreateAsync(user, model.Password);
            if (result.Succeeded)
            {

                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                // Send an email with this link
                // string code = await UserManager.GenerateEmailConfirmationTokenAsync(user.Id);
                // var callbackUrl = Url.Action("ConfirmEmail", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);
                // await UserManager.SendEmailAsync(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>");

                var claims = _userManager.GetClaimsAsync(user);
                var id = new ClaimsIdentity(claims.Result);
                var token = GenerateToken(_appSettings.TokenExpires, id);

                _logger.LogInformation(typeof(AccountController).Name, "User registered");

                return Ok(token);
            }

            _logger.LogInformation(typeof(AccountController).Name, "User not register");

            if (result.Errors.Any(e => e.Code.Equals("DuplicateUserName")))
                return StatusCode((int)HttpStatusCode.Conflict, $"User name {model.Name} is already taken.");

            return BadRequest(result.Errors);
        }

        //
        // POST: /Account/LogOut
        [HttpPost("logout")]
        public async Task<IActionResult> LogOut()
        {
            //you can delete token on client side (may be better solution)
            //you can revoke token by set expiration value

            //code below still sucks
            await _signInManager.SignOutAsync();
            _logger.LogInformation(typeof(AccountController).Name, "User logged out");
            return Ok();
        }

        private string GenerateToken(DateTime expires, ClaimsIdentity claims)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_appSettings.Secret);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(claims),
                Expires = expires,
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }
    }
}