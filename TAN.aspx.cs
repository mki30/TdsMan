using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TAN : System.Web.UI.Page
{
    string Data1 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Data1 = RouteData.Values["Data1"] != null ? RouteData.Values["Data1"].ToString() : "";
        switch (Data1)
        {
            //case "new":
            //    frame.Src = "https://tin.tin.nsdl.com/tan/form49B.html";
            //    frame.Attributes.Add("height", "1900");
            //    Title = "New TAN";
            //    break;
            case "correction":
                frame.Src = "https://tin.tin.nsdl.com/tan/ChangeRequest.html";
                heading.InnerText = "Changes Or Correction in TAN Data for TAN allotted";
                frame.Attributes.Add("height", "2200");
                Title = "TAN Correction";
                break;
            //case "status":
            //    frame.Src = "https://tin.tin.nsdl.com/pantan/StatusTrack.html";
            //    heading.InnerText = "Track Your TAN Status";
            //    frame.Attributes.Add("height", "700");
            //    Title = "TAN status";
            //    break;
            case "procedure":
                heading.InnerText = "Online TAN Application Procedure";
                divTanProcedure.Visible = true;
                divFrame.Visible = false;
                Title = "TAN Application Procedure";
                break;
            default:
                frame.Src = "https://tin.tin.nsdl.com/tan/form49B.html";
                frame.Attributes.Add("height", "1900");
                break;

        }
    }
}