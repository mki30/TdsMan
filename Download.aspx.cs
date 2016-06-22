using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class Download : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        int returnID = QueryStringInt("returnid");
        string type = QueryString("type");
        TRN_BASIC_INFO RR = TRN_BASIC_INFO.GetByID(returnID);
        if (!IsPostBack)
        {
            switch (type)
            {
                case "fvu":
                    string filePath = @"c:\TDS\RRASOFT\" + RR.YEAR + "\\" + RR.FORM_NO + "\\" + RR.QTR+ "\\FVU.fvu";
                    if (File.Exists(filePath))
                    {
                        FileInfo info = new FileInfo(filePath);
                        Cmn.Download(info, this.Page);
                    }
                    break;
                case "pdf":
                    MST_COMPANY C = MST_COMPANY.GetByID((int)RR.COMPANY_ID);
                    string initialPath = @"c:\TDS\RRASOFT\" + RR.YEAR + "\\" + RR.FORM_NO + "\\" + RR.QTR + "";
                    string filePath1 = initialPath + "\\27A_" + C.TAN_NO + "" + RR.FORM_NO+ "_" + RR.QTR + "_" + RR.YEAR.ToString() + (RR.YEAR + 1).ToString().Substring(2, 2) + ".pdf";
                    if (File.Exists(filePath1))
                    {
                        FileInfo info = new FileInfo(filePath1);
                        Cmn.Download(info, this.Page);
                    }
                    break;
                case "justification-report-generation-utility":
                    string filePath2 = Server.MapPath(@"\downloads\traces-pdf-converter-27d-v1.0.zip");
                    if (File.Exists(filePath2))
                    {
                        FileInfo info = new FileInfo(filePath2);
                        Cmn.Download(info, this.Page);
                    }
                    break;
                case "traces-pdf-convertor-27d":
                    string filePath3 = Server.MapPath(@"\downloads\traces-justification-report-generation-utility-v2.0.zip");
                    if (File.Exists(filePath3))
                    {
                        FileInfo info = new FileInfo(filePath3);
                        Cmn.Download(info, this.Page);
                    }
                    break;
                case "traces-pdf-converterv1.3l.zip":
                    string filePath4 = Server.MapPath(@"\downloads\traces-pdf-converterv1.3l.zip");
                    if (File.Exists(filePath4))
                    {
                        FileInfo info = new FileInfo(filePath4);
                        Cmn.Download(info, this.Page);
                    }
                    break;
            }
        }
    }
}