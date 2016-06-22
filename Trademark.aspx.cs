using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Trademark : System.Web.UI.Page
{
    string Data1 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Data1 = RouteData.Values["Data1"] != null ? RouteData.Values["Data1"].ToString() : "";

        switch (Data1)
        {
            case "registration":
                divTrademarkReg.Visible = true;
                Title = "Trademark registration";
                heading.InnerText = "Trademark Registration";
                break;
            case "registration-process":
                divTrademarkRegProcess.Visible = true;
                Title = "Trademark registration process";
                heading.InnerText = "Trademark Registration Process";
                break;
            case "fast-track-registration":
                divFastTrackTrademarkReg.Visible = true;
                Title="Fast-Track Trademark Registration";
                heading.InnerText = "Fast-Track Trademark Registration";
                break;
            case "classification-of-goods-and-services":
                divTrademarkClassification.Visible = true;
                Title = "Classification of goods and services";
                heading.InnerText = "Trademark Classification of Goods and Services";
                break;
            case "registration-faq":
                divTrademarkRegFaq.Visible = true;
                Title = "Trademark Registration FAQ";
                heading.InnerText = "Trademark Registration FAQ";
                break;
            default:
                
                break;
        }
    }
}