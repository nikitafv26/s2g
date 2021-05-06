using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace S2G.WebAPI.Helpers
{
    public class AppSettings
    {
        public string Secret { get; set; }
        public DateTime TokenExpires => DateTime.UtcNow.AddMinutes(40);
    }
}
