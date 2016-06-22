using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class SelectCompany : BasePage
{
    new protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Global.LogInDone == false)
                Response.Redirect("/login.aspx");
            List<MST_COMPANY> list = MST_COMPANY.GetAll();
            ddCompany.Items.Clear();
            ddCompany.Items.Add(new ListItem("-----Select------", "-1"));
            foreach (MST_COMPANY comp in list)
            {
                ddCompany.Items.Add(new ListItem(comp.COMPANY_NAME, comp.COMPANY_ID.ToString()));
            }
        }
    }
    protected void ddCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddCompany.SelectedValue != "-1")
        {
            Global.CompanyID = Cmn.ToInt(ddCompany.SelectedValue);
            Global.CompanyName = ddCompany.SelectedItem.Text;
            string returnPath = Request.QueryString["return"] != null ? Request.QueryString["return"].ToString() : "";

            if(returnPath!="")
                Response.Redirect(returnPath);
            else
                Response.Redirect("/");
        }
    }
}