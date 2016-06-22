using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LLP : System.Web.UI.Page
{
    public string Action = "";
    public string Data1 = "";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Action = RouteData.Values["Action"] != null ? RouteData.Values["Action"].ToString() : "";
        
        Data1 = RouteData.Values["Data1"] != null ? RouteData.Values["Data1"].ToString() : "";
        
        switch (Data1)
        {
            case "registration":
                divLLPReg.Visible = true;
                Title = "LLP Registration";
                break;
            case "registration-requirements":
                divLlpRegRequirements.Visible = true;
                Title = "Requirements for LLP Registration";
                heading.InnerText = "Requirements for LLP Registration";
                break;
            case "registration-required-documents":
                divLlpRegDocument.Visible = true;
                Title="Documents Required for LLP Registration";
                heading.InnerText = "Documents Required for LLP Registration";
                break;
            case "registration-process":
                divLlpRegProcess.Visible = true;
                Title = "LLP Registration Process";
                heading.InnerText = "LLP Registration Process";
                break;
            case "name-guidelines":
                llpNameGuidlines.Visible = true;
                Title = "LLP Registration Process";
                heading.InnerText = "LLP Name Guidelines";
                break;
            case "registration-FAQ":
                llpRegFaq.Visible = true;
                Title = "LLP Registration FAQ";
                heading.InnerText = "LLP Registration FAQ";
                break;
            case "agreement":
                divLlpAgreement.Visible = true;
                Title = "LLP Agreement";
                heading.InnerText = "LLP Agreement";
                break;
            case "contents-of-an-agreement":
                divContentsOfLlpAggrement.Visible = true;
                Title = "Contents of an LLP Agreement";
                heading.InnerText = "Contents of an LLP Agreement";
                break;
            case "agreement-and-tax-planning":
                divLlpAgreementAndTaxPlanning.Visible = true;
                Title = "LLP Agreement and Tax Planning";
                heading.InnerText = "LLP Agreement and Tax Planning";
                break;
            case "types-of-agreements":
                divTypesOfLlpAgreement.Visible = true;
                Title = "Types of LLP Agreements";
                heading.InnerText = "Types of LLP Agreements";
                break;
            case "why-agreement":
                divWhyLlpAgreement.Visible = true;
                Title = "Why LLP Agreement";
                heading.InnerText = "Why LLP Agreement?";
                break;
            default:
                divLLPReg.Visible = true;
                break;
        }
    }
}