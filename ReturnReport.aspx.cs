using System;
using System.Collections.Generic;
using System.Text;
using TDSModel; 

public partial class ReturnReport : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        ShowReport();
    }

    private void ShowReport()
    {
        StringBuilder str = new StringBuilder("<table class='table table-striped table-condensed'><tr><th>SNo<th>Financial Year<th>Form<th>Quarter<th>Company Name<th>Tan No<th> Token No<th>Filing Date");
        List<TRN_BASIC_INFO> RR = TRN_BASIC_INFO.GetByYearFormQuarterCompany(Global.FinancialYear, ReturnFormFilterl.FormType, ReturnFormFilterl.Quarter, Global.CompanyID);
        int ctr=0;
        foreach (TRN_BASIC_INFO rr in RR)
        {
            MST_COMPANY c = MST_COMPANY.GetByID((int)rr.COMPANY_ID);
            str.Append("<tr><td><a class='fancybox fancybox.iframe' href='/EditRegularReturn.aspx?id=" + rr.BASIC_INFO_ID + "'>" + ++ctr + "</a><td>"
                + (rr.YEAR).ToString() + "-" + (rr.YEAR + 1).ToString() + "<td>" + rr.FORM_NO +
                "<td>" + rr.QTR + "<td>" + c.COMPANY_NAME + "<td>" + c.TAN_NO + "<td>" + (string.IsNullOrEmpty(rr.PRN_NO)?"-":rr.PRN_NO) + "<td>" + (rr.DATE_OF_FILING.ToString() != "" ? (Cmn.ToDate(rr.DATE_OF_FILING).ToString("dd-MMM-yy")) : "-") + "</tr>");
        }
        str.Append("</table>");
        lblReport.Text = str.ToString();
     }
   
}