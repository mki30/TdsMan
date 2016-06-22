using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class DeducteeList : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        Title = "Deductee Master";
       
        if (Global.CompanyID == -1)
            Response.Redirect("/CompanyPage.aspx");
        
        if (!IsPostBack)
        {
            //Company.FillCompanyList(ddCompany);
            ShowData();
            CreateAddEmployeeLink();
        }
    }
    //protected void ddCompany_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    ShowData();
    //    CreateAddEmployeeLink();
    //}
    protected void CreateAddEmployeeLink()
    {
        lnkAddDeductee.HRef = "deducteepage.aspx?id=0&companyid=" + Global.CompanyID;
    }
    private void ShowData()
    {
        
        List<MST_DEDUCTEE> D = MST_DEDUCTEE.GetList(Cmn.ToInt(Global.CompanyID));
        if (D.Count == 0)
        {
           lblDeducteeList.Text = "<div style='color:red'>No deductee found!</div>";
           return;
        }
        StringBuilder sb = new StringBuilder("<table class='table table-striped table-condensed table-bordered hover-style'><tr><th>SNo</th><th>Name</th><th>Pan</th><th>Address</th><th>Mobile</th><th>Email</th><th>Deductee Code</th></tr>");
        int ctr = 0;
        foreach (MST_DEDUCTEE d in D)
        {
            sb.Append("<tr><td>" + ++ctr + "<td><a class='fancybox450 fancybox.iframe' href='/deducteepage.aspx?id=" + d.DEDUCTEE_ID 
                + "&companyid=" + d.COMPANY_ID + "'>" 
                + d.DEDUCTEE_NAME + "</a><td>" 
                + d.DEDUCTEE_PAN + "<td>" 
                + d.ADDRESS1 +", "+d.ADDRESS2+", "+d.ADDRESS3+ "<td>" 
                + d.MOBILE_NO + "<td>"
                +d.EMAIL+"<td>"
                +(Cmn.ToInt(d.DEDUCTEE_CODE)==1?"01-Cpmpany":"02-Non Company")+"</tr>");
        }
        sb.Append("</table>");
        lblDeducteeList.Text = sb.ToString();
    }
}