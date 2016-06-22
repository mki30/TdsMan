using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NameGuidlines : System.Web.UI.Page
{
    string Data1 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string type = Request.QueryString["type"];
        Data1 = RouteData.Values["Data1"] != null ? RouteData.Values["Data1"].ToString() : "";

        switch (Data1)
        {
            case "company-llp-name-availability":
                pnlLlpNameAvl.Visible = true;
                Title = "Company LLP Name Availability";
                break;
            case "company-name":
                pnlCompanyName.Visible = true;
                Title = "Company Name";
                break;
            case "company-name-availability":
                pnlCompanyNameAvl.Visible = true;
                Title = "Company Name Availability";
                break;
            case "company-name-undesirable-names":
                pnlUndesirableNames.Visible = true;
                Title = "Company Name Undesirable Names";
                break;
            
            case "companyname-businessname-trademark-brandname-logo-and-domain-name":
                pnlCompanyNameBusinessNameEtc.Visible = true;
                Title = "Companyname Businessname Trademark Brandname Logo And Domain Name";
                break;

            case "company-names-facts-to-be-disregarded":
                pnlCompanyNameFaq.Visible = true;
                Title = "Company Names Facts To Be Disregarded";
                break;

            case "limited-liability-partnership-name":
                pnlLlpName.Visible = true;
                Title = "Limited Liability Partnership Name";
                break;

            case "llp-name-guidelines":
                pnlLlpNameGuidlines.Visible = true;
                Title = "LLP  Name Guidelines";
                break;

            case "trade-mark-and-company-llp-name":
                pnlTrademarkAndCompany.Visible = true;
                Title = "Trade Mark And Company LLP Name";
                break;

            case "company-name-availability-faq":
                PanelCompanyNameAvlFaq.Visible = true;
                Title = "Company Name Availability FAQ";
                break;
        }
    }
}