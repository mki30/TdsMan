using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class SalaryDetailPage : BasePage
{
    int formid = 0;
    int employeeid = 0;

    StringBuilder taxCalculationLink = new StringBuilder();
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        formid = Cmn.ToInt(QueryString("formid"));
        employeeid = Cmn.ToInt(QueryString("employeeid"));
        TRN_SALARY_DETAILS sd = TRN_SALARY_DETAILS.GetByFormIDEmployeeID(formid, employeeid);
        if (sd != null)
            lblID.Text = sd.SALARY_DETAILS_ID.ToString();
        
        if (!IsPostBack)
        {
            MST_EMPLOYEE E = MST_EMPLOYEE.GetByID(employeeid);
            if (E != null)
            {
                lblEmployeeName.Text = E.EMPLOYEE_NAME_;
                lblEmployeePan.Text = E.EMPLOYEE_PAN;
                lblEmployeeId.Text = employeeid.ToString();

                TRN_BASIC_INFO rr = TRN_BASIC_INFO.GetByID(Cmn.ToInt(formid));
                txtFromDate.Text = "1-apr-" + rr.YEAR;
                txtToDate.Text = "31-mar-" + (rr.YEAR + 1);
                ShowData();
            }
        }
     }

    private void ShowData()
    {
        TRN_SALARY_DETAILS SD = TRN_SALARY_DETAILS.GetByID(Cmn.ToInt(lblID.Text));
        if (SD == null) return;
        
        List<TRN_CHALLAN> chl = TRN_CHALLAN.GetByYear(Cmn.ToDate(SD.FROM_DATE).Year);
        double bal = 0.00d;
        double totalTds = 0.00d;
        foreach (TRN_CHALLAN ch in chl)
        {
            List<TRN_DEDUCTEE_DETAILS> cdl = TRN_DEDUCTEE_DETAILS.GetByChallanIDandEmployeeID(ch.CHALLAN_ID, employeeid);
            foreach (TRN_DEDUCTEE_DETAILS cd in cdl)
            {
                bal += Cmn.ToDbl(cd.PAYMENT_AMOUNT);
                totalTds += Cmn.ToDbl(cd.TOTAL_AMOUNT);
            }
        }

        lblID.Text = SD.SALARY_DETAILS_ID.ToString();
        txtFromDate.Text = Cmn.ToDate(SD.FROM_DATE).ToString("dd-MMM-yyyy");
        txtToDate.Text = Cmn.ToDate(SD.TO_DATE).ToString("dd-MMM-yyyy"); 
        //1
        txtSec17_1.Text=SD.TS_GS_SEC_17_1.ToString();
        txtSec17_2.Text=SD.TS_GS_SEC_17_2.ToString();
        txtSec17_3.Text=SD.TS_GS_SEC_17_3.ToString();
        lblTotal.Text = SD.TS_GS_TOTAL.ToString();

        //2
        txtAllowanceDesc1.Text=SD.TS_LA_ITEM_1_DESC;
        txtAllowanceDesc2.Text=SD.TS_LA_ITEM_2_DESC;
        txtAllowanceDesc3.Text=SD.TS_LA_ITEM_3_DESC;
        txtAllowanceDesc4.Text=SD.TS_LA_ITEM_4_DESC;
        txtAllowanceDesc5.Text=SD.TS_LA_ITEM_5_DESC;
        txtAllowance1Amount.Text = SD.TS_LA_ITEM_1.ToString();
        txtAllowance2Amount.Text = SD.TS_LA_ITEM_2.ToString();
        txtAllowance3Amount.Text = SD.TS_LA_ITEM_3.ToString();
        txtAllowance4Amount.Text = SD.TS_LA_ITEM_4.ToString();
        txtAllowance5Amount.Text = SD.TS_LA_ITEM_5.ToString();
        lblAlllowanceTotal.Text=SD.TS_LA_TOTAL.ToString() ;

        //4
        txtEntertainmentAllowance.Text=Cmn.ToDbl(SD.US_16_EA).ToString("0.00");
        txtTaxOnEmployement.Text=Cmn.ToDbl(SD.US_16_TE.ToString()).ToString("0.00");
        double aggOf4a4b = Cmn.ToDbl(SD.US_16_EA + SD.US_16_TE);
        lblAggregateOf4a4b.Text = aggOf4a4b.ToString("0.00");

        //3
        double balance=Cmn.ToDbl(SD.TS_GS_TOTAL - SD.TS_LA_TOTAL);
        txtBalance.Text = balance.ToString("0.00");
        txtBrkupCurrentEmployerBal.Text = Cmn.ToDbl(balance-aggOf4a4b).ToString("0.00");
        lblBrkupAmountInSoftware.Text = Cmn.ToDbl(bal).ToString("0.00");
        //txtBrkupPrevEmployer.Text = Cmn.ToDbl(SD.BalancePriviousEmployer).ToString("0.00");
        
        //6  (3-5)
        lblIncomeChargableUnderHeadSal.Text = Cmn.ToDbl(SD.INCOME_CHARGEABLE).ToString("0.00");

        //7
        txtOtheIncomeDesc1.Text=SD.AIS_ITEM_1_DESC;
        txtOtheIncomeDesc2.Text=SD.AIS_ITEM_2_DESC;
        txtOtheIncomeDesc3.Text=SD.AIS_ITEM_3_DESC;
        txtOtheIncomeDesc4.Text=SD.AIS_ITEM_4_DESC;
        txtOtheIncomeAmount1.Text=SD.AIS_ITEM_1.ToString();
        txtOtheIncomeAmount2.Text=SD.AIS_ITEM_2.ToString();
        txtOtheIncomeAmount3.Text=SD.AIS_ITEM_3.ToString();
        txtOtheIncomeAmount4.Text=SD.AIS_ITEM_4.ToString();
        lblTotalOtherIncome.Text=Cmn.ToDbl(SD.AIS_Total).ToString("0.00");
        
        //8
        lblGrossTotalIncome.Text = Cmn.ToDbl(SD.INCOME_CHARGEABLE + SD.AIS_Total).ToString("0.00");

        //9-A
        txt80CDesc1.Text=  SD.CVIA_SEC80C_ITEM_1_DESC;
        txt80CDesc2.Text = SD.CVIA_SEC80C_ITEM_2_DESC;
        txt80CDesc3.Text = SD.CVIA_SEC80C_ITEM_3_DESC;
        txt80CDesc4.Text = SD.CVIA_SEC80C_ITEM_4_DESC;
        txt80CDesc5.Text = SD.CVIA_SEC80C_ITEM_5_DESC;
        txt80CDesc6.Text = SD.CVIA_SEC80C_ITEM_6_DESC;
        txt80CAmount1.Text=SD.CVIA_SEC80C_ITEM_1.ToString();
        txt80CAmount2.Text=SD.CVIA_SEC80C_ITEM_2.ToString();
        txt80CAmount3.Text=SD.CVIA_SEC80C_ITEM_3.ToString();
        txt80CAmount4.Text=SD.CVIA_SEC80C_ITEM_4.ToString();
        txt80CAmount5.Text = SD.CVIA_SEC80C_ITEM_5.ToString();
        txt80CAmount6.Text = SD.CVIA_SEC80C_ITEM_6.ToString();
        lblGrossTotal80C.Text=Cmn.ToDbl(SD.CVIA_SEC80C_GROSS_TOTAL).ToString("0.00");
        txtDeductibleTotal80C.Text=SD.CVIA_SEC80C_DED_TOTAL.ToString();

        txtGrossAmount80CCC.Text=SD.CVIA_SEC80CCC_GROSS_AMOUNT.ToString();
        txtDeducAmount80CCC.Text=SD.CVIA_SEC80CCC_DED_AMOUNT.ToString();
        txtGrossAmount80CCD.Text=SD.CVIA_SEC80CCD_GROSS_AMOUNT.ToString();
        txtDeducAmount80CCD.Text=SD.CVIA_SEC80CCD_DED_AMOUNT.ToString();

        
        lblTotalDedAmount80CCE.Text=SD.CVIA_SEC80CCE_TOTAL_DED_AMOUNT.ToString();
        //9-B
        txtGrossAmount80CCG.Text=SD.CVIA_SEC80CCG_GROSS_AMOUNT.ToString();
        txtDeducAmount80CCG.Text=SD.CVIA_SEC80CCG_DED_AMOUNT.ToString();
        
        //9-c
        txtOtherSec1.Text = SD.CVIA_OTH_ITEM_1_DESC;
        txtOtherSec1GrossAmmount.Text = Cmn.ToDbl(SD.CVIA_OTH_ITEM_1_GROSS_AMOUNT).ToString("0.00");
        txtOtherSec1QualifyingAmount.Text = Cmn.ToDbl(SD.CVIA_OTH_ITEM_1_QUAL_AMOUNT).ToString("0.00");
        txtOtherSec1DeductibleAmount.Text = Cmn.ToDbl(SD.CVIA_OTH_ITEM_1_DED_AMOUNT).ToString("0.00");
        
        txtOtherSec2.Text = SD.CVIA_OTH_ITEM_2_DESC;
        txtOtherSec2GrossAmmount.Text = Cmn.ToDbl(SD.CVIA_OTH_ITEM_2_GROSS_AMOUNT).ToString("0.00");
        txtOtherSec2QualifyingAmount.Text = Cmn.ToDbl(SD.CVIA_OTH_ITEM_2_QUAL_AMOUNT).ToString("0.00");
        txtOtherSec2DeductibleAmount.Text = Cmn.ToDbl(SD.CVIA_OTH_ITEM_2_DED_AMOUNT).ToString("0.00");
        
        txtOtherSec3.Text = SD.CVIA_OTH_ITEM_3_DESC;
        txtOtherSec3GrossAmmount.Text = Cmn.ToDbl(SD.CVIA_OTH_ITEM_3_GROSS_AMOUNT).ToString("0.00");
        txtOtherSec3QualifyingAmount.Text = Cmn.ToDbl(SD.CVIA_OTH_ITEM_3_QUAL_AMOUNT).ToString("0.00");
        txtOtherSec3DeductibleAmount.Text = Cmn.ToDbl(SD.CVIA_OTH_ITEM_3_DED_AMOUNT).ToString("0.00");
        
        txtOtherSec4.Text = SD.CVIA_OTH_ITEM_4_DESC;
        txtOtherSec4GrossAmmount.Text = Cmn.ToDbl(SD.CVIA_OTH_ITEM_4_GROSS_AMOUNT).ToString("0.00");
        txtOtherSec4QualifyingAmount.Text = Cmn.ToDbl(SD.CVIA_OTH_ITEM_4_QUAL_AMOUNT).ToString("0.00");
        txtOtherSec4DeductibleAmount.Text = Cmn.ToDbl(SD.CVIA_OTH_ITEM_4_DED_AMOUNT).ToString("0.00");
        
        txtOtherSec5.Text = SD.CVIA_OTH_ITEM_5_DESC;
        txtOtherSec5GrossAmmount.Text = Cmn.ToDbl(SD.CVIA_OTH_ITEM_5_GROSS_AMOUNT).ToString("0.00");
        txtOtherSec5QualifyingAmount.Text = Cmn.ToDbl(SD.CVIA_OTH_ITEM_5_QUAL_AMOUNT).ToString("0.00");
        txtOtherSec5DeductibleAmount.Text = Cmn.ToDbl(SD.CVIA_OTH_ITEM_5_DED_AMOUNT).ToString("0.00");
    
        lblTotalDedAmountOtherSec.Text = Cmn.ToDbl(SD.CVIA_OTH_DED_TOTAL).ToString("0.00");

        //10
        lblTotalDedAmountVIA.Text = Cmn.ToDbl(SD.CVIA_SEC80CCE_TOTAL_DED_AMOUNT + SD.CVIA_SEC80CCG_DED_AMOUNT + SD.CVIA_OTH_DED_TOTAL).ToString("0.00");
        //11
        lblTotalTaxableIncome.Text = Cmn.ToDbl(SD.GROSS_TOTAL_INCOME - SD.CVIA_DED_TOTAL).ToString("0.00");
        //12
        txtTaxOnTotalIncome.Text = Cmn.ToDbl(SD.TAX_TOTAL_INCOME).ToString("0.00");

        //13
        txtSurcharge.Text = SD.SCHG_TOTAL_INCOME.ToString();
        //14
        txtCess.Text = SD.ECESS_TOTAL_INCOME.ToString();
        //15
        lblTaxPayble.Text = Cmn.ToDbl(SD.TAX_PAYABLE).ToString("0.00");

        //16
        txtRelief.Text=SD.US_89_LESS.ToString();
        //17
        lblNetTaxPayble.Text = Cmn.ToDbl(SD.TAX_PAYABLE - SD.US_89_LESS).ToString("0.00");

        txtTotalTaxDeducted.Text=Cmn.ToDbl(SD.TOTAL_TAX_DEDUCTED_AMOUNT).ToString("0.00");

        //txtTDSCurentEmployer.Text=Cmn.ToDbl(SD.BrkUpTdsCurrentEmployer).ToString("0.00");
        lblTDSInSW.Text = Cmn.ToDbl(totalTds).ToString("0.00");
        lblShortfallExcessDedofTax.Text = Cmn.ToDbl(SD.SHORTFALL_TAX).ToString("0.00");
        DDNoPan.SelectedValue = SD.TAX_DEDUCTED_HIGHER_RATE == 1 ? "1" : "0";
        DDNoPan.SelectedValue = SD.TAX_DEDUCTED_HIGHER_RATE.ToString();

        
        lnkTotalTaxSlab.HRef = "/TaxCalculate.aspx?employeeid=" + lblEmployeeId.Text + "&totaltaxableincome=" + lblTotalTaxableIncome.Text.Split('.')[0];
        lnkSurchargeAsPerSlab.HRef = "/TaxCalculate.aspx?employeeid=" + lblEmployeeId.Text + "&totaltaxableincome=" + lblTotalTaxableIncome.Text.Split('.')[0];
        lnkCessAsPerSlab.HRef = "/TaxCalculate.aspx?employeeid=" + lblEmployeeId.Text + "&totaltaxableincome=" + lblTotalTaxableIncome.Text.Split('.')[0];

        //calculations as pe slab
        lblTaxOnTotalIncomeAsPerSlab.Text = Cmn.CalculateTax((double)SD.TOTAL_INCOME).ToString();
        lblSurchargeAsPerSlab.Text = Cmn.CalculateSurcharge((double)SD.TAX_TOTAL_INCOME).ToString();
        lblCessAsPerSlab.Text = Cmn.CalculateCess((double)SD.TAX_TOTAL_INCOME).ToString();
    }

    private void Update()
    {
        TRN_SALARY_DETAILS SD = TRN_SALARY_DETAILS.GetByID(Cmn.ToInt(lblID.Text));
        if (SD == null)
        SD = new TRN_SALARY_DETAILS();
        SD.BASIC_INFO_ID = Cmn.ToInt(formid);
        SD.EMPLOYEE_ID = Cmn.ToInt(lblEmployeeId.Text);
        SD.FROM_DATE = Cmn.ToDate(txtFromDate.Text);
        SD.TO_DATE = Cmn.ToDate(txtToDate.Text);
        
        //1
        SD.TS_GS_SEC_17_1 = Cmn.ToDbl(txtSec17_1.Text);
        SD.TS_GS_SEC_17_2 = Cmn.ToDbl(txtSec17_2.Text);
        SD.TS_GS_SEC_17_3 = Cmn.ToDbl(txtSec17_3.Text);
        SD.TS_GS_TOTAL = Cmn.ToDbl(txtSec17_1.Text) + Cmn.ToDbl(txtSec17_2.Text) + Cmn.ToDbl(txtSec17_3.Text);//Cmn.ToDbl(txtTotal.Text);
        //2
        SD.TS_LA_ITEM_1_DESC = txtAllowanceDesc1.Text;
        SD.TS_LA_ITEM_2_DESC = txtAllowanceDesc2.Text;
        SD.TS_LA_ITEM_3_DESC = txtAllowanceDesc3.Text;
        SD.TS_LA_ITEM_4_DESC = txtAllowanceDesc4.Text;
        SD.TS_LA_ITEM_5_DESC = txtAllowanceDesc5.Text;
        SD.TS_LA_ITEM_1 = Cmn.ToDbl(txtAllowance1Amount.Text);
        SD.TS_LA_ITEM_2 = Cmn.ToDbl(txtAllowance2Amount.Text);
        SD.TS_LA_ITEM_3 = Cmn.ToDbl(txtAllowance3Amount.Text);
        SD.TS_LA_ITEM_4 = Cmn.ToDbl(txtAllowance4Amount.Text);
        SD.TS_LA_ITEM_5 = Cmn.ToDbl(txtAllowance5Amount.Text);
        SD.TS_LA_TOTAL = Cmn.ToDbl(txtAllowance1Amount.Text) + Cmn.ToDbl(txtAllowance2Amount.Text) + Cmn.ToDbl(txtAllowance3Amount.Text) + Cmn.ToDbl(txtAllowance4Amount.Text) + Cmn.ToDbl(txtAllowance5Amount.Text);//Cmn.ToDbl(txtAlllowanceTotal.Text);
        
        SD.TS_BALANCE = Cmn.ToDbl(txtBalance.Text);
        
        //4
        SD.US_16_EA = Cmn.ToDbl(txtEntertainmentAllowance.Text);
        SD.US_16_TE = Cmn.ToDbl(txtTaxOnEmployement.Text);
        double aggOf4a4b = Cmn.ToDbl(SD.US_16_EA + SD.US_16_TE);
        SD.US_16_AGGREGATE = Cmn.ToDbl(SD.US_16_EA + SD.US_16_TE);

        //3- hve to be fixed
        SD.BalanceCurrentEmployer = (txtBrkupCurrentEmployerBal.Text != "") ? Cmn.ToDbl(txtBrkupCurrentEmployerBal.Text) : Cmn.ToDbl(SD.TS_BALANCE - aggOf4a4b);
        //SD.BalanceInSoftware = Cmn.ToDbl(lblBrkupAmountInSoftware.Text);
        SD.BalancePriviousEmployer = Cmn.ToDbl(txtBrkupPrevEmployer.Text);
        
        //5
        
        //6
        SD.INCOME_CHARGEABLE = SD.TS_BALANCE - aggOf4a4b;
        //7
        SD.AIS_ITEM_1_DESC = txtOtheIncomeDesc1.Text;
        SD.AIS_ITEM_2_DESC = txtOtheIncomeDesc2.Text;
        SD.AIS_ITEM_3_DESC = txtOtheIncomeDesc3.Text;
        SD.AIS_ITEM_4_DESC = txtOtheIncomeDesc4.Text;
        SD.AIS_ITEM_1 = Cmn.ToDbl(txtOtheIncomeAmount1.Text);
        SD.AIS_ITEM_2 = Cmn.ToDbl(txtOtheIncomeAmount2.Text);
        SD.AIS_ITEM_3 = Cmn.ToDbl(txtOtheIncomeAmount3.Text);
        SD.AIS_ITEM_4 = Cmn.ToDbl(txtOtheIncomeAmount4.Text);
        double incomeOtherThanSalTotal = Cmn.ToDbl(SD.AIS_ITEM_1 + SD.AIS_ITEM_2 + SD.AIS_ITEM_2 + SD.AIS_ITEM_4);
        SD.AIS_Total = incomeOtherThanSalTotal;
        
        //8
        SD.GROSS_TOTAL_INCOME = SD.INCOME_CHARGEABLE + incomeOtherThanSalTotal;

        //9
        SD.CVIA_SEC80C_ITEM_1_DESC = txt80CDesc1.Text;
        SD.CVIA_SEC80C_ITEM_2_DESC = txt80CDesc2.Text;
        SD.CVIA_SEC80C_ITEM_3_DESC = txt80CDesc3.Text;
        SD.CVIA_SEC80C_ITEM_4_DESC = txt80CDesc4.Text;
        SD.CVIA_SEC80C_ITEM_5_DESC = txt80CDesc5.Text;
        SD.CVIA_SEC80C_ITEM_6_DESC = txt80CDesc6.Text;
        SD.CVIA_SEC80C_ITEM_1 =Cmn.ToDbl(txt80CAmount1.Text);
        SD.CVIA_SEC80C_ITEM_2 = Cmn.ToDbl(txt80CAmount2.Text);
        SD.CVIA_SEC80C_ITEM_3 = Cmn.ToDbl(txt80CAmount3.Text);
        SD.CVIA_SEC80C_ITEM_4 = Cmn.ToDbl(txt80CAmount4.Text);
        SD.CVIA_SEC80C_ITEM_5 = Cmn.ToDbl(txt80CAmount5.Text);
        SD.CVIA_SEC80C_ITEM_6 = Cmn.ToDbl(txt80CAmount6.Text);
        double sec80cTotal = Cmn.ToDbl(SD.CVIA_SEC80C_ITEM_1 + SD.CVIA_SEC80C_ITEM_2 + SD.CVIA_SEC80C_ITEM_3 + SD.CVIA_SEC80C_ITEM_4 + SD.CVIA_SEC80C_ITEM_5 + SD.CVIA_SEC80C_ITEM_6);

        SD.CVIA_SEC80C_GROSS_TOTAL = sec80cTotal;
        SD.CVIA_SEC80C_DED_TOTAL = Cmn.ToDbl(txtDeductibleTotal80C.Text);

        SD.CVIA_SEC80CCC_GROSS_AMOUNT= Cmn.ToDbl(txtGrossAmount80CCC.Text);
        SD.CVIA_SEC80CCC_DED_AMOUNT= Cmn.ToDbl(txtDeducAmount80CCC.Text);
        SD.CVIA_SEC80CCD_GROSS_AMOUNT = Cmn.ToDbl(txtGrossAmount80CCD.Text);
        SD.CVIA_SEC80CCD_DED_AMOUNT = Cmn.ToDbl(txtDeducAmount80CCD.Text);
        double totlDedAmount80cce=Cmn.ToDbl(SD.CVIA_SEC80C_DED_TOTAL+SD.CVIA_SEC80CCC_DED_AMOUNT+SD.CVIA_SEC80CCD_DED_AMOUNT);
        SD.CVIA_SEC80CCE_TOTAL_DED_AMOUNT = totlDedAmount80cce;

        SD.CVIA_SEC80CCG_GROSS_AMOUNT = Cmn.ToDbl(txtGrossAmount80CCG.Text);
        SD.CVIA_SEC80CCG_DED_AMOUNT= Cmn.ToDbl(txtDeducAmount80CCG.Text);
        
        SD.CVIA_OTH_ITEM_1_DESC=txtOtherSec1.Text;
        SD.CVIA_OTH_ITEM_2_DESC=txtOtherSec2.Text;
        SD.CVIA_OTH_ITEM_3_DESC=txtOtherSec3.Text;
        SD.CVIA_OTH_ITEM_4_DESC=txtOtherSec4.Text;
        SD.CVIA_OTH_ITEM_5_DESC=txtOtherSec5.Text;

        SD.CVIA_OTH_ITEM_1_GROSS_AMOUNT=Cmn.ToDbl(txtOtherSec1GrossAmmount.Text);
        SD.CVIA_OTH_ITEM_2_GROSS_AMOUNT=Cmn.ToDbl(txtOtherSec2GrossAmmount.Text);
        SD.CVIA_OTH_ITEM_3_GROSS_AMOUNT=Cmn.ToDbl(txtOtherSec3GrossAmmount.Text);
        SD.CVIA_OTH_ITEM_4_GROSS_AMOUNT=Cmn.ToDbl(txtOtherSec4GrossAmmount.Text);
        SD.CVIA_OTH_ITEM_5_GROSS_AMOUNT=Cmn.ToDbl(txtOtherSec5GrossAmmount.Text);

        SD.CVIA_OTH_ITEM_1_QUAL_AMOUNT=Cmn.ToDbl(txtOtherSec1QualifyingAmount.Text);
        SD.CVIA_OTH_ITEM_2_QUAL_AMOUNT=Cmn.ToDbl(txtOtherSec2QualifyingAmount.Text);
        SD.CVIA_OTH_ITEM_3_QUAL_AMOUNT=Cmn.ToDbl(txtOtherSec3QualifyingAmount.Text);
        SD.CVIA_OTH_ITEM_4_QUAL_AMOUNT=Cmn.ToDbl(txtOtherSec4QualifyingAmount.Text);
        SD.CVIA_OTH_ITEM_5_QUAL_AMOUNT=Cmn.ToDbl(txtOtherSec5QualifyingAmount.Text);


        SD.CVIA_OTH_ITEM_1_DED_AMOUNT=Cmn.ToDbl(txtOtherSec1DeductibleAmount.Text);
        SD.CVIA_OTH_ITEM_2_DED_AMOUNT=Cmn.ToDbl(txtOtherSec2DeductibleAmount.Text);
        SD.CVIA_OTH_ITEM_3_DED_AMOUNT=Cmn.ToDbl(txtOtherSec3DeductibleAmount.Text);
        SD.CVIA_OTH_ITEM_4_DED_AMOUNT=Cmn.ToDbl(txtOtherSec4DeductibleAmount.Text);
        SD.CVIA_OTH_ITEM_5_DED_AMOUNT=Cmn.ToDbl(txtOtherSec5DeductibleAmount.Text);


        double totlDedAmountOtherSec = Cmn.ToDbl(txtOtherSec1DeductibleAmount.Text) + Cmn.ToDbl(txtOtherSec2DeductibleAmount.Text) + Cmn.ToDbl(txtOtherSec3DeductibleAmount.Text) + Cmn.ToDbl(txtOtherSec4DeductibleAmount.Text) + Cmn.ToDbl(txtOtherSec5DeductibleAmount.Text);
        SD.CVIA_OTH_DED_TOTAL = totlDedAmountOtherSec;
        
        //10
        SD.CVIA_DED_TOTAL = Cmn.ToDbl(SD.CVIA_SEC80CCE_TOTAL_DED_AMOUNT + SD.CVIA_SEC80CCG_DED_AMOUNT + SD.CVIA_OTH_DED_TOTAL);
        
        //11
        SD.TOTAL_INCOME = SD.GROSS_TOTAL_INCOME - SD.CVIA_DED_TOTAL;
        
        //12
        SD.TAX_TOTAL_INCOME = Cmn.ToDbl(txtTaxOnTotalIncome.Text);
        //13
        SD.SCHG_TOTAL_INCOME = Cmn.ToDbl(txtSurcharge.Text);
        
        //14
        SD.ECESS_TOTAL_INCOME = Cmn.ToDbl(txtCess.Text);
        
        //15
        SD.TAX_PAYABLE_AGGREGATE = SD.TAX_TOTAL_INCOME + SD.SCHG_TOTAL_INCOME + SD.ECESS_TOTAL_INCOME;
        
        //16
        SD.US_89_LESS = Cmn.ToDbl(txtRelief.Text);
        
        //17
        SD.TOTAL_TDS_DEDUCTED = Cmn.ToDbl(txtTotalTaxDeducted.Text);
        SD.BrkUpTdsCurrentEmployer = SD.TOTAL_TDS_DEDUCTED;
        SD.PREVIOUS_TAX_DEDUCTED_TOTAL = Cmn.ToDbl(txtTDSPreviousEmployer.Text);

        double NetTaxPayble = Cmn.ToDbl(SD.TAX_PAYABLE_AGGREGATE - SD.US_89_LESS);
        SD.TAX_PAYABLE=NetTaxPayble;
        SD.SHORTFALL_TAX = NetTaxPayble - SD.TOTAL_TDS_DEDUCTED;

        SD.TAX_DEDUCTED_HIGHER_RATE = Cmn.ToInt(DDNoPan.SelectedValue);
        
        SD.Save();
        lblID.Text = SD.SALARY_DETAILS_ID.ToString();
        ShowData();
    }
    
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Update();
    }
    protected void radioMandatory_SelectedIndexChanged(object sender, EventArgs e)
    {
        string ro="true";
        if (radioMandatory.SelectedValue == "2")
        {
            ro="false";
        }
            //txtSec17_1.ReadOnly = true;
            //txtSec17_2.ReadOnly = true;
            //txtSec17_3.ReadOnly = true;
            //txtTotal.ReadOnly = true;
            //txtAllowanceDesc1.ReadOnly = true;
            //txtAllowance1Amount.ReadOnly = true;
            //txtAllowanceDesc2.ReadOnly = true;
            //txtAllowance2Amount.ReadOnly = true;
            //txtAllowanceDesc3.ReadOnly = true;
            //txtAllowance3Amount.ReadOnly = true;
            //txtAllowanceDesc4.ReadOnly = true;
            //txtAllowance4Amount.ReadOnly = true;
            //txtAllowanceDesc5.ReadOnly = true;
            //txtAllowance5Amount.ReadOnly = true;
            //txtAlllowanceTotal.ReadOnly = true;
            //txtOtheIncomeDesc1.ReadOnly = true;
            //txtOtheIncomeAmount1.ReadOnly = true;
            //txtOtheIncomeDesc2.ReadOnly = true;
            //txtOtheIncomeAmount2.ReadOnly = true;
            //txtOtheIncomeDesc3.ReadOnly = true;
            //txtOtheIncomeAmount3.ReadOnly = true;
            //txtOtheIncomeDesc4.ReadOnly = true;
            //txtOtheIncomeAmount4.ReadOnly = true;
            //txtOtheIncomeDesc5.ReadOnly = true;
            //txtOtheIncomeAmount5.ReadOnly = true;
            ContentPlaceHolder mpContentPlaceHolder = (ContentPlaceHolder)this.Master.FindControl("ContentPlaceHolder1");
            if (mpContentPlaceHolder != null)
            {
                Panel p = (Panel)mpContentPlaceHolder.FindControl("PanelTotalSalary");
                foreach (Control c in p.Controls)
                {
                    if (c is TextBox)
                    {
                        ((TextBox)c).Attributes.Add("Readonly", ro);
                    }
                }
                //Panel p2 = (Panel)mpContentPlaceHolder.FindControl("PanelAllowane");
                //foreach (Control c in p2.Controls)
                //{
                //    if (c is TextBox)
                //    {
                //        ((TextBox)c).Attributes.Add("Readonly", ro);
                //    }
                //}

                Panel p3 = (Panel)mpContentPlaceHolder.FindControl("PanelOtherIncome");
                foreach (Control c in p3.Controls)
                {
                    if (c is TextBox)
                    {
                        ((TextBox)c).Attributes.Add("Readonly", ro);
                    }
                }

                Panel p4 = (Panel)mpContentPlaceHolder.FindControl("PanelDedUnderVIA");
                foreach (Control c in p4.Controls)
                {
                    if (c is TextBox)
                    {
                        ((TextBox)c).Attributes.Add("Readonly", ro);
                    }
                }
                Panel p5 = (Panel)mpContentPlaceHolder.FindControl("Panel9Ext");
                foreach (Control c in p5.Controls)
                {
                    if (c is TextBox)
                    {
                        ((TextBox)c).Attributes.Add("Readonly", ro);
                    }
                }
                Panel p6 = (Panel)mpContentPlaceHolder.FindControl("PanelOtherSections");
                foreach (Control c in p6.Controls)
                {
                    if (c is TextBox)
                    {
                        ((TextBox)c).Attributes.Add("Readonly", ro);
                    }
                }
            }
          }

        //else
        //{
        //    txtSec17_1.ReadOnly = false;
        //    txtSec17_2.ReadOnly = false;
        //    txtSec17_3.ReadOnly = false;
        //    txtTotal.ReadOnly = false;
        //    txtAllowanceDesc1.ReadOnly = false;
        //    txtAllowance1Amount.ReadOnly = false;
        //    txtAllowanceDesc2.ReadOnly = false;
        //    txtAllowance2Amount.ReadOnly = false;
        //    txtAllowanceDesc3.ReadOnly = false;
        //    txtAllowance3Amount.ReadOnly = false;
        //    txtAllowanceDesc4.ReadOnly = false;
        //    txtAllowance4Amount.ReadOnly = false;
        //    txtAllowanceDesc5.ReadOnly = false;
        //    txtAllowance5Amount.ReadOnly = false;
        //    txtAlllowanceTotal.ReadOnly = false;
        //    txtOtheIncomeDesc1.ReadOnly = false;
        //    txtOtheIncomeAmount1.ReadOnly = false;
        //    txtOtheIncomeDesc2.ReadOnly = false;
        //    txtOtheIncomeAmount2.ReadOnly = false;
        //    txtOtheIncomeDesc3.ReadOnly = false;
        //    txtOtheIncomeAmount3.ReadOnly = false;
        //    txtOtheIncomeDesc4.ReadOnly = false;
        //    txtOtheIncomeAmount4.ReadOnly = false;
        //    txtOtheIncomeDesc5.ReadOnly = false;
        //    txtOtheIncomeAmount5.ReadOnly = false;
        //}
    //}
}