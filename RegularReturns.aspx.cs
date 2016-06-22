using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;
using System.Text;
using System.Data;

public partial class RegularReturns : BasePage
{
    string formType = "";
    int returnId = 0;
    int ChallanRecords = 0;
    int DeducteeRecords = 0;
    double ChallanAmount = 0.0f;
    double AmountPaid = 0.0f;
    double TotalTDSDeducted = 0.0f;
    int correction = 0;

    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        Title = "Regular Return";
        formType = QueryString("formtype");
        if(formType=="") formType="24Q";
        returnId = Cmn.ToInt(QueryString("returnid"));
        showCorrectionSummary.Visible = false;
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ReturnFormFilterl.HideForm();    //Hide Form Type Selector
            
            string corrrAppend = "";
            if (returnId != 0)               //In case of correction
            {
                correction = 1;
                corrrAppend = " Correction";
                showCorrectionSummary.Visible = true;
                //ShowCorrectionSummary();
            }
            if (formType == "26Q")
                headingText.InnerText = "Form 26Q" + corrrAppend;
            else if (formType == "24Q")
                headingText.InnerText = "Form 24Q" + corrrAppend;
            ShowData();
        }
    }

    private void ShowData()
    {
        panelMain.Visible = false;

        ReturnFormFilterl.removeTopItemFromQtrDropdown();  //remove <--All--> from quarter selection

        if (Global.FinancialYear == -1 || ReturnFormFilterl.Quarter == "-1" || Global.CompanyID == -1)
            return;

        panelMain.Visible = true;
        TRN_BASIC_INFO RR = null;

        if (returnId != 0)   //in case of correction
        {
            RR = TRN_BASIC_INFO.GetByID(returnId);
        }
        else
        {
            List<TRN_BASIC_INFO> RRL = TRN_BASIC_INFO.GetByFormYearQuarterCompany(formType, Global.FinancialYear, ReturnFormFilterl.Quarter, Global.CompanyID);
            if (RRL.Count > 0)
                RR = RRL[0];
        }

        if (RR != null)
        {
            ShowBasicInfoSummary(RR);
            WriteCookie(this.Page, formType.ToString(), Global.FinancialYear.ToString(), ReturnFormFilterl.Quarter.ToString(), Global.CompanyID.ToString(), ReturnFormFilterl.ChallanID.ToString(), "-1");
        }
        
        else
        {
            //if ((formType != 0 && formType <= 2 && Global.FinancialYear != -1) && (ReturnFormFilterl.Quarter != "-1" && Global.CompanyID != -1))
            if ((formType != "" && Global.FinancialYear != -1) && (ReturnFormFilterl.Quarter != "-1" && Global.CompanyID != -1))
            {
                lblID.Text = "0";
                Update();
            }
            lnkAddChallan.Visible = false;
            ltrSalDetailList.Text = "";
        }
        
        //if (lblID.Text != "0")                      //was already commented
        //{
        //    lnkAddChallan.Visible = true;
        //    linkRegularReturnEdit.HRef = "/editregularreturn.aspx?id=" + lblID.Text;
        //}
        //else
        //    linkRegularReturnEdit.Visible = false;

        ShowCompanyInfoSummary();
        CreateAddChallanLink();
        ShowChallanData(Cmn.ToInt(lblID.Text));
        ShowQuarterFourData();
        ShowReturnData(RR);
        ShowCorrectionSummary(RR);

        lnkGenerateReturn.HRef = "/generatereturns.aspx?returnid=" + lblID.Text + "";
    }
    
    private void ShowCompanyInfoSummary()
    {
        MST_COMPANY C = MST_COMPANY.GetByID(Global.CompanyID);
        if (C != null)
        {
            lblTan.Text = C.TAN_NO;
            lblPan.Text = C.PAN_NO;
            string d = "";
            Global.DeductorType.TryGetValue(C.D_CATEGORY_ID, out d);
            lblDeductorType.Text = d;
            lblResponsiblePerson.Text = C.PERSON_NAME;
        }
    }  //Basic summary 1st line

    private void ShowBasicInfoSummary(TRN_BASIC_INFO RR)  //Basic summary 2nd line 
    {

        lblID.Text = RR.BASIC_INFO_ID.ToString();
        lblFillingDate.Text = Cmn.ToDate(RR.DATE_OF_FILING).ToString("dd-MMM-yyyy") == "01-Jan-1900" ? "" : Cmn.ToDate(RR.DATE_OF_FILING).ToString("dd-MMM-yy");
        lblReciptNo.Text = RR.RECEIPT_NO;
        lblTokenNo.Text = RR.PRN_NO;
        if (RR.ACCEPT_FLAG == null || RR.ACCEPT_FLAG == 0)
        {
            lblTokenNo.BackColor = System.Drawing.Color.LightCoral;
            lblTokenNo.Attributes.Add("title", "click here to verify");
        }
        else
        {
            lblTokenNo.BackColor = System.Drawing.Color.LightGreen;
            lblTokenNo.Attributes.Add("title", "Verified");
        }
        lblPrevTokenNo.Text = RR.PREV_PRN_NO;
        lblAddresChanged.Text = (RR.ADDRESS_CHANGE == 1 || RR.P_ADDRESS_CHANGE == 1) ? "Yes" : "No";
    }

    private void ShowChallanSummary()
    {
        lblChallanRecords.Text = ChallanRecords.ToString();
        lblDeducteeRecords.Text = DeducteeRecords.ToString();
        lblAmountPaid.Text = AmountPaid.ToString("#,##,##0");
        lblChalllanAmount.Text = ChallanAmount.ToString("#,##,##0");
        lblTotalTDSDeducted.Text = TotalTDSDeducted.ToString("#,##,##0");
    }   //Basic Summary 3rd line

    private void ShowReturnData(TRN_BASIC_INFO rr)
    {
        if (rr == null) return;
        lblFinancialYexr.Text = (rr.YEAR).ToString() + "-" + (rr.YEAR + 1).ToString();
        lblQuarter.Text = rr.QTR;
        //lblCompany.Text = rr.COMPANY_NAME;
        lblFormNo.Text = rr.FORM_NO;
        ddReturnFiledPrev.SelectedValue = rr.PREV_PRN_NO == "" ? "0" : "1";
        txtTokenOfPrev26QReturn.Text = rr.PREV_PRN_NO;
        chkCompany.Checked = rr.ADDRESS_CHANGE == 1 ? true : false;
        chkResponsiblePerson.Checked = rr.P_ADDRESS_CHANGE == 1 ? true : false;
        txtReciptNo.Text = rr.RECEIPT_NO;
        txtDateOfFiling.Text = Cmn.ToDate(rr.DATE_OF_FILING).ToString("dd-MMM-yy") == "01-Jan-00" ? "" : (Cmn.ToDate(rr.DATE_OF_FILING).ToString("dd-MMM-yy").ToString());
        txtTokenNo.Text = rr.PRN_NO;

        TRN_COMPANY_INFO CI = TRN_COMPANY_INFO.GetByBasicInfoID(rr.BASIC_INFO_ID);
        if (CI != null)
        {
            txtCompanyName.Text = CI.COMPANY_NAME;
            txtTanNo.Text = CI.TAN_NO;
            txtPanNo.Text = CI.PAN_NO;
            txtBranch.Text = CI.BRANCH_DIV;
            ddDeductorType.SelectedValue = CI.D_CATEGORY_ID;
            //txtTanRegNo.Text = CI.TanRegNo;
            txtFlatNo.Text = CI.ADDRESS1;
            txtBuildingName.Text = CI.ADDRESS2;
            txtStreet.Text = CI.ADDRESS4;
            txtArea.Text = CI.ADDRESS5;
            txtTown.Text = CI.ADDRESS3;
            txtPin.Text = CI.PAN_NO;
            ddState.SelectedValue = CI.STATE_ID;
            txtStd.Text = CI.STD;
            txtPhone.Text = CI.PHONE;
            //txtAltStd.Text = CI.StdAlt;
            //txtPhoneAlt.Text = CI.PhoneAlt;
            txtEmail.Text = CI.EMAIL;
            //txtEmailAlt.Text = CI.EmailAlt;
            txtResponsiblePersonName.Text = CI.PERSON_NAME;
            txtDesignation.Text = CI.DESIGNATION;
            //txtFathersName.Text = CI.RPFathersName;
            txtRPMobileNo.Text = CI.P_MOBILE;
            txtRPFlatNo.Text = CI.P_ADDRESS1;
            txtRPBuildingName.Text = CI.P_ADDRESS2;
            txtRPStreet.Text = CI.P_ADDRESS4;
            txtRPArea.Text = CI.P_ADDRESS5;
            txtRPTown.Text = CI.P_ADDRESS3;
            txtRPPin.Text = CI.P_PIN_CODE;
            ddRPState.SelectedValue = CI.P_STATE_ID;
            txtStdRP.Text = CI.P_STD;
            //txtStdAltRP.Text = CI.RPStdAlt;
            txtRPPhone.Text = CI.P_PHONE;
            //txtPhoneAlt.Text = CI.PhoneAlt;
            txtRPEmail.Text = CI.P_EMAIL;
            //txtRPEmailAlt.Text = CI.RPEmailAlt;
            txtPAOCode.Text = CI.PAO_CODE;
            txtPAORegNo.Text = CI.PAO_REG_NO;
            txtDDOCode.Text = CI.DDO_CODE;
            //txtDDORegNo.Text = rr.DDORegNo;
            ddGovDeductorState.SelectedValue = CI.D_STATE_ID;
            ddMinistry.SelectedValue = CI.MINISTRY_ID;
            txtOtherMinistry.Text = CI.MINISTRY_OTHER;
            //txtAccountOfficerIDNo.Text = CI.ASSESSING_OFFICER;
            //txtCITAddress.Text = CI.rrITAddress;
            //txtCITCity.Text = CI.CITCity;
            //txtCITPin.Text = CI.CITPin;
        }
        ResetPrevTokenText();
    }

    private void ResetPrevTokenText()
    {
        if (ddReturnFiledPrev.SelectedValue == "0")
        {
            txtTokenOfPrev26QReturn.ReadOnly = true;
            txtTokenOfPrev26QReturn.Text = "";
        }
        else
            txtTokenOfPrev26QReturn.ReadOnly = false;
    }

    private void Update()
    {
        TRN_BASIC_INFO RR = TRN_BASIC_INFO.GetByID(Cmn.ToInt(lblID.Text));
        if (RR == null)
        {
            RR = new TRN_BASIC_INFO();
            RR.FORM_NO = formType;
            RR.COMPANY_ID = Global.CompanyID;
            RR.YEAR = Global.FinancialYear;
            RR.QTR = ReturnFormFilterl.Quarter;
            RR.Save();

            MST_COMPANY C = MST_COMPANY.GetByID(Global.CompanyID);
            if (C != null)
            {
                TRN_COMPANY_INFO CI = new TRN_COMPANY_INFO();
                CI.BASIC_INFO_ID = RR.BASIC_INFO_ID;
                CI.COMPANY_ID = Global.CompanyID;
                CI.GROUP_ID = 0;
                CI.ASST_ID = Global.FinancialYearID.ToString();
                CI.COMPANY_NAME = C.COMPANY_NAME;
                CI.TAN_NO = C.TAN_NO;
                CI.PAN_NO = C.PAN_NO;
                CI.BRANCH_DIV = C.BRANCH_DIV;
                CI.D_CATEGORY_ID = C.D_CATEGORY_ID;
                CI.TAN_REG_NO = C.TAN_REG_NO;
                CI.ADDRESS1 = C.ADDRESS1;
                CI.ADDRESS2 = C.ADDRESS2;
                CI.ADDRESS3 = C.ADDRESS3;
                CI.ADDRESS4 = C.ADDRESS4;
                CI.ADDRESS5 = C.ADDRESS5;
                CI.PIN_CODE = C.PIN_CODE;
                CI.STATE_ID = C.STATE_ID;
                CI.STD = C.P_STD;
                CI.PHONE = C.PHONE;
                CI.ALT_STD = C.ALT_STD;
                CI.ALT_PHONE = C.ALT_PHONE;
                CI.EMAIL = C.EMAIL;
                CI.ALT_EMAIL = C.ALT_EMAIL;
                CI.PERSON_NAME = C.PERSON_NAME;
                CI.DESIGNATION = C.DESIGNATION;
                CI.FATHER_NAME = C.FATHER_NAME;
                CI.P_MOBILE = C.P_MOBILE;
                CI.P_ADDRESS1 = C.P_ADDRESS1;
                CI.P_ADDRESS2 = C.P_ADDRESS2;
                CI.P_ADDRESS3 = C.P_ADDRESS3;
                CI.P_ADDRESS4 = C.P_ADDRESS4;
                CI.P_ADDRESS5 = C.P_ADDRESS5;
                CI.P_PIN_CODE = C.P_PIN_CODE;
                CI.P_STATE_ID = C.P_STATE_ID;
                CI.P_STD = C.P_STD;
                CI.P_ALT_STD = C.P_ALT_STD;
                CI.P_PHONE = C.P_PHONE;
                CI.P_ALT_PHONE = C.P_ALT_PHONE;
                CI.P_EMAIL = C.P_EMAIL;
                CI.P_ALT_EMAIL = C.P_ALT_EMAIL;
                CI.PAO_CODE = C.PAO_CODE;
                CI.PAO_REG_NO = C.PAO_REG_NO;
                CI.DDO_CODE = C.DDO_CODE;
                CI.DDO_REG_NO = C.DDO_REG_NO;
                CI.D_STATE_ID = C.D_STATE_ID;
                CI.MINISTRY_ID = C.MINISTRY_ID;
                CI.MINISTRY_OTHER = C.MINISTRY_OTHER;
                CI.ASSESSING_OFFICER = C.ASSESSING_OFFICER;
                CI.CIT_TDS_ADDRESS = C.CIT_TDS_ADDRESS;
                CI.CIT_TDS_CITY = C.CIT_TDS_CITY;
                CI.CIT_TDS_PINCODE = C.CIT_TDS_PINCODE;
                CI.Save();
            }
            ShowData();
        }
        else
        {
            try
            {
                RR.PREV_PRN_NO = txtTokenOfPrev26QReturn.Text;
                RR.ADDRESS_CHANGE = chkCompany.Checked == true ? 1 : 0;
                RR.P_ADDRESS_CHANGE = chkResponsiblePerson.Checked == true ? 1 : 0;
                RR.RECEIPT_NO = txtReciptNo.Text;
                RR.DATE_OF_FILING = Cmn.ToDate(txtDateOfFiling.Text);
                RR.PRN_NO = txtTokenNo.Text;

                if (RR.CORRECTION_ID.ToString() != "")
                {
                    MST_COMPANY C = MST_COMPANY.GetByID((int)RR.COMPANY_ID);
                    //RR.COMPANY_NAME = C.COMPANY_NAME;
                    //RR.TAN_NO = C.TAN_NO;
                    //RR.PAN_NO = C.PAN_NO;
                    //RR.BRANCH_DIV = C.BRANCH_DIV;
                    //RR.D_CATEGORY_ID = C.D_CATEGORY_ID;
                    //RR.TAN_REG_NO = C.TAN_REG_NO;
                    //RR.ADDRESS1 = C.ADDRESS1;
                    //RR.ADDRESS2 = C.ADDRESS2;
                    //RR.ADDRESS3 = C.ADDRESS3;
                    //RR.ADDRESS4 = C.ADDRESS4;
                    //RR.ADDRESS5 = C.ADDRESS5;
                    //RR.PIN_CODE = C.PIN_CODE;
                    //RR.STATE_ID = C.STATE_ID;
                    //RR.STD = C.P_STD;
                    //RR.PHONE = C.PHONE;
                    //RR.ALT_STD = C.ALT_STD;
                    //RR.ALT_PHONE = C.ALT_PHONE;
                    //RR.EMAIL = C.EMAIL;
                    //RR.ALT_EMAIL = C.ALT_EMAIL;
                    //RR.PERSON_NAME = C.PERSON_NAME;
                    //RR.DESIGNATION = C.DESIGNATION;
                    //RR.FATHER_NAME = C.FATHER_NAME;
                    //RR.P_MOBILE = C.P_MOBILE;
                    //RR.P_ADDRESS1 = C.P_ADDRESS1;
                    //RR.P_ADDRESS2 = C.P_ADDRESS2;
                    //RR.P_ADDRESS3 = C.P_ADDRESS3;
                    //RR.P_ADDRESS4 = C.P_ADDRESS4;
                    //RR.P_ADDRESS5 = C.P_ADDRESS5;
                    //RR.P_PIN_CODE = C.P_PIN_CODE;
                    //RR.P_STATE_ID = C.P_STATE_ID;
                    //RR.P_STD = C.P_STD;
                    //RR.P_ALT_STD = C.P_ALT_STD;
                    //RR.P_PHONE = C.P_PHONE;
                    //RR.P_ALT_PHONE = C.P_ALT_PHONE;
                    //RR.P_EMAIL = C.P_EMAIL;
                    //RR.P_ALT_EMAIL = C.P_ALT_EMAIL;
                    //RR.PAO_CODE = C.PAO_CODE;
                    //RR.PAO_REG_NO = C.PAO_REG_NO;
                    //RR.DDO_CODE = C.DDO_CODE;
                    //RR.DDO_REG_NO = C.DDO_REG_NO;
                    //RR.D_STATE_ID = C.D_STATE_ID;
                    //RR.MINISTRY_ID = C.MINISTRY_ID;
                    //RR.MINISTRY_OTHER = C.MINISTRY_OTHER;
                    //RR.ASSESSING_OFFICER = C.ASSESSING_OFFICER;
                    //RR.CIT_TDS_ADDRESS = C.CIT_TDS_ADDRESS;
                    //RR.CIT_TDS_CITY = C.CIT_TDS_CITY;
                    //RR.CIT_TDS_PINCODE = C.CIT_TDS_PINCODE;
                }
                else
                {
                    TRN_COMPANY_INFO CI = TRN_COMPANY_INFO.GetByID(Cmn.ToInt(RR.COMPANY_ID));
                    if (CI != null)
                    {
                        CI.COMPANY_NAME = txtCompanyName.Text;
                        CI.TAN_NO = txtTanNo.Text;
                        CI.PAN_NO = txtPanNo.Text;
                        CI.BRANCH_DIV = txtBranch.Text;
                        CI.D_CATEGORY_ID = ddDeductorType.SelectedValue;
                        //RR.TanRegNo = txtTanRegNo.Text;
                        CI.ADDRESS1 = txtFlatNo.Text;
                        CI.ADDRESS2 = txtBuildingName.Text;
                        CI.ADDRESS3 = txtStreet.Text;
                        CI.ADDRESS4 = txtArea.Text;
                        CI.ADDRESS5 = txtTown.Text;
                        CI.PIN_CODE = txtPin.Text;
                        CI.STATE_ID = ddState.SelectedValue;
                        CI.STD = txtStd.Text;
                        CI.PHONE = txtPhone.Text;
                        //RR.StdAlt = txtAltStd.Text;
                        //RR.PhoneAlt = txtPhoneAlt.Text;
                        CI.EMAIL = txtEmail.Text;
                        //RR.EmailAlt = txtEmailAlt.Text;
                        CI.PERSON_NAME = txtResponsiblePersonName.Text;
                        CI.DESIGNATION = txtDesignation.Text;
                        //RR.RPFathersName = txtFathersName.Text;
                        CI.P_MOBILE = txtRPMobileNo.Text;
                        CI.ADDRESS1 = txtRPFlatNo.Text;
                        CI.ADDRESS2 = txtRPBuildingName.Text;
                        CI.ADDRESS3 = txtRPStreet.Text;
                        CI.ADDRESS4 = txtRPArea.Text;
                        CI.ADDRESS4 = txtRPTown.Text;
                        CI.P_PIN_CODE = txtRPPin.Text;
                        CI.P_STATE_ID = ddRPState.SelectedValue;
                        CI.P_STD = txtStdRP.Text;
                        //RR.RPStdAlt = txtStdAltRP.Text;
                        CI.P_PHONE = txtRPPhone.Text;
                        //RR.PhoneAlt = txtPhoneAlt.Text;
                        CI.P_EMAIL = txtRPEmail.Text;
                        //RR.RPEmailAlt = txtRPEmailAlt.Text;
                        CI.PAO_CODE = txtPAOCode.Text;
                        CI.PAO_REG_NO = txtPAORegNo.Text;
                        CI.DDO_CODE = txtDDOCode.Text;
                        CI.DDO_REG_NO = txtDDORegNo.Text;
                        CI.D_CATEGORY_ID = ddGovDeductorState.SelectedValue;
                        CI.MINISTRY_ID = ddMinistry.SelectedValue;
                        CI.MINISTRY_OTHER = txtOtherMinistry.Text;
                        //RR.AccountOfficerIDNo = txtAccountOfficerIDNo.Text;
                        //RR.CITAddress = txtCITAddress.Text;
                        //RR.CITCity = txtCITCity.Text;
                        //RR.CITPin = txtCITPin.Text;
                    }
                }
                RR.Save();
                lblMsg.Text = "Saved!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
            }
            catch
            {
            }
        }
    }

    private void ShowChallanData(int FormID)
    {
        StringBuilder sb = new StringBuilder("<div class='panel-group' id='accordion' role='tablist' aria-multiselectable='true'>");

        List<TRN_CHALLAN> CL = null;

        if (ReturnFormFilterl.ChallanID == -1)
            CL = TRN_CHALLAN.GetByFormID(FormID);
        else
        {
            CL = new List<TRN_CHALLAN>();
            CL.Add(TRN_CHALLAN.GetByID(ReturnFormFilterl.ChallanID));
        }

        int ctr = 0;
        foreach (TRN_CHALLAN C in CL)
        {
            if (C == null) continue;
            ChallanRecords++;
            ChallanAmount += Cmn.ToDbl(C.TOT_TAX);
            double DeducteeTotal = 0.0;
            List<TRN_DEDUCTEE_DETAILS> CD = TRN_DEDUCTEE_DETAILS.GetByChallanID(C.CHALLAN_ID);

            bool isChallnDetailModified = false;
            foreach (TRN_DEDUCTEE_DETAILS cd in CD)
            {
                if (cd.MODE == 1)
                    isChallnDetailModified = true;
                DeducteeTotal += Cmn.ToDbl(cd.TAX_DEPOSITED_AMOUNT);
            }

            double Balance = (double)C.TOT_TAX - DeducteeTotal;
            string NSDLStatus = "";
            if (C.NSDL_STATUS != null)
                Global.NSDLStatus.TryGetValue(C.NSDL_STATUS, out NSDLStatus);

            sb.Append("<div class='panel panel-default'>" +
                          "<div class='panel-heading' style='background-color:#d9edf7' role='tab' id='heading" + C.CHALLAN_ID + "'>" +
                            "<h4 class='panel-title'>" +
                            "<a data-toggle='collapse'  data-parent='#accordion' href='#collapse" + C.CHALLAN_ID + "' aria-expanded='true' aria-controls='collapse" + C.CHALLAN_ID + "' class='collapsed tognav'  id='a_collapse" + C.CHALLAN_ID + "' >" +
                              "<table class='table challan'><tr><th style='width:150px;'>" + (++ctr) + ". <a class='fancybox450 fancybox.iframe' href='/addchallan.aspx?challanid=" + C.CHALLAN_ID + "&formId=" + C.BASIC_INFO_ID + "&correction=" + correction + "'>Challan: " + C.CHALLAN_NO + "</a>" +
                               "<td style='width:120px;'>Date: " + Cmn.ToDate(C.DEPOSIT_DATE).ToString("dd-MMM-yy") + "<td style='width:120px;'>BSR: " + C.BSR_CODE + "<td style='width:120px;'>Amount: " + Cmn.ToDbl(C.TOT_TAX).ToString("#,##,##0") +
                                "<td style='width:150px;'>Balance: <span style='color:" + (Balance > 0 ? "red" : "green") + ";font-weight:bold;'>" + Balance.ToString("0.00"));
            if (correction == 1)
            {
                sb.Append("<td style='width:150px;'>NSDL Status: " + NSDLStatus +
                 "<td style='width:100px;'>Mode: <span style='" + (C.MODE == null ? "background-color:trasparent" : (C.MODE == 0 ? "background-color:#9BECA8" : "background-color:yellow;")) + ";padding:5px;'>" + (C.MODE == null ? "" : (C.MODE == 1 ? "Edit" : "Add")) +
                 "<td>Changes in Deductee: " + (isChallnDetailModified ? "YES" : "") + "");
            }
            sb.Append("</table>" +//"Collapsible Group Item #1"
             "</a>" +
        "</h4>" +
       "</div>" +
"<div id='collapse" + C.CHALLAN_ID + "' class='panel-collapse collapse' role='tabpanel' aria-labelledby='heading" + C.CHALLAN_ID + "'>" +
  "<div class='panel-body pnlchallandetail'>");

            string ChallanDetails = GetChallanDetail(C.CHALLAN_ID, Cmn.ToInt(C.COMPANY_ID));
            if (ChallanDetails != "")
            {
                sb.Append(ChallanDetails);
            }
            sb.Append("</div>" +
        "</div>" +
     "</div>");

        }
        sb.Append("</div>");
        ltDataTable.Text = sb.ToString();
        
        ShowChallanSummary();
    }

    

    private string GetChallanDetail(int ChallanID, int CompanyID)
    {
        TRN_CHALLAN Cln = TRN_CHALLAN.GetByID(ChallanID);

        List<TRN_DEDUCTEE_DETAILS> CD = TRN_DEDUCTEE_DETAILS.GetByChallanID(ChallanID);
        StringBuilder sb = new StringBuilder();
        if (CD != null)
        {
            sb.Append("<table class='table table-condensed table-striped table-bordered hover-style challandetail' ><tr><th>#<th>Name");
            if (correction == 1)
                sb.Append("<th>Mode");
            sb.Append("<th>Payment<th>TDS<th> Date");
            int ctr = 0;
            double Payment = 0, TDS = 0;

            foreach (TRN_DEDUCTEE_DETAILS c in CD)
            {
                DeducteeRecords++;
                AmountPaid += (float)c.PAYMENT_AMOUNT;
                TotalTDSDeducted += (float)c.TAX_DEPOSITED_AMOUNT;
                sb.Append("<tr><td> " + ++ctr + "<td><a class='fancybox500 fancybox.iframe' href='/addemployee.aspx?id=" + c.DEDUCTEE_DETAIL_ID + "&challanid=" + c.CHALLAN_ID + "&challanno="+Cln.CHALLAN_NO+"&chalandate="+Cmn.ToDate(Cln.DEPOSIT_DATE).ToString("dd-MMM-yy")+"&companyid=" + CompanyID + "&formtype=" + formType + "&correction=" + correction + "'>"
                    + c.DEDUCTEE_NAME + " (" + c.DEDUCTEE_PAN + ")</a><td style='" + (c.MODE == null ? "background-color:white" : (c.MODE == 0 ? "background-color:yellow" : "background-color:#9BECA8")) + "'>");
                if (correction == 1)
                    sb.Append((c.MODE == null ? "" : c.MODE == 0 ? "Add" : "Edit") + "<td>");
                sb.Append(((double)c.PAYMENT_AMOUNT).ToString("#,##,##0") + "<td>"
                + ((double)c.TAX_DEPOSITED_AMOUNT).ToString("#,##,##0") + "<td>"
                + Cmn.ToDate(c.DEDUCTED_DATE).ToString("dd-MMM-yy"));
                Payment += (double)c.PAYMENT_AMOUNT;
                TDS += (double)c.TAX_DEPOSITED_AMOUNT;
            }
            
            sb.Append("<tr><th><th>Total");
            if (correction == 1)
                sb.Append("<th>");
            sb.Append("<th>" + Payment.ToString("#,##,##0") + "<th>" + TDS.ToString("#,##,##0") + "<th>");
            sb.Append("<a id='addEmployye' style='width:100px; padding:2px !important;' class='no-print pull-right fancybox500 fancybox.iframe btn btn-sm btn-success btn-sm' href='/addemployee.aspx?id=0&challanid=" + ChallanID + "&challanno="+Cln.CHALLAN_NO+"&chalandate="+Cmn.ToDate(Cln.DEPOSIT_DATE).ToString("dd-MMM-yy")+"&companyid=" + CompanyID + "&formtype=" + formType + "&correction=" + correction + "'><span class='glyphicon glyphicon-plus'></span>" + (formType == "24Q" ? " Add Employee" : " Add Deductee") + "</a>");
            return sb.Append("</table>").ToString();
        }
        return "";
    }

    private void ShowQuarterFourData()
    {
        if (ReturnFormFilterl.Quarter == "Q4" && formType == "24Q")
        {
            linkSalaryDetail.Visible = true;
            ddEmployee.Visible = true;
            if (lblID.Text == "0")
            {
                linkSalaryDetail.Visible = false;
                ddEmployee.Visible = false;
                return;
            }
            List<MST_EMPLOYEE> list = MST_EMPLOYEE.GetList(Global.CompanyID);
            ddEmployee.Items.Clear();
            foreach (MST_EMPLOYEE emp in list)
            {
                ddEmployee.Items.Add(new ListItem(emp.EMPLOYEE_NAME_ + "," + emp.EMPLOYEE_PAN, emp.EMPLOYEE_ID.ToString()));
            }
            createSalryDetailLink();

        }
        else
        {
            linkSalaryDetail.Visible = false;
            ddEmployee.Visible = false;
        }
        ShowSalaryDetailList();
    }
    protected void ShowSalaryDetailList()
    {
        if (ReturnFormFilterl.Quarter != "Q4" || formType != "24Q")
        {
            ltrSalDetailList.Text = "";
            return;
        }
        StringBuilder str = new StringBuilder();
        List<TRN_SALARY_DETAILS> SD = TRN_SALARY_DETAILS.GetByFormID(Cmn.ToInt(lblID.Text));
        if (SD.Count > 0)
        {
            str.Append("<table class='SalaryDetails table table-bordered table-condensed'><tr><th>SNo<th>Employee<th>Pan<th>Date<th>Salary<th>Deductions" +
                "<th>Income<th>Tax<th>Gross Salary");
            int ctr = 0;
            foreach (TRN_SALARY_DETAILS sd in SD)
            {
                MST_EMPLOYEE e = MST_EMPLOYEE.GetByID((int)sd.EMPLOYEE_ID);
                str.Append("<tr><td>" + ++ctr + "<td><a href='/salarydetailpage.aspx?formid=" + sd.BASIC_INFO_ID + "&&employeeid=" + sd.EMPLOYEE_ID + "' target='_blank'>" + e.EMPLOYEE_NAME_ + "</a>" +
                "<td>" + e.EMPLOYEE_PAN + "" +
                "<td>" + Cmn.ToDate(sd.FROM_DATE).ToString("dd-MMM-yy") + " to " + Cmn.ToDate(sd.TO_DATE).ToString("dd-MMM-yy") + "" +
                "<td>" + sd.TS_GS_TOTAL + "" +
                "<td>" + Cmn.ToDbl(sd.US_16_EA + sd.US_16_TE) +
                "<td>" + sd.INCOME_CHARGEABLE +
                "<td>" + sd.TOTAL_TDS_DEDUCTED +
                "<td>" + sd.GROSS_TOTAL_INCOME);
            }
            str.Append("</table>");
        }
        ltrSalDetailList.Text = str.ToString();
    }

    protected void CreateAddChallanLink()
    {
        lnkAddChallan.HRef = "/addchallan.aspx?challanid=0&formId=" + lblID.Text + "&correction=" + correction + "";
    }

    protected void createSalryDetailLink()
    {
        linkSalaryDetail.Visible = true;
        if (ddEmployee.SelectedValue == "")
        {
            linkSalaryDetail.Visible = false;
            ddEmployee.Visible = false;
        }
        linkSalaryDetail.HRef = "/salarydetailpage.aspx?formid=" + lblID.Text + "&employeeid=" + ddEmployee.SelectedValue;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Update();
    }

    protected void ddEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        createSalryDetailLink();
    }

    protected void ReturnFormFilterl_SelectionChange(object sender, EventArgs e)
    {
        ShowData();
    }
    protected void dd26QReturnFiledPrev_SelectedIndexChanged(object sender, EventArgs e)
    {
        ResetPrevTokenText();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Update();
    }

    private void UpdateRegularRuturn()
    {
        TRN_BASIC_INFO rr = TRN_BASIC_INFO.GetByID(Cmn.ToInt(lblID.Text));
        if (rr != null)
        {
            try
            {
                rr.PREV_PRN_NO = txtTokenOfPrev26QReturn.Text;
                rr.ADDRESS_CHANGE = chkCompany.Checked == true ? 1 : 0;
                rr.P_ADDRESS_CHANGE = chkResponsiblePerson.Checked == true ? 1 : 0;
                rr.RECEIPT_NO = txtReciptNo.Text;
                rr.DATE_OF_FILING = Cmn.ToDate(txtDateOfFiling.Text);
                rr.PRN_NO = txtTokenNo.Text;
                rr.Save();

                if (rr.CORRECTION_ID.ToString() != "")
                {
                    MST_COMPANY C = MST_COMPANY.GetByID((int)rr.COMPANY_ID);
                    //rr.COMPANY_NAME = C.COMPANY_NAME;
                    //rr.TAN_NO = C.TAN_NO;
                    //rr.PAN_NO = C.PAN_NO;
                    //rr.BRANCH_DIV = C.BRANCH_DIV;
                    //rr.D_CATEGORY_ID = C.D_CATEGORY_ID;
                    //rr.TAN_REG_NO = C.TAN_REG_NO;
                    //rr.ADDRESS1 = C.ADDRESS1;
                    //rr.ADDRESS2 = C.ADDRESS2;
                    //rr.ADDRESS3 = C.ADDRESS3;
                    //rr.ADDRESS4 = C.ADDRESS4;
                    //rr.ADDRESS5 = C.ADDRESS5;
                    //rr.PAN_NO = C.PIN_CODE;
                    //rr.STATE_ID = C.STATE_ID;
                    //rr.STD = C.STD;
                    //rr.PHONE = C.PHONE;
                    //rr.ALT_STD = C.ALT_STD;
                    //rr.ALT_PHONE = C.ALT_PHONE;
                    //rr.EMAIL = C.EMAIL;
                    //rr.ALT_EMAIL = C.P_ALT_EMAIL;
                    //rr.PERSON_NAME = C.PERSON_NAME;
                    //rr.DESIGNATION = C.DESIGNATION;
                    //rr.FATHER_NAME = C.FATHER_NAME;
                    //rr.P_MOBILE = C.P_MOBILE;
                    //rr.P_ADDRESS1 = C.P_ADDRESS1;
                    //rr.P_ADDRESS2 = C.P_ADDRESS2;
                    //rr.P_ADDRESS3 = C.P_ADDRESS3;
                    //rr.P_ADDRESS4 = C.P_ADDRESS4;
                    //rr.P_ADDRESS5 = C.P_ADDRESS5;
                    //rr.P_PIN_CODE = C.P_PIN_CODE;
                    //rr.P_STATE_ID = C.P_STATE_ID;
                    //rr.P_STD = C.P_STD;
                    //rr.P_ALT_STD = C.P_ALT_STD;
                    //rr.P_PHONE = C.P_PHONE;
                    //rr.P_ALT_PHONE = C.P_ALT_PHONE;
                    //rr.P_EMAIL = C.P_EMAIL;
                    //rr.P_ALT_EMAIL = C.P_ALT_EMAIL;
                    //rr.PAO_CODE = C.PAO_CODE;
                    //rr.PAO_REG_NO = C.PAO_REG_NO;
                    //rr.DDO_CODE = C.DDO_CODE;
                    //rr.DDO_REG_NO = C.DDO_REG_NO;
                    //rr.D_STATE_ID = C.D_STATE_ID;
                    //rr.MINISTRY_ID = C.MINISTRY_ID;
                    //rr.MINISTRY_OTHER = C.MINISTRY_OTHER;
                    //rr.ASSESSING_OFFICER = C.ASSESSING_OFFICER;
                    //rr.CIT_TDS_ADDRESS = C.CIT_TDS_ADDRESS;
                    //rr.CIT_TDS_CITY = C.CIT_TDS_CITY;
                    //rr.CIT_TDS_PINCODE = C.CIT_TDS_PINCODE;
                }

                else
                {
                    TRN_COMPANY_INFO CI = TRN_COMPANY_INFO.GetByBasicInfoID(rr.BASIC_INFO_ID);
                    if (CI != null)
                    {
                        CI.COMPANY_NAME = txtCompanyName.Text;
                        CI.TAN_NO = txtTanNo.Text;
                        CI.PAN_NO = txtPanNo.Text;
                        CI.BRANCH_DIV = txtBranch.Text;
                        CI.D_CATEGORY_ID = ddDeductorType.SelectedValue;
                        //rr.TanRegNo = txtTanRegNo.Text;
                        CI.ADDRESS1 = txtFlatNo.Text;
                        CI.ADDRESS2 = txtBuildingName.Text;
                        CI.ADDRESS4 = txtStreet.Text;
                        CI.ADDRESS5 = txtArea.Text;
                        CI.ADDRESS3 = txtTown.Text;
                        CI.PAN_NO = txtPin.Text;
                        CI.STATE_ID = ddState.SelectedValue;
                        CI.STD = txtStd.Text;
                        CI.PAN_NO = txtPhone.Text;
                        //rr.StdAlt = txtAltStd.Text;
                        //rr.PhoneAlt = txtPhoneAlt.Text;
                        CI.EMAIL = txtEmail.Text;
                        //rr.EmailAlt = txtEmailAlt.Text;
                        CI.PERSON_NAME = txtResponsiblePersonName.Text;
                        CI.DESIGNATION = txtDesignation.Text;
                        //rr.RPFathersName = txtFathersName.Text;
                        CI.PERSON_NAME = txtRPMobileNo.Text;
                        CI.ADDRESS1 = txtRPFlatNo.Text;
                        CI.ADDRESS2 = txtRPBuildingName.Text;
                        CI.ADDRESS4 = txtRPStreet.Text;
                        CI.ADDRESS5 = txtRPArea.Text;
                        CI.ADDRESS3 = txtRPTown.Text;
                        CI.P_PIN_CODE = txtRPPin.Text;
                        CI.P_STATE_ID = ddRPState.SelectedValue;
                        CI.P_STD = txtStdRP.Text;
                        //rr.RPStdAlt = txtStdAltRP.Text;
                        CI.P_PHONE = txtRPPhone.Text;
                        //rr.PhoneAlt = txtPhoneAlt.Text;
                        CI.P_EMAIL = txtRPEmail.Text;
                        //rr.RPEmailAlt = txtRPEmailAlt.Text;
                        CI.PAO_CODE = txtPAOCode.Text;
                        CI.PAO_REG_NO = txtPAORegNo.Text;
                        CI.DDO_CODE = txtDDOCode.Text;
                        CI.DDO_REG_NO = txtDDORegNo.Text;
                        CI.D_CATEGORY_ID = ddGovDeductorState.SelectedValue;
                        CI.MINISTRY_ID = ddMinistry.SelectedValue;
                        CI.MINISTRY_OTHER = txtOtherMinistry.Text;
                        //rr.AccountOfficerIDNo = txtAccountOfficerIDNo.Text;
                        //rr.CITAddress = txtCITAddress.Text;
                        //rr.CITCity = txtCITCity.Text;
                        //rr.CITPin = txtCITPin.Text;
                        CI.Save();
                    }
                }
                //rr.Save();
                lblMsg.Text = "Saved!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
            }
            catch
            {
            }
        }
    }


    private void ShowCorrectionSummary(TRN_BASIC_INFO rr)
    {
        if (rr == null) return;
        if (rr.CORRECTION_ID != null)
        {
            bool changeInCompanyDetail = false;
            int changeInExistingChallan = 0;
            int totalNewChallanAdded = 0;
            int totalPanUpdates = 0;
            int changeInExistingDeducteeRecords = 0;
            int totalNewDeducteeAdded = 0;
            int totalCorrections = 0;

            DatabaseCE db = new DatabaseCE();
            try
            {
                string Error = "";
                string sql = "SELECT TanNo, DeductorType, LUDate from RegularReturnCorrection where id=" + rr.CORRECTION_ID + "";
                IDataReader dr = db.GetDataReader(sql, ref Error);
                while (dr.Read())
                {
                    lblTanCorr.Text = dr["TanNo"].ToString();       //TAN No                
                    string dedType = "";
                    Global.DeductorType.TryGetValue(dr["DeductorType"].ToString(), out dedType); //Deductor Type
                    lblDeductorTypeCorr.Text = dedType;
                    lblFileImportedOnCorr.Text = Cmn.ToDate(dr["LUDate"].ToString()).ToString("dd-MMM-yy");  //File Impored On
                }

                string sql1 = "SELECT  COUNT(*) AS Expr1 FROM ChallanCorrection WHERE FormID =" + rr.COMPANY_ID + "";
                lblTotalNoOfChallansCorr.Text = (db.GetCount(sql1, ref Error).ToString());  //Total No of challans

                string sql2 = "SELECT SUM(TotalAmount) AS ChaallanSum FROM ChallanCorrection where formid=" + rr.COMPANY_ID + " GROUP BY TotalAmount";
                dr = db.GetDataReader(sql2, ref Error);
                while (dr.Read())
                    lblTotalChallanAmountCorr.Text = dr["ChaallanSum"].ToString();  //Total Challan Amount

                string sql3 = "SELECT SUM(ChallanDetailCorrection.TaxDeposited) AS SUM, COUNT(*) AS COUNT FROM ChallanDetailCorrection INNER JOIN ChallanCorrection ON ChallanDetailCorrection.ChallanID = ChallanCorrection.ID WHERE  (ChallanCorrection.FormID = " + rr.CORRECTION_ID + ")";
                dr = db.GetDataReader(sql3, ref Error);
                while (dr.Read())
                {
                    lblTotalNoOfDeductionsCorr.Text = dr["COUNT"].ToString();      //Total no of deductions   
                    lblTotlTdsDeductrdCorr.Text = dr["SUM"].ToString();            //Total TDS deducted
                }

                if (GetDiffenceInTowRecords(rr.BASIC_INFO_ID.ToString(), rr.CORRECTION_ID.ToString()))
                {
                    changeInCompanyDetail = true;
                }
                lblChangesInCompany.Text = changeInCompanyDetail == true ? "YES" : "NO";   //changes in company detail 

                totalPanUpdates = GetPanDifferenceCounter(rr.BASIC_INFO_ID.ToString());
                lblNoOfPanUpdatedDeductee.Text = totalPanUpdates.ToString();

                string sql6 = "SELECT * FROM Challan WHERE FormID=" + rr.BASIC_INFO_ID + "";
                dr = db.GetDataReader(sql6, ref Error);
                while (dr.Read())
                {
                    if (dr["Mode"].ToString() == "1")
                    {
                        changeInExistingChallan++;     //Total Changes In Existing Challan
                    }
                    if (dr["Mode"].ToString() == "0")
                    {
                        totalNewChallanAdded++;        //Total No of New Challan Added
                    }
                }

                lblTotalChanges_ExistingChallan.Text = changeInExistingChallan.ToString();
                lblTotalNewChallanAdded.Text = totalNewChallanAdded.ToString();

                string sql7 = "SELECT ChallanDetail.ID, ChallanDetail.ChallanID, ChallanDetail.Mode FROM ChallanDetail INNER JOIN Challan ON ChallanDetail.ChallanID = Challan.ID WHERE (Challan.FormID = 10)";
                dr = db.GetDataReader(sql7, ref Error);
                while (dr.Read())
                {
                    if (dr["Mode"].ToString() == "1")
                    {
                        changeInExistingDeducteeRecords++;  //Total Changes In Deductee Of Existing Challan
                    }
                    if (dr["Mode"].ToString() == "0")
                    {
                        totalNewDeducteeAdded++;        //Total No of Deductees Added in New Challan
                    }
                }
                lblChangesInDeductee_ExistingChallan.Text = changeInExistingDeducteeRecords.ToString();
                lblTotalDeducteeAddedNewChallan.Text = totalNewDeducteeAdded.ToString();

                totalCorrections = (changeInCompanyDetail == true ? 1 : 0) + changeInExistingChallan + totalNewChallanAdded + totalPanUpdates + changeInExistingDeducteeRecords + totalNewDeducteeAdded;
                lblTotalCorrections.Text = totalCorrections.ToString();
            }
            catch { }
            finally
            {
                db.Close();
            }
        }
    }

    private int GetPanDifferenceCounter(string ID1)
    {
        int totalPanModified = 0;
        DatabaseCE db = new DatabaseCE();
        string sql = "SELECT ChallanDetail.ChallanID, ChallanDetail.ID, ChallanDetail.EmployeePan,challandetail.CorrectionID FROM Challan INNER JOIN ChallanDetail ON ChallanDetail.ChallanID = Challan.ID WHERE (Challan.FormID =" + ID1 + ") AND (ChallanDetail.Mode = 1)";
        string Error = "";

        try
        {
            DataSet ds = db.GetDataSet(sql, ref Error);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string correctionid = "";
                foreach (DataColumn dc in ds.Tables[0].Columns)
                {
                    if (dc.ColumnName == "CorrectionID")
                    {
                        correctionid = dr[dc].ToString();
                    }
                }

                IDataReader drOriginal = db.GetDataReader("SELECT EmployeePan FROM ChallanDetailCorrection WHERE id=" + correctionid + "", ref Error);
                while (drOriginal.Read())
                {
                    foreach (DataColumn c in ds.Tables[0].Columns)
                    {
                        if (dr["EmployeePan"].ToString() != drOriginal["EmployeePan"].ToString())
                        {
                            totalPanModified++;
                        }
                    }
                }
            }
            return totalPanModified;
        }
        catch
        {
            return 0;
        }
        finally
        {
            db.Close();
        }
    }

    private bool GetDiffenceInTowRecords(String ID1, String ID2)
    {
        bool _IsModified = false;
        DatabaseCE db = new DatabaseCE();
        string sql = "SELECT * from RegularReturn where id=" + ID1 + "";
        string Error = "";

        try
        {
            DataSet ds = db.GetDataSet(sql, ref Error);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                IDataReader drOriginal = db.GetDataReader("SELECT * from RegularReturnCorrection where id=" + ID2 + "", ref Error);
                while (drOriginal.Read())
                {
                    foreach (DataColumn c in ds.Tables[0].Columns)
                    {
                        // || c.ColumnName == "StdAlt" || c.ColumnName == "PhoneAlt" || c.ColumnName == "EmailAlt" || c.ColumnName == "RPStdAlt" || c.ColumnName == "RPPhoneAlt" || c.ColumnName == "RPEmailAlt"
                        if (c.ColumnName == "ID" || c.ColumnName == "LUDate" || c.ColumnName == "LUBy" || c.ColumnName == "CorrectionID")
                            continue;

                        if (dr[c.ColumnName].ToString() != drOriginal[c.ColumnName].ToString())
                        {
                            _IsModified = true;
                        }
                    }
                }
            }
            return _IsModified;
        }
        catch 
        {
            return _IsModified;
        }
        finally
        {
            db.Close();
        }
    }
}