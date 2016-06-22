using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class DeducteePage1 : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        
        string ID = QueryString("id");
        string companyid = QueryString("companyid");

        MST_COMPANY c = MST_COMPANY.GetByID(Cmn.ToInt(companyid));

        if (c != null)
        {
            lblID.Text = ID;
            lblCompanyID.Text = c.COMPANY_ID.ToString();
        }
        
        if (ID != "" && !IsPostBack)
        {
            ShowData();
        }
    }
    private void ShowData()
    {
        MST_DEDUCTEE D = MST_DEDUCTEE.GetByID(Cmn.ToInt(lblID.Text));
        if (D != null)
        {
            ddDeducteeType.SelectedValue = D.DEDUCTEE_CODE.ToString();
            txtPan.Text = D.DEDUCTEE_PAN;
            txtDeducteeName.Text = D.DEDUCTEE_NAME;
            txtDeducteeAddress1.Text = D.ADDRESS1;
            txtDeducteeAddress2.Text = D.ADDRESS2;
            txtDeducteeAddress3.Text = D.ADDRESS3;
            txtDeducteeAddress4.Text = D.ADDRESS4;
            txtDeducteeAddress5.Text = D.ADDRESS5;
            ddState.SelectedValue = D.STATE_ID.ToString();
            txtPin.Text = D.PIN_CODE;
            txtMobile.Text = D.MOBILE_NO;
            txtEmail.Text = D.EMAIL;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Update();
    }
    public void Update()
    {
        try
        {
            MST_DEDUCTEE D = MST_DEDUCTEE.GetByID(Cmn.ToInt(lblID.Text));
            if (D == null)
                D = new MST_DEDUCTEE();
            D.COMPANY_ID = Cmn.ToInt(lblCompanyID.Text);
            D.DEDUCTEE_CODE = ddDeducteeType.SelectedValue;
            D.DEDUCTEE_PAN = txtPan.Text;
            D.DEDUCTEE_NAME = txtDeducteeName.Text;
            D.ADDRESS1 = txtDeducteeAddress1.Text;
            D.ADDRESS2 = txtDeducteeAddress2.Text;
            D.ADDRESS3 = txtDeducteeAddress3.Text;
            D.ADDRESS4 = txtDeducteeAddress4.Text;
            D.ADDRESS5 = txtDeducteeAddress5.Text;
            D.STATE_ID = Cmn.ToInt(ddState.SelectedValue);
            D.PIN_CODE = txtPin.Text;
            D.MOBILE_NO = txtMobile.Text;
            D.EMAIL = txtEmail.Text;
            D.Save();

            lblID.Text = D.DEDUCTEE_ID.ToString();
            lblMessage.Text = "Saved!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Not Saved!" + ex.Message;
            lblMessage.ForeColor = System.Drawing.Color.Red;

        }
    }
}