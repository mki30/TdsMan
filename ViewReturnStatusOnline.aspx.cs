using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class ViewReturnStatusOnline : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender,e);
        Title = "Return Status Online";
        if (!IsPostBack)
        {
            //TDSModel.Company.FillCompanyList(ddCompany);
            WriteValueToPage(Global.CompanyID);
        }
    }
    //protected void txtTokenNo_TextChanged(object sender, EventArgs e)
    //{
    //}
    ////protected void ddCompany_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    WriteValueToPage(Cmn.ToInt(ddCompany.SelectedValue));
    //}
    protected void WriteValueToPage(int CompanyID)
    {
        MST_COMPANY c = MST_COMPANY.GetByID(CompanyID);
        WriteClientScript("var tanNo='" + c.TAN_NO+"';");
    }
}