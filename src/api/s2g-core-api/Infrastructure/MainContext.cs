using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using S2G.WebAPI.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace S2G.WebAPI.Infrastructure
{
    public class MainContext : IdentityDbContext<IdentityUser>
    {
        public MainContext(DbContextOptions<MainContext> options) : base(options)
        {
        }

        public DbSet<Location> Locations { get; set; }
    }
}
