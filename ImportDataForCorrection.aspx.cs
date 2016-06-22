using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class ImportDataForCorrection : BasePage
{
    int returnId = 0;
    int returnIdCorr = 0;
    int challanId = 0;
    int challanIdCorr = 0;

    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        Title = "Import data for correction";
    }

    protected void btnImport_Click(object sender, EventArgs e)
    {
        if (Global.LogInDone)
            if (FileUpload1.HasFile)
            {
                StreamReader reader = new StreamReader(FileUpload1.FileContent);
                string text = reader.ReadToEnd();
                string[] lines = text.Split(new string[] { "\r\n", "\n" }, StringSplitOptions.None);
                try
                {
                    FileUpload1.SaveAs(Server.MapPath(@"\CorrectionFiles\" + FileUpload1.FileName + ""));
                    foreach (string line in lines)
                    {
                        if (line.Length > 0)
                        {
                            string[] lineData = line.Split('^');
                            string recordType = lineData[1];
                            switch (recordType)
                            {
                                case "BH":
                                    CreateNewReturn(line);
                                    break;
                                case "CD":
                                    SaveChallanDetail(line);
                                    break;
                                case "DD":
                                    SaveDeducteeDetail(line);
                                    break;
                            }
                        }
                    }
                    lblMsg.Text = "Succesfully Imported!";
                    lblMsg.ForeColor = System.Drawing.Color.Green;
                }
                catch 
                {
                    lblMsg.Text = "Error!";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
            }
    }
    protected void CreateNewReturn(string line)
    {
        RegularReturnCorrection RRC = new RegularReturnCorrection();
        string[] lineData = (line).Split('^');

        try
        {
            RRC.FormType = (lineData[4] == "24Q" ? 1 : 2);
            RRC.CompanyID = Global.CompanyID;
            RRC.FinancialYear = Cmn.ToInt(lineData[16].Substring(0, 4));
            int quarter = (int)((Quarter)Enum.Parse(typeof(Quarter), lineData[17]));
            RRC.Quarter = quarter;
            RRC.PrevRegularReturnToken = (lineData[8]);
            RRC.AddressChangedCompany = lineData[30] == "N" ? 0 : 1;
            RRC.AddressChangedRP = lineData[45] == "N" ? 0 : 1;
            //RR.ReciptNo="";
            //RR.DateOfFiling=null;
            RRC.TokenNo = (lineData[7]);
            RRC.CompanyName = lineData[18];
            RRC.TanNo = (lineData[12]);
            RRC.PanNo = lineData[14];
            RRC.Branch = lineData[19];
            RRC.DeductorType = lineData[31];
            //RR.TanRegNo = C.TanRegNo;
            RRC.FlatBlock = lineData[20];
            RRC.Building = lineData[21];
            RRC.Street = lineData[22];
            RRC.Area = lineData[23];
            RRC.Town = lineData[24];
            RRC.Pin = lineData[26];
            RRC.State = Cmn.ToInt(lineData[25]);
            RRC.Std = lineData[28];
            RRC.Phone = lineData[29];
            //RR.StdAlt = C.StdAlt;
            //RR.PhoneAlt = C.PhoneAlt;
            RRC.Email = lineData[27];
            //RR.EmailAlt = C.EmailAlt;
            RRC.RPName = lineData[32];
            RRC.RPDesg = lineData[33];
            //RR.RPFathersName = C.RPFathersName;
            RRC.RPMobile = lineData[47];
            RRC.RPFlatBlock = lineData[34];
            RRC.RPBuilding = lineData[35];
            RRC.RPStreet = lineData[36];
            RRC.RPArea = lineData[37];
            RRC.RPTown = lineData[38];
            RRC.RPPin = lineData[40];
            RRC.RPState = Cmn.ToInt(lineData[39]);
            RRC.RPStd = lineData[43];
            //RR.RPStdAlt = C.RPStdAlt;
            RRC.RPPhone = lineData[44];
            //RR.PhoneAlt = C.PhoneAlt;
            RRC.RPEmail = lineData[41];
            //RR.RPEmailAlt = C.RPEmailAlt;
            RRC.PAOCode = lineData[54];
            RRC.PAORegNo = lineData[59];
            RRC.DDOCode = lineData[55];
            RRC.DDORegNo = lineData[60];
            RRC.GvtDeductorState = Cmn.ToInt(lineData[53]) == 0 ? -1 : Cmn.ToInt(lineData[53]);
            RRC.Ministry = lineData[56] == "" ? "-1" : lineData[56];
            //RR.OtherMinistry = C.OtherMinistry;
            //RR.AccountOfficerIDNo = C.AccountOfficerIDNo;
            //RR.CITAddress = C.CITAddress;
            //RR.CITCity = C.CITCity;
            //RR.CITPin = C.CITPin;
            
            RRC.Save();

            returnIdCorr = RRC.ID;

            //Copy in origional Regular Return
            TRN_BASIC_INFO RR = new TRN_BASIC_INFO();
            RR.FORM_NO = (lineData[4]);
            RR.COMPANY_ID = Global.CompanyID;
            RR.YEAR = Cmn.ToInt(lineData[16].Substring(0, 4));
            RR.QTR = lineData[17];
            RR.PREV_PRN_NO = (lineData[8]);
            RR.ADDRESS_CHANGE = lineData[30] == "N" ? 0 : 1;
            RR.P_ADDRESS_CHANGE = lineData[45] == "N" ? 0 : 1;
            //RR.ReciptNo="";
            //RR.DateOfFiling=null;

            TRN_COMPANY_INFO CI = TRN_COMPANY_INFO.GetByBasicInfoID(RR.BASIC_INFO_ID);
            if(CI!=null)
            {
            RR.PRN_NO = (lineData[7]);
            CI.COMPANY_NAME = lineData[18];
            CI.TAN_NO = (lineData[12]);
            CI.PAN_NO = lineData[14];
            CI.BRANCH_DIV = lineData[19];
            CI.D_CATEGORY_ID = lineData[31];
            //CI.TanRegNo = C.TanRegNo;
            CI.ADDRESS1 = lineData[20];
            CI.ADDRESS2 = lineData[21];
            CI.ADDRESS3 = lineData[22];
            CI.ADDRESS4 = lineData[23];
            CI.ADDRESS5 = lineData[24];
            CI.PIN_CODE = lineData[26];
            CI.STATE_ID = lineData[25];
            CI.STD= lineData[28];
            CI.PHONE = lineData[29];
            //CI.StdAlt = C.StdAlt;
            //CI.PhoneAlt = C.PhoneAlt;
            CI.EMAIL = lineData[27];
            //CI.EmailAlt = C.EmailAlt;
            CI.PERSON_NAME = lineData[32];
            CI.DESIGNATION = lineData[33];
            //CI.RPFathersName = C.RPFathersName;
            CI.P_MOBILE = lineData[47];
            CI.P_ADDRESS1 = lineData[34];
            CI.P_ADDRESS2 = lineData[35];
            CI.P_ADDRESS3 = lineData[36];
            CI.P_ADDRESS4 = lineData[37];
            CI.P_ADDRESS5 = lineData[38];
            CI.PIN_CODE = lineData[40];
            CI.P_STATE_ID = lineData[39];
            CI.P_STD = lineData[43];
            //CI.RPStdAlt = C.RPStdAlt;
            CI.P_PHONE = lineData[44];
            //CI.PhoneAlt = C.PhoneAlt;
            CI.P_EMAIL = lineData[41];
            //CI.RPEmailAlt = C.RPEmailAlt;
            CI.PAO_CODE = lineData[54];
            CI.PAO_REG_NO = lineData[59];
            CI.DDO_CODE = lineData[55];
            CI.DDO_REG_NO = lineData[60];
            CI.D_STATE_ID = lineData[53];
            CI.MINISTRY_ID = lineData[56];
            //CI.OtherMinistry = C.OtherMinistry;
            //CI.AccountOfficerIDNo = C.AccountOfficerIDNo;
            //CI.CITAddress = C.CITAddress;
            //CI.CITCity = C.CITCity;
            //CI.CITPin = C.CITPin;
            //CI.IsCorrection = 1;
            CI.COMPANY_ID = RRC.ID;
            RR.Save();
            }

            returnId = RR.BASIC_INFO_ID;

        }
        catch { }
    }
    private void SaveChallanDetail(string line)
    {
        if (returnId != 0)
        {
            
            string[] clnData = (line).Split('^');
            try
            {
                ChallanCorrection clnCorr = new ChallanCorrection();
                clnCorr.CompanyID = Global.CompanyID;
                clnCorr.FormID = returnIdCorr;
                RegularReturnCorrection rr = RegularReturnCorrection.GetByID(returnIdCorr);
                clnCorr.Quarter = rr.Quarter;
                clnCorr.Year = rr.FinancialYear;
                clnCorr.Date = new DateTime(Cmn.ToInt(clnData[17].Substring(4, 4)), Cmn.ToInt(clnData[17].Substring(2, 2)), Cmn.ToInt(clnData[17].Substring(0, 2))); //Cmn.ToDate(clnData[17]);
                clnCorr.BSRNo = clnData[15];
                clnCorr.ChallanNo = clnData[11];
                clnCorr.TDS = Cmn.ToDbl(clnData[21]);
                clnCorr.Surcharge = Cmn.ToDbl(clnData[22]);
                clnCorr.EducationCess = Cmn.ToDbl(clnData[23]);
                clnCorr.Intrest = Cmn.ToDbl(clnData[24]);
                clnCorr.Fee = 0;
                clnCorr.Others = Cmn.ToDbl(clnData[25]); 
                clnCorr.TotalAmount = Cmn.ToDbl(clnData[26]);
                clnCorr.MinorHead = Cmn.ToInt(clnData[40]);
                clnCorr.IntrestAlloc = Cmn.ToDbl(clnData[33]);
                clnCorr.OtherAlloc = Cmn.ToDbl(clnData[34]);

                clnCorr.NSDLStatus = clnData[8];
                clnCorr.Remarks = "";
                clnCorr.Save();

                challanIdCorr = clnCorr.ID;


                TRN_CHALLAN cln = new TRN_CHALLAN();   //Copy in Origional Challan
                cln.COMPANY_ID = Global.CompanyID;
                cln.BASIC_INFO_ID = returnId;
                //cln.QTR = rr.Quarter;
                cln.YEAR = rr.FinancialYear;
                cln.DEPOSIT_DATE = new DateTime(Cmn.ToInt(clnData[17].Substring(4, 4)), Cmn.ToInt(clnData[17].Substring(2, 2)), Cmn.ToInt(clnData[17].Substring(0, 2))); //Cmn.ToDate(clnData[17]);
                cln.BSR_CODE = clnData[15];
                cln.CHALLAN_NO = clnData[11];
                cln.TDS = Cmn.ToDbl(clnData[21]);
                cln.SURCHARGE = Cmn.ToDbl(clnData[22]);
                cln.EDUCATION_CESS = Cmn.ToDbl(clnData[23]);
                cln.INTEREST = Cmn.ToDbl(clnData[24]);
                cln.LATE_FEE = 0;
                cln.OTHERS= Cmn.ToDbl(clnData[25]); ;
                cln.TOT_TAX = Cmn.ToDbl(clnData[26]);
                cln.MINOR_HEAD_ID = clnData[40];
                cln.INTEREST_ALLOCATE = Cmn.ToDbl(clnData[33]);
                cln.OTHERS_ALLOCATED_ = Cmn.ToDbl(clnData[34]);
                cln.NSDL_STATUS = clnData[8];
                cln.REMARKS = "";
                cln.CORRECTION_ID = clnCorr.ID;
                cln.Save();

                challanId = cln.CHALLAN_ID;
            }
            catch
            {
            }
        }
    }

    private void SaveDeducteeDetail(string line)
    {
        if (challanId != 0)
        {
            
            string[] chdData = (line).Split('^');

            try
            {
                RegularReturnCorrection rr = RegularReturnCorrection.GetByID(returnIdCorr);
                if (rr.FormType == 1)
                {
                    ChallanDetailCorrection chdCorr = new ChallanDetailCorrection();
                    string empPan = chdData[9];
                    MST_EMPLOYEE E =MST_EMPLOYEE.GetByPan(empPan);
                    chdCorr.EmployeeID = E.EMPLOYEE_ID;
                    chdCorr.ChallanID = challanIdCorr;
                    chdCorr.EmployeeName = chdData[12];
                    chdCorr.EmployeePan = chdData[9];
                    //chd.Section = ;
                    chdCorr.Date = new DateTime(Cmn.ToInt(chdData[22].Substring(4, 4)), Cmn.ToInt(chdData[22].Substring(2, 2)), Cmn.ToInt(chdData[22].Substring(0, 2)));
                    chdCorr.PaymentAmount = Cmn.ToDbl(chdData[21]);
                    chdCorr.Tax = Cmn.ToDbl(chdData[13]);
                    chdCorr.SurCharge = Cmn.ToDbl(chdData[14]);
                    chdCorr.Cess = Cmn.ToDbl(chdData[15]);
                    chdCorr.Total = Cmn.ToDbl(chdData[16]); //Cmn.ToDbl(txtTotal.Text);
                    chdCorr.TaxDeposited = Cmn.ToDbl(chdData[18]);
                    chdCorr.Remarks = "";
                    //chd.CertificateNo = "";
                    chdCorr.Save();

                    TRN_DEDUCTEE_DETAILS chd = new TRN_DEDUCTEE_DETAILS();    //Copy in challan Detail
                    chd.DEDUCTEE_ID = E.EMPLOYEE_ID;
                    chd.CHALLAN_ID = challanId;
                    chd.DEDUCTEE_NAME = chdData[12];
                    chd.DEDUCTEE_PAN = chdData[9];
                    //chd.Section = ;
                    chd.DEDUCTED_DATE = new DateTime(Cmn.ToInt(chdData[22].Substring(4, 4)), Cmn.ToInt(chdData[22].Substring(2, 2)), Cmn.ToInt(chdData[22].Substring(0, 2)));
                    chd.PAYMENT_AMOUNT = Cmn.ToDbl(chdData[21]);
                    chd.TAX_AMOUNT= Cmn.ToDbl(chdData[13]);
                    chd.SURCHARGE_AMOUNT = Cmn.ToDbl(chdData[14]);
                    chd.CESS_AMOUNT = Cmn.ToDbl(chdData[15]);
                    chd.TOTAL_AMOUNT = Cmn.ToDbl(chdData[16]); //Cmn.ToDbl(txtTotal.Text);
                    chd.TAX_DEPOSITED_AMOUNT = Cmn.ToDbl(chdData[18]);
                    chd.REASON_ID = "";
                    //chd.CertificateNo = "";
                    chd.CORRECTIONID = chdCorr.ID;
                    chd.Save();
               }

                else if (rr.FormType == 2)
                {
                    ChallanDetailCorrection chdCorr = new ChallanDetailCorrection();
                    string dedPan = chdData[9];
                    MST_DEDUCTEE D = MST_DEDUCTEE.GetByPan(dedPan);
                    chdCorr.ChallanID = challanIdCorr;
                    chdCorr.EmployeeID = D.DEDUCTEE_ID;
                    chdCorr.EmployeeName = chdData[12];
                    chdCorr.EmployeePan = chdData[9];
                    if (chdData[33] != "")
                        chdCorr.Section = "19" + chdData[33];
                    chdCorr.Date = new DateTime(Cmn.ToInt(chdData[22].Substring(4, 4)), Cmn.ToInt(chdData[22].Substring(2, 2)), Cmn.ToInt(chdData[22].Substring(0, 2)));
                    chdCorr.PaymentAmount = Cmn.ToDbl(chdData[21]);
                    chdCorr.Tax = Cmn.ToDbl(chdData[13]);
                    chdCorr.SurCharge = Cmn.ToDbl(chdData[14]);
                    chdCorr.Cess = Cmn.ToDbl(chdData[15]);
                    chdCorr.Total = Cmn.ToDbl(chdData[16]); //Cmn.ToDbl(txtTotal.Text);
                    chdCorr.TaxDeposited = Cmn.ToDbl(chdData[18]);
                    chdCorr.Remarks = "0";
                    //chd.CertificateNo = "";
                    chdCorr.Save();

                    TRN_DEDUCTEE_DETAILS chd = new TRN_DEDUCTEE_DETAILS();  //Copy in challan Detail
                    chd.CHALLAN_ID = challanId;
                    chd.DEDUCTEE_ID = D.DEDUCTEE_ID;
                    chd.DEDUCTEE_NAME = chdData[12];
                    chd.DEDUCTEE_PAN = chdData[9];
                    if (chdData[33] != "")
                        chd.SECTION_ID = "19" + chdData[33];
                    chd.DEDUCTED_DATE = new DateTime(Cmn.ToInt(chdData[22].Substring(4, 4)), Cmn.ToInt(chdData[22].Substring(2, 2)), Cmn.ToInt(chdData[22].Substring(0, 2)));
                    chd.PAYMENT_AMOUNT = Cmn.ToDbl(chdData[21]);
                    chd.TAX_AMOUNT = Cmn.ToDbl(chdData[13]);
                    chd.SURCHARGE_AMOUNT = Cmn.ToDbl(chdData[14]);
                    chd.CESS_AMOUNT = Cmn.ToDbl(chdData[15]);
                    chd.TOTAL_AMOUNT = Cmn.ToDbl(chdData[16]); //Cmn.ToDbl(txtTotal.Text);
                    chd.TAX_DEPOSITED_AMOUNT = Cmn.ToDbl(chdData[18]);
                    chd.REASON_ID = "";
                    //chd.CertificateNo = "";
                    chd.CORRECTIONID = chdCorr.ID;
                    chd.Save();
                }
            }
            catch { }
        }
    }
}