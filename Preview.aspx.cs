using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class Preview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        int id = Request.QueryString["id"] == "" ? 0 : Cmn.ToInt(Request.QueryString["id"]);
        string sheet = Request.QueryString["sheet"] == "" ? "" : Request.QueryString["sheet"];
        SellBusiness sb = SellBusiness.GetByID(id);
        string folder = sheet == "BL" ? "ModifiedBalanceSheet" : sheet == "PL" ? "ModifiedProfitLoss" : "";
        //if (Global.LogInDone)
        //{
        if (sheet == "BL")
        {
            ShowData(id.ToString(), folder);
            //if (File.Exists(Server.MapPath("~/Documents/ModifiedBalanceSheet/" + id + ".jpeg")))
            //{
            //    string jpegPath = Server.MapPath(@"~/Documents/ModifiedBalanceSheet/" + id + ".jpeg");
            //    WebClient client = new WebClient();
            //    Byte[] buffer = client.DownloadData(jpegPath);
            //    Response.ContentType = "jpeg";
            //    Response.AddHeader("content-length", buffer.Length.ToString());
            //    Response.BinaryWrite(buffer);
            //}

        }
        if (sheet == "PL")
        {
            ShowData(id.ToString(), folder);
            //if (File.Exists(Server.MapPath("~/Documents/ModifiedProfitLossSheet/" + id + ".jpeg")))
            //{
            //    string jpegPath = Server.MapPath(@"~/Documents/ModifiedProfitLossSheet/" + id + ".jpeg");
            //    WebClient client = new WebClient();
            //    Byte[] buffer = client.DownloadData(jpegPath);
            //    Response.ContentType = "jpeg";
            //    Response.AddHeader("content-length", buffer.Length.ToString());
            //    Response.BinaryWrite(buffer);
            //}

        }
        //}
        //else
        //{
        //    Response.Redirect("/Login.aspx");
        //}
    }
    public void ShowData(string id, string folder)
    {
        if (File.Exists(Server.MapPath("~/Documents/" + folder + "/" + id + ".jpg")))
        {
            string jpgPath = Server.MapPath(@"~/Documents/ModifiedBalanceSheet/" + id + ".jpg");
            WebClient client = new WebClient();
            Byte[] buffer = client.DownloadData(jpgPath);
            Response.ContentType = "jpg";
            Response.AddHeader("content-length", buffer.Length.ToString());
            Response.BinaryWrite(buffer);
        }
        if (File.Exists(Server.MapPath("~/Documents/" + folder + "/" + id + ".pdf")))
        {
            string pdfPath = Server.MapPath(@"~/Documents/ModifiedBalanceSheet/" + id + ".pdf");
            WebClient client = new WebClient();
            Byte[] buffer = client.DownloadData(pdfPath);
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-length", buffer.Length.ToString());
            Response.BinaryWrite(buffer);
        }

    }
}