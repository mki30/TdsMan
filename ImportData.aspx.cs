using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;

public partial class ImportData : BasePage
{
    int comp_Id = -1;
    int rra_Copm_Id = -1;

    protected new void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnImport_Click(object sender, EventArgs e)
    {
        if (Global.LicenseID == -1)
        {
            Response.Redirect("/Login.aspx");
        }
        
        if (FileUpload1.HasFile)
        {
            string FileName = (Server.MapPath(FileUpload1.FileName));
            
            if (!Directory.Exists(Server.MapPath("TempData")))
                Directory.CreateDirectory(Server.MapPath("TempData"));
            FileUpload1.SaveAs(Server.MapPath("TempData/Temp.mdb"));
            string accessConn = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("TempData/Temp.mdb") + ";Jet OLEDB:Database Password=mother";

            DatabaseCE dbTDSMAN = new DatabaseCE(accessConn);
            DatabaseCE db = new DatabaseCE();
            try
            {
                ImportCompany(dbTDSMAN, db);
                Import_SALARY_DETAIL(dbTDSMAN, db);
                //ImpoortEmploee(dbTDSMAN, db);
                //ImpoortDeductee(dbTDSMAN, db);
                //Import_BASIC_INFO(dbTDSMAN, db);
                //Import_TRN_COMP_INFO(dbTDSMAN, db);
                //Import_TRN_CHALLAN_INFO(dbTDSMAN, db);
                //Import_TRN_DEDUCTEE_DETAIL(dbTDSMAN, db);
            }
            catch { }
            finally
            {
                db.Close();
                dbTDSMAN.Close();
                File.Delete(Server.MapPath("TempData/Temp.mdb"));
            }
        }
    }
 
    private void ImportCompany(DatabaseCE dbTDSMAN, DatabaseCE db)
    {
        string Error = "";
        IDataReader dr = null;
        
        dr = dbTDSMAN.GetDataReader("SELECT * from MST_COMPANY", ref Error);
        try
        {
            if (dr != null)
            {
                while (dr.Read())
                {
                    string vError = "";
                    DataSet catDS = dbTDSMAN.GetDataSet("Select * from MST_CATEGORY", ref vError);
                    DataTable categoryTable = catDS.Tables[0];
                    DataRow[] calagory = categoryTable.Select("CATEGORY_ID=" + dr["D_CATEGORY_ID"].ToString() + "");
                    string d_category = calagory[0].ItemArray[1].ToString();

                    DataSet stateDS = dbTDSMAN.GetDataSet("Select * from MST_STATE", ref vError);
                    DataTable stateTable = stateDS.Tables[0];
                    DataRow[] stateRow = stateTable.Select("STATE_ID=" + dr["STATE_ID"].ToString() + "");
                    string state = stateRow[0].ItemArray[1].ToString();

                    DataRow[] p_stateRow = stateTable.Select("STATE_ID=" + dr["P_STATE_ID"].ToString() + "");
                    string p_state = p_stateRow[0].ItemArray[1].ToString();

                    string d_state = "";
                    try
                    {
                        DataRow[] d_stateRow = stateTable.Select("STATE_ID=" + dr["D_STATE_ID"].ToString() + "");
                        d_state = d_stateRow[0].ItemArray[1].ToString();
                    }
                    catch { }

                    int count=Cmn.ToInt(db.ExecuteScalar("Select count(*) from MST_COMPANY", ref vError));
                    if (count == 0)
                        rra_Copm_Id = 1;
                    else
                        rra_Copm_Id = GetMaxRRACompID(db)+1;

                    int LicenseID = Global.LicenseID;
                    string sql = "insert into MST_COMPANY(COMPANY_ID,GROUP_ID,ASST_ID,TAN_NO,PAN_NO," +
                    "COMPANY_NAME,D_CATEGORY_ID,D_STATE_ID,BRANCH_DIV," +
                    "MINISTRY_ID,MINISTRY_OTHER,PAO_CODE,PAO_REG_NO," +
                    "DDO_CODE,DDO_REG_NO,ADDRESS1," +
                    "ADDRESS2,ADDRESS3,ADDRESS4,ADDRESS5,STATE_ID," +
                    "PIN_CODE,PHONE,STD,EMAIL," +
                    "PERSON_NAME,DESIGNATION,FATHER_NAME,P_ADDRESS1" +
                    ",P_ADDRESS2,P_ADDRESS3,P_ADDRESS4,P_ADDRESS5," +
                    "P_STATE_ID,P_PIN_CODE,P_PHONE,P_STD," +
                    "P_EMAIL ,P_MOBILE,ASSESSING_OFFICER," +
                    "TDS_CIRCLE,FILE_PREFIX,CIT_TDS_ADDRESS,CIT_TDS_CITY" +
                    ",CIT_TDS_PINCODE,AIN_NO,TAN_REG_NO," +
                    "ALT_STD,ALT_PHONE,ALT_EMAIL,P_ALT_STD," +
                    "P_ALT_PHONE,P_ALT_EMAIL,LICENSE_ID,DELETED,RRA_COMPANY_ID)" +

                    " values(" + dr["COMPANY_ID"].ToString() + "," + dr["GROUP_ID"].ToString() + ",'" + dr["ASST_ID"].ToString() + "','" + dr["TAN_NO"].ToString() + "','" + dr["PAN_NO"].ToString() + "','"
                               + dr["COMPANY_NAME"].ToString() + "','" + d_category + "','" + d_state + "','" + dr["BRANCH_DIV"].ToString() + "','"
                               + dr["MINISTRY_ID"].ToString() + "','" + dr["MINISTRY_OTHER"].ToString() + "','" + dr["PAO_CODE"].ToString() + "','" + dr["PAO_REG_NO"].ToString() + "','"
                               + dr["DDO_CODE"].ToString() + "','" + dr["DDO_REG_NO"].ToString() + "','" + dr["ADDRESS1"].ToString() + "','"
                               + dr["ADDRESS2"].ToString() + "','" + dr["ADDRESS3"].ToString() + "','" + dr["ADDRESS4"].ToString() + "','" + dr["ADDRESS5"].ToString() + "','" + state + "','"
                               + dr["PIN_CODE"] + "','" + dr["PHONE"].ToString() + "','" + dr["STD"].ToString() + "','" + dr["EMAIL"].ToString() + "','"
                               + dr["PERSON_NAME"].ToString() + "','" + dr["DESIGNATION"].ToString() + "','" + dr["FATHER_NAME"].ToString() + "','"+ dr["P_ADDRESS1"].ToString() + "','"
                               + dr["P_ADDRESS2"].ToString() + "','" + dr["P_ADDRESS3"].ToString() + "','" + dr["P_ADDRESS4"].ToString() + "','" + dr["P_ADDRESS5"].ToString() + "','"
                               + p_state + "','" + dr["P_PIN_CODE"].ToString() + "','" + dr["P_PHONE"].ToString() + "','" + dr["P_STD"].ToString() + "','"
                               + dr["P_EMAIL"].ToString() + "','" + dr["P_MOBILE"].ToString() + "','" + dr["ASSESSING_OFFICER_CODE"].ToString() + "','"
                               + dr["TDS_CIRCLE"].ToString() + "','" + dr["FILE_PREFIX"].ToString() + "','" + dr["CIT_TDS_ADDRESS"].ToString() + "','" + dr["CIT_TDS_CITY"].ToString() + "','"
                               + dr["CIT_TDS_PINCODE"].ToString() + "','" + dr["AIN_NO"].ToString() + "','" + dr["TAN_REG_NO"].ToString() + "','"
                               + dr["ALT_STD"].ToString() + "','" + dr["ALT_PHONE"].ToString() + "','" + dr["ALT_EMAIL"].ToString() + "','" + dr["P_ALT_STD"].ToString() + "','"
                               + dr["P_ALT_PHONE"].ToString() + "','" + dr["P_ALT_EMAIL"].ToString() + "','" + Global.LicenseID + "',0," + rra_Copm_Id + ")";
                    
                    db.RunQuery(sql);

                    comp_Id = Cmn.ToInt(dr["COMPANY_ID"]);

                    if(rra_Copm_Id>0)
                    ImpoortEmploee(dbTDSMAN, db);
                    ImpoortDeductee(dbTDSMAN, db);
                    Import_BASIC_INFO(dbTDSMAN, db);
                }
            }
        }
        catch { }
        finally { dr.Close(); }
    }

    private int GetMaxRRACompID(DatabaseCE db)
    {
        string vError = "";
        int rra_Copm_Id =db.GetMax("MST_COMPANY", "RRA_COMPANY_ID","",ref vError);
        return rra_Copm_Id;
    }

    private void ImpoortEmploee(DatabaseCE dbTDSMAN, DatabaseCE db)
    {
       string Error = "";
      
       DataSet ds = dbTDSMAN.GetDataSet("Select * from MST_EMPLOYEE where COMPANY_ID=" + comp_Id + "", ref Error);
       if (ds.Tables.Count > 0)
       {
           DataTable dt = ds.Tables[0];
           if (dt != null)
           {
               foreach (DataRow dr in dt.Rows)
               {
                   string sql = "insert into MST_EMPLOYEE(EMPLOYEE_ID,EMPLOYEE_NAME,EMPLOYEE_PAN,GROUP_ID,COMPANY_ID,DESIGNATION,CATEGORY,EMPLOYEE_REF,DOB,DOJ,ADDRESS,RRA_COMPANY_ID)" +
                          " values(" + dr["EMPLOYEE_ID"] + ",'" + dr["EMPLOYEE_NAME"] + "','" + dr["EMPLOYEE_PAN"].ToString() + "',"
                          + dr["GROUP_ID"] + "," + dr["COMPANY_ID"].ToString() + ",'"
                          + dr["DESIGNATION"] + "','" + dr["CATEGORY"].ToString() + "','"
                          + dr["EMPLOYEE_REF"] + "','','','','" + rra_Copm_Id+ "')";
                          db.RunQuery(sql);
                }
           }
        }
     }

    private void ImpoortDeductee(DatabaseCE dbTDSMAN, DatabaseCE db)
    {
        string Error = "";
        //IDataReader dr = null;
        
        DataSet ds = dbTDSMAN.GetDataSet("SELECT * from MST_DEDUCTEE", ref Error);

        if (ds.Tables.Count > 0)
        {
            DataTable dt = ds.Tables[0];
            if (dt != null)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    string sql = "insert into MST_DEDUCTEE(DEDUCTEE_ID,DEDUCTEE_CODE,DEDUCTEE_NAME,DEDUCTEE_PAN,GROUP_ID," +
                    "ADDRESS1,ADDRESS2,ADDRESS3,ADDRESS4,ADDRESS5,STATE_ID,PIN_CODE,MOBILE_NO,EMAIL,DEDUCTEE_REF,COMPANY_ID,DELETED,RRA_COMPANY_ID)" +
                    " values(" + dr["DEDUCTEE_ID"] + ",'" + dr["DEDUCTEE_CODE"].ToString() + "','" + dr["DEDUCTEE_NAME"].ToString() + "','"
                    + dr["DEDUCTEE_PAN"].ToString() + "'," + dr["GROUP_ID"].ToString() + ",'" + (dr["ADDRESS1"].ToString() + "','" + dr["ADDRESS2"].ToString() + "','"
                    + dr["ADDRESS3"].ToString() + "','" + dr["ADDRESS4"].ToString() + "','" + dr["ADDRESS5"].ToString()) + "','"
                    + dr["STATE_ID"].ToString() + "','" + dr["PIN_CODE"].ToString() + "','" + dr["MOBILE_NO"].ToString() + "','" + dr["EMAIL"].ToString() + "','','" + comp_Id + "','','" + rra_Copm_Id + "')";
                    db.RunQuery(sql);
                }
           }
        }
        //try
        //{
        //    if (dr != null)
        //    {
        //        while (dr.Read())
        //        {
        //            string sql = "insert into MST_DEDUCTEE(DEDUCTEE_ID,DEDUCTEE_CODE,DEDUCTEE_NAME,DEDUCTEE_PAN,GROUP_ID," +
        //            "ADDRESS1,ADDRESS2,ADDRESS3,ADDRESS4,ADDRESS5,STATE_ID,PIN_CODE,MOBILE_NO,EMAIL,DEDUCTEE_REF,COMPANY_ID,DELETED,RRA_COMPANY_ID)" +
        //            " values(" + dr["DEDUCTEE_ID"] + ",'" + dr["DEDUCTEE_CODE"].ToString() + "','" + dr["DEDUCTEE_NAME"].ToString() + "','"
        //            + dr["DEDUCTEE_PAN"].ToString() + "'," + dr["GROUP_ID"].ToString() + ",'" + (dr["ADDRESS1"].ToString() + "','" + dr["ADDRESS2"].ToString() + "','"
        //            + dr["ADDRESS3"].ToString() + "','" + dr["ADDRESS4"].ToString() + "','" + dr["ADDRESS5"].ToString()) + "','"
        //            + dr["STATE_ID"].ToString() + "','" + dr["PIN_CODE"].ToString() + "','" + dr["MOBILE_NO"].ToString() + "','" + dr["EMAIL"].ToString() + "','','" + comp_Id + "','','" + rra_Copm_Id + "')";
        //            db.RunQuery(sql);
        //        }
        //    }
        //}
        //catch { }
        //finally { dr.Close(); }
    }

    private void Import_BASIC_INFO(DatabaseCE dbTDSMAN, DatabaseCE db)
    {
        string Error = "";
        DataSet ds = dbTDSMAN.GetDataSet("Select * from TRN_BASIC_INFO where COMPANY_ID="+comp_Id+"", ref Error);
        
        if (ds.Tables.Count > 0)
        {
            DataTable dt = ds.Tables[0];
            if (dt != null)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    string vError = "";
                    DataSet AssYearDS = dbTDSMAN.GetDataSet("Select * from MST_ASSESSMENT", ref vError);
                    DataTable AssYearTable = AssYearDS.Tables[0];
                    DataRow[] AssYear = AssYearTable.Select("ASST_ID=" + dr["ASST_ID"].ToString() + "");
                    string finYr = AssYear[0].ItemArray[2].ToString().Substring(0,4);

                    string sql = "insert into TRN_BASIC_INFO(BASIC_INFO_ID,COMPANY_ID,ASST_ID,QTR,FORM_NO,NIL_RETURN,RECEIPT_NO,DATE_OF_FILING," +
                    "PRN_NO,ADDRESS_CHANGE,P_ADDRESS_CHANGE,PREV_FILED,PREV_PRN_NO,YEAR,ACCEPT_FLAG,CORRECTION_ID,DELETED,RRA_COMPANY_ID)" +
                    " values(" + dr["BASIC_INFO_ID"] + "," + dr["COMPANY_ID"] + "," + dr["ASST_ID"].ToString() + ",'" + dr["QTR"].ToString() + "','"
                    + dr["FORM_NO"].ToString() + "'," + (dr["NIL_RETURN"].ToString() + ",'" + dr["RECEIPT_NO"].ToString() + "','" + dr["DATE_OF_FILING"].ToString() + "','" + dr["PRN_NO"].ToString() + "'," + dr["ADDRESS_CHANGE"].ToString()) + "," + dr["P_ADDRESS_CHANGE"].ToString() + ","
                    + dr["PREV_FILED"].ToString() + ",'" + dr["PREV_PRN_NO"].ToString() + "'," + finYr + ",'','','','" + rra_Copm_Id + "')";
                    db.RunQuery(sql);
                    
                    Import_TRN_COMP_INFO(dbTDSMAN, db, dr["BASIC_INFO_ID"].ToString());
                    Import_TRN_CHALLAN_INFO(dbTDSMAN, db, dr["BASIC_INFO_ID"].ToString(), dr["QTR"].ToString(), finYr);
                }
            }
        }
        
    }

    private void Import_TRN_COMP_INFO(DatabaseCE dbTDSMAN, DatabaseCE db, string Basic_Info_Id)
    {
        string Error = "";
       
        DataSet ds = dbTDSMAN.GetDataSet("Select * from TRN_COMPANY_INFO where BASIC_INFO_ID=" + Basic_Info_Id + "", ref Error);
        if (ds.Tables.Count > 0)
        {
            DataTable dt = ds.Tables[0];
            if (dt != null)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    string sql = "insert into TRN_COMPANY_INFO(COMPANY_INFO_ID,BASIC_INFO_ID,COMPANY_ID,GROUP_ID,ASST_ID,TAN_NO,PAN_NO," +
                    "COMPANY_NAME,D_CATEGORY_ID,D_STATE_ID,BRANCH_DIV," +
                    "MINISTRY_ID,MINISTRY_OTHER,PAO_CODE,PAO_REG_NO," +
                    "DDO_CODE,DDO_REG_NO,ADDRESS1," +
                    "ADDRESS2,ADDRESS3,ADDRESS4,ADDRESS5,STATE_ID," +
                    "PIN_CODE,PHONE,STD,EMAIL," +
                    "PERSON_NAME,DESIGNATION,FATHER_NAME,P_ADDRESS1" +
                    ",P_ADDRESS2,P_ADDRESS3,P_ADDRESS4,P_ADDRESS5," +
                    "P_STATE_ID,P_PIN_CODE,P_PHONE,P_STD," +
                    "P_EMAIL ,P_MOBILE,ASSESSING_OFFICER," +
                    "TDS_CIRCLE,FILE_PREFIX,CIT_TDS_ADDRESS,CIT_TDS_CITY" +
                    ",CIT_TDS_PINCODE,AIN_NO,TAN_REG_NO," +
                    "ALT_STD,ALT_PHONE,ALT_EMAIL,P_ALT_STD," +
                    "P_ALT_PHONE,P_ALT_EMAIL,RRA_COMPANY_ID)" +

                     " values(" + dr["COMPANY_INFO_ID"] + "," + dr["BASIC_INFO_ID"] + "," + dr["COMPANY_ID"].ToString() + "," + dr["GROUP_ID"].ToString() + ",'" + dr["ASST_ID"].ToString() + "','"
                               + dr["TAN_NO"].ToString() + "','" + dr["PAN_NO"].ToString() + "','"
                               + dr["COMPANY_NAME"].ToString() + "','" + dr["D_CATEGORY_ID"].ToString() + "','" + dr["D_STATE_ID"].ToString() + "','" + dr["BRANCH_DIV"].ToString() + "','"
                               + dr["MINISTRY_ID"].ToString() + "','" + dr["MINISTRY_OTHER"].ToString() + "','" + dr["PAO_CODE"].ToString() + "','" + dr["PAO_REG_NO"].ToString() + "','"
                               + dr["DDO_CODE"].ToString() + "','" + dr["DDO_REG_NO"].ToString() + "','" + dr["ADDRESS1"].ToString() + "','"
                               + dr["ADDRESS2"].ToString() + "','" + dr["ADDRESS3"].ToString() + "','" + dr["ADDRESS4"].ToString() + "','" + dr["ADDRESS5"].ToString() + "','" + dr["STATE_ID"].ToString() + "','"
                               + dr["PIN_CODE"] + "','" + dr["PHONE"].ToString() + "','" + dr["STD"].ToString() + "','" + dr["EMAIL"].ToString() + "','"
                               + dr["PERSON_NAME"].ToString() + "','" + dr["DESIGNATION"].ToString() + "','" + dr["FATHER_NAME"].ToString() + dr["P_ADDRESS1"].ToString() + "','"
                               + dr["P_ADDRESS2"].ToString() + "','" + dr["P_ADDRESS3"].ToString() + "','" + dr["P_ADDRESS4"].ToString() + "','" + dr["P_ADDRESS5"].ToString() + "','"
                               + dr["P_STATE_ID"].ToString() + "','" + dr["P_PIN_CODE"].ToString() + "','" + dr["P_PHONE"].ToString() + "','" + "','" + dr["P_STD"].ToString() + "','"
                               + dr["P_EMAIL"].ToString() + "','" + dr["P_MOBILE"].ToString() + "','" + dr["ASSESSING_OFFICER_CODE"].ToString() + "','"
                               + dr["TDS_CIRCLE"].ToString() + "','" + dr["FILE_PREFIX"].ToString() + "','" + dr["CIT_TDS_ADDRESS"].ToString() + "','" + dr["CIT_TDS_CITY"].ToString() + "','"
                               + dr["CIT_TDS_PINCODE"].ToString() + "','" + dr["AIN_NO"].ToString() + "','" + dr["TAN_REG_NO"].ToString() + "','"
                               + dr["ALT_STD"].ToString() + "','" + dr["ALT_PHONE"].ToString() + "','" + dr["ALT_EMAIL"].ToString() + "','" + dr["P_ALT_STD"].ToString() + "','"
                               + dr["P_ALT_PHONE"].ToString() + "','" + dr["P_ALT_EMAIL"].ToString() + "'," + rra_Copm_Id + ")";
                    db.RunQuery(sql);
                }
            }
        }
    }

    private void Import_TRN_CHALLAN_INFO(DatabaseCE dbTDSMAN, DatabaseCE db, string Basic_Info_Id,string qtr,string finyr)
    {
        string Error = "";
       
        DataSet ds = dbTDSMAN.GetDataSet("Select * from TRN_CHALLAN where BASIC_INFO_ID=" + Basic_Info_Id + "", ref Error);
        if (ds.Tables.Count > 0)
        {
            DataTable dt = ds.Tables[0];
            if (dt != null)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    string sql = "insert into TRN_CHALLAN(CHALLAN_ID,BASIC_INFO_ID,SL_NO,SECTION_ID,DEPOSIT_DATE,BSR_CODE,CHALLAN_NO,TRANSFER_VOUCHER_NO," +
                    "CHEQUE_NO,TDS,SURCHARGE,EDUCATION_CESS,INTEREST,OTHERS,TOT_TAX,CTRL_TDS," +
                    "CTRL_SURCHARGE,CTRL_EDU_CESS,INTEREST_ALLOCATE,OTHERS_ALLOCATED,CTRL_TOT_TAX," +
                    "CTRL_TOT,REMARKS,BOOK_ENTRY,LATE_FEE,MINOR_HEAD_ID,TEMP_SL_NO," +
                    "COMPANY_ID,QTR,YEAR,NSDL_STATUS,MODE,CORRECTION_ID,DELETED,RRA_COMPANY_ID)" +

                    " values(" + dr["CHALLAN_ID"] + "," + dr["BASIC_INFO_ID"] + "," + dr["SL_NO"].ToString() + "," + dr["SECTION_ID"].ToString() + ",'"
                    + dr["DEPOSIT_DATE"].ToString() + "','" + (dr["BSR_CODE"].ToString() + "','" + dr["CHALLAN_NO"].ToString() + "','" + dr["TRANSFER_VOUCHER_NO"].ToString() + "','"
                    + dr["CHEQUE_NO"].ToString() + "','" + dr["TDS"].ToString()) + "','" + dr["SURCHARGE"].ToString() + "','"
                    + dr["EDUCATION_CESS"].ToString() + "','" + dr["INTEREST"].ToString() + "','" + dr["OTHERS"].ToString() + "','"
                    + dr["TOT_TAX"].ToString() + "','" + dr["CTRL_TDS"].ToString() + "','" + dr["CTRL_SURCHARGE"].ToString() + "','"
                    + dr["CTRL_EDU_CESS"].ToString() + "','" + dr["INTEREST_ALLOCATED"].ToString() + "','" + dr["OTHERS_ALLOCATED"].ToString() + "','"
                    + dr["CTRL_TOT_TAX"].ToString() + "','" + dr["CTRL_TOT"].ToString() + "','" + dr["REMARKS"].ToString() + "','"
                    + dr["BOOK_ENTRY"].ToString() + "','" + dr["LATE_FEE"].ToString() + "','" + dr["MINOR_HEAD_ID"].ToString() + "','"
                    + dr["TEMP_SL_NO"].ToString() + "',"+comp_Id+",'"+qtr+"',"+finyr+",'','','',''," + rra_Copm_Id + ")";
                    
                    db.RunQuery(sql);
                    Import_TRN_DEDUCTEE_DETAIL(dbTDSMAN, db, dr["CHALLAN_ID"].ToString());
                }
            }
        }
    }

    private void Import_TRN_DEDUCTEE_DETAIL(DatabaseCE dbTDSMAN, DatabaseCE db, string challan_Id)
    {
        string Error = "";
        
        DataSet ds = dbTDSMAN.GetDataSet("Select * from TRN_DEDUCTEE_DETAILS where CHALLAN_ID=" + challan_Id + "", ref Error);
        if (ds.Tables.Count > 0)
        {
            DataTable dt = ds.Tables[0];
            if (dt != null)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    string vError = "";
                    DataSet basicInfoDS = dbTDSMAN.GetDataSet("SELECT FORM_NO FROM TRN_BASIC_INFO WHERE BASIC_INFO_ID IN (SELECT BASIC_INFO_ID  FROM TRN_CHALLAN  WHERE  CHALLAN_ID =" + challan_Id + ")", ref vError);
                    //DataTable basicInfoTable = basicInfoDS.Tables[0];
                    string formType = basicInfoDS.Tables[0].Rows[0].ItemArray[0].ToString();
                    
                    string dedName="";
                    string dedPan="";
                    if (formType == "24Q")
                    {
                        string sqf = "SELECT * FROM MST_EMPLOYEE WHERE EMPLOYEE_ID=" + dr["PARTY_ID"];
                        DataSet EmployeeDS = dbTDSMAN.GetDataSet("SELECT * FROM MST_EMPLOYEE WHERE EMPLOYEE_ID="+dr["PARTY_ID"], ref vError);
                        if (EmployeeDS.Tables.Count > 0)
                        {
                            if (EmployeeDS.Tables[0].Rows.Count > 0)
                            {
                                dedName = EmployeeDS.Tables[0].Rows[0].ItemArray[1].ToString();
                                dedPan = EmployeeDS.Tables[0].Rows[0].ItemArray[2].ToString();
                            }
                        }
                    }
                    else if (formType == "26Q")
                    {
                        DataSet DedubcteeDS = dbTDSMAN.GetDataSet("SELECT * FROM MST_DEDUCTEE WHERE DEDUCTEE_ID=" + dr["PARTY_ID"], ref vError);
                        if(DedubcteeDS.Tables.Count>0)
                        {
                            if (DedubcteeDS.Tables[0].Rows.Count > 0)
                            {
                                dedName = DedubcteeDS.Tables[0].Rows[0].ItemArray[2].ToString();
                                dedPan = DedubcteeDS.Tables[0].Rows[0].ItemArray[3].ToString();
                            }
                        }
                    }

                     string sql = "insert into TRN_DEDUCTEE_DETAILS(DEDUCTEE_DETAIL_ID,CHALLAN_ID,BASIC_INFO_ID,SL_NO," +
                     "PARTY_ID,PAYMENT_DATE,DEDUCTED_DATE,PAYMENT_AMOUNT," +
                     "RATE,TAX_AMOUNT,SURCHARGE_AMOUNT" +
                     ",CESS_AMOUNT,TOTAL_AMOUNT,TAX_DEPOSITED_AMOUNT," +
                     "NON_DEDUCTION_FLAG,GROSSING_UP_INDIC,TOT_VALUE_PURCHAS,CASH_BOOK_ENTRY," +
                     "SECTION_ID,CERTIFICATE_NO,REASON_ID,TDS_APPLICABILITY_ID,REMITTANCE_ID," +
                     "UNIQUE_ACKN,COUNTRY_ID," +
                     "DEDUCTEE_ID,DEDUCTEE_NAME,DEDUCTEE_PAN,MODE,CORRECTIONID,DELETED,RRA_COMPANY_ID)" +

                     " values(" + dr["DEDUCTEE_DETAIL_ID"] + "," + dr["CHALLAN_ID"] + "," + dr["BASIC_INFO_ID"].ToString() + "," + dr["SL_NO"].ToString() + ","
                     + dr["PARTY_ID"].ToString() + ",'" + (dr["PAYMENT_DATE"].ToString() + "','" + dr["DEDUCTED_DATE"].ToString() + "','" + dr["PAYMENT_AMOUNT"].ToString() + "','"
                     + dr["RATE"].ToString() + "','" + dr["TAX_AMOUNT"].ToString()) + "','" + dr["SURCHARGE_AMOUNT"].ToString() + "','"
                     + dr["CESS_AMOUNT"].ToString() + "','" + dr["TOTAL_AMOUNT"].ToString() + "','" + dr["TAX_DEPOSITED_AMOUNT"].ToString() + "','"
                     + dr["NON_DEDUCTION_FLAG"].ToString() + "','" + dr["GROSSING_UP_INDICATOR"].ToString() + "','" + dr["TOT_VALUE_PURCHASE"].ToString() + "','" + dr["CASH_BOOK_ENTRY"].ToString() + "','"
                     + dr["SECTION_ID"].ToString() + "','" + dr["CERTIFICATE_NO"].ToString() + "','" + dr["REASON_ID"].ToString() + "','"
                     + dr["TDS_APPLICABILITY_ID"].ToString() + "','" + dr["REMITTANCE_ID"].ToString() + "','" + dr["UNIQUE_ACKN"].ToString() + "','"
                     + dr["COUNTRY_ID"].ToString() + "','" + dr["PARTY_ID"].ToString() + "','" + dedName + "','" + dedPan + "','','',''," + rra_Copm_Id + ")";
                    
                     db.RunQuery(sql);
                    }
            }
        }
    }

    private void Import_SALARY_DETAIL(DatabaseCE dbTDSMAN, DatabaseCE db)
    {
        string Error = "";
        DataSet ds = dbTDSMAN.GetDataSet("Select * from TRN_SALARY_DETAILS", ref Error);
        //DataSet ds = dbTDSMAN.GetDataSet("Select * from TRN_SALARY_DETAILS where BASIC_INFO_ID=" + basic_Info_Id + " and EMPLOYEE_ID=" + employee_Id + "", ref Error);
        
        if (ds.Tables.Count > 0)
        {
            DataTable dt = ds.Tables[0];
            if (dt != null)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    //string vError = "";

                    string sql = "insert into TRN_SALARY_DETAILS(SALARY_DETAILS_ID,BASIC_INFO_ID,EMPLOYEE_ID,FROM_DATE,TO_DATE," +
                        "TS_GS_SEC_17_1,TS_GS_SEC_17_2,TS_GS_SEC_17_3,TS_GS_TOTAL," +
                        "TS_LA_ITEM_1_DESC,TS_LA_ITEM_1,TS_LA_ITEM_2_DESC,TS_LA_ITEM_2,TS_LA_ITEM_3_DESC,TS_LA_ITEM_3," +
                        "TS_LA_ITEM_4_DESC,TS_LA_ITEM_4,TS_LA_ITEM_5_DESC,TS_LA_ITEM_5,TS_LA_TOTAL,TS_BALANCE,US_16_EA,US_16_TE," +
                        "US_16_AGGREGATE,INCOME_CHARGEABLE," +
                        "AIS_ITEM_1_DESC,AIS_ITEM_1,AIS_ITEM_2_DESC,AIS_ITEM_2,AIS_ITEM_3_DESC," +
                        "AIS_ITEM_3,AIS_ITEM_4_DESC,AIS_ITEM_4,AIS_Total,GROSS_TOTAL_INCOME," +
                        "CVIA_SEC80C_ITEM_1_DESC,CVIA_SEC80C_ITEM_1," +
                        "CVIA_SEC80C_ITEM_2_DESC,CVIA_SEC80C_ITEM_2," +
                        "CVIA_SEC80C_ITEM_3_DESC,CVIA_SEC80C_ITEM_3," +
                        "CVIA_SEC80C_ITEM_4_DESC,CVIA_SEC80C_ITEM_4," +
                        "CVIA_SEC80C_ITEM_5_DESC,CVIA_SEC80C_ITEM_5," +
                        "CVIA_SEC80C_ITEM_6_DESC,CVIA_SEC80C_ITEM_6," +
                        "CVIA_SEC80C_GROSS_TOTAL,CVIA_SEC80C_DED_TOTAL," +
                        "CVIA_SEC80CCC_GROSS_AMOUNT,CVIA_SEC80CCC_DED_AMOUNT," +
                        "CVIA_SEC80CCD_GROSS_AMOUNT,CVIA_SEC80CCD_DED_AMOUNT,CVIA_SEC80CCE_TOTAL_DED_AMOUNT," +
                        "CVIA_SEC80CCF_GROSS_AMOUNT,CVIA_SEC80CCF_DED_AMOUNT," +
                        "CVIA_SEC80CCG_GROSS_AMOUNT,CVIA_SEC80CCG_DED_AMOUNT," +
                        "CVIA_OTH_ITEM_1_DESC,CVIA_OTH_ITEM_1_GROSS_AMOUNT,CVIA_OTH_ITEM_1_QUAL_AMOUNT,CVIA_OTH_ITEM_1_DED_AMOUNT," +
                        "CVIA_OTH_ITEM_2_DESC,CVIA_OTH_ITEM_2_GROSS_AMOUNT,CVIA_OTH_ITEM_2_QUAL_AMOUNT,CVIA_OTH_ITEM_2_DED_AMOUNT," +
                        "CVIA_OTH_ITEM_3_DESC,CVIA_OTH_ITEM_3_GROSS_AMOUNT,CVIA_OTH_ITEM_3_QUAL_AMOUNT,CVIA_OTH_ITEM_3_DED_AMOUNT," +
                        "CVIA_OTH_ITEM_4_DESC,CVIA_OTH_ITEM_4_GROSS_AMOUNT,CVIA_OTH_ITEM_4_QUAL_AMOUNT,CVIA_OTH_ITEM_4_DED_AMOUNT," +
                        "CVIA_OTH_ITEM_5_DESC,CVIA_OTH_ITEM_5_GROSS_AMOUNT,CVIA_OTH_ITEM_5_QUAL_AMOUNT,CVIA_OTH_ITEM_5_DED_AMOUNT," +
                        "CVIA_OTH_DED_TOTAL,CVIA_DED_TOTAL,TOTAL_INCOME," +
                        "TAX_TOTAL_INCOME,SCHG_TOTAL_INCOME,ECESS_TOTAL_INCOME,TAX_PAYABLE_AGGREGATE,US_89_LESS,TAX_PAYABLE," +
                        "TOTAL_TDS_DEDUCTED,SHORTFALL_TAX,ENTRY_MODE,SL_NO,TAXABLE_AMOUNT,REPORTED_TAXABLE_AMOUNT,TOTAL_TAX_DEDUCTED_AMOUNT,"+
                        "PREVIOUS_TAX_DEDUCTED_TOTAL,TAX_DEDUCTED_HIGHER_RATE,BalanceCurrentEmployer,BalancePriviousEmployer,BrkUpTdsCurrentEmployer,"+
                        "BrkUpTdsPevEmployer)" +
                   
                    " values(" + dr["SALARY_DETAILS_ID"] + "," + dr["BASIC_INFO_ID"] + "," + dr["EMPLOYEE_ID"].ToString() + ",'" + dr["FROM_DATE"].ToString() + "','" + dr["TO_DATE"].ToString() + "','"
                    + dr["TS_GS_SEC_17_1"].ToString() + "','" + (dr["TS_GS_SEC_17_2"].ToString() + "','" + dr["TS_GS_SEC_17_3"].ToString() + "','" + dr["TS_GS_TOTAL"].ToString() + "','"
                    + dr["TS_LA_ITEM_1_DESC"].ToString() + "','" + dr["TS_LA_ITEM_1"].ToString()) + "','" + dr["TS_LA_ITEM_2_DESC"].ToString() + "','" + dr["TS_LA_ITEM_2"].ToString() + "','" + dr["TS_LA_ITEM_3_DESC"].ToString() + "','" + dr["TS_LA_ITEM_3"].ToString() + "','"
                    + dr["TS_LA_ITEM_4_DESC"].ToString() + "','" + dr["TS_LA_ITEM_4"].ToString() + "','" + dr["TS_LA_ITEM_5_DESC"].ToString() + "','" + dr["TS_LA_ITEM_5"].ToString() + "','" + dr["TS_LA_TOTAL"].ToString() + "','" + dr["TS_BALANCE"].ToString() + "','" + dr["US_16_EA"].ToString() + "','" + dr["US_16_TE"].ToString() + "','"
                    + dr["US_16_AGGREGATE"].ToString() + "','" + dr["INCOME_CHARGEABLE"].ToString() + "','"
                    + dr["AIS_ITEM_1_DESC"].ToString() + "','" + dr["AIS_ITEM_1"].ToString() + "','" + dr["AIS_ITEM_2_DESC"].ToString() + "','" + dr["AIS_ITEM_2"].ToString() + "','" + dr["AIS_ITEM_3_DESC"].ToString() + "','"
                    + dr["AIS_ITEM_3"].ToString() + "','" + dr["AIS_ITEM_4_DESC"].ToString() + "','" + dr["AIS_ITEM_4"].ToString() + "','" + dr["AIS_Total"].ToString() + "','" + dr["GROSS_TOTAL_INCOME"].ToString() + "','"
                    + dr["CVIA_SEC80C_ITEM_1_DESC"].ToString() + "','" + dr["CVIA_SEC80C_ITEM_1"].ToString() + "','"
                    + dr["CVIA_SEC80C_ITEM_2_DESC"].ToString() + "','" + dr["CVIA_SEC80C_ITEM_2"].ToString() + "','"
                    + dr["CVIA_SEC80C_ITEM_3_DESC"].ToString() + "','" + dr["CVIA_SEC80C_ITEM_3"].ToString() + "','"
                    + dr["CVIA_SEC80C_ITEM_4_DESC"].ToString() + "','" + dr["CVIA_SEC80C_ITEM_4"].ToString() + "','"
                    + dr["CVIA_SEC80C_ITEM_5_DESC"].ToString() + "','" + dr["CVIA_SEC80C_ITEM_5"].ToString() + "','"
                    + dr["CVIA_SEC80C_ITEM_6_DESC"].ToString() + "','" + dr["CVIA_SEC80C_ITEM_6"].ToString() + "','"
                    + dr["CVIA_SEC80C_GROSS_TOTAL"].ToString() + "','" + dr["CVIA_SEC80C_DED_TOTAL"].ToString() + "','"
                    + dr["CVIA_SEC80CCC_GROSS_AMOUNT"].ToString() + "','" + dr["CVIA_SEC80CCC_DED_AMOUNT"].ToString() + "','"
                    + dr["CVIA_SEC80CCD_GROSS_AMOUNT"].ToString() + "','" + dr["CVIA_SEC80CCD_DED_AMOUNT"].ToString() + "','" + dr["CVIA_SEC80CCE_TOTAL_DED_AMOUNT"].ToString() + "','"
                    + dr["CVIA_SEC80CCF_GROSS_AMOUNT"].ToString() + "','" + dr["CVIA_SEC80CCF_DED_AMOUNT"].ToString() + "','"
                    + dr["CVIA_SEC80CCG_GROSS_AMOUNT"].ToString() + "','" + dr["CVIA_SEC80CCG_DED_AMOUNT"].ToString() + "','"
                    + dr["CVIA_OTH_ITEM_1_DESC"].ToString() + "','" + dr["CVIA_OTH_ITEM_1_GROSS_AMOUNT"].ToString() + "','" + dr["CVIA_OTH_ITEM_1_QUAL_AMOUNT"].ToString() + "','" + dr["CVIA_OTH_ITEM_1_DED_AMOUNT"].ToString() + "','"
                    + dr["CVIA_OTH_ITEM_2_DESC"].ToString() + "','" + dr["CVIA_OTH_ITEM_2_GROSS_AMOUNT"].ToString() + "','" + dr["CVIA_OTH_ITEM_2_QUAL_AMOUNT"].ToString() + "','" + dr["CVIA_OTH_ITEM_2_DED_AMOUNT"].ToString() + "','"
                    + dr["CVIA_OTH_ITEM_3_DESC"].ToString() + "','" + dr["CVIA_OTH_ITEM_3_GROSS_AMOUNT"].ToString() + "','" + dr["CVIA_OTH_ITEM_3_QUAL_AMOUNT"].ToString() + "','" + dr["CVIA_OTH_ITEM_3_DED_AMOUNT"].ToString() + "','"
                    + dr["CVIA_OTH_ITEM_4_DESC"].ToString() + "','" + dr["CVIA_OTH_ITEM_4_GROSS_AMOUNT"].ToString() + "','" + dr["CVIA_OTH_ITEM_4_QUAL_AMOUNT"].ToString() + "','" + dr["CVIA_OTH_ITEM_4_DED_AMOUNT"].ToString() + "','"
                    + dr["CVIA_OTH_ITEM_5_DESC"].ToString() + "','" + dr["CVIA_OTH_ITEM_5_GROSS_AMOUNT"].ToString() + "','" + dr["CVIA_OTH_ITEM_5_QUAL_AMOUNT"].ToString() + "','" + dr["CVIA_OTH_ITEM_5_DED_AMOUNT"].ToString() + "','"
                    + dr["CVIA_OTH_DED_TOTAL"].ToString() + "','" + dr["CVIA_DED_TOTAL"].ToString() + "','" + dr["TOTAL_INCOME"].ToString() + "','"
                    + dr["TAX_TOTAL_INCOME"].ToString() + "','" + dr["SCHG_TOTAL_INCOME"].ToString() + "','" + dr["ECESS_TOTAL_INCOME"].ToString() + "','" + dr["TAX_PAYABLE_AGGREGATE"].ToString() + "','" + dr["US_89_LESS"].ToString() + "','" + dr["TAX_PAYABLE"].ToString() + "','"
                    + dr["TOTAL_TDS_DEDUCTED"].ToString() + "','" + dr["SHORTFALL_TAX"].ToString() + "','" + dr["ENTRY_MODE"].ToString() + "','" + dr["SL_NO"].ToString() + "','" + dr["TAXABLE_AMOUNT"].ToString() + "','" + dr["REPORTED_TAXABLE_AMOUNT"].ToString() + "','" + dr["TOTAL_TAX_DEDUCTED_AMOUNT"].ToString() + "','"
                    + dr["PREVIOUS_TAX_DEDUCTED_TOTAL"].ToString() + "','" + dr["TAX_DEDUCTED_HIGHER_RATE"].ToString() + "',0,0,0,0)";

                    db.RunQuery(sql);
                }
            }
        }

    }

}




