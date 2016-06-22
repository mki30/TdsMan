using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GetImage : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string type = QueryString("type");
        int id = QueryStringInt("id");
        if (Global.LogInDone)
        {
            switch (type)
            {
                case "BalanceSheet": GetFile(type, id); break;
                case "ProfitLossSheet": GetFile(type, id); break;
                case "ModifiedBalanceSheet": GetFile(type, id); break;
                case "ModifiedProfitLossSheet": GetFile(type, id); break;
                case "IdProof": GetFile(type, id); break;
                case "AddressProof": GetFile(type, id); break;
                default: return;
            }
        }
        else
        {
            Response.Redirect("Account/Login.aspx");
        }
    }
    public void GetFile(string type, int id)
    {
        //if (type == "BalanceSheet" || type == "ProfitLossSheet" || type == "ModifiedBalanceSheet" || type == "ModifiedsProfitLossSheet")
        //{
            if (File.Exists(Server.MapPath("~/Documents/" + type + "/" + id + ".jpg")))
            {
                string jpgPath = Server.MapPath(@"~/Documents/" + type + "/" + id + ".jpg");
                WebClient client = new WebClient();
                Byte[] buffer = client.DownloadData(jpgPath);
                Response.ContentType = "jpg";
                Response.AddHeader("content-length", buffer.Length.ToString());
                Response.BinaryWrite(buffer);

            }
            else if (File.Exists(Server.MapPath("~/Documents/" + type + "/" + id + ".pdf")))
            {
                string pdfPath = Server.MapPath(@"~/Documents/" + type + "/" + id + ".pdf");
                if (File.Exists(pdfPath))
                {
                    Response.AddHeader("Content-Disposition", "attachment; filename="+pdfPath+" "+ ".pdf");
                    Response.ContentType = "application/pdf";
                    Response.WriteFile(pdfPath);
                    Response.End();
                    return;
                }



                //string pdfPath = Server.MapPath(@"~/Documents/" + type + "/" + id + ".pdf");
                //WebClient client = new WebClient();
                //Byte[] buffer = client.DownloadData(pdfPath);
                //Response.ContentType = "application/pdf";
                //Response.AddHeader("content-length", buffer.Length.ToString());
                //Response.BinaryWrite(buffer);

            }
        

    }
}