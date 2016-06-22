using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;
using System.Text;

public partial class GenerateForm27A : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        int FormID = Cmn.ToInt(QueryString("formId"));
        TRN_BASIC_INFO RR=TRN_BASIC_INFO.GetByID(FormID);
        txtFinancialYear.Text = (RR.YEAR).ToString() + "-" + (RR.YEAR+1).ToString();
        txtAssessmentYear.Text=(RR.YEAR+1).ToString()+ "-" + (RR.YEAR+2).ToString();
        txtPrvReturnTokenNo.Text = string.IsNullOrEmpty(RR.PREV_PRN_NO) ? "" : RR.PREV_PRN_NO;
        List<TRN_CHALLAN> C =TRN_CHALLAN.GetByFormID(FormID);
        int Deductee =0;
        float ChallanAmount = 0.00f;
        float AmountPayed = 0.00f;
        float taxDeducted = 0.00f;
        float taxDeposited = 0.00f;
        foreach (TRN_CHALLAN c in C)
        {
            
            ChallanAmount += (float)c.TOT_TAX;
            taxDeducted += (float)c.TOT_TAX;
            taxDeposited += (float)(c.TOT_TAX);
            
            List<TRN_DEDUCTEE_DETAILS> CD = TRN_DEDUCTEE_DETAILS.GetByChallanID(c.CHALLAN_ID);
            foreach (TRN_DEDUCTEE_DETAILS cd in CD)
            {
                Deductee++;
                AmountPayed+=(float)(cd.PAYMENT_AMOUNT);
                //taxDeposited += (float)(cd.TaxDeposited);
            }
        }
        MST_COMPANY Comp = MST_COMPANY.GetByID((int)RR.COMPANY_ID);
        if (Comp != null)
        {
            lblName.Text = Comp.COMPANY_NAME;
            string Dedtype="";
            Global.DeductorType.TryGetValue(Comp.D_CATEGORY_ID,out Dedtype);
            txtDeductorTAN.Text = Comp.TAN_NO;
            txtDeductorPAN.Text = Comp.PAN_NO;
            lblDeductorType.Text = Dedtype;
            lblBranch.Text = Comp.BRANCH_DIV;
            lblFlatNo.Text = Comp.ADDRESS1;
            lblBuilding.Text = Comp.ADDRESS2;
            lblStreet.Text = Comp.ADDRESS3;
            lblArea.Text = Comp.ADDRESS4;
            lblCity.Text = Comp.ADDRESS5;
            string state = "";
            Global.State.TryGetValue(Cmn.ToInt( Comp.STATE_ID), out state);
            lblState.Text = state;
            lblPin.Text = Comp.PIN_CODE;
            lblTel.Text = Comp.PHONE;
            lblEmial.Text = Comp.EMAIL;

            lblRPName.Text = Comp.PERSON_NAME;
            lblRPFlatNo.Text = Comp.P_ADDRESS1;
            lblRPBuilding.Text = Comp.P_ADDRESS2;
            lblRPStreet.Text = Comp.P_ADDRESS3;
            lblRPArea.Text = Comp.P_ADDRESS4;
            lblRPTown.Text = Comp.P_ADDRESS5;
            string p_state = "";
            Global.State.TryGetValue(Cmn.ToInt( Comp.P_STATE_ID), out p_state);
            lblRPState.Text = state;
            lblRPPin.Text = Comp.P_PIN_CODE;
            lblRPTel.Text = Comp.P_PHONE;
            lblRPEmail.Text = Comp.P_EMAIL;

            lblNoOfDeductee.Text = Deductee.ToString();
            lblAmountPayed.Text = Cmn.ToDbl(AmountPayed).ToString("0.00");
            lblTaxDed.Text = Cmn.ToDbl(taxDeducted).ToString("0.00");
            lblTaxDeposited.Text = Cmn.ToDbl(taxDeposited).ToString("0.00");

            lblDeclarePerson.Text = Comp.PERSON_NAME;
            lblPlace.Text = Comp.ADDRESS5;
            lblDate.Text = DateTime.Now.ToString("dd-MMM-yy");
        }

    }
}