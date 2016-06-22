using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DownloadUsefulForms : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        Title = "Download useful forms";
        base.Page_Load(sender, e);
    }
    protected void btnChallan281_Click(object sender, EventArgs e)
    {
        FileInfo info = new FileInfo(Server.MapPath(@"~/Forms/Challan-ITNS-281.pdf"));
        Cmn.Download(info, this.Page);
    }
    protected void btnForm16A_Click(object sender, EventArgs e)
    {
        FileInfo info = new FileInfo(Server.MapPath(@"~/Forms/Form-16A.pdf"));
        Cmn.Download(info, this.Page);
    }
    protected void btnForm24Q_Click(object sender, EventArgs e)
    {
        FileInfo info = new FileInfo(Server.MapPath(@"~/Forms/Form-24Q.pdf"));
        Cmn.Download(info, this.Page);
    }
    protected void btnForm26Q_Click(object sender, EventArgs e)
    {
        FileInfo info = new FileInfo(Server.MapPath(@"~/Forms/Form-26Q.pdf"));
        Cmn.Download(info, this.Page);
    }
    protected void btnForm27Q_Click(object sender, EventArgs e)
    {
        FileInfo info = new FileInfo(Server.MapPath(@"~/Forms/Form-27A.pdf"));
        Cmn.Download(info, this.Page);

    }
    protected void btnForm27EQ_Click(object sender, EventArgs e)
    {
        FileInfo info = new FileInfo(Server.MapPath(@"~/Forms/Form-27EQ.pdf"));
        Cmn.Download(info, this.Page);
    }
}