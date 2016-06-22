using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class SendMail : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        string type = QueryString("type");
        string mailType = QueryString("mailtype");
        int id = QueryStringInt("id");
        Boolean autosend = Request.QueryString["autosend"] == "" ? false : true;
        EmailControl.EmailInit(type, mailType, id,autosend);
    }
}