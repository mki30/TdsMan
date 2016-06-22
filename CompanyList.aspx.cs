using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class CompanyList : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        StringBuilder sb = new StringBuilder();
        List<MST_COMPANY> C = MST_COMPANY.GetAll();
        if (C.Count > 0)
        {
            sb.Append("<table class='table table-striped table-condensed'><tr><th>SNo<th>Name<th>Tan<th>Pan<th>Branch<th>Phone<th>Email");
            int ctr = 0;
            foreach (MST_COMPANY c in C)
            {
                sb.Append("<tr><td>" + ++ctr + "<td><a class='fancybox fancybox.iframe' href='/CompanyPage.aspx?id=" + c.COMPANY_ID + "'>" + c.COMPANY_NAME + "</a><td>" + c.TAN_NO+ "<td>" + c.PAN_NO + "<td>" + c.BRANCH_DIV + "<td>" + c.PHONE+ "<td>" + c.EMAIL);
            }
            sb.Append("</table>");
        }
        lblCompanyList.Text = sb.ToString();
    }
}