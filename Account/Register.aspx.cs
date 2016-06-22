using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using ebuild;
//using eBuildModel;
using System.Web;

public partial class Account_Register : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
     //   string userid = Request.QueryString["user"],
     //token = HttpUtility.HtmlDecode(Request.QueryString["token"]), m = Request.QueryString["m"], company = Request.QueryString["company"];

     //   //if (User.Identity.IsAuthenticated && string.IsNullOrWhiteSpace(token) && string.IsNullOrWhiteSpace(userid))
     //   //{
     //   //    Response.Redirect("/account/manage.aspx");
     //   //}


     //   if (!string.IsNullOrWhiteSpace(company) && company.ToLower() == "true")
     //   {
     //       pnlUser.Visible = false;
     //       createText.InnerHtml = "Register Company";
     //       Button1.Visible = false;
     //       btnRegisterCompany.Visible = true;

     //   }
     //   if (m != null && m.ToLower() == "company-requested")
     //   {
     //       createText.InnerHtml = "Registration Request Send.";
     //       pnldetail.Visible = false;
     //       ErrorMessage.Text = "<div class='alert alert-success'><p>Company Created! You will be contacted soon to verify details provided by you and will be asked for more details to create company. <a href='/account/manage.aspx'>Go Back To Manage Page</a></div>";
     //   }
     //   if (m != null && m.ToLower() == "checkmail")
     //   {
     //       pnldetail.Visible = false;
     //       ErrorMessage.Text = "<div class='errorBox'>An email has been sent to you with email verification data.<br/><br/>Check your email now.</div>";
     //   }
     //   if (!string.IsNullOrWhiteSpace(userid) && !string.IsNullOrWhiteSpace(token))
     //   {
     //       pnldetail.Visible = false;
     //       UserManager manager = new UserManager();
     //       var user = manager.FindById(userid);
     //       if (user != null)
     //       {
     //           var result = manager.ConfirmEmail(user.Id, token);
     //           if (result.Succeeded)
     //           {
     //               ErrorMessage.Text = "<div class='alert alert-success'>Email verified successfully. <a href='/account/login.aspx'>Click Here To Login</a>.</div>";
     //           }
     //       }
     //   }
    }

    protected void CreateUser_Click(object sender, EventArgs e)
    {
        TDSModel.User u = TDSModel.User.GetByEmailID(txtEmail.Text);
        if (u == null && txtPassword.Text == txtConfirmPassword.Text && txtCAPTCHA.Text == Global.Captcha)
        {
            TDSModel.User.CreateLogin(txtName.Text, txtEmail.Text, "", txtPassword.Text);
            lblMessage.Attributes.Remove("ForeColor");
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Login sucessfully created.Please check your email address for further details.";
        }
        else if (u != null)
            lblMessage.Text = "Account already exists.";
        else if (txtCAPTCHA.Text != Global.Captcha && txtPassword.Text != txtConfirmPassword.Text)
            lblMessage.Text = "Both Captcha and Password did not match";
        else if (txtPassword.Text != txtConfirmPassword.Text)
            lblMessage.Text = "Password did not match";
        else if (txtCAPTCHA.Text != Global.Captcha)
            lblMessage.Text = "Captcha did not match";
        
        //if (string.IsNullOrWhiteSpace(txtName.Text))
        //{
        //    ErrorMessage.Text = "Please Enter First Name.";
        //    return;
        //}
        //if (string.IsNullOrWhiteSpace(txtLocation.Text))
        //{
        //    ErrorMessage.Text = "Please Enter LOCALITY.";
        //    return;
        //}
        //if (string.IsNullOrWhiteSpace(txtEmail.Text) || string.IsNullOrWhiteSpace(txtConfirmEmail.Text))
        //{
        //    ErrorMessage.Text = "Please Enter EMAIL or CONFIRM EMAIL.";
        //    return;
        //}
        //if (txtEmail.Text.Trim().ToLower() != txtConfirmEmail.Text.Trim().ToLower())
        //{
        //    ErrorMessage.Text = "EMAIL & CONFIRM EMAIL NOT MATCHED.";
        //    return;
        //}
        //if (string.IsNullOrWhiteSpace(txtPassword.Text) || string.IsNullOrWhiteSpace(txtConfirmPassword.Text))
        //{
        //    ErrorMessage.Text = "Please Enter PASSWORD or CONFIRM PASSWORD";
        //    return;
        //}
        //if (txtPassword.Text.Trim().ToLower() != txtConfirmPassword.Text.Trim().ToLower())
        //{
        //    ErrorMessage.Text = "PASSWORD & CONFIRM PASSWORD NOT MATCHED.";
        //    return;
        //}
        //if (!string.IsNullOrWhiteSpace(txtCompanyName.Text))
        //{
        //    if (drpCompanyType.SelectedValue == "0")
        //    {
        //        ErrorMessage.Text = "Please Select COMPANY TYPE.";
        //        return;
        //    }
        //    if (string.IsNullOrWhiteSpace(txtCompanyLocation.Text))
        //    {
        //        ErrorMessage.Text = "Please Enter COMPANY LOCATION.";
        //        return;
        //    }
        //    if (string.IsNullOrWhiteSpace(txtCompanyAddress.Text))
        //    {
        //        ErrorMessage.Text = "Please Enter COMPANY ADDRESS.";
        //        return;
        //    }
        //    if (string.IsNullOrWhiteSpace(txtCompanyMobile.Text))
        //    {
        //        ErrorMessage.Text = "Please Enter COMPANY MOBILE.";
        //        return;
        //    }
        //    if (string.IsNullOrWhiteSpace(txtCompanyEmail.Text))
        //    {
        //        ErrorMessage.Text = "Please Enter COMPANY EMAIL.";
        //        return;
        //    }

        //}
        //var manager = new UserManager();
        //var user = new ApplicationUser()
        //{
        //    Email = txtEmail.Text.Trim(),
        //    UserName = txtEmail.Text.Trim(),
        //    FirstName = txtName.Text.Trim(),
        //    LastName = txtSurname.Text.Trim(),
        //    Location = txtLocation.Text.Trim(),
        //    UserKey = Guid.NewGuid().ToString(),
        //    UrlName = txtName.Text.Trim().ToLower() + "_" + txtSurname.Text.Trim().ToLower() + DateTime.Now.Ticks,
        //};

        //IdentityResult result = manager.Create(user, txtPassword.Text);
        //if (result.Succeeded)
        //{
        //    //if (!string.IsNullOrWhiteSpace(txtCompanyName.Text))
        //    //{
        //    //    RegisterCompany(user);
        //    //}
        //    string token = manager.GenerateEmailConfirmationToken(user.Id),
        //        callbackUrl = "http://ebuild.in/account/register.aspx?user=" + user.Id + "&token=" + HttpUtility.UrlEncode(token);

        //  //  email.SendAppEmail(user.Email, "Confirm Email", "<div><p>Hi " + user.FirstName + ",</p><p>Welcome to <a href='http://ebuild.in'>eBuild.in</a>! Please take a moment to verify your <span class='il'>email</span> address to help us protect your personal data.</p><p><a href='" + callbackUrl + "'>Click Here To Confirm Email</a></p><p>Regards,<br/>Team eBuild.in</p></div>");

        //    IdentityHelper.SignIn(manager, user, isPersistent: false);
        //    IdentityHelper.RedirectToReturnUrl("/account/edititem.aspx?type=profile", Response);
        //}
        //else
        //{
        //    string error = result.Errors.FirstOrDefault();
        //    ErrorMessage.Text = (error.Contains("already taken") ? "Email " + txtEmail.Text + " already registered." : error);
        //}
    }

    //protected void btnRegisterCompany_Click(object sender, EventArgs e)
    //{
    //    if (string.IsNullOrWhiteSpace(txtCompanyName.Text))
    //    {
    //        ErrorMessage.Text = "Please Enter Company Name";
    //        return;
    //    }
    //    if (drpCompanyType.SelectedValue == "0")
    //    {
    //        ErrorMessage.Text = "Please Select COMPANY TYPE.";
    //        return;
    //    }
    //    if (string.IsNullOrWhiteSpace(txtCompanyLocation.Text))
    //    {
    //        ErrorMessage.Text = "Please Enter COMPANY LOCATION.";
    //        return;
    //    }
    //    if (string.IsNullOrWhiteSpace(txtCompanyAddress.Text))
    //    {
    //        ErrorMessage.Text = "Please Enter COMPANY ADDRESS.";
    //        return;
    //    }
    //    if (string.IsNullOrWhiteSpace(txtCompanyMobile.Text))
    //    {
    //        ErrorMessage.Text = "Please Enter COMPANY MOBILE.";
    //        return;
    //    }
    //    if (string.IsNullOrWhiteSpace(txtCompanyEmail.Text))
    //    {
    //        ErrorMessage.Text = "Please Enter COMPANY EMAIL.";
    //        return;
    //    }

    //    var manager = new UserManager();
    //    var user = manager.FindById(User.Identity.GetUserId());
    //    //if (user != null)
    //    //{
    //    //    RegisterCompany(user);
    //    //}
    //}
    //void RegisterCompany(ApplicationUser user)
    //{
    //    CompanyType ct = ((CompanyType)Cmn.ToInt(drpCompanyType.SelectedValue));
    //    string urlname = Cmn.GenerateSlug(txtCompanyName.Text + "-" + txtLocation.Text.Trim() + "-submited-by-" + user.FirstName);
    //    Company c = Company.GetCompany(urlname, ct, true);

    //    if (c != null)
    //    {
    //        ErrorMessage.Text = "Company Already Registered! Plese Check Your Manage Page";
    //        return;
    //    }
    //    c = new Company();
    //    c.Name = txtCompanyName.Text.Trim();
    //    c.CompanyTypeID = (int)ct;
    //    c.CompanyTypeName = ct.ToString();
    //    c.Website = txtCompanyWebsite.Text.Trim();
    //    c.Source = (int)SourceType.Requested;
    //    c.Offline = 1;
    //    c.isVerified = 0;
    //    c.UrlName = urlname;
    //    c.SourceDetails = "Requested by user " + user.Email;
    //    c.Aboutus = "Address: " + txtCompanyAddress.Text.Trim() + "<br/> Mobile: " + txtCompanyMobile.Text + "<br/> Email: " + txtCompanyEmail.Text;
    //    c.Save();
    //    if (c != null && c.ID != 0)
    //    {
    //        if (!Global.CompanyList.ContainsKey(c.ID))
    //            Global.CompanyList.Add(c.ID, c);

    //        string isCreated = string.Empty;
    //        DatabaseCE db = new DatabaseCE(Global.UserConnection);
    //        try
    //        {
    //            isCreated = db.RunQuery("Insert into UserCompanyLink (UserID,CompanyID,isApproved)  values('" + user.Email + "', " + c.ID + ",0)");
    //        }
    //        catch (Exception ex)
    //        {
    //            ErrorMessage.Text = "Error: User Not Linked With Company";
    //            Cmn.LogError(ex, "Company User Link");
    //        }
    //        if (isCreated == "1")
    //        {
    //            Response.Redirect("/account/manage.aspx");
    //        }
    //    }
    //}
}