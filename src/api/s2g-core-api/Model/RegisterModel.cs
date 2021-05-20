using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace S2G.WebAPI.Model
{
    public class RegisterModel
    {
        [Required]
        public string Name { get; set; }

        [Required]
        [EmailAddress(ErrorMessage = "Not a valid email")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "Not a valid password length", MinimumLength = 8)]
        public string Password { get; set; }
    }
}
