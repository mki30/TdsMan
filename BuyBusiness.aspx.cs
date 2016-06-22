using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI.WebControls;
using TDSModel;
using System.Linq;
using System.IO;


public partial class BuyBusiness : System.Web.UI.Page
{
    string Data1 = "";
    string[] SelectedCompanies = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        Data1 = RouteData.Values["Data1"] != null ? RouteData.Values["Data1"].ToString() : "";
        if (Data1 == "request")
        {
            divFindBusines.Visible = false;
            divBusinesRequest.Visible = true;

            StringBuilder sb = new StringBuilder(BuyBusinessFilter.Header);
            if (Request.Cookies["SelectedCompanies"] != null)
            {
                SelectedCompanies = Server.UrlDecode(Request.Cookies["SelectedCompanies"].Value).Split(',');
                sb.Append(SellBusiness.GetSelecedCompanies(SelectedCompanies, (Global.LogInDone ? true : false)));
            }

            sb.Append("</table></div>");
            ltHeader.Text = sb.ToString();
        }
        BuyBusinessFilter.ShowAdminFilter(false);
    }

    //private User CreateLogin(string name, string email, string contactno)
    //{
    //    if (Global.LogInDone == true || TDSModel.User.GetByEmailID(email) != null)
    //        return null;

    //    User U = new User();
    //    try
    //    {
    //        U.Name = name;
    //        U.EmailID = email;
    //        string password = CreateRandomPassword(6);
    //        U.Password = password;
    //        U.ContactNo = contactno;
    //        U.AutoLogin = Guid.NewGuid().ToString();
    //        U.UserType = (int)UserTypes.UT_Customer;
    //        U.Save();
    //        string mailBody = "<html><head>FinComIndia</head><body>" +
    //        "<p>Dear " + U.Name + ", thank you for registering with us.</p>" +
    //        "<p>Your login details are-<p>" +
    //        "<p><b>User Id: " + U.EmailID + "</b></p>" +
    //        "<p><b>Password: " + U.Password + "</b></p>" +
    //        "<p><b><a href='" + Global.GetRootPathVirtual + "/login?autologin=" + U.AutoLogin + "'>Login Here</a></b></p>" +
    //        "</body></html>";

    //        string mailText = Cmn.CreateMailStructure("Login Information", U.EmailID, mailBody);

    //        Cmn.SendEmail("Login Information", U.EmailID, U.Name, mailText);

    //    }
    //    catch
    //    {
    //    }
    //    return U;
    //}


    //private string CreateRandomPassword(int pasLenth)
    //{
    //    string allowedChars = "";
    //    allowedChars = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,";
    //    allowedChars += "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,";
    //    allowedChars += "1,2,3,4,5,6,7,8,9,0,!,@,#,$,%,&,?";
    //    char[] sep = { ',' };
    //    string[] arr = allowedChars.Split(sep);
    //    string passwordString = "";
    //    string temp = "";
    //    Random rand = new Random();
    //    for (int i = 0; i < pasLenth; i++)
    //    {
    //        temp = arr[rand.Next(0, arr.Length)];
    //        passwordString += temp;
    //    }
    //    return passwordString;
    //}
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        TDSModel.User U = TDSModel.User.GetByEmailID(txtEmail.Text.ToLower());

        if (U == null)
        {
            //U = new User();
            TDSModel.User user = TDSModel.User.GetByEmailID(txtEmail.Text);
            if (user == null)
                TDSModel.User.CreateLogin(txtName.Text, txtEmail.Text, txtContact.Text);
            else
                TDSModel.User.LoginAlreadyExists(txtName.Text, txtEmail.Text, txtContact.Text);
            //U.Name = txtName.Text;
            //U.EmailID = txtEmail.Text;
            //U.ContactNo = txtContact.Text;
            //U.UserType = (int)UserTypes.UT_Customer;
            //U.Save();
            lblID.InnerText = U.ID.ToString();
            SaveBusiness(U);
        }
        else
            SaveBusiness(U);
    }

    private void SaveBusiness(TDSModel.User U)
    {
        if (Request.Cookies["SelectedCompanies"] != null)
        {
            SelectedCompanies = Server.UrlDecode(Request.Cookies["SelectedCompanies"].Value).Split(',');
            foreach (string s in SelectedCompanies)
            {
                SellBusiness S = SellBusiness.GetByID(Cmn.ToInt(s));
                if (S != null)
                    SaveBuinessRequest(U, S.ID);
            }
        }
    }

    private void SaveBuinessRequest(TDSModel.User U, int CompanyID)
    {
        BusinessRequest BR = new BusinessRequest();
        try
        {
            BR.UserID = U.ID;
            BR.CompanyID = CompanyID;
            BR.Save();
            lblMsg.Text = "Successfully Saved!";
            lblMsg.ForeColor = System.Drawing.Color.Green;
            Response.Redirect("/confirmation");
        }
        catch
        {
            lblMsg.Text = "Error";
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}