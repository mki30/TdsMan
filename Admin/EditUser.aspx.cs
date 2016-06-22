using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class Admin_EditUser :BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        
        if (!IsPostBack)
        {
            int ID = Cmn.ToInt(QueryString("id"));
            int LicenseID = Cmn.ToInt(QueryString("licenseid"));
            lblID.Text = ID.ToString();
            lblLicenceID.Text = LicenseID.ToString();
            ShowData();
        }
    }
    private void ShowData()
    {
        TDSModel.User u = TDSModel.User.GetByID(Cmn.ToInt(lblID.Text));
        if (u != null)
        {
            lblLicenceID.Text = u.LicenseID.ToString();
            //txtCompanyID.Text = u.CompanyID.ToString();
            ddUserType.SelectedValue = u.UserType.ToString();
            txtName.Text = u.Name;
            txtEmail.Text = u.EmailID;
            txtPassword.Text = u.Password;
        }
    }
    private void Update()
    {
        TDSModel.User u = TDSModel.User.GetByID(Cmn.ToInt(lblID.Text));
        if(u==null)
            u=new TDSModel.User();
        u.LicenseID = Cmn.ToInt(lblLicenceID.Text);
        //u.CompanyID = Cmn.ToInt(txtCompanyID.Text);
        u.UserType = Cmn.ToInt(ddUserType.SelectedValue);
        u.Name = txtName.Text;
        u.EmailID = txtEmail.Text;
        u.Password = txtPassword.Text;
        try
        {
            u.Save();
            lblID.Text = u.ID.ToString();
            lblMsg.Text = "Saved!";
            lblMsg.ForeColor = System.Drawing.Color.Green;
        }
        catch 
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Update();
    }
}