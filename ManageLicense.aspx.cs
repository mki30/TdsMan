using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class ManageLicense : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);

        if (!IsPostBack)
        {
            FillLicenceDropDown();
            ShowData();
        }
    }
    private void ShowData()
    {
        StringBuilder str = new StringBuilder("<table class='table table-bordered table-condensed'><tr><th>SNo<th>Name<th>Address<th>Email<th>Phone<th>");
        List<License> L = License.GetAll(Cmn.ToInt(ddLicense.SelectedValue));
        int ctr = 1;

        foreach (License l in L)
        {
            str.Append("<tr><td>" + ctr++ + "<td><a href='/Admin/EditLicense.aspx?id=" + l.ID + "' class='fancybox400 fancybox.iframe'>" + l.Name + "</a><td>" + l.Address + "<td>" + l.Email + "<td>" + l.Phone + "<td><a href='/Admin/EditUser.aspx?id=0&licenseid=" + l.ID + "' class='pull-right fancybox400 fancybox.iframe'>+Add User</a>");
            List<TDSModel.User> U = TDSModel.User.GetUsersByLicenseID(l.ID);

            if (U.Count > 0)
            {
                str.Append("<tr><td colspan='7'>");
                str.Append("<table style='width:50%' class='table table-bordered table-condensed'><tr><th><th>SNo<th>Name<th>Email ID<th>Password<th>User Type");
                int ctr1 = 1;
                foreach (TDSModel.User u in U)
                {
                    str.Append("<tr><td>&nbsp;&nbsp;&nbsp;<td>" + ctr1++ + "<td><a href='/Admin/EditUser.aspx?id=" + u.ID + "&licenseid=" + l.ID + "' class='fancybox400 fancybox.iframe'>" + u.Name + "</a><td>" + u.EmailID + "<td>" + u.Password + "");
                    str.Append("<td>" + Global.GetText((UserTypes)u.UserType));
                }
                str.Append("</table>");
                str.Append("</tr>");
            }
            MST_COMPANY C = MST_COMPANY.GetByLicenceID(l.ID);
            if (C != null)
            {
                str.Append("<tr><td colspan='7'>");
                str.Append("<table class='table table-bordered table-condensed' style='width:50%'><tr><th><th>SNo<th>Company Name");
                int ctr1 = 1;
                //foreach (Company c in C)
                //{
                str.Append("<tr><td>&nbsp;&nbsp;<td>" + ctr1++ + "<td>" + C.COMPANY_NAME + "");
                //}
                str.Append("</table>");
                str.Append("</tr>");
            }
        }
        str.Append("</table>");
        lblLicense.Text = str.ToString();
    }


    private void FillLicenceDropDown()
    {
        ddLicense.Items.Clear();
        List<License> LL = License.GetAll();
        ddLicense.Items.Add(new ListItem("-All-", "0"));
        foreach (License L in LL)
        {
            ddLicense.Items.Add(new ListItem(L.Name, L.ID.ToString()));
        }
    }
    protected void ddLicense_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowData();
    }
}