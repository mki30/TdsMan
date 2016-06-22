using Microsoft.AspNet.Identity;
using Microsoft.Owin;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.DataProtection;
using Microsoft.Owin.Security.Facebook;
using Microsoft.Owin.Security.Google;
using Owin;

namespace ebuild
{    
    public partial class Startup
    {
        internal static IDataProtectionProvider DataProtectionProvider { get; private set; }
        public void ConfigureAuth(IAppBuilder app)
        {
            DataProtectionProvider = app.GetDataProtectionProvider();
            // Enable the application to use a cookie to store information for the signed in user
            // and also store information about a user logging in with a third party login provider.
            // This is required if your application allows users to login

            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                LoginPath = new PathString("/Account/Login.aspx")
            });
            app.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie);

            // Uncomment the following lines to enable logging in with third party login providers
            //app.UseMicrosoftAccountAuthentication(
            //    clientId: "",
            //    clientSecret: "");     
            //app.UseTwitterAuthentication(
            //   consumerKey: "",
            //   consumerSecret: "");
            //AppId = "1396408247291333",
            //AppSecret = "25875b7c761df76b228395d525eab571",  

            var facebookAuthenticationOptions = new FacebookAuthenticationOptions()
            {
                AppId = Global.FacebookAppID,
                AppSecret = Global.FacebookSECRETID,
            };

            facebookAuthenticationOptions.Provider = new FacebookAuthenticationProvider()
            {          
                OnAuthenticated = async context =>
                {
                    context.Identity.AddClaim(new System.Security.Claims.Claim("FacebookAccessToken", context.AccessToken));
                    foreach (var claim in context.User)
                    {
                        var claimType = string.Format("urn:facebook:{0}", claim.Key);
                        string claimValue = claim.Value.ToString();
                        if (!context.Identity.HasClaim(claimType, claimValue))
                            context.Identity.AddClaim(new System.Security.Claims.Claim(claimType, claimValue, "XmlSchemaString", "Facebook"));
                    }
                }
            };

            facebookAuthenticationOptions.Scope.Add("email");
            app.UseFacebookAuthentication(facebookAuthenticationOptions);
            var googleAuthOptions = new GoogleOAuth2AuthenticationOptions()
            {
                ClientId = Global.GoogleAppID,
                ClientSecret = Global.GoogleSECRETID,
            };
                   
            googleAuthOptions.Provider = new GoogleOAuth2AuthenticationProvider()
            {
                OnAuthenticated = async context =>
              {
                  foreach (var claim in context.User)
                  {
                      var claimType = string.Format("{0}", claim.Key);
                      string claimValue = claim.Value.ToString();
                      if (!context.Identity.HasClaim(claimType, claimValue))
                          context.Identity.AddClaim(new System.Security.Claims.Claim(claimType, claimValue, "XmlSchemaString", "Google"));
                  }
              }
            };
            app.UseGoogleAuthentication(googleAuthOptions);
        }
    }
}
