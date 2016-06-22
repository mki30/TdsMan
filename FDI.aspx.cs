using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FDI : System.Web.UI.Page
{
    string Data1 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Data1 = RouteData.Values["Data1"] != null ? RouteData.Values["Data1"].ToString() : "";

        switch (Data1)
        {
            case "foreign-direct-investment-in-india":
                divFDI.Visible = true;
                break;
            case "in-limited-company":
                divFdiInLtdCompany.Visible = true;
                heading.InnerText = "FDI in Limited Company";
                break;
            case "compliances-by-company":
                divFDIComplianceByCompany.Visible = true;
                heading.InnerText = "FDI Compliances by Company";
                break;
            case "branch-office-liaison-office":
                divBranchAndLiason.Visible = true;
                heading.InnerText = "Branch Office & Liaison Office";
                break;
            case "branch-office-liaison-office-faq":
                divFaqBranchAndLiason.Visible = true;
                heading.InnerText = "FAQ on Branch Office and Liaison Office";
                break;
                default:
                divFDI.Visible = true;
                break;
        }
    }
}