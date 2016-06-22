using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using ebuild;
using System.Configuration;

public partial class Account_Login : Page
{
    string autologin = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        registerOnEdilportaleButton.NavigateUrl = "register.aspx";
       // OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
        var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        if (!String.IsNullOrEmpty(returnUrl))
        {
            registerOnEdilportaleButton.NavigateUrl += "?ReturnUrl=" + returnUrl;
        }

        string action = Request.QueryString["action"] != null ? Request.QueryString["action"].ToString() : "",
         retUrl = Request.QueryString["ReturnUrl"] != null ? Request.QueryString["ReturnUrl"].ToString() : "";

        autologin = (Request.QueryString["autologin"] != null ? Request.QueryString["autologin"].ToString() : "");

        //if (FormsAuthentication.Authenticate("admin@gmail.com", "123"))
        //{
        //    Response.Redirect(retUrl, false);
        //    //FormsAuthentication.RedirectFromLoginPage(username, false);
        //}
        //if (Global.LogInDone && !string.IsNullOrWhiteSpace(retUrl))
        //{
        //    Response.Redirect(retUrl, false);
        //}
        if (action.ToLower() == "logout" && !IsPostBack)
        {
            Global.LogInDone = false;
            Global.UserName = "";
            Global.LicenseID = -1;
            Global.CompanyID = -1;
            Global.CompanyName = "";
            Global.FinancialYearID = -1;
            Global.CurrentUserType = UserTypes.UT_Customer;

        }
        if (!IsPostBack)
        {
            if (autologin != "")
                ValidateUser();
        }
    }
    private void ValidateUser()
    {
        TDSModel.User U;
        if (autologin != "")
            U = TDSModel.User.ValidatebyAutoLogin(autologin);
        else
            U = TDSModel.User.Validate(txtUser.Text, txtPWD.Text);
        if (U != null)
        {
            Global.LogInDone = true;
            Global.UserID = U.ID;
            Global.UserName = U.EmailID;
            Global.LicenseID = Cmn.ToInt(U.LicenseID);
            Global.CurrentUserType = (UserTypes)U.UserType;

            if (Global.CurrentUserType == UserTypes.UT_Customer)
            {
                Response.Redirect("/customer");
                return;
            }

            if (Global.CurrentUserType == UserTypes.UT_Admin || Global.CurrentUserType == UserTypes.UT_AgentAdmin)
            {
                if (Global.CurrentUserType == UserTypes.UT_Admin)
                    Global.MyAgents = TDSModel.User.GetAll();
                else if (Global.CurrentUserType == UserTypes.UT_AgentAdmin)
                    Global.MyAgents = TDSModel.User.GetUsersByLicenseID(Global.LicenseID);

            }

            Response.Redirect("/adminpanel");
        }
        else
        {
            FailureText.Text = "Username or password do not match!";
        }
    }
    protected void LogIn(object sender, EventArgs e)
    {
        ValidateUser();
    }
    //protected void LogIn(object sender, EventArgs e)
    //{
    //    if (IsValid)
    //    {
    //        var manager = new UserManager();
    //        #region Lockout
    //        //var user = manager.FindByName(txtUsername.Text);
    //        //if (user != null)
    //        //{
    //        //    var validCredentials = manager.Find(txtUsername.Text, txtPassword.Text);

    //        //    // When a user is lockedout, this check is done to ensure that even if the credentials are valid
    //        //    // the user can not login until the lockout duration has passed
    //        //    if (manager.IsLockedOut(user.Id))
    //        //    {
    //        //        FailureText.Text = string.Format("Your account has been locked out for {0} minutes due to multiple failed login attempts.", ConfigurationManager.AppSettings["DefaultAccountLockoutTimeSpan"].ToString());
    //        //        ErrorMessage.Visible = true;
    //        //    }
    //        //    // if user is subject to lockouts and the credentials are invalid
    //        //    // record the failure and check if user is lockedout and display message, otherwise,
    //        //    // display the number of attempts remaining before lockout
    //        //    else if (manager.GetLockoutEnabled(user.Id) && validCredentials == null)
    //        //    {
    //        //        // Record the failure which also may cause the user to be locked out
    //        //        manager.AccessFailedAsync(user.Id);

    //        //        string message = string.Empty;

    //        //        if (manager.IsLockedOut(user.Id))
    //        //        {
    //        //            FailureText.Text = string.Format("Your account has been locked out for {0} minutes due to multiple failed login attempts.", ConfigurationManager.AppSettings["DefaultAccountLockoutTimeSpan"].ToString());
    //        //            ErrorMessage.Visible = true;
    //        //        }
    //        //        else
    //        //        {
    //        //            int accessFailedCount = manager.GetAccessFailedCount(user.Id);

    //        //            int attemptsLeft =
    //        //                Convert.ToInt32(
    //        //                    ConfigurationManager.AppSettings["MaxFailedAccessAttemptsBeforeLockout"].ToString()) -
    //        //                accessFailedCount;

    //        //            message = string.Format(
    //        //                "Invalid credentials. You have {0} more attempt(s) before your account gets locked out.", attemptsLeft);

    //        //        }
    //        //        FailureText.Text = message;
    //        //        ErrorMessage.Visible = true;
    //        //    }
    //        //    else
    //        //    {
    //        //        IdentityHelper.SignIn(manager, user, false);

    //        //        // When token is verified correctly, clear the access failed count used for lockout
    //        //        manager.ResetAccessFailedCountAsync(user.Id);
    //        //        IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
    //        //    }
    //        //}
    //        #endregion
    //        // Validate the user password            
    //        ApplicationUser user = manager.Find(txtUser.Text.Trim(), txtPWD.Text.Trim().ToLower());
    //        if (user != null)
    //        {
    //            if (user.IsDisabled == 1)
    //            {
    //                FailureText.Text = "User Disabled.";
    //                ErrorMessage.Visible = true;
    //                return;
    //            }
    //            IdentityHelper.SignIn(manager, user, false);
    //            IdentityHelper.RedirectToReturnUrl("/account/manage.aspx", Response);
    //        }
    //        else
    //        {
    //            FailureText.Text = "Invalid username or password.";
    //            ErrorMessage.Visible = true;
    //        }
    //    }
    //}
}