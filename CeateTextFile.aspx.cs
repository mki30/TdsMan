using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using TDSModel;
public partial class CeateTextFile : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        
        int CompanyID = QueryString("companyid") == null ? 1 : Cmn.ToInt(QueryStringInt("companyid"));
        int FinancialYear = QueryString("financialyear") == null ? 2015 : Cmn.ToInt(QueryStringInt("financialyear"));
        int Quarter = QueryString("quarter") == null ? 1 : Cmn.ToInt(QueryStringInt("quarter"));
        int formID = QueryString("formid") == null ? 1 : Cmn.ToInt(QueryStringInt("formid"));
    }

    protected void btn24Q_Click(object sender, EventArgs e)
    {
        string FormType = "24Q";
        int CompanyID = 3;
        int FinancialYear = 2010;
        string Quarter = "Q3";
        int formID = 3;//regular return type id

        StringBuilder str = new StringBuilder();
        MST_COMPANY comp = MST_COMPANY.GetByID(CompanyID);
        List<TRN_CHALLAN> challanlist = TRN_CHALLAN.GetByFormID(formID);
        float TotalDepositSum = 0.0f;
        int salaryDetailsRecordCount = 0;
        foreach (TRN_CHALLAN ch in challanlist)
        {
            TotalDepositSum += (float)ch.TOT_TAX;
            List<TRN_DEDUCTEE_DETAILS> chdetailist = TRN_DEDUCTEE_DETAILS.GetByChallanID(ch.CHALLAN_ID);
            foreach (TRN_DEDUCTEE_DETAILS cd in chdetailist)
            {
                salaryDetailsRecordCount++;
            }
        }
        int ctr = 1;
        if (comp != null)
        {
            //TDS Statement for Salary category (File Header Record)
            str.Append(ctr //1 
                + "^FH"  //2
                + "^SL1" //3
                + "^R" //4
                + "^" + DateTime.Now.ToString("ddMMyyyy") //5
                + "^1" //6
                + "^D" //7
                + "^" + comp.TAN_NO //8
                + "^1" //9
                + "^NSDLRPU2.4" //10
                + "^" //11
                + "^" //12
                + "^" //13
                + "^" //14
                + "^" //15
                + "^" //16
                + "^" //17
                + "^" //18
               );
            str.Append(Environment.NewLine);

            TRN_BASIC_INFO rr = TRN_BASIC_INFO.GetByFormYearQuarterCompany(FormType, FinancialYear, Quarter, CompanyID)[0];

            //TDS Statement for Salary category (Batch Header Record)
            str.Append((++ctr) //1 
               + "^BH"  //2
               + "^1" //3
               + "^" + challanlist.Count //4
               + "^24Q"//5
               + "^" //6
               + "^" //7
               + "^"//8
               + "^" //9
               + "^" //10
               + "^" //11
               + "^" //12
               + "^" + comp.TAN_NO //13
               + "^" //14
               + "^" + comp.PAN_NO //15
               + "^" + (((rr.YEAR + 1).ToString()) + ((rr.YEAR + 2).ToString().Substring(2, 2)))//16  //2011-12
               + "^" + ((rr.YEAR).ToString() + ((rr.YEAR + 1).ToString()).Substring(2, 2))//17    //2010-11
               + "^" + rr.QTR //18
               + "^" + comp.COMPANY_NAME //19
               + "^" + comp.BRANCH_DIV//20
               + "^" + comp.ADDRESS1//21
               + "^" + comp.ADDRESS2//22
               + "^" + comp.ADDRESS3//23
               + "^" + comp.ADDRESS4//24
               + "^" + comp.ADDRESS5//25
               + "^" + comp.STATE_ID//26
               + "^" + comp.PIN_CODE//27
               + "^" + comp.EMAIL//28
               + "^" + comp.STD//29-phone std
               + "^" + comp.PHONE//30
               + "^" + (rr.ADDRESS_CHANGE == 1 ? "Y" : "N")//31
               + "^" + comp.D_CATEGORY_ID//32
               + "^" + comp.PERSON_NAME//33
               + "^" + comp.DESIGNATION//34
               + "^" + comp.P_ADDRESS1//35
               + "^" + comp.P_ADDRESS2//36
               + "^" + comp.P_ADDRESS3//37
               + "^" + comp.P_ADDRESS4///38
               + "^" + comp.P_ADDRESS5//39
               + "^" + comp.P_STATE_ID//40
               + "^" + comp.P_PIN_CODE//41
               + "^"// + comp.RPEmail//42
               + "^" + comp.P_MOBILE//43
               + "^" + comp.P_STD//44
               + "^" + comp.P_PHONE//45
               + "^" + (rr.P_ADDRESS_CHANGE == 1 ? "Y" : "N")
               + "^" + TotalDepositSum.ToString("0.00")//47*
               + "^"//48
               + "^0"// + salaryDetailsRecordCount//49*
               + "^0.00"//50*
               + "^N"//51
               + "^"//+ (rr.PrevRegularReturnToken != "" ? "Y" : "N")//52
               + "^"//53
               + "^"//54
               + "^"//55
               + "^"//56
               + "^"//57
               + "^"//58
               + "^"//59
               + "^"//60
               + "^"//61
               + "^"//62
               + "^"//63
               + "^"//64
               + "^"//65
               + "^"//66
               + "^"//67
               + "^"// + comp.AccountOfficerIDNo//68
               + "^"//69
               );
            str.Append(Environment.NewLine);
        }

        //List<Challan> challanlist = Challan.GetByFormID(formID);

        int chalanctr = 0;
        foreach (TRN_CHALLAN ch in challanlist)
        {
            //List<Deductee> d = Deductee.GetList(CompanyID);
            List<TRN_DEDUCTEE_DETAILS> chdetailist = TRN_DEDUCTEE_DETAILS.GetByChallanID(ch.CHALLAN_ID);

            double TotalTaxDeposited = 0.0d;
            double TotalTDS = 0.0d;
            double TotalSurcharge = 0.0d;
            double TotalCess = 0.0d;
            double TotalSum = 0.0d;
            foreach (TRN_DEDUCTEE_DETAILS cd in chdetailist)
            {
                TotalTaxDeposited += (double)cd.TAX_DEPOSITED_AMOUNT;
                TotalTDS += (double)cd.TAX_AMOUNT;
                TotalSurcharge += (double)cd.SURCHARGE_AMOUNT;
                TotalCess += (double)cd.CESS_AMOUNT;
                TotalSum += (double)cd.TOTAL_AMOUNT;
            }

            //TDS Statement for Salary category (Challan / Transfer Voucher Detail Record)
            str.Append((++ctr) //1 
              + "^CD"  //2
              + "^1" //3
              + "^" + (++chalanctr) //4
              + "^" + chdetailist.Count //5   
              + "^N" //6 
              + "^" //7
              + "^" //8
              + "^" //9
              + "^" //10
              + "^" //11
              + "^" + ch.CHALLAN_NO //12
              + "^" //13
              + "^" //14   
              + "^" //15
              + "^" + ch.BSR_CODE //16
              + "^" //17
              + "^" + Cmn.ToDate(ch.DEPOSIT_DATE).ToString("ddMMyyyy")  //18  
              + "^" //19
              + "^" //20 
              + "^" //21 * 
              + "^" + Cmn.ToDbl(ch.TDS).ToString("0.00") //22 
              + "^" + Cmn.ToDbl(ch.SURCHARGE).ToString("0.00") //23
              + "^" + Cmn.ToDbl(ch.EDUCATION_CESS).ToString("0.00") //24 
              + "^" + Cmn.ToDbl(ch.INTEREST).ToString("0.00") //25 
              + "^" + Cmn.ToDbl(ch.OTHERS).ToString("0.00") //26 
              + "^" + Cmn.ToDbl(ch.TOT_TAX).ToString("0.00") //27
              + "^" //28 
              + "^" + Cmn.ToDbl(TotalTaxDeposited).ToString("0.00")//29  
              + "^" + Cmn.ToDbl(TotalTDS).ToString("0.00")//30 
              + "^" + Cmn.ToDbl(TotalSurcharge).ToString("0.00")//31 
              + "^" + Cmn.ToDbl(TotalCess).ToString("0.00")//32 
              + "^" + Cmn.ToDbl(TotalSum).ToString("0.00")//33 
              + "^" //+ Cmn.ToDbl(ch.Intrest).ToString("0.00") //34 
              + "^" //+ Cmn.ToDbl(ch.Others).ToString("0.00")  //35 
              + "^" //36-DD CHEQUE NO OF CHALLAN
              + "^N" //37 
              + "^" //38 
              + "^" //39
                //+ "^" //40 
                //+ "^" //41 
             );
            str.Append(Environment.NewLine);


            //TDS Statement for Salary category (Deductee Detail Record)

            int chdctr = 0;
            foreach (TRN_DEDUCTEE_DETAILS cd in chdetailist)
            {
                MST_EMPLOYEE E = MST_EMPLOYEE.GetByID(Cmn.ToInt(cd.DEDUCTEE_ID));

                str.Append((++ctr) //1 
                  + "^DD"  //2
                  + "^1" //3
                  + "^" + (chalanctr) //4
                  + "^" + (++chdctr)
                  + "^O"//6
                  + "^" + E.EMPLOYEE_REF //7 *
                  + "^"//8
                  + "^" //9
                  + "^" + cd.DEDUCTEE_PAN //10
                  + "^" //11
                  + "^" //12
                  + "^" + cd.DEDUCTEE_NAME //13
                  + "^" + Cmn.ToDbl(cd.TAX_AMOUNT).ToString("0.00")//14
                  + "^" + Cmn.ToDbl(cd.SURCHARGE_AMOUNT).ToString("0.00") //15
                  + "^" + Cmn.ToDbl(cd.CESS_AMOUNT).ToString("0.00") //16
                  + "^" + Cmn.ToDbl(cd.TOTAL_AMOUNT).ToString("0.00") //17
                  + "^" //18
                  + "^" + Cmn.ToDbl(cd.TAX_DEPOSITED_AMOUNT).ToString("0.00") //19
                  + "^" //20
                  + "^" //21
                  + "^" + Cmn.ToDbl(cd.PAYMENT_AMOUNT).ToString("0.00") //22
                  + "^" + Cmn.ToDate(cd.DEDUCTED_DATE).ToString("ddMMyyyy") //23
                  + "^" + Cmn.ToDate(cd.DEDUCTED_DATE).ToString("ddMMyyyy")//24
                  + "^" + Cmn.ToDate(ch.DEPOSIT_DATE).ToString("ddMMyyyy") //25
                  + "^" //26
                  + "^" //27
                  + "^" //28
                  + "^" //29
                  + "^" + cd.REASON_ID //30
                  + "^" //31
                  + "^" //32
                  + "^" //33
                    //+ "^" //34
                    //+ "^" //35
                    //+ "^" //36
                    //+ "^" //37
                    //+ "^" //38
                    //+ "^" //39
                 );
                str.Append(Environment.NewLine);
            }

        }
        System.IO.File.WriteAllText(Server.MapPath(@"~\text.txt"), str.ToString());
    }

    protected void btn24QLastQuarter_Click(object sender, EventArgs e)
    {
        string FormType = "24Q";//24Q or 26Q
        int CompanyID = 1;
        int FinancialYear = 2014;
        string Quarter = "Q4";
        int formID = 4; //regular return type id

        StringBuilder str = new StringBuilder();
        MST_COMPANY comp = MST_COMPANY.GetByID(CompanyID);
        List<TRN_CHALLAN> challanlist = TRN_CHALLAN.GetByFormID(formID);
        float TotalDepositSum = 0.0f;
        int salaryDetailsRecordCount = 0;
        foreach (TRN_CHALLAN ch in challanlist)
        {
            TotalDepositSum += (float)ch.TOT_TAX;
            List<TRN_DEDUCTEE_DETAILS> chdetailist = TRN_DEDUCTEE_DETAILS.GetByChallanID(ch.CHALLAN_ID);
            foreach (TRN_DEDUCTEE_DETAILS cd in chdetailist)
            {
                salaryDetailsRecordCount++;
            }
        }
        int ctr = 1;
        if (comp != null)
        {
            //TDS Statement for Salary category (File Header Record)
            str.Append(ctr //1 
                + "^FH"  //2
                + "^SL1" //3
                + "^R" //4
                + "^" + DateTime.Now.ToString("ddMMyyyy") //5
                + "^1" //6
                + "^D" //7
                + "^" + comp.TAN_NO //8
                + "^1" //9
                + "^NSDLRPU2.4" //10
                + "^" //11
                + "^" //12
                + "^" //13
                + "^" //14
                + "^" //15
                + "^" //16
                + "^" //17
                + "^" //18
               );
            str.Append(Environment.NewLine);

            List<TRN_BASIC_INFO> RR = TRN_BASIC_INFO.GetByFormYearQuarterCompany(FormType, FinancialYear, Quarter, CompanyID);
            if (RR.Count == 0) return;
            TRN_BASIC_INFO rr = RR[0];// RegularReturn.GetByFormYearQuarterCompany(FormTypeId, FinancialYear, Quarter, CompanyID)[0];

            //TDS Statement for Salary category (Batch Header Record)
            str.Append((++ctr) //1 
               + "^BH"  //2
               + "^1" //3
               + "^" + challanlist.Count //4
               + "^24Q"//5
               + "^" //6
               + "^" //7
               + "^"//8
               + "^" //9
               + "^" //10
               + "^" //11
               + "^" //12
               + "^" + comp.TAN_NO //13
               + "^" //14
               + "^" + comp.PAN_NO //15
               + "^" + (((rr.YEAR + 1).ToString()) + ((rr.YEAR + 2).ToString().Substring(2, 2)))//16  //2011-12
               + "^" + ((rr.YEAR).ToString() + ((rr.YEAR + 1).ToString()).Substring(2, 2))//17    //2010-11
               + "^" + rr.QTR //18
               + "^" + comp.COMPANY_NAME //19
               + "^" + comp.BRANCH_DIV//20
               + "^" + comp.ADDRESS1//21
               + "^" + comp.ADDRESS3//22
               + "^" + comp.ADDRESS3//23
               + "^" + comp.ADDRESS4//24
               + "^" + comp.ADDRESS5//25
               + "^" + comp.STATE_ID//26
               + "^" + comp.PIN_CODE//27
               + "^" + comp.EMAIL//28
               + "^" + comp.STD//29-phone std
               + "^" + comp.PHONE//30
               + "^" + (rr.ADDRESS_CHANGE == 1 ? "Y" : "N")//31
               + "^" + comp.D_CATEGORY_ID//32
               + "^" + comp.PERSON_NAME//33
               + "^" + comp.DESIGNATION//34
               + "^" + comp.P_ADDRESS1//35
               + "^" + comp.P_ADDRESS2//36
               + "^" + comp.P_ADDRESS3//37
               + "^" + comp.P_ADDRESS4///38
               + "^" + comp.P_ADDRESS5//39
               + "^" + comp.P_STATE_ID//40
               + "^" + comp.P_PIN_CODE//41
               + "^"// + comp.RPEmail//42
               + "^" + comp.P_MOBILE//43
               + "^" + comp.P_STD//44
               + "^" + comp.P_PHONE//45
               + "^" + (rr.P_ADDRESS_CHANGE == 1 ? "Y" : "N")
               + "^" + TotalDepositSum.ToString("0.00")//47*
               + "^"//48
               + "^0"// + salaryDetailsRecordCount//49*
               + "^0.00"//50*
               + "^N"//51
               + "^"//+ (rr.PrevRegularReturnToken != "" ? "Y" : "N")//52
               + "^"//53
               + "^"//54
               + "^"//55
               + "^"//56
               + "^"//57
               + "^"//58
               + "^"//59
               + "^"//60
               + "^"//61
               + "^"//62
               + "^"//63
               + "^"//64
               + "^"//65
               + "^"//66
               + "^"//67
               + "^"// + comp.AccountOfficerIDNo//68
               + "^"//69
               );
            str.Append(Environment.NewLine);
        }

        int chalanctr = 0;
        foreach (TRN_CHALLAN ch in challanlist)
        {

            //List<Deductee> d = Deductee.GetList(CompanyID);
            List<TRN_DEDUCTEE_DETAILS> chdetailist = TRN_DEDUCTEE_DETAILS.GetByChallanID(ch.CHALLAN_ID);

            double TotalTaxDeposited = 0.0d;
            double TotalTDS = 0.0d;
            double TotalSurcharge = 0.0d;
            double TotalCess = 0.0d;
            double TotalSum = 0.0d;
            foreach (TRN_DEDUCTEE_DETAILS cd in chdetailist)
            {
                TotalTaxDeposited += (double)cd.TAX_DEPOSITED_AMOUNT;
                TotalTDS += (double)cd.TAX_AMOUNT;
                TotalSurcharge += (double)cd.SURCHARGE_AMOUNT;
                TotalCess += (double)cd.CESS_AMOUNT;
                TotalSum += (double)cd.TOTAL_AMOUNT;
            }

            //TDS Statement for Salary category (Challan / Transfer Voucher Detail Record)
            str.Append((++ctr) //1 
              + "^CD"  //2
              + "^1" //3
              + "^" + (++chalanctr) //4
              + "^" + chdetailist.Count //5   
              + "^N" //6 
              + "^" //7
              + "^" //8
              + "^" //9
              + "^" //10
              + "^" //11
              + "^" + ch.CHALLAN_NO //12
              + "^" //13
              + "^" //14   
              + "^" //15
              + "^" + ch.BSR_CODE //16
              + "^" //17
              + "^" + Cmn.ToDate(ch.DEPOSIT_DATE).ToString("ddMMyyyy")  //18  
              + "^" //19
              + "^" //20 
              + "^" //21 * 
              + "^" + Cmn.ToDbl(ch.TDS).ToString("0.00") //22 
              + "^" + Cmn.ToDbl(ch.SURCHARGE).ToString("0.00") //23
              + "^" + Cmn.ToDbl(ch.EDUCATION_CESS).ToString("0.00") //24 
              + "^" + Cmn.ToDbl(ch.INTEREST).ToString("0.00") //25 
              + "^" + Cmn.ToDbl(ch.OTHERS).ToString("0.00") //26 
              + "^" + Cmn.ToDbl(ch.TOT_TAX).ToString("0.00") //27
              + "^" //28 
              + "^" + Cmn.ToDbl(TotalTaxDeposited).ToString("0.00")//29  
              + "^" + Cmn.ToDbl(TotalTDS).ToString("0.00")//30 
              + "^" + Cmn.ToDbl(TotalSurcharge).ToString("0.00")//31 
              + "^" + Cmn.ToDbl(TotalCess).ToString("0.00")//32 
              + "^" + Cmn.ToDbl(TotalSum).ToString("0.00")//33 
              + "^" //+ Cmn.ToDbl(ch.Intrest).ToString("0.00") //34 
              + "^" //+ Cmn.ToDbl(ch.Others).ToString("0.00")  //35 
              + "^" //36-DD CHEQUE NO OF CHALLAN
              + "^N" //37 
              + "^" //38 
              + "^" //39
                //+ "^" //40 
                //+ "^" //41 
             );
            str.Append(Environment.NewLine);

            //TDS Statement for Salary category (Deductee Detail Record)

            int chdctr = 0;
            foreach (TRN_DEDUCTEE_DETAILS cd in chdetailist)
            {
                MST_EMPLOYEE E = MST_EMPLOYEE.GetByID(Cmn.ToInt(cd.DEDUCTEE_ID));

                str.Append((++ctr) //1 
                  + "^DD"  //2
                  + "^1" //3
                  + "^" + (chalanctr) //4
                  + "^" + (++chdctr)
                  + "^O"//6
                  + "^" + E.EMPLOYEE_REF //7 *
                  + "^"//8
                  + "^" //9
                  + "^" + cd.DEDUCTEE_PAN //10
                  + "^" //11
                  + "^" //12
                  + "^" + cd.DEDUCTEE_NAME //13
                  + "^" + Cmn.ToDbl(cd.TAX_AMOUNT).ToString("0.00")//14
                  + "^" + Cmn.ToDbl(cd.SURCHARGE_AMOUNT).ToString("0.00") //15
                  + "^" + Cmn.ToDbl(cd.CESS_AMOUNT).ToString("0.00") //16
                  + "^" + Cmn.ToDbl(cd.TOTAL_AMOUNT).ToString("0.00") //17
                  + "^" //18
                  + "^" + Cmn.ToDbl(cd.TAX_DEPOSITED_AMOUNT).ToString("0.00") //19
                  + "^" //20
                  + "^" //21
                  + "^" + Cmn.ToDbl(cd.PAYMENT_AMOUNT).ToString("0.00") //22
                  + "^" + Cmn.ToDate(cd.DEDUCTED_DATE).ToString("ddMMyyyy") //23
                  + "^" + Cmn.ToDate(cd.DEDUCTED_DATE).ToString("ddMMyyyy")//24
                  + "^" + Cmn.ToDate(ch.DEPOSIT_DATE).ToString("ddMMyyyy") //25
                  + "^" //26
                  + "^" //27
                  + "^" //28
                  + "^" //29
                  + "^" + cd.REASON_ID //30
                  + "^" //31
                  + "^" //32
                  + "^" //33
                    //+ "^" //34
                    //+ "^" //35
                    //+ "^" //36
                    //+ "^" //37
                    //+ "^" //38
                    //+ "^" //39
                 );
                str.Append(Environment.NewLine);
            }

            int sdcounter = 1;
            int noOfsdRecords = 0;
            List<TRN_SALARY_DETAILS> SD =TRN_SALARY_DETAILS.GetByFormID(formID);
            noOfsdRecords = SD.Count;
            foreach (TRN_SALARY_DETAILS sd in SD)
            {
                //RegularReturn rr = RegularReturn.GetByID(Cmn.ToInt(sd.FormID));
                MST_EMPLOYEE E = MST_EMPLOYEE.GetByID(Cmn.ToInt(sd.EMPLOYEE_ID));

                str.Append((++ctr) //1 
                  + "^SD" //2
                  + "^1" //3
                  + "^" + (++sdcounter) //4
                  + "^A" //5
                  + "^" //6
                  + "^" + E.EMPLOYEE_PAN  //7 
                  + "^" //8
                  + "^" + E.EMPLOYEE_PAN //9
                  + "^" + E.CATEGORY //10
                  + "^" + Cmn.ToDate(sd.FROM_DATE).ToString("ddMMyyyy")//11
                  + "^" + Cmn.ToDate(sd.TO_DATE).ToString("ddMMyyyy")//12
                  + "^" +Cmn.ToDbl(sd.TOTAL_INCOME+sd.BalancePriviousEmployer).ToString("0.00")//13*
                  + "^" //14
                  + "^" + noOfsdRecords //15
                  + "^"  //16*
                  + "^" +Cmn.ToDbl(sd.INCOME_CHARGEABLE).ToString("0.00")//17
                  + "^" +Cmn.ToDbl(sd.AIS_Total).ToString("0.00")//18
                  + "^" +Cmn.ToDbl(sd.GROSS_TOTAL_INCOME).ToString("0.00")//19
                  + "^" //20
                  + "^" //21*
                  + "^" //22*
                  + "^" +Cmn.ToDbl(sd.TOTAL_INCOME).ToString("0.00")//23
                  + "^" +Cmn.ToDbl(sd.TAX_PAYABLE).ToString("0.00")//24
                  + "^" +Cmn.ToDbl(sd.SCHG_TOTAL_INCOME).ToString("0.00") //25
                  + "^" +Cmn.ToDbl(sd.ECESS_TOTAL_INCOME).ToString("0.00") //26
                  + "^" +Cmn.ToDbl(sd.US_89_LESS).ToString("0.00")//27
                  + "^" +Cmn.ToDbl(sd.TAX_PAYABLE - sd.US_89_LESS)//28
                  + "^" +Cmn.ToDbl(sd.BrkUpTdsCurrentEmployer+sd.BrkUpTdsPevEmployer).ToString("0.00")//29
                  + "^" +Cmn.ToDbl(sd.SHORTFALL_TAX).ToString("0.00")//30
                  + "^" //31
                  + "^" //32
                  + "^" //33
                  + "^" //34
                  + "^" //35
                  + "^" //36
                  + "^" //37
                  + "^" //38
                  + "^" //39
                 );
                str.Append(Environment.NewLine);
            }

        }
        System.IO.File.WriteAllText(Server.MapPath(@"~\text2.txt"), str.ToString());
      }
}