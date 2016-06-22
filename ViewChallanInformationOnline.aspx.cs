using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class ViewChallanInformationOnline : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        Title = "Challan Information Online";

        if (!IsPostBack)
        {
            //TDSModel.Company.FillCompanyList(ddCompany);
            txtChallanFromDate.Text = "01-04-"+DateTime.Now.Year;
            txtChallanToDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
        }
        //WriteValueToPage(Cmn.ToInt(ddCompany.SelectedValue));
        WriteValueToPage(Global.CompanyID);
    }
    //protected void ddCompany_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    Company c = Company.GetByID(Cmn.ToInt(ddCompany.SelectedItem));
    //    CompanyTAN = c.TanNo;
    //    WriteValueToPage(Cmn.ToInt(ddCompany.SelectedValue));
    //}
    protected void WriteValueToPage(int CompanyID)
    {
        MST_COMPANY c = MST_COMPANY.GetByID(CompanyID);
        WriteClientScript("var tanNo='" + c.TAN_NO+"';");
    }
    protected void btnDownloadCSI_Click(object sender, EventArgs e)
    {
        MST_COMPANY C = MST_COMPANY.GetByID(Global.CompanyID);
        string[] dateFrom = txtChallanFromDate.Text.Split('-');
        string[] dateTo = txtChallanToDate.Text.Split('-');
        
        string uriString = "https://tin.tin.nsdl.com/oltas/servlet/TanSearch/?appUser=T&TAN_NO=" + C.TAN_NO + "&TAN_FROM_DT_DD=" + dateFrom[0] + "&TAN_FROM_DT_MM=" + dateFrom[1] + "&TAN_FROM_DT_YY=" + dateFrom[2] + "&TAN_TO_DT_DD=" + dateTo[0] + "&TAN_TO_DT_MM=" + dateTo[1] + "&TAN_TO_DT_YY=" + dateTo[2] + "&submit=Download Challan file";
        WebClient webClient = new WebClient();
        String s=webClient.DownloadString(new Uri(uriString));
        
        Response.Clear(); 
        byte[] buffer = Encoding.ASCII.GetBytes(s);
        Response.ContentType = "text/plain";
        Response.OutputStream.Write(buffer, 0, buffer.Length);
        Response.AddHeader("Content-Disposition", "attachment;filename=file.csi");
        Response.Flush();
        Response.End();
    }
}