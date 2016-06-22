using ebuild;
using Microsoft.AspNet.Identity;
using System;
using System.Web;
using System.Linq;



public partial class Account_PasswordRecover : System.Web.UI.Page
{
    string autologin;
    protected void Page_Load(object sender, EventArgs e)
    {
        string userid = Request.QueryString["user"],
            token = HttpUtility.HtmlDecode(Request.QueryString["token"]), m = Request.QueryString["m"];
        autologin = Request.QueryString["autologin"];
        if (autologin == "" || autologin == null)
            pnlForgot.Visible = true;
        else
        {
            pnlForgot.Visible = false;
            pnlCreate.Visible = true;
        }
        //pnlerror.Visible = false;
        //if (m != null && m.ToLower() == "checkmail")
        //{
        //    pnlerror.Visible = true;
        //    pnlDetails.Visible = false;
        //    errormsg.InnerHtml = "An email has been sent to you with login data.<br/><br/>Check your email now.";
        //    errormsg.Attributes.Add("class", "errorBox warning");
        //}
        //if (m != null && m.ToLower() == "pwdchanged")
        //{
        //    pnlForgot.Visible = false;
        //    pnlCreate.Visible = true;
        //    pnlDetail1.Visible = false;
        //    subtitle1.Visible = false;
        //    pnlerr1.Visible = true;
        //    errortxt.InnerHtml = "Password Changed Success! <a href='/account/login.aspx'>Click Here To Login</a>";
        //    errortxt.Attributes.Add("class", "alert alert-success");
        //    lblCreateText.Text = "Password Changed!";
        //}
        //if (!string.IsNullOrWhiteSpace(userid) && !string.IsNullOrWhiteSpace(token))
        //{
        //    pnlForgot.Visible = false;
        //    pnlCreate.Visible = true;
        //    txtUserID.Value = userid;
        //    txtToken.Value = token;
        //    UserManager manager = new UserManager();
        //    var user = manager.FindById(userid);
        //    if (user != null)
        //    {
        //        lblUser.Text = user.FirstName;
        //    }
        //}
    }

    protected void btnSendMail_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrWhiteSpace(txtEmail.Text))
        {
            var vlu = txtValue.Value;
            var url = Request.Url.ToString().Contains("localhost") ? "http://localhost:50033" : "http://fincomindia.in";
            string msg = string.Empty;
            //UserManager manager = new UserManager();
            //var user = manager.FindByEmail(txtEmail.Text);
            TDSModel.User user = TDSModel.User.GetByEmailID(txtEmail.Text);
            if (user != null)
            {
                string callbackUrl = Global.GetRootPathVirtual + "/account/passwordrecover.aspx?user=" + user.ID + "&autologin=" + user.AutoLogin;
                string mailbody = "<p>Dear " + user.Name + ",<br/></p>" +
                        "<p>Please click the link below to reset password<br/></p>" +
                        "<b>" + "<a href='"+url+"/account/passwordrecover.aspx?autologin=" + user.AutoLogin + "'>Click here </a>" +" </b>" +
                        "<br/><br/><p>Thanking You<br/>Team Fin Com India</p>";
                pnlerror.Visible = true;
                Cmn.SendEmail("Password Reset Link", txtEmail.Text, user.Name, Cmn.CreateMailStructure("Password Reset Link", txtEmail.Text, mailbody));
                errormsg.InnerHtml = "An email has been sent to you.<br/><br/>Please check your email now.";
                errormsg.Attributes.Add("class", "errorBox warning");
                //byte[] time = BitConverter.GetBytes(DateTime.UtcNow.ToBinary()); HttpUtility.UrlEncode(code);code = user.Password,
                //byte[] key = Guid.NewGuid().ToByteArray();
                //string token = Convert.ToBase64String(time.Concat(key).ToArray());// +Convert.ToBase64String(key);

                //byte[] data = Convert.FromBase64String(token);
                //DateTime when = DateTime.FromBinary(BitConverter.ToInt64(data, 0));
                //if (when < DateTime.UtcNow.AddHours(-24))
                //{
                //    // too old
                //}

                //if (Request.Url.Host.ToLower().Contains("localhost"))
                //    msg = email.SendEmail2(user.Email, "Reset Password", "Hello <b>" + user.FirstName + "</b>,<br/><br/>This mail has been sent from <a href='http://ebuild.in'>eBuild.in</a> as you have requested password reset.<br/><br/>To Reset Password <a href=\"" + callbackUrl + "\">Click Here</a>.<br/><br/><p>Your Username: " + user.UserName + "</p><p>Your Password: <a href=\"" + callbackUrl + "\">Click Here To Reset</a></p><br/><p><b>Please note your password reset token will expire in one day and you can use it only one time.</b></p><br/><br/><p><b>Team eBuild.in</b></p>");
                //else
                //    msg = manager.SendOnwWayMail(user.Email, "Reset Password", "Hello <b>" + user.FirstName + "</b>,<br/><br/>This mail has been sent from <a href='http://ebuild.in'>eBuild.in</a> as you have requested password reset.<br/><br/>To Reset Password <a href=\"" + callbackUrl + "\">Click Here</a>.<br/><br/><p>Your Username: " + user.UserName + "</p><p>Your Password: <a href=\"" + callbackUrl + "\">Click Here To Reset</a></p><br/><p><b>Please note your password reset token will expire in one day and you can use it only one time.</b></p><br/><br/><p><b>Team eBuild.in</b></p>");

                //if (msg == "Mail Send")
                //{
                //    Response.Redirect("/account/PasswordRecover.aspx?m=checkmail");
                //}
            }
            else
            {
                pnlerror.Visible = true;
                errormsg.InnerHtml = "WARNING: the email " + txtEmail.Text + " has not been registered yet";
            }
        }
        else
        {
            pnlerror.Visible = true;
            errormsg.InnerHtml = "Please Enter Email!";
        }
    }

    protected void btnResetPassword_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtPassword.Text) && string.IsNullOrWhiteSpace(txtPassword1.Text))
        {
            errortxt.InnerHtml = "Plese Type Password & Re-Enter Password";
            pnlerr1.Visible = true;
            return;
        }
        if (txtPassword.Text.Trim() != txtPassword1.Text.Trim())
        {
            errortxt.InnerHtml = "Password & Re-Enter Password Not Matched";
            pnlerr1.Visible = true;
            return;
        }
        pnlerr1.Visible = false;
        errortxt.InnerHtml = "";
        TDSModel.User user = TDSModel.User.ValidatebyAutoLogin(autologin);
        if (user != null)
        {
            user.Password = txtPassword.Text;
            user.Save();
            pnlerr1.Visible = true;
            errortxt.InnerHtml = "Password Changed Success! <a href='/account/login.aspx'>Click Here To Login</a>";
            errortxt.Attributes.Add("class", "alert alert-success");
            lblCreateText.Text = "Password Changed!";
        }
        //UserManager manager = new UserManager();
        //var user = manager.FindById(txtUserID.Value);
        //if (user != null)
        //{
        //    var result = manager.ResetPassword(user.Id, txtToken.Value, txtPassword.Text.Trim().ToLower());
        //    if (result.Succeeded)
        //    {
        //        //string msg = string.Empty;
        //        //if (Request.Url.Host.ToLower().Contains("localhost"))
        //        //    msg = email.SendEmail2(user.Email, "Password Changed", "Your Password has been chnaged.<a href='http://localhost:38005/account/login.aspx'>To Login click here</a>.<br/><br/><b>Team eBuild.in</b>");
        //        //else
        //        //    msg = manager.SendOnwWayMail(user.Email, "Password Changed", "Your Password has been chnaged.<a href='http://ebuild.in/account/login.aspx'>To Login click here</a>.<br/><br/><b>Team eBuild.in</b>");
        //        //if (msg == "Mail Send")
        //        //{
        //        //    Response.Redirect("/account/PasswordRecover.aspx?m=pwdchanged&user=" + user.UserName);
        //        //}
        //    }
        //    else
        //    {
        //        pnlerr1.Visible = true;
        //        errortxt.InnerHtml = string.Join("<br/>", result.Errors);
        //    }
        //}
    }
}