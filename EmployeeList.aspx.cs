using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class EmployeeList : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        Title = "Employee Master";

        if (Global.CompanyID == -1)
            Response.Redirect("/companypage.aspx");

        if (!IsPostBack)
        {
            //Company.FillCompanyList(ddCompany);
            ShowData();
            CreateAddEmployeeLink();
        }
    }
    protected void ddCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowData();
        CreateAddEmployeeLink();
    }
    protected void CreateAddEmployeeLink()
    {
        addEmployeeLink.HRef = "employeepage.aspx?id=0&companyid=" + Global.CompanyID;
    }

    private void ShowData()
    {
        List<MST_EMPLOYEE> EL = MST_EMPLOYEE.GetList(Cmn.ToInt(Global.CompanyID));
        if (EL.Count == 0)
        {
            lblEmployeeList.Text = "<div style='color:red;'>No employee found</div>";
            return;
        }

        StringBuilder sb = new StringBuilder("<table class='table table-striped table-condensed table-bordered hover-style'><tr><th>#</th><th>Name</th><th>Pan</th><th>Ref No</th><th>Designation</th><th>Emp Category</th><th>Total Income</th><th>Total Ded</th></tr>");
        int ctr = 0;
        foreach (MST_EMPLOYEE em in EL)
        {
            EmployeeSalary e = EmployeeSalary.GetByIDandFY(em.EMPLOYEE_ID, Global.FinancialYear);

            string income = "0";
            string deduction = "0";

            if (e != null)
            {
                string data = Cmn.GetUnCompressed(e.Data, (int)e.DataSize);
                Dictionary<string, object> d = (Dictionary<string, object>)new JavaScriptSerializer().DeserializeObject(data);
                if (d.ContainsKey("txtTotalIncomeTotal"))
                    income = d["txtTotalIncomeTotal"].ToString();
                if (d.ContainsKey("txtTotalDeductionTotal"))
                    deduction = d["txtTotalDeductionTotal"].ToString();
            }
            string categoty = "";
            Global.EmployeeCategory.TryGetValue(em.CATEGORY, out categoty);
            sb.Append("<tr><td class='boldFont'>" + ++ctr + "<td><a class='fancybox400 fancybox.iframe' href='/employeepage.aspx?id="
                 + em.EMPLOYEE_ID + "&companyid="
                 + em.COMPANY_ID + "'>"
                 + em.EMPLOYEE_NAME_ + "</a><td>"
                 + em.EMPLOYEE_PAN + "<td>" + em.EMPLOYEE_REF + "<td>" + em.DESIGNATION + "<td>"
                 + categoty + "<td><a target='_blank' href='/employeesal.aspx?empid=" + em.EMPLOYEE_ID + "&fy=" + Global.FinancialYear + "'>" + (income == "0" ? "Edit" : Cmn.ToDbl(income).ToString("##,##0")) + "</a>"
                 + "<td>" + Cmn.ToDbl(deduction).ToString("##,##0"));
        }
        sb.Append("</table>");
        lblEmployeeList.Text = sb.ToString();
    }
}