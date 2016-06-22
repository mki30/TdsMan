using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ebuild.Startup))]
namespace ebuild
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
