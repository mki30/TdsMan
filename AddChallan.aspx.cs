using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class AddChallan : BasePage
{
    int correction = 0;
    new protected void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        spanFormID.InnerText = QueryString("formId");
        spanChallanID.InnerText = QueryString("challanid");
        correction = QueryStringInt("correction");
        if (!IsPostBack)
        {
            ShowData(Cmn.ToInt(spanChallanID.InnerText));
        }
    }
    private void ShowData(int ChallanID)
    {
        if (spanFormID.InnerText != "")
        {
            TRN_BASIC_INFO BI = TRN_BASIC_INFO.GetByID(Cmn.ToInt(spanFormID.InnerText));
            if (BI != null)
            {
                int maxSlNo = Cmn.ToInt(TRN_CHALLAN.GetByFormIdFinYrQuarter(BI.BASIC_INFO_ID, Cmn.ToInt(BI.YEAR), BI.QTR));
                spanSrlNo.InnerText = (maxSlNo + 1).ToString();
            }
        }

        if (ChallanID == 0)
            return;
        TRN_CHALLAN C = TRN_CHALLAN.GetByID(ChallanID);
        if (C != null)
        {
            spanSrlNo.InnerText = C.SL_NO.ToString();
            txtDate.Text = Cmn.ToDate(C.DEPOSIT_DATE).ToString("dd-MMM-yyy");
            txtBSRCode.Text = C.BSR_CODE;
            txtChalllnNo.Text = C.CHALLAN_NO;
            txtTDS.Text = Cmn.ToDbl(C.TDS).ToString("0.00");
            txtSurcharge.Text = Cmn.ToDbl(C.SURCHARGE).ToString("0.00");
            txtEducationCess.Text = Cmn.ToDbl(C.EDUCATION_CESS).ToString("0.00");
            txtInterest.Text = Cmn.ToDbl(C.INTEREST).ToString("0.00");
            txtFee.Text = Cmn.ToDbl(C.LATE_FEE).ToString("0.00");
            txtOthers.Text = Cmn.ToDbl(C.OTHERS).ToString("0.00");
            lblTotal.Text = Cmn.ToDbl(C.TOT_TAX).ToString("0.00");
            ddMinorHead.SelectedValue = C.MINOR_HEAD_ID;
            txtIntrestAllocated.Text = C.INTEREST_ALLOCATE.ToString();
            txtOthersAllocated.Text = C.OTHERS_ALLOCATED_.ToString();
            txtRemark.Text = C.REMARKS;
        }
    }
    
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Update();
    }
    
    private bool Compare(TRN_CHALLAN Chl)
    {
        ChallanCorrection ChlCorr = ChallanCorrection.GetByID((int)Chl.CORRECTION_ID);
        if (ChlCorr.MinorHead == Cmn.ToInt(Chl.MINOR_HEAD_ID) && ChlCorr.IntrestAlloc == Chl.INTEREST_ALLOCATE && ChlCorr.OtherAlloc == Chl.OTHERS_ALLOCATED_)
            return true;
        else
            return false;
    }

    private void Update()
    {
        try
        {
            TRN_CHALLAN C = TRN_CHALLAN.GetByID(Cmn.ToInt(spanChallanID.InnerText));

            if (C == null)
            {
                C = new TRN_CHALLAN();
                if (correction == 1)
                {
                    C.MODE = 0;  //add new challan in case of correction set mode to add-0 mode 
                }
            }

            TRN_BASIC_INFO rr = TRN_BASIC_INFO.GetByID(Cmn.ToInt(spanFormID.InnerText));

            C.COMPANY_ID = rr.COMPANY_ID;
            C.BASIC_INFO_ID = rr.BASIC_INFO_ID;
            C.QTR = rr.QTR;
            C.YEAR = rr.YEAR;
            C.DEPOSIT_DATE = Cmn.ToDate(txtDate.Text);
            C.BSR_CODE = txtBSRCode.Text;
            C.CHALLAN_NO = txtChalllnNo.Text;
            C.TDS = Cmn.ToDbl(txtTDS.Text);
            C.SURCHARGE = Cmn.ToDbl(txtSurcharge.Text);
            C.EDUCATION_CESS = Cmn.ToDbl(txtEducationCess.Text);
            C.INTEREST = Cmn.ToDbl(txtInterest.Text);
            C.LATE_FEE = Cmn.ToDbl(txtFee.Text);
            C.OTHERS = Cmn.ToDbl(txtOthers.Text);
            C.TOT_TAX = C.TDS + C.SURCHARGE + C.EDUCATION_CESS+C.INTEREST + C.LATE_FEE + C.OTHERS;//Cmn.ToDbl(txtTotal.Text);
            C.MINOR_HEAD_ID = ddMinorHead.SelectedValue;
            C.REMARKS = txtRemark.Text;
            C.INTEREST_ALLOCATE = Cmn.ToDbl(txtIntrestAllocated.Text);
            C.OTHERS_ALLOCATED_ = Cmn.ToDbl(txtOthersAllocated.Text);

            
            if (correction == 1)   //in case of correction
                {
                    if (C.MODE != 0)  //not a case of new add
                    {
                        if (Compare(C))
                            C.MODE = null;  //if equal to origional correction challan then set mode to null
                        else
                            C.MODE = 1;     //if origional correction challan modified then set mode to edit-1
                    }
                }
            
            C.Save();

            lblMessage.Text = "Saved!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            //WriteClientScript("parent.RefreshPage();");
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Not Saved" + ex.Message;
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }
}