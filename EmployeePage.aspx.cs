using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class EmployeePage : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);

        string ID = QueryString("id");
        string companyid = QueryString("companyid");

        MST_COMPANY c = MST_COMPANY.GetByID(Cmn.ToInt(companyid));
        if (c != null)
        {
            lblCompany.Text = c.COMPANY_NAME;
            lblCompanyID.Text = c.COMPANY_ID.ToString();
        }
        
        if (ID != "" && !IsPostBack)
        {
            ShowData(Cmn.ToInt(ID));
        }
    }

    private void ShowData(int ID)
    {
        MST_EMPLOYEE E = MST_EMPLOYEE.GetByID(ID);
        if (E != null)
        {
            lblID.Text = E.EMPLOYEE_ID.ToString();
            //ddCompany.SelectedValue = E.CompanyID.ToString();
            txtEmployeePan.Text = E.EMPLOYEE_PAN;
            txtEmployeeName.Text = E.EMPLOYEE_NAME_;
            ddEmployeeCatagory.SelectedValue = E.CATEGORY.ToString();
            txtEmployeReferenceNo.Text = E.EMPLOYEE_REF;
            txtDesignation.Text = E.DESIGNATION;
            txtDOB.Text = E.DOB!=Cmn.MinDate ?Cmn.ToDate(E.DOB).ToString("dd-MMM-yyyy"):"";
            txtDOJ.Text = E.DOB != Cmn.MinDate ? Cmn.ToDate(E.DOJ).ToString("dd-MMM-yyyy") : "";
            txtAddress.Text = E.ADDRESS;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Update();
    }
    private void Update()
    {
        if (txtEmployeeName.Text != "")
        {
            try
            {
                MST_EMPLOYEE E = MST_EMPLOYEE.GetByID(Cmn.ToInt(lblID.Text));
                if (E == null)
                    E = new MST_EMPLOYEE();
                E.COMPANY_ID = Cmn.ToInt(lblCompanyID.Text);
                E.EMPLOYEE_PAN = txtEmployeePan.Text;
                E.EMPLOYEE_NAME_ = txtEmployeeName.Text;
                E.CATEGORY = ddEmployeeCatagory.SelectedValue;
                E.EMPLOYEE_REF = txtEmployeReferenceNo.Text;
                E.DESIGNATION = txtDesignation.Text;
                E.DOB = Cmn.ToDate(txtDOB.Text);
                E.DOJ = Cmn.ToDate(txtDOJ.Text);
                E.ADDRESS = txtAddress.Text;
                E.Save();

                lblID.Text = E.EMPLOYEE_ID.ToString();
                lblMessage.Text = "Saved!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            catch
            {
                lblMessage.Text = "Not Saved!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
        else
        {
            lblMessage.Text = "Not Saved! Employee name is mandatory!";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }

}