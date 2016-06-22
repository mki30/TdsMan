using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class Admin_EditLicense : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        
        if(!IsPostBack)
        {   
            int ID = Cmn.ToInt(QueryString("id"));
            lblID.Text = ID.ToString();
            ShowData();
        }
    }

   private void ShowData()
   {
       License l=License.GetByID(Cmn.ToInt(lblID.Text));
       if(l!=null)
       {
           txtName.Text=l.Name;
           txtAddress.Text=l.Address;
           txtEmail.Text=l.Email;
           txtPhone.Text=l.Phone;
           ddLicenseType.SelectedValue = l.LicenseType.ToString();
           txtValidUpto.Text = Cmn.ToDate(l.ValidUpto).Year ==00?Cmn.ToDate(l.ValidUpto).ToString("dd-MMM-yy"):"";
       }
   }
    private void Update()
    {
         License l=License.GetByID(Cmn.ToInt(lblID.Text));
         if(l==null)
            l=new License();
         l.Name=txtName.Text;
         l.Address=txtAddress.Text;
         l.Email=txtEmail.Text;
         l.Phone=txtPhone.Text;
         l.LicenseType = Cmn.ToInt(ddLicenseType.SelectedValue);
         l.ValidUpto = Cmn.ToDate(txtValidUpto.Text);
         try
         {
             l.Save();
             lblID.Text = l.ID.ToString();
             lblMsg.Text = "Saved!";
             lblMsg.ForeColor = System.Drawing.Color.Green;
             lblID.Text = l.ID.ToString();
         }
         catch 
         {
             lblMsg.Text = "Not Saved!";
             lblMsg.ForeColor = System.Drawing.Color.Red;
         }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Update();
    }
}