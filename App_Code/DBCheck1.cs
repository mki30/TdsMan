using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlServerCe;

public class DBCheck1
{
    //CheckDatabase
    //CheckTable
    
    public static void RunSQLFile(DatabaseCE db, string data)
    {
        string[] Commands = data.Split(new string[] { "GO\r\n" }, StringSplitOptions.RemoveEmptyEntries);
        IDbCommand cmd = new SqlCeCommand();
        cmd.Connection = db.myconnection;
        foreach (string s in Commands)
        {
            cmd.CommandText = s;
            cmd.ExecuteNonQuery();
        }
    }
    
    public static void CheckTable(DatabaseCE db, string TableName, Dictionary<string, string> Fields, string[] PrimaryKeys)
    {
        //fields to be added to all table
        if (!Fields.ContainsKey("LUDate"))
        Fields.Add("LUDate", "[datetime]");
        if (!Fields.ContainsKey("LUBy"))
        Fields.Add("LUBy", "[nvarchar](50)");
        
        //create table
        string SQL = "CREATE TABLE [" + TableName + "] (";
        string PK = " PRIMARY KEY (";
        foreach (string s in PrimaryKeys)
        {
            SQL += " [" + s + "] " + Fields[s] + ",";
            PK += " [" + s + "] " + ",";
        }

        PK = PK.Substring(0, PK.Length - 1) + ") ";
        SQL = SQL + PK + ") ";

        string err = db.RunQuery(SQL);
        
        //check for fields
        foreach (string s in Fields.Keys)
        {
            string Err = db.RunQuery("ALTER TABLE [" + TableName + "] ADD [" + s + "] " + Fields[s]);
        }
    }

    public static Boolean UpdateDBStructure(DatabaseCE db, int Counter)
    {
        Dictionary<string, string> fields = new Dictionary<string, string>();

        switch (Counter)
        {
            case 1:                 //MST_COMPANY
                fields.Add("COMPANY_ID", "[int]");
                fields.Add("GROUP_ID", "[int]");
                fields.Add("ASST_ID", "[nvarchar](10)");
                fields.Add("TAN_NO", "[nvarchar](20)");
                fields.Add("PAN_NO", "[nvarchar](20)");
                fields.Add("COMPANY_NAME", "[nvarchar](100)");
                fields.Add("D_CATEGORY_ID", "[nvarchar](10)");
                fields.Add("D_STATE_ID", "[nvarchar](10)");
                fields.Add("BRANCH_DIV", "[nvarchar](50)");
                fields.Add("MINISTRY_ID", "[nvarchar](10)");
                fields.Add("MINISTRY_OTHER", "[nvarchar](10)");
                fields.Add("PAO_CODE", "[nvarchar](20)");
                fields.Add("PAO_REG_NO", "[nvarchar](20)");
                fields.Add("DDO_CODE", "[nvarchar](20)");
                fields.Add("DDO_REG_NO", "[nvarchar](20)");
                fields.Add("ADDRESS1", "[nvarchar](100)");
                fields.Add("ADDRESS2", "[nvarchar](100)");
                fields.Add("ADDRESS3", "[nvarchar](100)");
                fields.Add("ADDRESS4", "[nvarchar](100)");
                fields.Add("ADDRESS5", "[nvarchar](100)");
                fields.Add("STATE_ID", "[nvarchar](10)");
                fields.Add("PIN_CODE", "[nvarchar](10)");
                fields.Add("PHONE", "[nvarchar](20)");
                fields.Add("STD", "[nvarchar](5)");
                fields.Add("EMAIL", "[nvarchar](100)");
                fields.Add("PERSON_NAME", "[nvarchar](100)");
                fields.Add("DESIGNATION", "[nvarchar](50)");
                fields.Add("FATHER_NAME", "[nvarchar](100)");
                fields.Add("P_ADDRESS1", "[nvarchar](100)");
                fields.Add("P_ADDRESS2", "[nvarchar](100)");
                fields.Add("P_ADDRESS3", "[nvarchar](100)");
                fields.Add("P_ADDRESS4", "[nvarchar](100)");
                fields.Add("P_ADDRESS5", "[nvarchar](100)");
                fields.Add("P_STATE_ID", "[nvarchar](20)");
                fields.Add("P_PIN_CODE", "[nvarchar](10)");
                fields.Add("P_PHONE", "[nvarchar](20)");
                fields.Add("P_STD", "[nvarchar](10)");
                fields.Add("P_EMAIL", "[nvarchar](100)");
                fields.Add("P_MOBILE", "[nvarchar](12)");
                fields.Add("ASSESSING_OFFICER", "[nvarchar](50)");
                fields.Add("TDS_CIRCLE", "[nvarchar](20)");
                fields.Add("FILE_PREFIX", "[nvarchar](50)");
                fields.Add("CIT_TDS_ADDRESS", "[nvarchar](200)");
                fields.Add("CIT_TDS_CITY", "[nvarchar](50)");
                fields.Add("CIT_TDS_PINCODE", "[nvarchar](10)");
                fields.Add("AIN_NO", "[nvarchar](10)");
                fields.Add("TAN_REG_NO", "[nvarchar](20)");
                fields.Add("ALT_STD", "[nvarchar](10)");
                fields.Add("ALT_PHONE", "[nvarchar](20)");
                fields.Add("ALT_EMAIL", "[nvarchar](100)");
                fields.Add("P_ALT_STD", "[nvarchar](10)");
                fields.Add("P_ALT_PHONE", "[nvarchar](20)");
                fields.Add("P_ALT_EMAIL", "[nvarchar](100)");
                fields.Add("Deleted", "[int]");
                CheckTable(db, "MST_COMPANY", fields, new string[] { "COMPANY_ID" });
                break;
            case 2:  //MST_EMPLOYEE
                fields.Add("EMPLOYEE_ID", "[int]");
                fields.Add("EMPLOYEE_NAME ", "[nvarchar](100)");
                fields.Add("EMPLOYEE_PAN", "[nvarchar](10)");
                fields.Add("GROUP_ID", "[int]");
                fields.Add("COMPANY_ID", "[int])");
                fields.Add("DESIGNATION", "[nvarchar](50)");
                fields.Add("CATEGORY", "[nvarchar](10)");
                fields.Add("EMPLOYEE_REF", "[nvarchar](10)");
                CheckTable(db, "MST_EMPLOYEE", fields, new string[] { "EMPLOYEE_ID" });
                break;
            
            case 3:  //MST_DEDUCTEE
                fields.Add("DEDUCTEE_ID", "[int]");
                fields.Add("DEDUCTEE_CODE", "[nvarchar](100)");
                fields.Add("DEDUCTEE_NAME", "[nvarchar](50)");
                fields.Add("DEDUCTEE_PAN", "[nvarchar](10)");
                fields.Add("GROUP_ID", "[int]");
                fields.Add("ADDRESS1", "[nvarchar](50)");
                fields.Add("ADDRESS2", "[nvarchar](50)");
                fields.Add("ADDRESS3", "[nvarchar](50)");
                fields.Add("ADDRESS4", "[nvarchar](50)");
                fields.Add("ADDRESS5", "[nvarchar](50)");
                fields.Add("STATE_ID", "[int]");
                fields.Add("PIN_CODE", "[nvarchar](10)");
                fields.Add("MOBILE_NO", "[nvarchar](20)");
                fields.Add("EMAIL", "[nvarchar](100)");
                fields.Add("DEDUCTEE_REF", "[nvarchar](10)");
                CheckTable(db, "MST_DEDUCTEE", fields, new string[] { "DEDUCTEE_ID" });
                break;
            
            case 4: //MST_CATEGORY
                fields.Add("CATEGORY_ID", "[int]");
                fields.Add("CATEGORY_CODE", "[nvarchar](10)");
                fields.Add("CATEGORY_DESCRIPTION", "[nvarchar](100)");
                CheckTable(db, "MST_CATEGORY", fields, new string[] { "CATEGORY_ID" });
                break;
            
            case 5:  //MST_ASSESSMENT
                fields.Add("ASST_ID", "[int]");
                fields.Add("ASST_YEAR", "[nvarchar](10)");
                fields.Add("FA_YEAR", "[nvarchar](10)");
                fields.Add("START_DATE", "[datetime]");
                fields.Add("END_DATE", "[datetime]");
                fields.Add("LAST_DATE_OF_PAYMENT", "[datetime]");
                fields.Add("FVU_VERSION", "[nvarchar](10)");
                fields.Add("INPUT_FILE_NAME_P", "[nvarchar](10)");
                fields.Add("VISIBILITY_FLAG", "[nvarchar](10)");
                CheckTable(db, "MST_ASSESSMENT", fields, new string[] { "ASST_ID" });
                break;
            
            case 6:  //MST_CIT_DETAILS
                fields.Add("CIT_ID", "[int]");
                fields.Add("CIT_STATES", "[nvarchar](100)");
                fields.Add("CIT_DESIGNATION", "[nvarchar](100)");
                fields.Add("CIT_ADDRESS", "[nvarchar](200)");
                CheckTable(db, "MST_CIT_DETAILS", fields, new string[] { "CIT_ID" });
                break;

            case 7:  //MST_COLLECTION
                fields.Add("COLLECTION_ID","[int]");
                fields.Add("COLLECTION_CODE","[nvarchar](5)");
                fields.Add("COLLECTION_DESCRIPTION","[nvarchar](200)");
                CheckTable(db, "MST_COLLECTION", fields, new string[] { "COLLECTION_ID" });
                break;

            case 8: //MST_COUNTRY
                fields.Add("COUNTRY_ID", "[int]");
                fields.Add("COUNTRY_DESC", "[nvarchar](100)");
                fields.Add("COUNTRY_CODE", "[int]");
                CheckTable(db, "MST_COUNTRY", fields, new string[] { "COUNTRY_ID" });
                break;

            case 9: //MST_GROUP
                fields.Add("GROUP_ID", "[int]");
                fields.Add("GROUP_NAME", "[nvarchar](50)");
                CheckTable(db, "MST_GROUP", fields, new string[] { "GROUP_ID" });
                break;

            case 10: //MST_INCOME_TAX_SLAB
                fields.Add("TAX_SLAB_ID", "[int]");
                fields.Add("ASST_ID", "[int]");
                fields.Add("CATEGORY", "[nvarchar](5)");
                fields.Add("INCOME_FROM", "[float]");
                fields.Add("TAX_RATE", "[float]");
                fields.Add("EDUCATION_CESS_RA", "[float]");
                CheckTable(db, "MST_INCOME_TAX_SLAB", fields, new string[] { "TAX_SLAB_ID" });
                break;
            
            case 11: //MST_MINISTRY
                fields.Add("MINISTRY_ID", "[int]");
                fields.Add("MINISTRY_CODE", "[nvarchar](5)");
                fields.Add("MINISTRY_NAME", "[nvarchar](100)");
                CheckTable(db, "MST_MINISTRY", fields, new string[] { "MINISTRY_ID"});
                break;
            
            case 12:  //MST_MINOR_HEADs
                fields.Add("MINOR_HEAD_ID", "[int]");
                fields.Add("MINISTRY_CODE", "[nvarchar](5)");
                fields.Add("MINOR_HEAD_DESC", "[nvarchar](200)");
                CheckTable(db, "MST_MINOR_HEAD", fields, new string[] { "MINOR_HEAD_ID" });
                break;

            case 13: //MST_MONTH
                fields.Add("MONTH_ID", "[int]");
                fields.Add("MONTH_DESC", "[nvarchar](20)");
                fields.Add("MONTH_SHORT", "[nvarchar](5)");
                fields.Add("MONTH_ORDER", "[int]");
                CheckTable(db, "MST_MONTH", fields, new string[] {"MONTH_ID"});
                break;

            case 14: //MST_NONSALARY_TAX_SLAB
                fields.Add("NONSALARY_TAX_SLAB_ID", "[int]");
                fields.Add("SECTION_ID", "[int]");
                fields.Add("FROM_DATE", "[datetime]");
                fields.Add("TO_DATE", "[datetime]");
                fields.Add("COMPANY_RATE", "[float]");
                fields.Add("NON_COMPANY_RATE", "[float]");
                fields.Add("INVALID_PAN_RATE", "[float]");
                CheckTable(db, "MST_NONSALARY_TAX_SLAB", fields, new string[] { "NONSALARY_TAX_SLAB_ID" });
                break;

            case 15: //MST_REASON
                fields.Add("REASON_ID", "[int]");
                fields.Add("FORM_NO", "[nvarchar](5)");
                fields.Add("REASON", "[nvarchar](10)");
                fields.Add("DESCRIPTION", "[nvarchar](100)");
                fields.Add("CERTIFICATE_REQD", "[int]");
                CheckTable(db, "MST_REASON", fields, new string[] { "REASON_ID" });
                break;

            case 16:  //MST_REMITTANCE
                fields.Add("REMITTANCE_ID", "[int]");
                fields.Add("REMITTANCE_DESC", "[nvarchar](200)");
                fields.Add("REMITTANCE_CODE", "[nvarchar](5)");
                CheckTable(db, "MST_REMITTANCE", fields, new string[] { "REMITTANCE_ID" });
                break;
            
            case 17: //MST_SECTION
                fields.Add("SECTION_ID", "[int]");
                fields.Add("FORM_NAME", "[nvarchar](5)");
                fields.Add("SECTION_TYPE", "[nvarchar](20)");
                fields.Add("SECTION_NAME", "[nvarchar](20)");
                fields.Add("SECTION_NO", "[nvarchar](20)");
                fields.Add("SECTION_DESCRIPTION", "[nvarchar](100)");
                fields.Add("ASST_ID", "[int]");
                fields.Add("VALID_UPTO_ASST_ID", "[int]");
                CheckTable(db, "MST_SECTION", fields, new string[] { "SECTION_ID" });
                break;
            
            case 18: //MST_STATE
                fields.Add("STATE_ID", "[int]");
                fields.Add("STATE_CODE", "[nvarchar](5)");
                fields.Add("STATE_NAME", "[nvarchar](100)");
                CheckTable(db, "MST_STATE", fields, new string[] { "STATE_ID" });
                break;
            case 19: //MST_TAN_ACCOUNT
                fields.Add("TAN_ACCOUNT_ID", "[int]");
                fields.Add("TAN_NO", "[nvarchar](15)");
                fields.Add("LOGIN_ID", "[nvarchar](100)");
                fields.Add("USER_PASSWORD", "[nvarchar](50)");
                fields.Add("COMPANY_NAME", "[nvarchar](100)");
                CheckTable(db, "MST_TAN_ACCOUNT", fields, new string[] { "TAN_ACCOUNT_ID" });
                break;
            case 20: //MST_TDS_APPLICABILITY
                fields.Add("TDS_APPLICABILITY_ID", "[int]");
                fields.Add("TDS_APPLICABILITY_DESC", "[nvarchar](200)");
                fields.Add("TDS_APPLICABILITY_CODE", "[nvarchar](5)");
                CheckTable(db, "MST_TDS_APPLICABILITY", fields, new string[] { "TDS_APPLICABILITY_ID" });
                break;
            case 21: //MST_TDS_NONSALARY_SLAB
                fields.Add("NONSALARY_SLAB_ID", "[int]");
                fields.Add("SECTION_ID", "[int]");
                fields.Add("FROM_DATE", "[datetime]");
                fields.Add("TO_DATE", "[datetime]");
                fields.Add("COMPANY_RATE", "[float]");
                fields.Add("NON_COMPANY_RATE", "[float]");
                fields.Add("INVALID_PAN_RATE", "[float]");
                CheckTable(db, "MST_TDS_NONSALARY_SLAB", fields, new string[] { "NONSALARY_SLAB_ID" });
                break;
            case 22: //MST_VERIFIED_PAN
                fields.Add("VERIFIED_PAN_ID", "[int]");
                fields.Add("PAN", "[nvarchar](10)");
                fields.Add("VERIFIED_NAME", "[nvarchar](100)");
                CheckTable(db, "MST_VERIFIED_PAN", fields, new string[] { "VERIFIED_PAN_ID" });
                break;   

            case 23: //TRN_BASIC_INFO
                fields.Add("BASIC_INFO_ID", "[int]");
                fields.Add("COMPANY_ID", "[int]");
                fields.Add("ASST_ID", "[int]");
                fields.Add("QTR", "[nvarchar](5)");
                fields.Add("FORM_NO", "[nvarchar](5)");
                fields.Add("NIL_RETURN", "[int]");
                fields.Add("RECEIPT_NO", "[nvarchar](20)");
                fields.Add("DATE_OF_FILING", "[datetime]");
                fields.Add("PRN_NO", "[nvarchar](20)");
                fields.Add("ADDRESS_CHANGE", "[int]");
                fields.Add("P_ADDRESS_CHANGE", "[int]");
                fields.Add("P_ADDRESS_CHANGE", "[int]");
                CheckTable(db, "TRN_BASIC_INFO", fields, new string[] { "BASIC_INFO_ID" });
                break;
             
            case 24: //TRN_COMPANY_INFO
                fields.Add("COMPANY_INFO_ID", "[int]");
                fields.Add("BASIC_INFO_ID", "[int]");
                fields.Add("COMPANY_ID", "[int]");
                fields.Add("GROUP_ID", "[int]");
                fields.Add("ASST_ID", "[nvarchar](10)");
                fields.Add("TAN_NO", "[nvarchar](20)");
                fields.Add("PAN_NO", "[nvarchar](20)");
                fields.Add("COMPANY_NAME", "[nvarchar](100)");
                fields.Add("D_CATEGORY_ID", "[nvarchar](10)");
                fields.Add("D_STATE_ID", "[nvarchar](10)");
                fields.Add("BRANCH_DIV", "[nvarchar](50)");
                fields.Add("MINISTRY_ID", "[nvarchar](10)");
                fields.Add("MINISTRY_OTHER", "[nvarchar](10)");
                fields.Add("PAO_CODE", "[nvarchar](20)");
                fields.Add("PAO_REG_NO", "[nvarchar](20)");
                fields.Add("DDO_CODE", "[nvarchar](20)");
                fields.Add("DDO_REG_NO", "[nvarchar](20)");
                fields.Add("ADDRESS1", "[nvarchar](100)");
                fields.Add("ADDRESS2", "[nvarchar](100)");
                fields.Add("ADDRESS3", "[nvarchar](100)");
                fields.Add("ADDRESS4", "[nvarchar](100)");
                fields.Add("ADDRESS5", "[nvarchar](100)");
                fields.Add("STATE_ID", "[nvarchar](10)");
                fields.Add("PIN_CODE", "[nvarchar](10)");
                fields.Add("PHONE", "[nvarchar](20)");
                fields.Add("STD", "[nvarchar](5)");
                fields.Add("EMAIL", "[nvarchar](100)");
                fields.Add("PERSON_NAME", "[nvarchar](100)");
                fields.Add("DESIGNATION", "[nvarchar](50)");
                fields.Add("FATHER_NAME", "[nvarchar](100)");
                fields.Add("P_ADDRESS1", "[nvarchar](100)");
                fields.Add("P_ADDRESS2", "[nvarchar](100)");
                fields.Add("P_ADDRESS3", "[nvarchar](100)");
                fields.Add("P_ADDRESS4", "[nvarchar](100)");
                fields.Add("P_ADDRESS5", "[nvarchar](100)");
                fields.Add("P_STATE_ID", "[nvarchar](20)");
                fields.Add("P_PIN_CODE", "[nvarchar](10)");
                fields.Add("P_PHONE", "[nvarchar](20)");
                fields.Add("P_STD", "[nvarchar](10)");
                fields.Add("P_EMAIL", "[nvarchar](100)");
                fields.Add("P_MOBILE", "[nvarchar](12)");
                fields.Add("ASSESSING_OFFICER", "[nvarchar](50)");
                fields.Add("TDS_CIRCLE", "[nvarchar](20)");
                fields.Add("FILE_PREFIX", "[nvarchar](50)");
                fields.Add("CIT_TDS_ADDRESS", "[nvarchar](200)");
                fields.Add("CIT_TDS_CITY", "[nvarchar](50)");
                fields.Add("CIT_TDS_PINCODE", "[nvarchar](10)");
                fields.Add("AIN_NO", "[nvarchar](10)");
                fields.Add("TAN_REG_NO", "[nvarchar](20)");
                fields.Add("ALT_STD", "[nvarchar](10)");
                fields.Add("ALT_PHONE", "[nvarchar](20)");
                fields.Add("ALT_EMAIL", "[nvarchar](100)");
                fields.Add("P_ALT_STD", "[nvarchar](10)");
                fields.Add("P_ALT_PHONE", "[nvarchar](20)");
                fields.Add("P_ALT_EMAIL", "[nvarchar](100)");
                CheckTable(db, "TRN_COMPANY_INFO", fields, new string[] { "COMPANY_INFO_ID" });
                break;
            case 25:
                fields.Add("CHALLAN_ID","[int]");
                fields.Add("BASIC_INFO_ID","[int]");
                fields.Add("SL_NO","[int]");
                fields.Add("SECTION_ID","[int]");
                fields.Add("DEPOSIT_DATE", "[datetime]");
                fields.Add("BSR_CODE", "[nvarchar](10)");
                fields.Add("CHALLAN_NO", "[nvarchar](10)");
                fields.Add("TRANSFER_VOUCHER_NO", "[nvarchar](10)");
                fields.Add("CHEQUE_NO", "[nvarchar](20)");
                fields.Add("TDS", "[float]");
                fields.Add("SURCHARGE", "[float]");
                fields.Add("EDUCATION_CESS", "[float]");
                fields.Add("INTEREST", "[float]");
                fields.Add("OTHERS", "[float]");
                fields.Add("TOT_TAX", "[float]");
                fields.Add("CTRL_TDS", "[float]");
                fields.Add("CTRL_SURCHARGE", "[float]");
                fields.Add("CTRL_EDU_CESS", "[float]");
                fields.Add("INTEREST_ALLOCATE", "[float]"); 
                fields.Add("OTHERS_ALLOCATED ", "[float]");
                fields.Add("CTRL_TOT_TAX", "[float]");
                fields.Add("CTRL_TOT", "[float]");
                fields.Add("REMARKS", "[nvarchar](10)");
                fields.Add("BOOK_ENTRY", "[nvarchar](10)");
                fields.Add("LATE_FEE", "[nvarchar](10)");
                fields.Add("MINOR_HEAD_ID", "[nvarchar](10)");
                fields.Add("TEMP_SL_NO", "[nvarchar](10)");

                fields.Add("NSDL_STATUS", "[nvarchar](5)");  //Matched-M,Unmatched-U,Previously-Booked-P
                fields.Add("MODE", "[int]");                //Add-0,Update-1
                fields.Add("CORRECTION_ID", "[int]");
                break;
            default:
                return false;
         }
        return true;
    }
}

