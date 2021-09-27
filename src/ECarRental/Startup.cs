using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ECarRental.Startup))]
namespace ECarRental
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
