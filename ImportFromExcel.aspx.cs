using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ImportFromExcell : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
    }
    protected void btn24QDownload1314_Click(object sender, EventArgs e)
    {
         string filePath = Server.MapPath(@"~/Files/XLS_BLANK24Q1314.xls");
         FileInfo info = new FileInfo(filePath);
         Cmn.Download(info, this.Page);
    }
    protected void btn26QDownload1314_Click(object sender, EventArgs e)
    {
        string filePath = Server.MapPath(@"~/Files/XLS_BLANK26Q1314.xls");
        FileInfo info = new FileInfo(filePath);
        Cmn.Download(info, this.Page);
    }
    protected void btn27QDownload1314_Click(object sender, EventArgs e)
    {
        string filePath = Server.MapPath(@"~/Files/XLS_BLANK27Q1314.xls");
        FileInfo info = new FileInfo(filePath);
        Cmn.Download(info, this.Page);
    }
    protected void btn27EQDownload1314_Click(object sender, EventArgs e)
    {
    }
}