using System;
using System.Collections.Generic;
using System.Text;
using TDSModel;
using System.Linq;
using System.Web.Script.Serialization;

public partial class ReportQuarterVise : BasePage
{
    int type = 0;
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        type = QueryStringInt("type");
        if (!IsPostBack)
        {
            //if (type != 0)
            //    ddrReportType.SelectedValue = type.ToString();
            //else if (Request.Cookies["ReturnFormFilter"] != null)
            //    ddrReportType.SelectedValue = Request.Cookies["ReturnFormFilter"]["ReporType"];
            ReturnFormFilterl.HideChallan();
        }
        ReturnFormFilterl.ShowForm();
        ReturnFormFilterl.ShowQuarter();
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        ShowData();
    }

    void ShowData()
    {
        WriteCookie(this.Page, ReturnFormFilterl.FormType.ToString(), Global.FinancialYear.ToString(), ReturnFormFilterl.Quarter.ToString(), Global.CompanyID.ToString(), ReturnFormFilterl.ChallanID.ToString(), type.ToString());

        lblReport.Text = "";
        Dictionary<string, string> RnDof = new Dictionary<string, string>();

        List<TRN_BASIC_INFO> returnList = TRN_BASIC_INFO.GetByFormYearQuarterCompany(ReturnFormFilterl.FormType, Global.FinancialYear, ReturnFormFilterl.Quarter, Global.CompanyID);
        foreach (TRN_BASIC_INFO rr in returnList)
        {
            string ReceiptNo = rr.RECEIPT_NO == null ? "" : rr.RECEIPT_NO.ToString();
            string FilingDate = rr.DATE_OF_FILING == null ? "" : rr.DATE_OF_FILING.ToString(); ;

            if (ReceiptNo != "")
                RnDof.Add(ReceiptNo, FilingDate);
        }
        MST_COMPANY Comp = MST_COMPANY.GetByID(Global.CompanyID);
        //switch (ddrReportType.SelectedValue)
        switch (type.ToString())
        {
            case "1":    // Company Details
                {
                    Title = "Company Report";
                    pageHeading.InnerText = "Company Report";
                    if (Comp != null)
                    {
                        int noOfChallan = 0;
                        int noOfDeducteeRecords = 0;
                        double TotalAmount = 0.0;
                        double TotalTDS = 0.0;

                        foreach (TRN_BASIC_INFO rr in returnList)
                        {
                            List<TRN_CHALLAN> Clist = TRN_CHALLAN.GetByFormID(rr.BASIC_INFO_ID);
                            if (Clist.Count > 0)
                            {
                                foreach (TRN_CHALLAN ch in Clist)
                                {
                                    noOfChallan++;
                                    TotalTDS += Cmn.ToDbl(ch.TDS);
                                    List<TRN_DEDUCTEE_DETAILS> CDlist = TRN_DEDUCTEE_DETAILS.GetByChallanID(ch.CHALLAN_ID);
                                    foreach (TRN_DEDUCTEE_DETAILS Cd in CDlist)
                                    {
                                        TotalAmount += (double)Cd.PAYMENT_AMOUNT;
                                        noOfDeducteeRecords++;
                                    }
                                }
                            }
                        }

                        string deductorType = "";
                        Global.DeductorType.TryGetValue(Comp.D_CATEGORY_ID, out deductorType);
                        string state = "";
                        Global.State.TryGetValue(Cmn.ToInt(Comp.STATE_ID), out state);
                        string p_state = "";
                        Global.State.TryGetValue(Cmn.ToInt(Comp.P_STATE_ID), out p_state);
                        string d_state = "";
                        Global.State.TryGetValue(Cmn.ToInt(Comp.D_STATE_ID), out d_state);
                        string ministry = "";
                        Global.Ministry.TryGetValue(Comp.MINISTRY_ID.ToString(), out ministry);

                        StringBuilder str = new StringBuilder("<table class='table table-condensed'>");
                        str.Append(" <tr><td colspan='5' style='font-weight:bold; text-align:center;'>" + Comp.COMPANY_NAME + "" +
                                    "<tr><td colspan='5' style='font-weight:bold; text-align:center;'>TAN: " + Comp.TAN_NO + "&nbsp;&nbsp;Financial Year: " + (Global.FinancialYear + "-" + (Cmn.ToInt(Global.FinancialYear) + 1)) + "" +
                                    "<tr><td colspan='5' style='font-weight:bold; text-align:center;border-bottom:1px solid black;'>Company Details" +
                                    "<tr><td colspan='5' class='boldFont'>1.Particulars Of Deductor" +
                                    "<tr><td>a) <td>Name:<td>" + Comp.COMPANY_NAME + "<td>Tan Reg No:<td>" + Comp.TAN_REG_NO + "" +
                                    "<tr><td>b) <td>Address:<td><td>PAO Code:<td>" + Comp.PAO_CODE + "" +
                                    "<tr><td><td>Flt/Dr/Blk No:<td>" + Comp.ADDRESS1 + "<td>PAO Reg No:<td>" + Comp.PAO_REG_NO + "" +
                                    "<tr><td><td>Building:<td>" + Comp.ADDRESS2 + "<td>DDO Code:<td>" + Comp.DDO_CODE + "" +
                                    "<tr><td><td>Rd/Strt/Lane<td>" + Comp.ADDRESS3 + "<td>DDO Reg No:<td>" + Comp.DDO_REG_NO + "" +
                                    "<tr><td><td>Area/Locality<td>" + Comp.ADDRESS4 + "<td>State<td>" + (Comp.D_STATE_ID != "-1" ? d_state : "") + "" +
                                    "<tr><td><td>Town/District<td>" + Comp.ADDRESS5 + "<td>Ministry<td>" + (Comp.MINISTRY_ID != "-1" ? ministry : "") + "" +
                                    "<tr><td><td>Pin<td>" + Comp.PIN_CODE + "<td>Other Ministry<td>" + Comp.MINISTRY_OTHER + "" +
                                    "<tr><td><td>State<td>" + state + "<td>Account Officer ID No<td>" + Comp.ASSESSING_OFFICER + "" +
                                    "<tr><td><td>Phone<td>" + Comp.PHONE + "<td><td>" +
                                    "<tr><td><td>Alt. Phone<td>" + Comp.ALT_PHONE + "<td><td>" +
                                    "<tr><td><td>Email<td>" + Comp.EMAIL + "<td><td>" +
                                    "<tr><td><td>Alt. Email<td>" + Comp.ALT_EMAIL + "<td><td>" +
                                    "<tr><td>c) <td>Tax Deduction Account Number (TAN): <td>" + Comp.TAN_NO + "<td><td>" +
                                    "<tr><td>d) <td>Permanent Account Number (PAN): <td>" + Comp.PAN_NO + "<td><td>" +
                                    "<tr><td>e) <td>Deductor Type: <td>" + deductorType + "-" + Comp.D_CATEGORY_ID + "<td><td>" +
                                    "<tr><td>f) <td>Has Address Changed ?: <td><td><td>" +
                                    "<tr><td colspan='5' class='boldFont' style='border-top:1px solid black;'>2.Particulars Of Responsible Person" +
                                    "<tr><td>a) <td>Name:<td>" + Comp.PERSON_NAME + "<td><td>" +
                                    "<tr><td>b) <td>Address:<td><td><td>" +
                                    "<tr><td><td>Flt/Dr/Blk No:<td>" + Comp.P_ADDRESS1 + "<td><td>" +
                                    "<tr><td><td>Building:<td>" + Comp.P_ADDRESS2 + "<td><td>" +
                                    "<tr><td><td>Rd/Strt/Lane<td>" + Comp.P_ADDRESS3 + "<td><td>" +
                                    "<tr><td><td>Area/Locality<td>" + Comp.P_ADDRESS4 + "<td><td>" +
                                    "<tr><td><td>Town/District<td>" + Comp.P_ADDRESS5 + "<td><td>" +
                                    "<tr><td><td>Pin<td>" + Comp.P_PIN_CODE + "<td><td>" +
                                    "<tr><td><td>State<td>" + p_state + "<td><td>" +
                                    "<tr><td><td>Phone<td>" + Comp.P_PHONE + "<td><td>" +
                                    "<tr><td><td>Alt. Phone<td>" + Comp.P_ALT_PHONE + "<td><td>" +
                                    "<tr><td><td>Email<td>" + Comp.P_EMAIL + "<td><td>" +
                                    "<tr><td><td>Alt Email<td>" + Comp.P_ALT_EMAIL + "<td><td>" +
                                    "<tr style='border-bottom:1px solid black;'><td><td>(c) Fathers Name<td>" + Comp.FATHER_NAME + "<td><td>" +
                                    "<tr><td>(d) <td>Designation<td>" + Comp.DESIGNATION + "<td><td>" +
                                    "<tr><td>(e) <td>Has Address Changed?<td>-<td><td>" +
                                    "<tr><td colspan='5' class='boldFont' style='border-top:1px solid black;'>Summary" +
                                    "<tr><td>(a) <td>No Of Challan:<td>" + noOfChallan + "<td>(a) No Of Deductee Records:<td>" + noOfDeducteeRecords + "" +
                                    "<tr><td>(b) <td>Total Amount<td>" + TotalAmount + "<td>Total TDS/TCS<td>" + TotalTDS +
                                    "<tr><td colspan='5' class='boldFont' style='border-top:1px solid black;'>Filing Details"
                        );
                        int ctr = 1;
                        foreach (KeyValuePair<string, string> kvp in RnDof)
                        {
                            str.Append("<tr><td><td>" + ctr++ + ". Receipt No:<td>" + kvp.Key + "<td>Date Of Filing:<td>" + Cmn.ToDate(kvp.Value).ToString("dd-MMM-yy"));
                        }
                        str.Append("</table>");
                        lblReport.Text = str.ToString();
                    }
                }
                break;
            case "2": // challans
                {
                    Title = "Challan Report";
                    pageHeading.InnerText = "Challan Report";
                    StringBuilder str = new StringBuilder("<table class='table table-condensed report table-bordered hover-style'><tr><th>#<th>Date<th>Minor Code<th>BSR Code<th>Challan No<th>TDS<th>Surchg<th>Cess<th>Interest<th>Fee<th>Others<th>Tot. Amt<th>Adjusted<th>Bal<th>Ded");
                    double TDSTotal = 0, SurchargeTotal = 0, CessTotal = 0, InetrestTotal = 0, FeeTotal = 0, OthersTotal = 0, TotlaAmtTotal = 0;
                    List<IGrouping<string, TRN_BASIC_INFO>> glist = returnList.GroupBy(m => m.QTR).ToList();

                    int ctr = 1;
                    foreach (var group in glist)
                    {
                        double _TDSTotal = 0, _SurchargeTotal = 0, _CessTotal = 0, _InetrestTotal = 0, _FeeTotal = 0, _OthersTotal = 0, _TotlaAmtTotal = 0;
                        int _quarter = -1;

                        TRN_BASIC_INFO tmp = null;
                        foreach (var groupedItem in group)
                        {
                            tmp = (TRN_BASIC_INFO)groupedItem;
                            List<TRN_CHALLAN> C = TRN_CHALLAN.GetByFormID(tmp.BASIC_INFO_ID);

                            foreach (TRN_CHALLAN c in C)
                            {
                                int noOfDeductee = 0;
                                double adjusted = 0.0;
                                double balance = 0.0;
                                List<TRN_DEDUCTEE_DETAILS> CDL = TRN_DEDUCTEE_DETAILS.GetByChallanID(c.CHALLAN_ID);
                                foreach (TRN_DEDUCTEE_DETAILS cd in CDL)
                                {
                                    noOfDeductee++;
                                    adjusted += Cmn.ToDbl(cd.TOTAL_AMOUNT);
                                }

                                balance = Cmn.ToDbl(c.TOT_TAX) - adjusted;
                                str.Append("<tr><td>" + ctr++ + "<td><a target='_blank' href='/RegularReturns.aspx?formtype=1&fy=" + Global.FinancialYear + "&quarter=" + c.QTR + "&companyid=" + Global.CompanyID + "&challanid=" + c.CHALLAN_ID + "'>" + Cmn.ToDate(c.DEPOSIT_DATE).ToString("dd-MMM-yy") + "</a><td>" + c.MINOR_HEAD_ID + "<td>" + c.BSR_CODE + "<td>"
                                    + c.CHALLAN_NO + "<td>" + Cmn.ToDbl(c.TDS).ToString("#,##,##0") + "<td>" + Cmn.ToDbl(c.SURCHARGE).ToString("#,##,##0") + "<td>" + Cmn.ToDbl(c.EDUCATION_CESS).ToString("#,##,##0") + "<td>" + Cmn.ToDbl(c.INTEREST).ToString("#,##,##0") + "<td>"
                                    + Cmn.ToDbl(c.LATE_FEE).ToString("#,##,##0") + "<td>" + Cmn.ToDbl(c.OTHERS).ToString("#,##,##0")
                                    + "<td>" + Cmn.ToDbl(c.TOT_TAX).ToString("#,##,##0") + "<td>" + Cmn.ToDbl(adjusted).ToString("#,##,##0") + "<td>" + Cmn.ToDbl(balance).ToString("#,##,##0") + "<td>" + noOfDeductee + "");

                                TDSTotal += (double)c.TDS;
                                SurchargeTotal += (double)c.SURCHARGE;
                                CessTotal += (double)c.EDUCATION_CESS;
                                InetrestTotal += (double)c.INTEREST;
                                FeeTotal += (double)c.LATE_FEE;
                                OthersTotal += (double)c.OTHERS;
                                TotlaAmtTotal += (double)c.TOT_TAX;

                                _quarter = Cmn.ToInt(c.QTR);
                                _TDSTotal += (double)c.TDS;
                                _SurchargeTotal += (double)c.SURCHARGE;
                                _CessTotal += (double)c.EDUCATION_CESS;
                                _InetrestTotal += (double)c.INTEREST;
                                _FeeTotal += (double)c.LATE_FEE;
                                _OthersTotal += (double)c.OTHERS;
                                _TotlaAmtTotal += (double)c.TOT_TAX;

                            }
                        }
                        if (ReturnFormFilterl.Quarter == "-1")
                            str.Append("<tr style='border-bottom:2px solid black;'><th><th>Q" + _quarter + " Total<th><th><th><th>" + Cmn.ToDbl(_TDSTotal).ToString("#,##,##0") + "<th>" + Cmn.ToDbl(_SurchargeTotal).ToString("#,##,##0") + "<th>" + Cmn.ToDbl(_CessTotal).ToString("#,##,##0") + "<th>" + Cmn.ToDbl(_InetrestTotal).ToString("#,##,##0") + "<th>" + Cmn.ToDbl(_FeeTotal).ToString("#,##,##0") + "<th>" + Cmn.ToDbl(_OthersTotal).ToString("#,##,##0") + "<th>" + Cmn.ToDbl(_TotlaAmtTotal).ToString("#,##,##0") + "<th><th><th>");
                    }
                    str.Append("<tr><th><th>TOTAL<th><th><th><th>" + Cmn.ToDbl(TDSTotal).ToString("#,##,##0") + "<th>" + Cmn.ToDbl(SurchargeTotal).ToString("#,##,##0") + "<th>" + Cmn.ToDbl(CessTotal).ToString("#,##,##0") + "<th>" + Cmn.ToDbl(InetrestTotal).ToString("#,##,##0") + "<th>" + Cmn.ToDbl(FeeTotal).ToString("#,##,##0") + "<th>" + Cmn.ToDbl(OthersTotal).ToString("#,##,##0") + "<th>" + Cmn.ToDbl(TotlaAmtTotal).ToString("#,##,##0") + "<th><th><th>");
                    str.Append("</table>");
                    lblReport.Text = str.ToString();
                }
                break;

            case "3": // Employee
                {
                    Title = "Employee Report";
                    pageHeading.InnerText = "Employee Report";

                    string fromDate = "", toDate = "";
                    string financialYr = Global.FinancialYear.ToString();
                    switch (ReturnFormFilterl.Quarter)
                    {
                        case "Q1":
                            fromDate = "01-04-" + financialYr;
                            toDate = "30-06-" + financialYr;
                            break;
                        case "Q2":
                            fromDate = "01-07-" + financialYr;
                            toDate = "31-09-" + financialYr;
                            break;
                        case "Q3":
                            fromDate = "01-10-" + financialYr;
                            toDate = "30-12-" + financialYr;
                            break;
                        case "Q4":
                            fromDate = "01-01-" + (Global.FinancialYear + 1).ToString();
                            toDate = "31-03-" + (Global.FinancialYear + 1).ToString();
                            break;
                        default:
                            fromDate = "01-04-" + financialYr;
                            toDate = "31-03-" + (Global.FinancialYear + 1).ToString();
                            break;
                    };
                    StringBuilder str = new StringBuilder("<table class='table table-condensed'>");
                    str.Append("<tr><td style='font-weight:bold; text-align:center;'>" + Comp.COMPANY_NAME + "<td>" +
                        "<tr><td style='font-weight:bold; text-align:center;'>TAN: " + Comp.TAN_NO + "  Financial Year: " + Global.FinancialYear.ToString() + "-" + (Global.FinancialYear + 1).ToString().Substring(2, 2) + "<td>" +
                        "<tr><td colspan='8' style='font-weight:bold; text-align:center;'>Form No " + ReturnFormFilterl.FormType + "-Employee Details");
                    //<td>From: " + fromDate + "  To:" + toDate + "
                    str.Append("</table>");
                    int ctr = 1;

                    str.Append("<table class='table table-condensed report table-bordered hover-style'><tr><th>SrNo<th>PAN<th>Employee Name<th>Section<th>Pay Date<th>Ded Date<th>Amount<th>Total TDS<th>Amount Dep<th>Remarks");
                    foreach (TRN_BASIC_INFO rr in returnList)
                    {
                        List<TRN_CHALLAN> C = TRN_CHALLAN.GetByFormID(rr.BASIC_INFO_ID);
                        if (C.Count > 0)
                        {
                            double amountSubtotal = 0, tdsSubtotal = 0, depSub = 0;
                            foreach (TRN_CHALLAN c in C)
                            {
                                str.Append("<tr style='background-color:#D7E7F8;' class='RowColorPrint'><td colspan='10'>Challlan Sl No:" + ctr++ + "&nbsp;&nbsp;&nbsp;Challan No:" + c.CHALLAN_NO + "&nbsp;&nbsp;&nbsp;BSR Code:" + c.BSR_CODE + "&nbsp;&nbsp;&nbsp;Deposit Date:" + Cmn.ToDate(c.DEPOSIT_DATE).ToString("dd-MM-yy") + "");
                                List<TRN_DEDUCTEE_DETAILS> CD = TRN_DEDUCTEE_DETAILS.GetByChallanID(c.CHALLAN_ID);
                                if (CD.Count > 0)
                                {
                                    int ctr1 = 1;

                                    foreach (TRN_DEDUCTEE_DETAILS cd in CD)
                                    {
                                        str.Append("<tr><td>" + ctr1++ + "<td>" + cd.DEDUCTEE_PAN + "<td>" + cd.DEDUCTEE_NAME + "<td>"
                                                  + cd.SECTION_ID + "<td>" + Cmn.ToDate(cd.DEDUCTED_DATE).ToString("dd-MM-yy") + "<td>-<td>" + Cmn.ToDbl(cd.PAYMENT_AMOUNT).ToString("#,##,##0") + "<td>" + Cmn.ToDbl(cd.TOTAL_AMOUNT).ToString("#,##,##0") + "<td>" + Cmn.ToDbl(cd.TAX_AMOUNT).ToString("#,##,##0") + "<td>" + cd.REASON_ID + "");
                                        amountSubtotal += (double)cd.PAYMENT_AMOUNT;
                                        tdsSubtotal += (double)cd.TAX_AMOUNT;
                                        depSub += (double)cd.TAX_DEPOSITED_AMOUNT;
                                    }
                                }
                                str.Append("<tr style='font-weight:bold;'><td colspan='6'>TOTAL<td>" + amountSubtotal.ToString("#,##,##0") + "<td>" + tdsSubtotal.ToString("#,##,##0") + "<td>" + depSub.ToString("#,##,##0") + "<td>");
                            }
                        }
                    }
                    str.Append("</table>");
                    lblReport.Text = str.ToString();
                }
                break;

            case "4":
                {
                    Title = "Salary Detail Report";
                    pageHeading.InnerText = "Salary Detail Report";

                    ReturnFormFilterl.HideQuarter();
                    ReturnFormFilterl.HideForm();

                    StringBuilder str = new StringBuilder("<table class='table table-condensed salarydetail'>");

                    str.Append("<tr><td style='font-weight:bold; text-align:center;' colspan='8'>" + Comp.COMPANY_NAME + "" +
                        "<tr><td style='font-weight:bold; text-align:center;' colspan='8'>TAN: " + Comp.TAN_NO + "  Financial Year: " + Global.FinancialYear.ToString() + "-" + (Global.FinancialYear + 1).ToString().Substring(2, 2) + "<td>" +
                        "<tr><td colspan='8' style='font-weight:bold; text-align:center;'>Form No " + ((RegularReturnType)1).ToString().Replace("_", "") + "-Salary Details");

                    List<TRN_BASIC_INFO> returnList1 = TRN_BASIC_INFO.GetByFormYearQuarterCompany("24Q", Global.FinancialYear, "-1", Global.CompanyID);

                    foreach (TRN_BASIC_INFO rr in returnList1)
                    {
                        List<TRN_SALARY_DETAILS> SD = TRN_SALARY_DETAILS.GetByFormID(rr.BASIC_INFO_ID);

                        if (SD.Count > 0)
                        {
                            //int ctr = 1;
                            foreach (TRN_SALARY_DETAILS sd in SD)
                            {
                                MST_EMPLOYEE E = MST_EMPLOYEE.GetByID((int)sd.EMPLOYEE_ID);
                                if (E != null)
                                {
                                    str.Append("<tr class='boldFont'><td>Employee Name :" + E.EMPLOYEE_NAME_ + "<td><td><td><td><td>PAN:" + E.EMPLOYEE_PAN + ""
                                        + "<tr class='boldFont'><td>Category :" + E.CATEGORY + "<td><td><td><td><td>Employment Period: " + Cmn.ToDate(sd.FROM_DATE).ToString("dd/MM/yy") + "     To " + Cmn.ToDate(sd.TO_DATE).ToString("dd/MM/yy") + "");
                                }
                                str.Append("<tr><td>Current Employer: <td><td>" + Cmn.ToDbl(sd.BalanceCurrentEmployer).ToString("0.00") + "<td>Total Taxable Income<td><td>" + Cmn.ToDbl(sd.TOTAL_INCOME).ToString("0.00") + ""
                                          + "<tr><td>Previous Employer: <td><td>" + Cmn.ToDbl(sd.BalancePriviousEmployer).ToString("0.00") + "<td>Income Tax On Total Income<td>" + Cmn.ToDbl(sd.TAX_TOTAL_INCOME).ToString("0.00") + "<td>"
                                          + "<tr><td>Total Salary:<td><td>" + Cmn.ToDbl(sd.TS_BALANCE).ToString("0.00") + "<td>Surcharge:<td>" + Cmn.ToDbl(sd.SCHG_TOTAL_INCOME).ToString("0.00") + "<td>"
                                          + "<tr><td>Deductions U/s 16(ii): <td>" + Cmn.ToDbl(sd.US_16_EA).ToString("0.00") + "<td><td>Education Cess<td>" + Cmn.ToDbl(sd.ECESS_TOTAL_INCOME).ToString("0.00") + "<td>"
                                          + "<tr><td>Deductions U/s 16(iii): <td>" + Cmn.ToDbl(sd.US_16_TE).ToString("0.00") + "<td><td>Total Tax<td><td>" + Cmn.ToDbl(sd.TAX_PAYABLE).ToString("0.00") + ""
                                          + "<tr><td>Gross Deductions U/s 16: <td><td>" + Cmn.ToDbl(sd.US_16_EA + sd.US_16_TE).ToString("0.00") + "<td>Income Tax Relief<td><td>" + Cmn.ToDbl(sd.US_89_LESS).ToString("0.00") + ""
                                          + "<tr><td>Income Chargeable Under Head Salary: <td><td>" + Cmn.ToDbl(sd.INCOME_CHARGEABLE).ToString("0.00") + "<td>Net Tax Payable:<td><td>" + Cmn.ToDbl(sd.TAX_PAYABLE - sd.US_89_LESS).ToString("0.00") + ""
                                          + "<tr><td>Any Other Income Other Than Salary: <td><td>" + Cmn.ToDbl(sd.AIS_Total).ToString("0.00") + "<td>Current Employer:<td>" + Cmn.ToDbl(sd.BrkUpTdsCurrentEmployer).ToString("0.00") + "<td>"
                                          + "<tr><td>Gross Total Income: <td><td>" + Cmn.ToDbl(sd.TS_GS_TOTAL).ToString("0.00") + "<td>Previous Employer<td>" + Cmn.ToDbl(sd.BrkUpTdsPevEmployer).ToString("0.00") + "<td>"
                                          + "<tr><td>Deductions U/s 80CCE: <td>-<td><td>Net Tax Deducted<td>" + Cmn.ToDbl(sd.TOTAL_TDS_DEDUCTED).ToString("0.00") + "<td>"
                                          + "<tr><td>Deductions U/s 80CCG: <td>" + Cmn.ToDbl(sd.CVIA_SEC80CCG_DED_AMOUNT).ToString("0.00") + "<td><td>ShortFall/Excess deduction Of Tax<td><td>" + sd.SHORTFALL_TAX + ""
                                          + "<tr><td>Other Deductions U/c VIA<td>" + Cmn.ToDbl(sd.CVIA_OTH_DED_TOTAL).ToString("0.00") + "<td><td style='width:25%;'>weather Tax Ded At Higher Rate Due To Non Furnishing Of PAN By Deductee<td><td>" + (sd.TAX_DEDUCTED_HIGHER_RATE == 0 ? "No" : "Yes") + ""
                                          + "<tr><td>Gross Total Amount Deductible U/c VIA<td><td>" + Cmn.ToDbl(sd.CVIA_DED_TOTAL).ToString("0.00") + "<td>-<td>-<td>-"
                                          + "<tr><td>Total Taxable Income:<td><td>" + Cmn.ToDbl(sd.TOTAL_INCOME).ToString("0.00") + "<td>-<td>-<td>-"
                                          + "<tr><td colspan='6' style='border-top:2px solid black'>"
                                         );
                            }
                        }

                    }
                    str.Append("</table>");
                    lblReport.Text = str.ToString();
                }
                break;

            case "5":
                {
                    Title = "Salary Yearly Report";
                    pageHeading.InnerText = "Salary Yearly Report";

                    ReturnFormFilterl.HideQuarter();
                    ReturnFormFilterl.HideForm();

                    StringBuilder str = new StringBuilder("<table class='table table-condensed report table-bordered hover-style'><tr><th>Name<th>Apr<th>May<th>Jun<th>Jul<th>Aug<th>Sep<th>Oct<th>Nov<th>Dec<th>Jan<th>Feb<th>Mar<th>Total");
                    List<MST_EMPLOYEE> EL = MST_EMPLOYEE.GetList(Global.CompanyID);
                    double[] MonthTotals = new double[13];
                    double[] PaidTotals = new double[13];


                    foreach (MST_EMPLOYEE e in EL)
                    {
                        EmployeeSalary es = EmployeeSalary.GetByIDandFY(e.EMPLOYEE_ID, 2014);
                        if (es == null)
                            continue;

                        string data = Cmn.GetUnCompressed(es.Data, (int)es.DataSize);
                        Dictionary<string, object> d = (Dictionary<string, object>)new JavaScriptSerializer().DeserializeObject(data);

                        List<string> list = new List<string>();

                        double EmpYearTotal = 0;

                        str.Append("<tr><td><a href='EmployeeSal.aspx?empid=" + e.EMPLOYEE_ID + "&fy=2014' target='_blank'>" + e.EMPLOYEE_NAME_ + "</a>");

                        for (int i = 1; i <= 12; i++)
                        {
                            object amt;
                            str.Append("<td>");
                            if (d.TryGetValue("txtTotalIncome" + i, out amt))
                            {
                                str.Append(amt.ToString());
                                double inc = Cmn.ToDbl(amt.ToString().Replace(",", ""));
                                EmpYearTotal += inc;
                                MonthTotals[i] += inc;
                            }

                            object paid;
                            if (d.TryGetValue("txtPaid" + i, out paid))
                            {
                                double pd = Cmn.ToDbl(paid.ToString().Replace(",", ""));
                                PaidTotals[i] += pd;
                            }

                        }
                        str.Append("<td>" + EmpYearTotal.ToString("##,##0"));
                    }

                    str.Append("<tr><th>Total");

                    double CopmanyYearTotal = 0;
                    for (int i = 1; i <= 12; i++)
                    {
                        str.Append("<th>" + MonthTotals[i].ToString("##,##0"));
                        CopmanyYearTotal += MonthTotals[i];
                    }
                    str.Append("<th>" + CopmanyYearTotal.ToString("##,##0"));
                    str.Append("<tr><th>Paid Total");
                    //double CopmanyPaidTotal = 0;
                    //for (int i = 1; i <= 12; i++)
                    //{
                    //    str.Append("<th>" + MonthTotals[i].ToString("##,##0"));
                    //    CopmanyYearTotal += MonthTotals[i];
                    //}
                    CopmanyYearTotal = 0;
                    for (int i = 1; i <= 12; i++)
                    {
                        str.Append("<th>" + PaidTotals[i].ToString("##,##0"));
                        CopmanyYearTotal += PaidTotals[i];
                    }
                    str.Append("<th>" + CopmanyYearTotal.ToString("##,##0"));
                    str.Append("<tr><th>Bal");
                    CopmanyYearTotal = 0;
                    for (int i = 1; i <= 12; i++)
                    {
                        str.Append("<th>" + (MonthTotals[i] - PaidTotals[i]).ToString("##,##0"));
                        CopmanyYearTotal += MonthTotals[i] - PaidTotals[i];
                    }
                    str.Append("<th>" + CopmanyYearTotal.ToString("##,##0") + "</table>");
                    lblReport.Text = str.ToString();
                }
                break;

            case "6":
                {
                    Title = "Return Report";
                    pageHeading.InnerText = "Return Report";
                    MST_COMPANY C = MST_COMPANY.GetByID(Global.CompanyID);

                    string deductorType = "";
                    Global.DeductorType.TryGetValue(Comp.D_CATEGORY_ID, out deductorType);
                    string state = "";
                    Global.State.TryGetValue(Cmn.ToInt( Comp.STATE_ID), out state);
                    string p_state = "";
                    Global.State.TryGetValue(Cmn.ToInt(Comp.P_STATE_ID), out p_state);

                    List<TRN_BASIC_INFO> RR = TRN_BASIC_INFO.GetByFormYearQuarterCompany(ReturnFormFilterl.FormType, Global.FinancialYear, ReturnFormFilterl.Quarter, Global.CompanyID);
                    if (RR.Count == 0)
                        return;
                    TRN_BASIC_INFO rr = RR[0];

                    StringBuilder returnTable = new StringBuilder();
                    StringBuilder sb = new StringBuilder();
                    StringBuilder str = new StringBuilder();
                    if (ReturnFormFilterl.Quarter == "-1")
                    {
                        returnTable.Append("<table class='table table-condensed table-bordered'><tr><th>Return Type<th>Quarter<th>Prev Ret Token<th>Receipt No<th>Filing Date<th>Token No");
                        foreach (TRN_BASIC_INFO regRet in RR)
                        {
                            returnTable.Append("<tr><td>" + regRet.FORM_NO + "<td><a target='_blank' href='/ReportQuarterWise.aspx?type=6&formtype=" + regRet.FORM_NO + "&quarter=" + regRet.QTR + "'>" + regRet.QTR + "</a><td>" + (regRet.PREV_PRN_NO == "" ? "-" : regRet.PREV_PRN_NO) + "<td>" + (string.IsNullOrEmpty(regRet.RECEIPT_NO) ? "-" : regRet.RECEIPT_NO) + "<td>" + (Cmn.ToDate(regRet.DATE_OF_FILING).ToString("dd-MM-yy") == "01-01-00" ? "-" : Cmn.ToDate(regRet.DATE_OF_FILING).ToString("dd-MM-yy")) + "<td>" + regRet.PRN_NO + "");
                        }
                        returnTable.Append("</table>");
                    }
                    else
                    {
                        List<TRN_CHALLAN> Clist = TRN_CHALLAN.GetByFormID(rr.BASIC_INFO_ID);
                        int ctr = 1;
                        foreach (TRN_CHALLAN Chl in Clist)
                        {
                            sb.Append("<tr><td>" + ctr++ + "<td>" + Chl.TDS + "<td>" + Chl.SURCHARGE + "<td>" + Chl.SURCHARGE + "<td>" + Chl.INTEREST + "<td>" + Chl.LATE_FEE + "<td>" + Chl.OTHERS + "<td>" + Chl.TOT_TAX + "<td>C<td>" + Chl.BSR_CODE + "<td>" + Chl.CHALLAN_NO + "<td>" + Cmn.ToDate(Chl.DEPOSIT_DATE).ToString("dd-MMM-yy") + "<td>" + Chl.MINOR_HEAD_ID + "");
                        }

                        str.Append("<table class='table table-condensed table-bordered'><tr><th colspan='6' style='text-align:center;'>Form No: " + ReturnFormFilterl.FormType + "");
                        str.Append("<tr><td colspan='6' style='text-align:center;'>[ see section 192 and rule 31A ]" +
                            "<tr><td colspan='6' style='text-align:center;'>Quarterly statement of deduction of tax under subsection(3) of section 200 of the income-tax act in respect of salary for the quarter for the quarter ended " + ReturnFormFilterl.Quarter + "" +
                            "<tr><td class='boldFont'>1.<td>(a)Tax Deduction and Collection Account No (TAN) :<td> " + C.TAN_NO + "<td><td>(e) Has any statement been filed earlier for this quarter (Yes/No) : <td>" + (string.IsNullOrEmpty(rr.PREV_PRN_NO) ? "No" : "Yes") +
                            "<tr><td><td>(b) Permanent Account No (PAN): <td>" + C.PAN_NO + "<td><td>(f) If answer to (e) is ‘Yes’, then Provisional Receipt No. of original statement :<td>" + (string.IsNullOrEmpty(rr.PREV_PRN_NO) ? "N.A." : rr.PREV_PRN_NO) +
                            "<tr><td><td>(c) Financial year: <td>" + Global.FinancialYear.ToString() + "-" + (Global.FinancialYear + 1).ToString().Substring(2, 2) + "<td><td>Type of debtor :<td>" + C.D_CATEGORY_ID + "-" + deductorType + "" +
                            "<tr><td colspan='6'>&nbsp;" +
                            "<tr><td class='boldFont'>2.<td colspan='2'>Particulars of the deductor (employer) <td><span class='boldFont'>3.</span><td colspan='2'>Particulars of person responsible for deduction of tax" +
                            "<tr><td><td>(a) Name of the employer : <td>" + C.COMPANY_NAME + "<td><td>(a) Name<td>" + C.PERSON_NAME +
                            "<tr><td><td>(b) If Central/State Government : <td><td><td>(b) Address<td>" +
                            "<tr><td><td>Name: <td><td><td>Flat/Door/Block No :<td>" + C.P_ADDRESS1 +
                            "<tr><td><td>AIN Code of PAO/TO/CDDO : <td><td><td>Name Of Premises/Building :<td>" + C.P_ADDRESS2 +
                            "<tr><td><td colspan='2'> (d) Address <td><td>Road/Street/Lane :<td>" + C.ADDRESS3 +
                            "<tr><td><td>Flt/Dr/Blk No : <td>" + C.ADDRESS1 + "<td><td>Area/Location : <td>" + C.ADDRESS4 +
                            "<tr><td><td>Building:<td>" + C.ADDRESS2 + "<td><td>Town/City/District : <td>" + C.ADDRESS5 +
                            "<tr><td><td>Rd/Strt/Lane : <td>" + C.ADDRESS3 + "<td><td>state :<td>" + p_state +
                            "<tr><td><td>Area/Locality : <td>" + C.ADDRESS4 + "<td><td>PIN Code<td>" + C.P_PIN_CODE +
                            "<tr><td><td>Town/District : <td>" + C.ADDRESS5 + "<td><td>Telephone No :<td>" + C.P_PHONE +
                            "<tr><td><td>Pin : <td>" + C.PIN_CODE + "<td><td>Alt Telephone No :<td>" + C.P_ALT_PHONE +
                            "<tr><td><td>State : <td>" + state + "<td><td>Email : <td>" + C.P_EMAIL +
                            "<tr><td><td>Phone : <td>" + C.PHONE + "<td><td>Alt. Email :<td>" + C.P_ALT_EMAIL +
                            "<tr><td><td>Alt. Phone : <td>" + C.ALT_PHONE + "<td><td>Mobile : <td>" + C.P_MOBILE +
                            "<tr><td><td>Email : <td>" + C.EMAIL + "<td><td><td>" +
                            "<tr><td><td>Alt. Email : <td>" + C.ALT_EMAIL + "<td><td><td>" +
                            "</table>");

                        str.Append("<table class='table table-condensed table-bordered report'><tr><th  colspan='13'>4.Details of tax deducted and paid to the credit of the central government:" +
                            "<tr class='boldFont'><td>Sr No<td>Tax<td>Surcharges<td>Edu Cess<td>Interest<td>Fee<td>Penalty/Others<td>Total Amt Dep<td>Mode<td>BSR Code<td>Challan Sr No<td>Date<td>Minor Head" +
                            "<tr><td>[301]<td>[302]<td>[303]<td>[304]<td>[305]<td>[306]<td>[307]<td>[308]<td>[309]<td>[310]<td>[311]<td>[312]<td>[313]");
                        str.Append(sb.ToString());
                        str.Append("</table>");

                        str.Append("<table  class='table table-condensed table-bordered'><tr><th>5.Details of salary paid and tax deducted thereon from the employer" +
                            "<tr><td> (i) Enclose Annexure I along with each quarterly statement" +
                            "<tr><td> (ii) Enclose Annexure II along with the last quarterly statement, i.e., for the quarter ending 31st march,having the details of whole financial year" +
                            "</table>");

                        str.Append("<table class='table table-condensed'><tr><th colspan='2'>Verification " +
                            "<tr><td>I," + C.PERSON_NAME + " hereby certify that all the Particulars furnished above are correct and complete<td>" +
                            "<tr><td>&nbsp;<td>" +
                            "<tr><td>Place:" + C.P_ADDRESS5 + "<td>Signature of the person responsible for deducting tax at source__________________________" +
                            "<tr><td><td >Name and designation of person responsible for deduction tax at source" +
                            "<tr><td>Date:" + DateTime.Now.ToString("dd-MM-yy") + "<td>" + C.PERSON_NAME + "," + C.DESIGNATION +
                            "</table>");

                        foreach (TRN_CHALLAN Chl in Clist)
                        {
                            str.Append("<table style='width:100%;' class='boldFont'><tr style='text-align:center;'><td>ANNEXURE: DEDUCTEE WISE BREAK-UP OF TDS" +
                                "<tr style='text-align:center;'><td>(Please use separate Annexure for each line - item in the table at S. No. 4 of main Form " + (ReturnFormFilterl.FormType) + ")" +
                                "<tr style='text-align:center;'><td>Details of salary paid and of tax deducted thereon from the employees</table>");

                            str.Append("<table style='width:100%;'><tr>" +
                                      "<td style='width:50%; vertical-align:top;'><table class='table table-condensed table-bordered'><tr><td>BSR code of the branch where tax is deposited<td>" + Chl.BSR_CODE + "" +
                                      "<tr><td>Date on which tax deposited (dd-mm-yyyy)<td>" + Cmn.ToDate(Chl.DEPOSIT_DATE).ToString("dd/MM/yy") + "" +
                                      "<tr><td>Challan Serial No<td>" + Chl.CHALLAN_NO + "" +
                                      "<tr><td>Section under which payment made<td>" + Chl.TOT_TAX + "" +
                                      "<tr><td>Total TDS to be allocated among deductees as in the vertical total of Col. 326 <td>-" +
                                      "<tr><td>Total interest to be allocated among deductees below <td>-" +
                                      "</table>" +
                                      "<td style='width:50%; vertical-align:top;'><table class='table table-condensed table-bordered'>" +
                                      "<tr><td>Name Of Employer<td>" + C.COMPANY_NAME + "<tr><td>TAN<td>" + C.TAN_NO + "</table>" +
                                      "</table>");
                            if (ReturnFormFilterl.FormType == "24Q")
                            {
                                str.Append("<table class='table table-condensed  table-bordered'>" +
                                       "<tr><td>SNo<td>Employee Ref No<td>PAN of The Employee<td>Name of Employee<td>Section Code<td>Date of payment/credit<td>Date of deduction<td>Amount paid or credited<td>Tax<td>Surcharge<td>Ed. Cess<td>Total TDS<td>Total TDS Deposited<td>Date of Deposit<td>Reason<td>No of Certificates u/s 197 issued by assessing officer for non deduction/lower deduction" +
                                       "<tr><td>[314]<td>[315]<td>[316]<td>[317]<td>[318]<td>[319]<td>[320]<td>[321]<td>[322]<td>[323]<td>[324]<td>[325]<td>[326]<td>[327]<td>[328]<td>[329]");

                                List<TRN_DEDUCTEE_DETAILS> CDL = TRN_DEDUCTEE_DETAILS.GetByChallanID(Chl.CHALLAN_ID);
                                int ctr2 = 1;
                                foreach (TRN_DEDUCTEE_DETAILS cd in CDL)
                                {
                                    str.Append("<tr><td>" + ctr2++ + "<td><td>" + cd.DEDUCTEE_PAN + "<td>" + cd.DEDUCTEE_NAME + "<td>1" + cd.SECTION_ID + "<td>" + Cmn.ToDate(cd.DEDUCTED_DATE).ToString("dd/MM/yy") + "<td>" + Cmn.ToDate(cd.DEDUCTED_DATE).ToString("dd/MM/yy") + "<td>" + cd.PAYMENT_AMOUNT + "<td>" + cd.TAX_AMOUNT + "<td>" + cd.SURCHARGE_AMOUNT + "<td>" + cd.CESS_AMOUNT + "<td>" + cd.TOTAL_AMOUNT + "<td>" + cd.TAX_DEPOSITED_AMOUNT + "<td>" + Cmn.ToDate(Chl.DEPOSIT_DATE).ToString("dd/MM/yy") + "<td>-<td>-");
                                }
                                str.Append("</table>");
                            }
                            else if (ReturnFormFilterl.FormType == "26Q")
                            {
                                str.Append("<table class='table table-condensed  table-bordered'>" +
                                       "<tr><td>SNo<td>Deductee ref no<td>Deductee Code<td>PAN of the deductor<td>Name of deductor<td>Section code<td>Date of payment/credit<td>Amount paid/credited<td>Totlal tax deducted<td>Total tax deposited<td>Date of deduction<td>Rate at which deducted<td>Reason<td>No of Certificates u/s 197 issued by assessing officer for non deduction/lower deduction" +
                                       "<tr><td>[414]<td>[415]<td>[416]<td>[417]<td>[418]<td>[419]<td>[420]<td>[421]<td>[422]<td>[423]<td>[424]<td>[425]<td>[426]<td>[427]");

                                List<TRN_DEDUCTEE_DETAILS> CDL = TRN_DEDUCTEE_DETAILS.GetByChallanID(Chl.CHALLAN_ID);
                                int ctr2 = 1;
                                foreach (TRN_DEDUCTEE_DETAILS cd in CDL)
                                {
                                    str.Append("<tr><td>" + ctr2++ + "<td><td>01<td>" + cd.DEDUCTEE_PAN + "<td>" + cd.DEDUCTEE_NAME + "<td>1" + cd.SECTION_ID + "<td>" + Cmn.ToDate(cd.DEDUCTED_DATE).ToString("dd/MM/yy") + "<td>" + cd.PAYMENT_AMOUNT + "<td>" + cd.TOTAL_AMOUNT + "<td>" + cd.TAX_DEPOSITED_AMOUNT + "<td>" + Cmn.ToDate(Chl.DEPOSIT_DATE).ToString("dd/MM/yy") + "<td>-<td>-<td>-");
                                }
                                str.Append("</table>");
                            }

                            str.Append("<table class='table table-condensed'><tr><th colspan='2'>Verification " +
                            "<tr><td>I," + C.PERSON_NAME + " hereby certify that all the Particulars furnished above are correct and complete<td>" +
                            "<tr><td>&nbsp;<td>" +
                            "<tr><td>Place:" + C.P_ADDRESS5 + "<td>Signature of the person responsible for deducting tax at source__________________________" +
                            "<tr><td><td >Name and designation of person responsible for deduction tax at source" +
                            "<tr><td>Date:" + DateTime.Now.ToString("dd/MM/yy") + "<td>" + C.PERSON_NAME + "," + C.DESIGNATION +
                            "<tr><td><td>" +
                            "</table>");
                        }
                    }
                    returnTable.Append(str.ToString());
                    lblReport.Text = returnTable.ToString();
                }
                break;
        }
    }

}