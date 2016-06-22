using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class CompanyPage1 : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        Title = "Company Master";
        string id = QueryString("id");
        if (!IsPostBack)
        {
            int companyID = Global.CompanyID;
            ShowData(Cmn.ToInt(companyID));
        }
    }
    private void ShowData(int ID)
    {
        MST_COMPANY C = MST_COMPANY.GetByID(ID);
        if (C != null)
        {
            lblID.Text = C.COMPANY_ID.ToString();
            txtCompanyName.Text = C.COMPANY_NAME;
            txtTanNo.Text = C.TAN_NO;
            txtPanNo.Text = C.PAN_NO;
            txtBranch.Text = C.BRANCH_DIV;
            ddDeductorType.SelectedValue = C.D_CATEGORY_ID;
            txtTanRegNo.Text = C.TAN_REG_NO;
            txtFlatNo.Text = C.ADDRESS1;
            txtBuildingName.Text = C.ADDRESS2;
            txtStreet.Text = C.ADDRESS4;
            txtArea.Text = C.ADDRESS5;
            txtTown.Text = C.ADDRESS3;
            txtPin.Text = C.PIN_CODE;
            ddState.SelectedValue = C.STATE_ID.ToString();
            txtStd.Text=C.STD;
            txtPhone.Text = C.PHONE;
            txtAltStd.Text=C.ALT_STD;
            txtPhoneAlt.Text = C.ALT_PHONE;
            txtEmail.Text = C.EMAIL;
            txtEmailAlt.Text = C.ALT_EMAIL;
            txtResponsiblePersonName.Text = C.PERSON_NAME;
            txtDesignation.Text = C.DESIGNATION;
            txtFathersName.Text = C.FATHER_NAME;
            txtRPMobileNo.Text = C.P_MOBILE;
            txtRPFlatNo.Text = C.P_ADDRESS1;
            txtRPBuildingName.Text = C.P_ADDRESS2;
            txtRPStreet.Text = C.P_ADDRESS4;
            txtRPArea.Text = C.P_ADDRESS5;
            txtRPTown.Text = C.P_ADDRESS3;
            txtRPPin.Text = C.P_PIN_CODE;
            ddRPState.SelectedValue = C.P_STATE_ID.ToString();
            txtStdRP.Text=C.P_STD;
            txtStdAltRP.Text=C.P_ALT_STD;
            txtRPPhone.Text = C.P_PHONE;
            txtPhoneAlt.Text = C.P_ALT_PHONE;
            txtRPEmail.Text = C.P_EMAIL;
            txtRPEmailAlt.Text = C.P_ALT_EMAIL;
            txtPAOCode.Text = C.PAO_CODE;
            txtPAORegNo.Text = C.PAO_REG_NO;
            txtDDOCode.Text = C.DDO_CODE;
            txtDDORegNo.Text = C.DDO_REG_NO;
            ddGovDeductorState.SelectedValue = C.D_STATE_ID.ToString();
            ddMinistry.SelectedValue = C.MINISTRY_ID;
            txtOtherMinistry.Text = C.MINISTRY_OTHER;
            txtAccountOfficerIDNo.Text = C.ASSESSING_OFFICER;
            txtCITAddress.Text = C.CIT_TDS_ADDRESS;
            txtCITCity.Text = C.CIT_TDS_CITY;
            txtCITPin.Text = C.CIT_TDS_PINCODE;
         }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Update();
    }
    private void Update()
    {
        try
        {
            MST_COMPANY C = MST_COMPANY.GetByID(Cmn.ToInt(lblID.Text));
            if (C == null)
                C = new MST_COMPANY();
            C.LICENSE_ID =Global.LicenseID;
            C.GROUP_ID = 0;
            C.ASST_ID = Global.FinancialYearID.ToString();
            C.COMPANY_NAME = txtCompanyName.Text;
            C.TAN_NO = txtTanNo.Text;
            C.PAN_NO = txtPanNo.Text;
            C.BRANCH_DIV = txtBranch.Text;
            C.D_CATEGORY_ID = ddDeductorType.SelectedValue;
            C.TAN_REG_NO = txtTanRegNo.Text;
            C.ADDRESS1 = txtFlatNo.Text;
            C.ADDRESS2 = txtBuildingName.Text;
            C.ADDRESS4 = txtStreet.Text;
            C.ADDRESS5 = txtArea.Text;
            C.ADDRESS3 = txtTown.Text;
            C.PIN_CODE = txtPin.Text;
            C.STATE_ID = ddState.SelectedValue;
            C.STD = txtStd.Text;
            C.PHONE = txtPhone.Text;
            C.ALT_STD = txtAltStd.Text;
            C.ALT_PHONE = txtPhoneAlt.Text;
            C.EMAIL = txtEmail.Text;
            C.ALT_EMAIL = txtEmailAlt.Text;
            C.PERSON_NAME = txtResponsiblePersonName.Text;
            C.DESIGNATION = txtDesignation.Text;
            C.FATHER_NAME = txtFathersName.Text;
            C.P_MOBILE = txtRPMobileNo.Text;
            C.P_ADDRESS1 = txtRPFlatNo.Text;
            C.P_ADDRESS2 = txtRPBuildingName.Text;
            C.P_ADDRESS4 = txtRPStreet.Text;
            C.P_ADDRESS5 = txtRPArea.Text;
            C.P_ADDRESS3 = txtRPTown.Text;
            C.P_PIN_CODE = txtRPPin.Text;
            C.P_STATE_ID = ddRPState.SelectedValue;
            C.P_STD = txtStdRP.Text;
            C.P_ALT_STD = txtStdAltRP.Text;
            C.P_PHONE = txtRPPhone.Text;
            C.P_ALT_PHONE = txtPhoneAlt.Text;
            C.P_EMAIL = txtRPEmail.Text;
            C.P_EMAIL = txtRPEmailAlt.Text;
            C.PAO_CODE = txtPAOCode.Text;
            C.PAO_REG_NO = txtPAORegNo.Text;
            C.DDO_CODE = txtDDOCode.Text;
            C.DDO_REG_NO = txtDDORegNo.Text;
            C.D_STATE_ID = ddGovDeductorState.SelectedValue;
            C.MINISTRY_ID = ddMinistry.SelectedValue;
            C.MINISTRY_OTHER = txtOtherMinistry.Text;
            C.ASSESSING_OFFICER = txtAccountOfficerIDNo.Text;
            C.CIT_TDS_ADDRESS = txtCITAddress.Text;
            C.CIT_TDS_CITY = txtCITCity.Text;
            C.CIT_TDS_PINCODE = txtCITPin.Text;
            C.Save();
            Global.CompanyID = C.COMPANY_ID;
            lblMessage.Text = "Saved!";
            lblID.Text = C.COMPANY_ID.ToString();
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error Not Saved!" + ex.Message;
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void radioAddressSame_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (radioAddressSame.SelectedValue == "Y")
        {
            txtRPFlatNo.Text = txtFlatNo.Text;
            txtRPBuildingName.Text = txtBuildingName.Text;
            txtRPStreet.Text = txtStreet.Text;
            txtRPArea.Text = txtArea.Text;
            txtRPTown.Text = txtTown.Text;
            txtRPPin.Text = txtPin.Text;
            ddRPState.SelectedValue = ddState.SelectedValue;
            txtStdRP.Text = txtStd.Text;
            txtStdAltRP.Text = txtAltStd.Text;
            txtRPPhone.Text = txtPhone.Text;
            txtRPPhoneAlt.Text = txtPhoneAlt.Text;
            txtRPEmail.Text = txtEmail.Text;
            txtRPEmailAlt.Text = txtEmailAlt.Text;
        }
        else
        {
            txtRPFlatNo.Text = "";
            txtRPBuildingName.Text = "";
            txtRPStreet.Text = "";
            txtRPArea.Text = "";
            txtRPTown.Text = "";
            txtRPPin.Text = "";
            ddRPState.SelectedValue = "1";
            txtStdRP.Text = "";
            txtStdAltRP.Text="";
            txtRPPhone.Text = "";
            txtRPPhoneAlt.Text = "";
            txtRPEmail.Text = "";
            txtRPEmailAlt.Text = "";
        }
    }
    
}