using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class AddEmployee : BasePage
{
    int correction = 0;
    new protected void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        
        spanID.InnerText = QueryString("id");
        ChallanNo.InnerText = QueryString("challanno");
        challanDate.InnerText = QueryString("chalandate");
        ChallanID.InnerText = QueryString("challanid");
        int companyid = QueryStringInt("companyid");
        string formtype = QueryString("formtype");
        correction = QueryStringInt("correction");

        if (formtype == "26Q")
            lblPanelHead.InnerText = "Deductee";

        if (!IsPostBack)
        {
            if (formtype == "24Q")
            {
                List<MST_EMPLOYEE> list = MST_EMPLOYEE.GetList(companyid);
                foreach (MST_EMPLOYEE emp in list)
                {
                    ddEmployee.Items.Add(new ListItem(emp.EMPLOYEE_NAME_ + "," + emp.EMPLOYEE_PAN, emp.EMPLOYEE_ID.ToString()));
                }
            }
            else if (formtype == "26Q")
            {
                List<MST_DEDUCTEE> list = MST_DEDUCTEE.GetList(companyid);
                foreach (MST_DEDUCTEE ded in list)
                {
                    ddEmployee.Items.Add(new ListItem(ded.DEDUCTEE_NAME + "," + ded.DEDUCTEE_PAN + "," + (DeducteeType)Cmn.ToInt(ded.DEDUCTEE_CODE), ded.DEDUCTEE_ID.ToString()));
                }
                lblddEmployee.InnerText = "Deductee";
                ddSection.Items.Clear();
                string[] sectios = { "193", "194", "194BB", "194EE", "194A", "194B", "194C", "194D", "194E", "194F", "194G", "194H", "194J", "194LA", "194IA", "194IB" };
                foreach (string s in sectios)
                {
                    ddSection.Items.Add(new ListItem(s, s));
                }
                ddRemarks.Items.Clear();
                string[] remarks = { "Normal", "0", "Lower Deduction u/s 197", "1", "No Deduction u/s 197", "2", "Higher Rate (Valid PAN Not Available)", "3", "Software Providers", "4", "Transporter", "5", "Threshold Limit", "6", "No deductions u/s 197A(1F)", "7" };
                for (int i = 0; i < remarks.Length; i += 2)
                {
                    ddRemarks.Items.Add(new ListItem(remarks[i], remarks[i + 1]));
                }
            }
            ShowData(Cmn.ToInt(spanID.InnerText ));
        }
    }

    void ShowData(int ID)
    {
        if (ID == 0)
        {
            ddEmployee.Attributes.Add("style", "display:block");
            txtDate.Text = DateTime.Now.Date.ToString("dd-MMM-yyyy");
            return;
        }

        if (ChallanID.InnerText != "0")
        {
            int maxSlNo = Cmn.ToInt(TRN_DEDUCTEE_DETAILS.GetMaxSlNo(Cmn.ToInt(ChallanID.InnerText)));
            spanSrlNo.InnerText = (maxSlNo + 1).ToString();
        }

        TRN_DEDUCTEE_DETAILS chd = TRN_DEDUCTEE_DETAILS.GetByID(ID);
        if (chd != null)
        {
            try
            {
                spanSrlNo.InnerText = chd.SL_NO.ToString();
                lblEmployee.Text = chd.DEDUCTEE_NAME;
                ddEmployee.SelectedValue = chd.DEDUCTEE_ID.ToString();
                txtName.Text = chd.DEDUCTEE_NAME;
                txtPan.Text = chd.DEDUCTEE_PAN;
                ddSection.SelectedValue = chd.SECTION_ID;
                txtDate.Text = Cmn.ToDate(chd.DEDUCTED_DATE).ToString("dd-MMM-yyy");
                txtAmountOfPayment.Text = chd.PAYMENT_AMOUNT.ToString();
                txtIncomeTax.Text = chd.TAX_AMOUNT.ToString();
                txtSurcharge.Text = chd.SURCHARGE_AMOUNT.ToString();
                txtCess.Text = chd.CESS_AMOUNT.ToString();
                lblTotal.Text = chd.TOTAL_AMOUNT.ToString();
                txtTaxDeposited.Text = chd.TAX_DEPOSITED_AMOUNT.ToString();
                ddRemarks.SelectedValue = chd.REASON_ID.ToString();
                txtCirtificateNo.Text = chd.CERTIFICATE_NO;
            }
            catch { }
        }
    }

    void SaveData(int ID)
    {
        try
        {
            TRN_DEDUCTEE_DETAILS chd = TRN_DEDUCTEE_DETAILS.GetByID(ID);
            if (chd == null)
            {
                chd = new TRN_DEDUCTEE_DETAILS();
                if (correction == 1)
                {
                    chd.MODE = 0;  //add new challan in case of correction set mode to add-0 mode 
                }
            }

            chd.DEDUCTEE_ID = Cmn.ToInt(ddEmployee.SelectedValue);
            chd.CHALLAN_ID = Cmn.ToInt(ChallanNo.InnerText);
            chd.DEDUCTEE_NAME = ddEmployee.SelectedItem.Text.Split(',')[0];
            chd.DEDUCTEE_PAN = ddEmployee.SelectedItem.Text.Split(',')[1];
            chd.SECTION_ID = ddSection.SelectedValue;
            chd.DEDUCTED_DATE = Cmn.ToDate(txtDate.Text);
            chd.PAYMENT_AMOUNT = Cmn.ToDbl(txtAmountOfPayment.Text);
            chd.TAX_AMOUNT = Cmn.ToDbl(txtIncomeTax.Text);
            chd.SURCHARGE_AMOUNT = Cmn.ToDbl(txtSurcharge.Text);
            chd.CESS_AMOUNT = Cmn.ToDbl(txtCess.Text);
            chd.TOTAL_AMOUNT = chd.TAX_AMOUNT+ chd.SURCHARGE_AMOUNT + chd.CESS_AMOUNT; //Cmn.ToDbl(txtTotal.Text);
            chd.TAX_DEPOSITED_AMOUNT = Cmn.ToDbl(txtTaxDeposited.Text);
            chd.REASON_ID = ddRemarks.SelectedValue;
            chd.CERTIFICATE_NO = txtCirtificateNo.Text;

            if (chd.CORRECTIONID != null)
            {
                if (chd.MODE != 0)  //not a case of new add
                {
                    if (Compare(chd))
                        chd.MODE = null;
                    else
                        chd.MODE = 1;
                }
            }
            chd.Save();
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

    private bool Compare(TRN_DEDUCTEE_DETAILS chd)
    {
        ChallanDetailCorrection chdCorr = ChallanDetailCorrection.GetByID((int)chd.CORRECTIONID);
        if (chd.SECTION_ID == chdCorr.Section && chd.PAYMENT_AMOUNT == chdCorr.PaymentAmount && chd.DEDUCTED_DATE == chdCorr.Date && chd.SURCHARGE_AMOUNT == chdCorr.SurCharge && chd.TOTAL_AMOUNT == chdCorr.Total)
        return true;
        else
        return false;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData(Cmn.ToInt(spanID.InnerText));
    }
}