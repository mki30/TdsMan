using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Linq;
using ebuild;
using System.IdentityModel.Claims;

public partial class Account_RegisterExternalLogin : System.Web.UI.Page
{
    string autologin = "";
    protected string ProviderName
    {
        get { return (string)ViewState["ProviderName"] ?? String.Empty; }
        private set { ViewState["ProviderName"] = value; }
    }

    protected string ProviderAccountKey
    {
        get { return (string)ViewState["ProviderAccountKey"] ?? String.Empty; }
        private set { ViewState["ProviderAccountKey"] = value; }
    }

    protected void Page_Load()
    {
        // Process the result from an auth provider in the request
        ProviderName = IdentityHelper.GetProviderNameFromRequest(Request);
        if (String.IsNullOrEmpty(ProviderName))
        {
            Response.Redirect("~/Account/Login.aspx");
        }
        if (!IsPostBack)
        {
            //var manager = new UserManager();
            var loginInfo = Context.GetOwinContext().Authentication.GetExternalLoginInfo();
            //if (loginInfo == null)
            //{
            //    Response.Redirect("~/Account/Login.aspx");
            //}
            //var user = manager.Find(loginInfo.Login);
            //if (user != null)
            //{
            //    if (user.IsDisabled == 1)
            //    {
            //        Response.Redirect("/Account/Login.aspx?ReturnUrl=/account/manage.aspx&m=128");
            //        return;
            //    }
            //    IdentityHelper.SignIn(manager, user, isPersistent: false);
            //    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            //}
            //else if (User.Identity.IsAuthenticated)
            //{
            //    // Apply Xsrf check when linking
            //    var verifiedloginInfo = Context.GetOwinContext().Authentication.GetExternalLoginInfo(IdentityHelper.XsrfKey, User.Identity.GetUserId());
            //    if (verifiedloginInfo == null)
            //    {
            //        Response.Redirect("~/Account/Login.aspx");
            //    }
            //    var result = manager.AddLogin(User.Identity.GetUserId(), verifiedloginInfo.Login);
            //    if (result.Succeeded)
            //    {
            //        IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"] + "?type=profile", Response);
            //    }
            //    else
            //    {
            //        AddErrors(result);
            //        return;
            //    }
            //}
            //else
            //{
            txtEmail.Text = loginInfo.Email;
            string firstName = string.Empty, lastName = string.Empty, profilePic = string.Empty;
            if (ProviderName.ToLower() == "facebook")
            {
                firstName = loginInfo.ExternalIdentity.Claims.First(c => c.Type == "urn:facebook:first_name").Value;
                lastName = loginInfo.ExternalIdentity.Claims.First(c => c.Type == "urn:facebook:last_name").Value;
                profilePic = "http://graph.facebook.com/" + loginInfo.Login.ProviderKey + "/picture?type=large";


            }
            else if (ProviderName.ToLower() == "google")
            {
                firstName = loginInfo.ExternalIdentity.Claims.First(c => c.Type == "name.givenName").ToString();
                lastName = loginInfo.ExternalIdentity.Claims.First(c => c.Type == "family_name").Value;
                profilePic = loginInfo.ExternalIdentity.Claims.First(c => c.Type == "picture").Value;
            }
            txtFirst.Text = firstName;
            txtLast.Text = lastName;
            txtProfilePic.Value = profilePic;
        }
        //kd}
    }

    protected void LogIn_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtEmail.Text))
        {
            ltErrors.Text = "Please Enter Your Email!";

            return;
        }
        TDSModel.User user = TDSModel.User.GetByEmailID(txtEmail.Text);

        if (user == null)
            TDSModel.User.CreateLogin(txtFirst.Text + " " + txtLast.Text, txtEmail.Text, "");

        ValidateUser();
        //CreateAndLoginUser();

    }
    private void ValidateUser()
    {
        TDSModel.User U = null;
        U = TDSModel.User.GetByEmailID(txtEmail.Text);
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
            lblMsg.Text = "Username or password do not match!";
        }
    }
    private void CreateAndLoginUser()
    {
        if (!IsValid)
        {
            return;
        }
        var manager = new UserManager();
        var user = new ApplicationUser()
        {
            UserName = txtEmail.Text,
            Email = txtEmail.Text.Trim(),
            FirstName = txtFirst.Text.Trim(),
            LastName = txtLast.Text.Trim(),
            UserKey = Guid.NewGuid().ToString(),
            UrlName = txtFirst.Text.Trim().ToLower() + "_" + txtLast.Text.Trim().ToLower() + DateTime.Now.Ticks
        };
        IdentityResult result = manager.Create(user);
        if (result.Succeeded)
        {
            var loginInfo = Context.GetOwinContext().Authentication.GetExternalLoginInfo();
            if (loginInfo == null)
            {
                Response.Redirect("~/Account/Login.aspx");
                return;
            }
            result = manager.AddLogin(user.Id, loginInfo.Login);
            if (result.Succeeded)
            {
                //if (chkProfile.Checked)                
                Cmn.DownloadFile(Server.MapPath("~/data/user/" + user.UserKey + ".jpg"), txtProfilePic.Value);
                IdentityHelper.SignIn(manager, user, isPersistent: false);
                IdentityHelper.RedirectToReturnUrl("/account/edititem.aspx?type=profile", Response);
                return;
            }
            AddErrors(result);
        }
        ltErrors.Text = string.Join("</br/>", result.Errors);
    }

    private void AddErrors(IdentityResult result)
    {
        foreach (var error in result.Errors)
        {
            ModelState.AddModelError("", error);
        }
    }
}