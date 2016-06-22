using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ROC : System.Web.UI.Page
{
    string Data1 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Data1 = RouteData.Values["Data1"] != null ? RouteData.Values["Data1"].ToString() : "";
        switch (Data1)
        {
            case "registrar-of-companies-in-india":
                divRocOffices.Visible = true;
                Title = "ROC in inida";
                heading.InnerText = "Registrar of Companies (ROC) in India";
                break;
            case "filing-fees":
                divRocFilingFees.Visible = true;
                Title = "MCA Filing Fee Calculator";
                heading.InnerText = "MCA Filing Fee Calculator";
                break;
            default:

                break;
        }

    }
}