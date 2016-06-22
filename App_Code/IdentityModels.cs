using TDSModel;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.Entity;
using System.Web;
using System.Linq;
using System.Text;
using System.IO;

namespace ebuild
{
    public class ApplicationUser : IdentityUser
    {
        [MaxLength(100)]
        public string FirstName { get; set; }
        [MaxLength(100)]
        public string LastName { get; set; }
        [MaxLength(500)]
        public string Website { get; set; }
        [MaxLength(500)]
        public string Location { get; set; }
        public DateTime? BirthDate { get; set; }
        [MaxLength(500)]
        public string FacebookUrl { get; set; }
        [MaxLength(500)]
        public string TwitterUrl { get; set; }
        [MaxLength(500)]
        public string GoogleUrl { get; set; }
        [MaxLength(500)]
        public string LinkedInUrl { get; set; }
        [MaxLength(500)]
        public string OtherUrl { get; set; }
        public string AboutMe { get; set; }

        [MaxLength(500)]
        public string UrlName { get; set; }
        [MaxLength(100)]


        public string UserKey { get; set; }
        public int URole { get; set; }

        public int IsDisabled { get; set; }

    

       
    }

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("UsersConnectionString")
        {

        }
    }
    #region Helpers

    public class UserManager : UserManager<ApplicationUser>
    {
        public UserManager()
            : base(new UserStore<ApplicationUser>(new ApplicationDbContext()))
        {
            var provider = new Microsoft.Owin.Security.DataProtection.DpapiDataProtectionProvider("ebuild");
            UserTokenProvider = new Microsoft.AspNet.Identity.Owin.DataProtectorTokenProvider<ApplicationUser>(provider.Create("PasswordReset"));
            ////Lockout if enablesd
            //UserLockoutEnabledByDefault = Convert.ToBoolean(ConfigurationManager.AppSettings["UserLockoutEnabledByDefault"].ToString());
            //DefaultAccountLockoutTimeSpan = TimeSpan.FromMinutes(Double.Parse(ConfigurationManager.AppSettings["DefaultAccountLockoutTimeSpan"].ToString()));
            //MaxFailedAccessAttemptsBeforeLockout = Convert.ToInt32(ConfigurationManager.AppSettings["MaxFailedAccessAttemptsBeforeLockout"].ToString());

        }

        public static Boolean IsUserNameAvailable(string Username)
        {
            using (var context = new ApplicationDbContext())
            {
                return (context.Users.FirstOrDefault(x => x.UrlName.ToLower() == Username.ToLower().Trim()) != null);
            }
        }

    

        public static ApplicationUser GetUser()
        {
            UserManager manager = new UserManager();
            return manager.FindById(HttpContext.Current.User.Identity.GetUserId());
        }
        public static ApplicationUser GetUserByEmail(string email)
        {
            UserManager manager = new UserManager();
            return manager.FindByEmail(email);
        }
        public static ApplicationUser GetUserByUrlName(string urlName)
        {
            using (var context = new ApplicationDbContext())
            {
                return context.Users.FirstOrDefault(x => x.UrlName != null && x.UrlName.ToLower() == urlName.ToLower().Trim());
            }
        }

        public static string UpdateUser(ApplicationUser user)
        {
            UserManager manager = new UserManager();
            return (manager.Update(user).Succeeded ? "updated" : string.Empty);
        }

      

    }
}

namespace ebuild
{
    public static class IdentityHelper
    {
        // Used for XSRF when linking external logins
        public const string XsrfKey = "XsrfId";

        public static void SignIn(UserManager manager, ApplicationUser user, bool isPersistent)
        {
            IAuthenticationManager authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut(DefaultAuthenticationTypes.ExternalCookie);
            var identity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
            authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = isPersistent }, identity);
        }

        public const string ProviderNameKey = "providerName";
        public static string GetProviderNameFromRequest(HttpRequest request)
        {
            return request[ProviderNameKey];
        }

        public static string GetExternalLoginRedirectUrl(string accountProvider)
        {
            return "/Account/RegisterExternalLogin.aspx?" + ProviderNameKey + "=" + accountProvider;
        }

        private static bool IsLocalUrl(string url)
        {
            return !string.IsNullOrEmpty(url) && ((url[0] == '/' && (url.Length == 1 || (url[1] != '/' && url[1] != '\\'))) || (url.Length > 1 && url[0] == '~' && url[1] == '/'));
        }

        public static void RedirectToReturnUrl(string returnUrl, HttpResponse response)
        {
            if (!String.IsNullOrEmpty(returnUrl) && IsLocalUrl(returnUrl))
            {
                response.Redirect(returnUrl);
            }
            else
            {
                response.Redirect("~/");
            }
        }
    }

    #endregion
}