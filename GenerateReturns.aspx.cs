using System;
using System.IO;
using TDSModel;

public partial class GenerateReturns : BasePage
{
    int returnID = 0;
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        returnID = QueryStringInt("returnid");
        WriteClientScript("var ReturnID='" + returnID + "';");
    }
    protected void btnDownloadFVUFile_Click(object sender, EventArgs e)
    {
        if (returnID != 0)
        {   
            TRN_BASIC_INFO RR = TRN_BASIC_INFO.GetByID(returnID);
            string filePath = @"c:\TDS\RRASOFT\"+RR.YEAR+"\\"+RR.FORM_NO+"\\"+RR.QTR+"\\FVU.fvu";
            if (File.Exists(filePath))
            {
                FileInfo info = new FileInfo(filePath);
                Cmn.Download(info, this.Page);
            }
        }
    }
    protected void btnDownloadPDF_Click(object sender, EventArgs e)
    {
        TRN_BASIC_INFO RR = TRN_BASIC_INFO.GetByID(returnID);
        MST_COMPANY C=MST_COMPANY.GetByID((int)RR.COMPANY_ID);
        string initialPath = @"c:\TDS\RRASOFT\" + RR.YEAR + "\\" + RR.FORM_NO+ "\\" + RR.QTR + "";
        string filePath = initialPath+"\\27A_"+C.TAN_NO+""+ RR.FORM_NO+ "_" + RR.QTR + "_"+RR.YEAR.ToString()+(RR.YEAR+1).ToString().Substring(2,2)+".pdf";
        if (File.Exists(filePath))
        {
            FileInfo info = new FileInfo(filePath);
            Cmn.Download(info, this.Page);
        }
    }
    protected void btnShowErrors_Click(object sender, EventArgs e)
    {
        TRN_BASIC_INFO RR = TRN_BASIC_INFO.GetByID(returnID);
        string initialPath = @"c:\TDS\RRASOFT\" + RR.YEAR + "\\" + ((RegularReturnType)RR.YEAR).ToString().Replace("_", "") + "\\" + RR.QTR + "";
        string filePath = initialPath + "\\" + RR.FORM_NO + "" + RR.QTR + "err.html";
        if (File.Exists(filePath))
        {
            string content=File.ReadAllText(filePath);
            divError.InnerHtml=content;
        }
    }
    protected void btnFUVStatementReport_Click(object sender, EventArgs e)
    {
        TRN_BASIC_INFO RR = TRN_BASIC_INFO.GetByID(returnID);
        string initialPath = @"c:\TDS\RRASOFT\" + RR.YEAR + "\\" + RR.YEAR+ "\\" + RR.QTR + "";
        string filePath = initialPath + "\\" + RR.FORM_NO + "" +RR.QTR + ".html";
        if (File.Exists(filePath))
        {
            string content = File.ReadAllText(filePath);
            divError.InnerHtml = content;
        }
    }
}