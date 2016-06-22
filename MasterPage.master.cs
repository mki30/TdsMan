using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class MasterPage : System.Web.UI.MasterPage
{
    public delegate void SomethingSelected(object sender, String SelectedValue);
    public event SomethingSelected OnSomethingSelected;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Url.ToString().ToLower().Contains("fincomindia.com") || Request.Url.ToString().ToLower().Contains("fincomindia.org") || Request.Url.ToString().ToLower().Contains("fincomindia.net"))
        {
            Response.Redirect("http://fincomindia.in/");
        }
        if (Request.Url.ToString().ToLower().Contains("fincomindia.in"))
        {
            incomeTaxReturnLink.Visible = false;
            tdsLink.Visible = false;
            serviceTaxLink.Visible = false;
        }

        if (IsPostBack)
        {
            Global.FinancialYearID = Cmn.ToInt(ddFinancialYear.SelectedValue);
            Global.FinancialYear = 2014; // Cmn.ToInt(ddFinancialYear.SelectedItem.Text.Substring(0, 4));
        }

        if (Global.LogInDone)
        {
            if(Global.CurrentUserType!=UserTypes.UT_Customer)
                tdLicence.Visible = true;
            if (!IsPostBack)
            {
                ddLicense.Items.Clear();
                if (Global.CurrentUserType == UserTypes.UT_Admin)
                {
                    ddLicense.Items.Add(new ListItem("Select", "-1"));
                    ddLicense.SelectedValue = Global.LicenseID.ToString();
                    Global.LicenseID = Cmn.ToInt(ddLicense.SelectedValue);
                }
                foreach (License L in Global.LicenseList)
                {
                    if(Global.CurrentUserType != UserTypes.UT_Admin && Global.LicenseID!=L.ID)
                        continue;
                    ddLicense.Items.Add(new ListItem(L.Name, L.ID.ToString()));
                }
            }
            fyddDiv.Visible = true;
            lblLoginMsg.Text = Global.UserName;
            if (Global.CompanyName != "")
                divCompanyName.InnerHtml = Global.CompanyName;
            //else if(Global.IsAdmin==false)
            //    divCompanyName.InnerHtml = "<a href='/companypage.aspx'>New Company</a>";
            if (Global.CurrentUserType == UserTypes.UT_Admin || Global.CurrentUserType == UserTypes.UT_AgentAdmin)
                ltAdminLink.Text = "<li class='dropdown'><a href='/adminpanel'>Admin</a></li>";
            if (Global.CurrentUserType == UserTypes.UT_Customer)
                ltAdminLink.Text = "<li class='dropdown'><a href='/customer'>My Account</a></li>";

            ltLoginText.Text = "<a href='/login?action=logout'  class='label label-info'>Logout</a>";
        }

        else
        {
            ltLoginText.Text = "<a href='/login'  class='label label-info'>Login</a>";
        }
    }

    protected void FillYearDropDown()
    {
        //for (int i = DateTime.Today.Year; i > DateTime.Today.Year - 6; i--)
        //{
        //    if (i < 2014)
        //        break;
        //    ListItem li = new ListItem(i.ToString() + "-" + (i + 1).ToString().Substring(2), i.ToString());
        //    ddFinancialYear.Items.Add(li);
        //    if (Global.FinancialYear != -1)
        //    {
        //        if (i == Global.FinancialYear)
        //            li.Selected = true;
        //    }
        //}
        List<MST_ASSESSMENT> mst_Ass = MST_ASSESSMENT.GetAll().OrderByDescending(m => m.ASST_YEAR).ToList();
        foreach (MST_ASSESSMENT ma in mst_Ass)
        {
            int FY = Cmn.ToInt(ma.FA_YEAR.Substring(0, 4)) + 1;
            if (FY < DateTime.Now.Year)
                continue;
            ListItem li = new ListItem(ma.FA_YEAR.ToString(), ma.ASST_ID.ToString());
            ddFinancialYear.Items.Add(li);
        }
        if (Global.FinancialYearID == -1)
        {
            ddFinancialYear.SelectedIndex = 0;
            Global.FinancialYearID = Cmn.ToInt(ddFinancialYear.SelectedValue);
            Global.FinancialYear = Cmn.ToInt(ddFinancialYear.SelectedItem.Text.Substring(0, 4));
        }
        else            ddFinancialYear.SelectedValue = Global.FinancialYearID.ToString();
    }

    protected void ddFinancialYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        Global.FinancialYearID = Cmn.ToInt(ddFinancialYear.SelectedValue);
        Global.FinancialYear = Cmn.ToInt(ddFinancialYear.SelectedItem.Text.Substring(0, 4));
        Response.Redirect(Request.RawUrl);
    }
    protected void ddLicense_SelectedIndexChanged(object sender, EventArgs e)
    {
        Global.LicenseID = Cmn.ToInt(ddLicense.SelectedValue);
        OnSomethingSelected(sender, ((DropDownList)sender).SelectedValue);
    }
}
