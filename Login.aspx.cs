using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class Login : System.Web.UI.Page
{
    string autologin = "";
    protected void Page_Load(object sender, EventArgs e)
    {
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
    protected void btnSave_Click(object sender, EventArgs e)
    {
        ValidateUser();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        TDSModel.User u = TDSModel.User.GetByEmailIDName(txtEmail2.Text, txtName.Text);
        if (u == null && txtPassword1.Text == txtReenterPassword.Text && txtCaptcha.Text==Global.Captcha)
        {
            TDSModel.User.CreateLogin(txtName.Text, txtEmail2.Text, "",txtPassword1.Text);
            lblMessage.Attributes.Remove("ForeColor");
            lblMessage.ForeColor=System.Drawing.Color.Green;
            lblMessage.Text = "Login sucessfully created.Please check your email address for further details.";
        }
        else if(u!=null)
            lblMessage.Text = "Account already exists.";
        else if (txtPassword1.Text != txtReenterPassword.Text)
            lblMessage.Text = "Password did not match";
        else if (txtCaptcha.Text != Global.Captcha)
            lblMessage.Text = "Captcha did not match";
    }
    private void ValidateUser()
    {
        TDSModel.User U;
        if (autologin != "")
            U = TDSModel.User.ValidatebyAutoLogin(autologin);
        else
            U = TDSModel.User.Validate(txtEmail.Text, txtPass.Text);
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
}