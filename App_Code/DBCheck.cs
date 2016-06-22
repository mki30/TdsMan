using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlServerCe;

public class DBCheck
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
            case 1://Company
                //fields.Add("ID", "[int]");
                //fields.Add("LicenseID", "[int]");
                //fields.Add("CompanyName", "[nvarchar](200)");
                //fields.Add("TanNo", "[nvarchar](20)");
                //fields.Add("PanNo", "[nvarchar](20)");
                //fields.Add("Branch", "[nvarchar](100)");
                //fields.Add("DeductorType", "[nvarchar](10)");
                //fields.Add("TanRegNo", "[nvarchar](20)");
                //fields.Add("FlatBlock", "[nvarchar](50)");
                //fields.Add("Building", "[nvarchar](50)");
                //fields.Add("Street", "[nvarchar](50)");
                //fields.Add("Area", "[nvarchar](50)");
                //fields.Add("Town", "[nvarchar](50)");
                //fields.Add("Pin", "[nvarchar](20)");
                //fields.Add("State", "[int]");
                //fields.Add("Std", "[nvarchar](5)");
                //fields.Add("Phone", "[nvarchar](50)");
                //fields.Add("StdAlt", "[nvarchar](5)");
                //fields.Add("PhoneAlt", "[nvarchar](50)");
                //fields.Add("Email", "[nvarchar](100)");
                //fields.Add("EmailAlt", "[nvarchar](100)");
                //fields.Add("RPName", "[nvarchar](100)");
                //fields.Add("RPDesg", "[nvarchar](100)");
                //fields.Add("RPFathersName", "[nvarchar](100)");
                //fields.Add("RPMobile", "[nvarchar](20)");
                //fields.Add("RPFlatBlock", "[nvarchar](50)");
                //fields.Add("RPBuilding", "[nvarchar](50)");
                //fields.Add("RPStreet", "[nvarchar](50)");
                //fields.Add("RPArea", "[nvarchar](50)");
                //fields.Add("RPTown", "[nvarchar](50)");
                //fields.Add("RPPin", "[nvarchar](20)");
                //fields.Add("RPState", "[int]");
                //fields.Add("RPStd", "[nvarchar](5)");
                //fields.Add("RPPhone", "[nvarchar](50)");
                //fields.Add("RPStdAlt", "[nvarchar](5)");
                //fields.Add("RPPhoneAlt", "[nvarchar](50)");
                //fields.Add("RPEmail", "[nvarchar](100)");
                //fields.Add("RPEmailAlt", "[nvarchar](100)");
                //fields.Add("PAOCode", "[nvarchar](50)");
                //fields.Add("PAORegNo", "[nvarchar](50)");
                //fields.Add("DDOCode", "[nvarchar](50)");
                //fields.Add("DDORegNo", "[nvarchar](50)");
                //fields.Add("GvtDeductorState", "[int]");
                //fields.Add("Ministry", "[nvarchar](100)");
                //fields.Add("OtherMinistry", "[nvarchar](100)");
                //fields.Add("AccountOfficerIDNo", "[nvarchar](20)");
                //fields.Add("CITAddress", "[nvarchar](200)");
                //fields.Add("CITCity", "[nvarchar](100)");
                //fields.Add("CITPin", "[nvarchar](10)");
                //fields.Add("Deleted", "[int]");
                //CheckTable(db, "Company", fields, new string[] { "ID" });
                break;
            case 2: //Deductee
                //fields.Add("ID", "[int]");
                //fields.Add("CompanyID", "[int]");
                //fields.Add("DeducteeType", "[int]");
                //fields.Add("Pan", "[nvarchar](10)");
                //fields.Add("Name", "[nvarchar](100)");
                //fields.Add("Address", "[nvarchar](200)");
                //fields.Add("State", "[nvarchar](100)");
                //fields.Add("Pin", "[nvarchar](20)");
                //fields.Add("Mobile", "[nvarchar](20)");
                //fields.Add("Email", "[nvarchar](200)");
                //fields.Add("Deleted", "[int]");
                //CheckTable(db, "Deductee", fields, new string[] { "ID" });
                break;
            case 3: //Employee
                //fields.Add("ID", "[int]");
                //fields.Add("CompanyID", "[int]");
                //fields.Add("EmployeePan", "[nvarchar](10)");
                //fields.Add("EmployeeName", "[nvarchar](100)");
                //fields.Add("EmployeeCatag", "[int]");
                //fields.Add("EmployeeRefNo", "[nvarchar](20)");
                //fields.Add("Designation", "[nvarchar](100)");
                //fields.Add("DOB", "[datetime]");
                //fields.Add("DOJ", "[datetime]");
                //fields.Add("Address", "[nvarchar](200)");
                //fields.Add("Deleted", "[int]");
                //CheckTable(db, "Employee", fields, new string[] { "ID" });
                break;
            case 4: //RegularReturn
                //fields.Add("ID", "[int]");
                //fields.Add("FormType", "[int]");//24Q-1,26Q-2,27Q-3,27EQ-4
                //fields.Add("CompanyID", "[int]");
                //fields.Add("FinancialYear", "[int]");
                //fields.Add("Quarter", "[int]");
                //fields.Add("PrevRegularReturnToken", "[nvarchar](20)");
                //fields.Add("AddressChangedCompany", "[int]");
                //fields.Add("AddressChangedRP", "[int]");
                //fields.Add("ReciptNo", "[nvarchar](20)");
                //fields.Add("DateOfFiling", "[datetime]");
                //fields.Add("TokenNo", "[nvarchar](20)");
                //fields.Add("AcceptFlag", "[int]");
                //fields.Add("Deleted", "[int]");
                //fields.Add("IsCorrection", "[int]");

                //fields.Add("CompanyName", "[nvarchar](200)");
                //fields.Add("TanNo", "[nvarchar](20)");
                //fields.Add("PanNo", "[nvarchar](20)");
                //fields.Add("Branch", "[nvarchar](100)");
                //fields.Add("DeductorType", "[nvarchar](10)");
                //fields.Add("TanRegNo", "[nvarchar](20)");
                //fields.Add("FlatBlock", "[nvarchar](50)");
                //fields.Add("Building", "[nvarchar](50)");
                //fields.Add("Street", "[nvarchar](50)");
                //fields.Add("Area", "[nvarchar](50)");
                //fields.Add("Town", "[nvarchar](50)");
                //fields.Add("Pin", "[nvarchar](20)");
                //fields.Add("State", "[int]");
                //fields.Add("Std", "[nvarchar](5)");
                //fields.Add("Phone", "[nvarchar](50)");
                //fields.Add("StdAlt", "[nvarchar](5)");
                //fields.Add("PhoneAlt", "[nvarchar](50)");
                //fields.Add("Email", "[nvarchar](100)");
                //fields.Add("EmailAlt", "[nvarchar](100)");
                //fields.Add("RPName", "[nvarchar](100)");
                //fields.Add("RPDesg", "[nvarchar](100)");
                //fields.Add("RPFathersName", "[nvarchar](100)");
                //fields.Add("RPMobile", "[nvarchar](20)");
                //fields.Add("RPFlatBlock", "[nvarchar](50)");
                //fields.Add("RPBuilding", "[nvarchar](50)");
                //fields.Add("RPStreet", "[nvarchar](50)");
                //fields.Add("RPArea", "[nvarchar](50)");
                //fields.Add("RPTown", "[nvarchar](50)");
                //fields.Add("RPPin", "[nvarchar](20)");
                //fields.Add("RPState", "[int]");
                //fields.Add("RPStd", "[nvarchar](5)");
                //fields.Add("RPPhone", "[nvarchar](50)");
                //fields.Add("RPStdAlt", "[nvarchar](5)");
                //fields.Add("RPPhoneAlt", "[nvarchar](50)");
                //fields.Add("RPEmail", "[nvarchar](100)");
                //fields.Add("RPEmailAlt", "[nvarchar](100)");
                //fields.Add("PAOCode", "[nvarchar](50)");
                //fields.Add("PAORegNo", "[nvarchar](50)");
                //fields.Add("DDOCode", "[nvarchar](50)");
                //fields.Add("DDORegNo", "[nvarchar](50)");
                //fields.Add("GvtDeductorState", "[int]");
                //fields.Add("Ministry", "[nvarchar](100)");
                //fields.Add("OtherMinistry", "[nvarchar](100)");
                //fields.Add("AccountOfficerIDNo", "[nvarchar](20)");
                //fields.Add("CITAddress", "[nvarchar](200)");
                //fields.Add("CITCity", "[nvarchar](100)");
                //fields.Add("CITPin", "[nvarchar](10)");

                //fields.Add("CorrectionID", "[int]");

                //fields.Add("BASIC_INFO_ID", "[int]");
                //fields.Add("COMPANY_ID", "[int]");
                //fields.Add("ASST_ID", "[int]");
                //fields.Add("QTR", "[nvarchar](5)");
                //fields.Add("FORM_NO", "[nvarchar](10)");
                //fields.Add("NIL_RETURN", "[int]");
                //fields.Add("RECEIPT_NO", "[nvarchar](20)");
                //fields.Add("DATE_OF_FILING", "[datetime]");
                //fields.Add("PRN_NO", "[nvarchar](20)");
                //fields.Add("ADDRESS_CHANGE", "[int]");
                //fields.Add("P_ADDRESS_CHANGE", "[int]");
                //fields.Add("PREV_FILED", "[int]");
                //fields.Add("PREV_PRN_NO", "[nvarchar](20)");

                //fields.Add("TAN_NO", "[nvarchar](20)");
                //fields.Add("PAN_NO", "[nvarchar](20)");
                //fields.Add("COMPANY_NAME", "[nvarchar](100)");
                //fields.Add("D_CATEGORY_ID", "[nvarchar](10)");
                //fields.Add("D_STATE_ID", "[nvarchar](10)");
                //fields.Add("BRANCH_DIV", "[nvarchar](50)");
                //fields.Add("MINISTRY_ID", "[nvarchar](10)");
                //fields.Add("MINISTRY_OTHER", "[nvarchar](10)");
                //fields.Add("PAO_CODE", "[nvarchar](20)");
                //fields.Add("PAO_REG_NO", "[nvarchar](20)");
                //fields.Add("DDO_CODE", "[nvarchar](20)");
                //fields.Add("DDO_REG_NO", "[nvarchar](20)");
                //fields.Add("ADDRESS1", "[nvarchar](100)");
                //fields.Add("ADDRESS2", "[nvarchar](100)");
                //fields.Add("ADDRESS3", "[nvarchar](100)");
                //fields.Add("ADDRESS4", "[nvarchar](100)");
                //fields.Add("ADDRESS5", "[nvarchar](100)");
                //fields.Add("STATE_ID", "[nvarchar](10)");
                //fields.Add("PIN_CODE", "[nvarchar](10)");
                //fields.Add("PHONE", "[nvarchar](20)");
                //fields.Add("STD", "[nvarchar](5)");
                //fields.Add("EMAIL", "[nvarchar](100)");
                //fields.Add("PERSON_NAME", "[nvarchar](100)");
                //fields.Add("DESIGNATION", "[nvarchar](50)");
                //fields.Add("FATHER_NAME", "[nvarchar](100)");
                //fields.Add("P_ADDRESS1", "[nvarchar](100)");
                //fields.Add("P_ADDRESS2", "[nvarchar](100)");
                //fields.Add("P_ADDRESS3", "[nvarchar](100)");
                //fields.Add("P_ADDRESS4", "[nvarchar](100)");
                //fields.Add("P_ADDRESS5", "[nvarchar](100)");
                //fields.Add("P_STATE_ID", "[nvarchar](20)");
                //fields.Add("P_PIN_CODE", "[nvarchar](10)");
                //fields.Add("P_PHONE", "[nvarchar](20)");
                //fields.Add("P_STD", "[nvarchar](10)");
                //fields.Add("P_EMAIL", "[nvarchar](100)");
                //fields.Add("P_MOBILE", "[nvarchar](12)");
                //fields.Add("ASSESSING_OFFICER", "[nvarchar](50)");
                //fields.Add("TDS_CIRCLE", "[nvarchar](20)");
                //fields.Add("FILE_PREFIX", "[nvarchar](50)");
                //fields.Add("CIT_TDS_ADDRESS", "[nvarchar](200)");
                //fields.Add("CIT_TDS_CITY", "[nvarchar](50)");
                //fields.Add("CIT_TDS_PINCODE", "[nvarchar](10)");
                //fields.Add("AIN_NO", "[nvarchar](10)");
                //fields.Add("TAN_REG_NO", "[nvarchar](20)");
                //fields.Add("ALT_STD", "[nvarchar](10)");
                //fields.Add("ALT_PHONE", "[nvarchar](20)");
                //fields.Add("ALT_EMAIL", "[nvarchar](100)");
                //fields.Add("P_ALT_STD", "[nvarchar](10)");
                //fields.Add("P_ALT_PHONE", "[nvarchar](20)");
                //fields.Add("P_ALT_EMAIL", "[nvarchar](100)");

                //fields.Add("YEAR", "[int]");
                //fields.Add("ACCEPT_FLAG", "[int]");
                //fields.Add("CORRECTION_ID", "[int]");
                //fields.Add("DELETED", "[int]");

                //CheckTable(db, "RegularReturn", fields, new string[] { "BASIC_INFO_ID" });
                //CheckTable(db, "RegularReturnCorrection", fields, new string[] { "ID" });
                break;

            case 5: //License
                fields.Add("ID", "[int]");
                fields.Add("Name", "[nvarchar](100)");
                fields.Add("Address", "[nvarchar](200)");
                fields.Add("Email", "[nvarchar](100)");
                fields.Add("Phone", "[nvarchar](20)");
                fields.Add("LicenseType", "[int]"); //0 - client 1- Agent
                fields.Add("ValidUpto", "[datetime]");
                CheckTable(db, "License", fields, new string[] { "ID" });
                break;
            case 6: //Users
                fields.Add("ID", "[int]");
                fields.Add("LicenseID", "[int]");
                fields.Add("CompanyID", "[int]");
                fields.Add("Name", "[nvarchar](50)");
                fields.Add("EmailID", "[nvarchar](50)");
                fields.Add("Password", "[nvarchar](50)");
                fields.Add("ContactNo", "[nvarchar](20)");
                fields.Add("UserType", "[int]");
                fields.Add("Active", "[int]"); //Active-0,inactive-1
                fields.Add("AutoLogin", "[nvarchar](50)");
                fields.Add("Token", "[nvarchar](50)");
                CheckTable(db, "User", fields, new string[] { "ID" });
                break;

            case 7://Challan
                //fields.Add("ID", "[int]");
                //fields.Add("CompanyID", "[int]");
                //fields.Add("FormID", "[int]");            //Regular Return Type
                //fields.Add("Date", "[datetime]");
                //fields.Add("ChallanNo", "[nvarchar](20)");
                //fields.Add("BSRNo", "[nvarchar](20)");
                //fields.Add("Quarter", "[int]");
                //fields.Add("Year", "[int]");
                //fields.Add("TDS", "[float]");
                //fields.Add("Surcharge", "[float]");
                //fields.Add("EducationCess", "[float]");
                //fields.Add("Intrest", "[float]");
                //fields.Add("Fee", "[float]");
                //fields.Add("Others", "[float]");
                //fields.Add("TotalAmount", "[float]");
                //fields.Add("MinorHead", "[int]");            //1-tds payble for taxpayer,2-tds regular assessment
                //fields.Add("Remarks", "[nvarchar](200)");
                //fields.Add("IntrestAlloc", "[float]");
                //fields.Add("OtherAlloc", "[float]");
                //fields.Add("Deleted", "[int]");

                //fields.Add("NSDLStatus", "[nvarchar](5)");  //Matched-M,Unmatched-U,Previously-Booked-P
                //fields.Add("Mode", "[int]");                //Add-0,Update-1
                //fields.Add("CorrectionID", "[int]");        

                //CheckTable(db, "Challan", fields, new string[] { "ID" });
                //CheckTable(db, "ChallanCorrection", fields, new string[] { "ID" });
                break;

            case 8://Challan Details
                //fields.Add("ID", "[int]");
                //fields.Add("ChallanID", "[int]");           //Regular Return Type
                //fields.Add("EmployeeID", "[int]");
                //fields.Add("EmployeeName", "[nvarchar](50)");
                //fields.Add("EmployeePan", "[nvarchar](50)");
                //fields.Add("Amount", "[float]");
                //fields.Add("Date", "[datetime]");
                //fields.Add("Section", "[nvarchar](10)");
                //fields.Add("PaymentAmount", "[float]");
                //fields.Add("Tax", "[float]");
                //fields.Add("SurCharge", "[float]");
                //fields.Add("Cess", "[float]");
                //fields.Add("Total", "[float]");
                //fields.Add("TaxDeposited", "[float]");
                //fields.Add("FormID", "[int]");
                //fields.Add("Remarks", "[nvarchar](5)");     //Regular Return Type
                //fields.Add("CertificateNo", "[nvarchar](20)");
                //fields.Add("Deleted", "[int]");

                //fields.Add("Mode", "[int]");                //New-0,Update-1
                //fields.Add("CorrectionID", "[int]");

                //CheckTable(db, "ChallanDetail", fields, new string[] { "ID" });
                //CheckTable(db, "ChallanDetailCorrection", fields, new string[] { "ID" });
                break;

            case 9: //Salary Detail
                fields.Add("ID", "[int]");
                fields.Add("EmployeeID", "[int]");
                fields.Add("FormID", "[int]");   //Regular Return Type ID
                fields.Add("FromDate", "[datetime]");
                fields.Add("ToDate", "[datetime]");
                fields.Add("GrossSalSec17_1", "[float]");
                fields.Add("GrossSalSec17_2", "[float]");
                fields.Add("GrossSalSec17_3", "[float]");
                fields.Add("GrossSalTotal", "[float]");
                fields.Add("AllowanceDesc1", "[nvarchar](100)");
                fields.Add("AllowanceAmount1", "[float]");
                fields.Add("AllowanceDesc2", "[nvarchar](100)");
                fields.Add("AllowanceAmount2", "[float]");
                fields.Add("AllowanceDesc3", "[nvarchar](100)");
                fields.Add("AllowanceAmount3", "[float]");
                fields.Add("AllowanceDesc4", "[nvarchar](100)");
                fields.Add("AllowanceAmount4", "[float]");
                fields.Add("AllowanceDesc5", "[nvarchar](100)");
                fields.Add("AllowanceAmount5", "[float]");
                fields.Add("AllowanceTotal", "[float]");
                fields.Add("Balance", "[float]");
                fields.Add("BalanceCurrentEmployer", "[float]");
                fields.Add("BalanceInSoftware", "[float]");
                fields.Add("BalancePriviousEmployer", "[float]");
                fields.Add("EntertainmentAllowance", "[float]");
                fields.Add("TaxOnEmployment", "[float]");
                fields.Add("IncomeChargUnderHeadSal", "[float]");
                fields.Add("IncomeOtherThanSalaryDesc1", "[nvarchar](100)");
                fields.Add("IncomeOtherThanSalaryAmount1", "[float]");
                fields.Add("IncomeOtherThanSalaryDesc2", "[nvarchar](100)");
                fields.Add("IncomeOtherThanSalaryAmount2", "[float]");
                fields.Add("IncomeOtherThanSalaryDesc3", "[nvarchar](100)");
                fields.Add("IncomeOtherThanSalaryAmount3", "[float]");
                fields.Add("IncomeOtherThanSalaryDesc4", "[nvarchar](100)");
                fields.Add("IncomeOtherThanSalaryAmount4", "[float]");
                fields.Add("IncomeOtherThanSalaryTotal", "[float]");
                fields.Add("GrossTotalIncome", "[float]");
                fields.Add("Sec80cDes1", "[nvarchar](100)");
                fields.Add("Sec80cAmount1", "[float]");
                fields.Add("Sec80cDes2", "[nvarchar](100)");
                fields.Add("Sec80cAmount2", "[float]");
                fields.Add("Sec80cDes3", "[nvarchar](100)");
                fields.Add("Sec80cAmount3", "[float]");
                fields.Add("Sec80cDes4", "[nvarchar](100)");
                fields.Add("Sec80cAmount4", "[float]");
                fields.Add("Sec80cDes5", "[nvarchar](100)");
                fields.Add("Sec80cAmount5", "[float]");
                fields.Add("Sec80cDes6", "[nvarchar](100)");
                fields.Add("Sec80cAmount6", "[float]");
                fields.Add("Sec80cGrossTotal", "[float]");
                fields.Add("Sec80cDeductibleTotal", "[float]");
                fields.Add("Sec80cccGrossAmount", "[float]");
                fields.Add("Sec80cccDeductibleAmount", "[float]");
                fields.Add("Sec80ccdGrossAmount", "[float]");
                fields.Add("Sec80ccdDeductibleAmount", "[float]");
                fields.Add("Sec80cceTotalDeductAmountE", "[float]");
                fields.Add("Sec80ccgGrossAmount", "[float]");
                fields.Add("Sec80ccgDeductibleAmount", "[float]");
                fields.Add("OtherSections", "[nvarchar](500)");
                fields.Add("TotalDeducAmountOtherSec", "[float]");
                fields.Add("AggrOfDeducAmountVIA", "[float]");
                fields.Add("TotalTaxableIncome", "[float]");
                fields.Add("TaxOnTotalIncome", "[float]");
                fields.Add("Surcharge", "[float]");
                fields.Add("Cess", "[float]");
                fields.Add("TaxPayble", "[float]");
                fields.Add("ReliefSection89", "[float]");
                fields.Add("TotalTDSDeducted", "[float]");
                fields.Add("BrkUpTdsCurrentEmployer", "[float]");
                fields.Add("BrkUpTdsPevEmployer", "[float]");
                fields.Add("NonPANTaxDeduction", "[int]");
                fields.Add("ShortfallExcessDedOfTax", "[float]");
                fields.Add("Deleted", "[int]");
                CheckTable(db, "SalaryDetail", fields, new string[] { "ID" });
                break;
            case 10:
                fields.Add("ID", "[int]");
                fields.Add("EmployeeID", "[int]");
                fields.Add("Income", "[float]");   //Regular Return Type ID
                fields.Add("Deductions", "[float]");
                fields.Add("Payable", "[float]");
                fields.Add("FinancialYear", "[int]");
                //fields.Add("Month", "[int]");    //Apr-1...March=12
                fields.Add("TDS", "[float]");
                fields.Add("Paid", "[float]");
                fields.Add("PaidOn", "[datetime]");
                fields.Add("Data", "[image]");
                fields.Add("DataSize", "[int]");
                CheckTable(db, "EmployeeSalary", fields, new string[] { "ID" });
                break;

            case 11:
                fields.Add("ID", "[int]");
                fields.Add("SalaryID", "[int]");
                fields.Add("AmountType", "[int]");   //Income-1,Ded-2
                fields.Add("ValueType", "[int]");    //HRA,TA etc
                fields.Add("Amount", "[float]");
                CheckTable(db, "EmployeeSalaryDetail", fields, new string[] { "ID" });
                break;

            case 12:
                fields.Add("ID", "[int]");
                fields.Add("CompanyID", "[int]");
                fields.Add("Year", "[int]");
                fields.Add("Name", "[nvarchar](200)");//   Income/Expence Name
                fields.Add("Type", "[int]");//Income-0,Expense-1   
                fields.Add("Data", "[image]");
                fields.Add("DataSize", "[int]");
                fields.Add("Amount", "[float]");
                CheckTable(db, "IncomeExpense", fields, new string[] { "ID" });
                break;

            case 13://MST_ASSESSMENT
                fields.Add("ASST_ID", "[int]");
                fields.Add("ASST_YEAR", "[nvarchar](10)");
                fields.Add("FA_YEAR", "[nvarchar](10)");
                fields.Add("START_DATE", "[datetime]");
                fields.Add("END_DATE", "[datetime]");
                fields.Add("LAST_DATE_OF_PAYMENT", "[datetime]");
                fields.Add("FVU_VERSION", "[nvarchar](10)");
                fields.Add("INPUT_FILE_NAME_P", "[nvarchar](10)");
                fields.Add("VISIBILITY_FLAG", "[nvarchar](10)");
                fields.Add("DELETED", "[int]");
                CheckTable(db, "MST_ASSESSMENT", fields, new string[] { "ASST_ID" });
                break;

            case 14:     //MST_COMPANY
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
                fields.Add("LICENSE_ID", "[int]");
                fields.Add("DELETED", "[int]");
                fields.Add("RRA_COMPANY_ID", "[int]");
                CheckTable(db, "MST_COMPANY", fields, new string[] { "COMPANY_ID" });
                break;

            case 15:  //MST_EMPLOYEE
                fields.Add("EMPLOYEE_ID", "[int]");
                fields.Add("EMPLOYEE_NAME ", "[nvarchar](100)");
                fields.Add("EMPLOYEE_PAN", "[nvarchar](10)");
                fields.Add("GROUP_ID", "[int]");
                fields.Add("COMPANY_ID", "[int]");
                fields.Add("DESIGNATION", "[nvarchar](50)");
                fields.Add("CATEGORY", "[nvarchar](10)");
                fields.Add("EMPLOYEE_REF", "[nvarchar](10)");
                fields.Add("DOB", "[datetime]");
                fields.Add("DOJ", "[datetime]");
                fields.Add("ADDRESS", "[nvarchar](200)");
                fields.Add("DELETED", "[int]");
                fields.Add("RRA_COMPANY_ID", "[int]");
                CheckTable(db, "MST_EMPLOYEE", fields, new string[] { "EMPLOYEE_ID" });
                break;

            case 16:  //MST_DEDUCTEE
                fields.Add("DEDUCTEE_ID", "[int]");
                fields.Add("DEDUCTEE_CODE", "[nvarchar](2)");
                fields.Add("DEDUCTEE_NAME", "[nvarchar](100)");
                fields.Add("DEDUCTEE_PAN", "[nvarchar](10)");
                fields.Add("GROUP_ID", "[int]");
                fields.Add("ADDRESS1", "[nvarchar](100)");
                fields.Add("ADDRESS2", "[nvarchar](100)");
                fields.Add("ADDRESS3", "[nvarchar](100)");
                fields.Add("ADDRESS4", "[nvarchar](100)");
                fields.Add("ADDRESS5", "[nvarchar](100)");
                fields.Add("STATE_ID", "[int]");
                fields.Add("PIN_CODE", "[nvarchar](10)");
                fields.Add("MOBILE_NO", "[nvarchar](20)");
                fields.Add("EMAIL", "[nvarchar](100)");
                fields.Add("DEDUCTEE_REF", "[nvarchar](10)");
                fields.Add("COMPANY_ID", "[int]");
                fields.Add("DELETED", "[int]");
                fields.Add("RRA_COMPANY_ID", "[int]");
                CheckTable(db, "MST_DEDUCTEE", fields, new string[] { "DEDUCTEE_ID" });
                break;

            case 17:
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
                fields.Add("PREV_FILED", "[int]");
                fields.Add("PREV_PRN_NO", "[nvarchar](20)");
                fields.Add("YEAR", "[int]");
                fields.Add("ACCEPT_FLAG", "[int]");
                fields.Add("CORRECTION_ID", "[int]");
                fields.Add("DELETED", "[int]");
                fields.Add("RRA_COMPANY_ID", "[int]");
                CheckTable(db, "TRN_BASIC_INFO", fields, new string[] { "BASIC_INFO_ID" });
                break;

            case 18: //TRN_COMPANY_INFO
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
                fields.Add("DELETED", "[int]");
                fields.Add("RRA_COMPANY_ID", "[int]");
                CheckTable(db, "TRN_COMPANY_INFO", fields, new string[] { "COMPANY_INFO_ID" });
                break;

            case 19:   //TRN_CHALLAN
                fields.Add("CHALLAN_ID", "[int]");
                fields.Add("BASIC_INFO_ID", "[int]");
                fields.Add("SL_NO", "[int]");
                fields.Add("SECTION_ID", "[int]");
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
                fields.Add("LATE_FEE", "[float]");
                fields.Add("MINOR_HEAD_ID", "[nvarchar](10)");
                fields.Add("TEMP_SL_NO", "[nvarchar](10)");

                fields.Add("COMPANY_ID", "[int]");
                fields.Add("QTR", "[nvarchar](2)");
                fields.Add("YEAR", "[int]");
                fields.Add("NSDL_STATUS", "[nvarchar](5)");  //Matched-M,Unmatched-U,Previously-Booked-P
                fields.Add("MODE", "[int]");                //Add-0,Update-1
                fields.Add("CORRECTION_ID", "[int]");
                fields.Add("DELETED", "[int]");
                fields.Add("RRA_COMPANY_ID", "[int]");
                CheckTable(db, "TRN_CHALLAN", fields, new string[] { "CHALLAN_ID" });
                break;

            case 20:  //TRN_DEDUCTEE_DETAILS
                fields.Add("DEDUCTEE_DETAIL_ID", "[int]");
                fields.Add("CHALLAN_ID", "[int]");
                fields.Add("BASIC_INFO_ID", "[int]");
                fields.Add("SL_NO", "[int]");
                fields.Add("PARTY_ID", "[int]");
                fields.Add("PAYMENT_DATE", "[datetime]");
                fields.Add("DEDUCTED_DATE", "[datetime]");
                fields.Add("PAYMENT_AMOUNT", "[float]");
                fields.Add("RATE", "[float]");
                fields.Add("TAX_AMOUNT", "[float]");
                fields.Add("SURCHARGE_AMOUNT", "[float]");
                fields.Add("CESS_AMOUNT", "[float]");
                fields.Add("TOTAL_AMOUNT", "[float]");
                fields.Add("TAX_DEPOSITED_AMOUNT", "[float]");
                fields.Add("NON_DEDUCTION_FLAG", "[nvarchar](2)");
                fields.Add("FROM_DATE", "[datetime]");
                fields.Add("TO_DATE", "[datetime]");
                fields.Add("GROSSING_UP_INDIC", "[nvarchar](2)");
                fields.Add("TOT_VALUE_PURCHAS", "[float]");
                fields.Add("CASH_BOOK_ENTRY", "[float]");
                fields.Add("SECTION_ID", "[nvarchar](10)");
                fields.Add("CERTIFICATE_NO", "[nvarchar](10)");
                fields.Add("REASON_ID", "[nvarchar](10)");
                fields.Add("TDS_APPLICABILITY_ID", "[nvarchar](10)");
                fields.Add("REMITTANCE_ID", "[nvarchar](10)");
                fields.Add("UNIQUE_ACKN", "[nvarchar](10)");
                fields.Add("COUNTRY_ID", "[nvarchar](10)");

                fields.Add("DEDUCTEE_ID", "[int]");
                fields.Add("DEDUCTEE_NAME", "[nvarchar](50)");
                fields.Add("DEDUCTEE_PAN", "[nvarchar](50)");
                fields.Add("MODE", "[int]");                //New-0,Update-1
                fields.Add("CORRECTIONID", "[int]");
                fields.Add("DELETED", "[int]");
                fields.Add("RRA_COMPANY_ID", "[int]");
                CheckTable(db, "TRN_DEDUCTEE_DETAILS", fields, new string[] { "DEDUCTEE_DETAIL_ID" });
                break;

            case 21:  //TRN_SALARY_DETAIL
                fields.Add("SALARY_DETAILS_ID", "[int]");
                fields.Add("BASIC_INFO_ID", "[int]");
                fields.Add("EMPLOYEE_ID", "[int]");
                fields.Add("FROM_DATE", "[datetime]");
                fields.Add("TO_DATE", "[datetime]");
                fields.Add("TS_GS_SEC_17_1", "[float]");
                fields.Add("TS_GS_SEC_17_2", "[float]");
                fields.Add("TS_GS_SEC_17_3", "[float]");
                fields.Add("TS_GS_TOTAL", "[float]");
                fields.Add("TS_LA_ITEM_1_DESC", "[nvarchar](50)");
                fields.Add("TS_LA_ITEM_1", "[float]");
                fields.Add("TS_LA_ITEM_2_DESC", "[nvarchar](50)");
                fields.Add("TS_LA_ITEM_2", "[float]");
                fields.Add("TS_LA_ITEM_3_DESC", "[nvarchar](50)");
                fields.Add("TS_LA_ITEM_3", "[float]");
                fields.Add("TS_LA_ITEM_4_DESC", "[nvarchar](50)");
                fields.Add("TS_LA_ITEM_4", "[float]");
                fields.Add("TS_LA_ITEM_5_DESC", "[nvarchar](50)");
                fields.Add("TS_LA_ITEM_5", "[float]");
                fields.Add("TS_LA_TOTAL", "[float]");
                fields.Add("TS_BALANCE", "[float]");
                fields.Add("US_16_EA", "[float]");
                fields.Add("US_16_TE", "[float]");
                fields.Add("US_16_AGGREGATE", "[float]");
                fields.Add("INCOME_CHARGEABLE", "[float]");
                fields.Add("AIS_ITEM_1_DESC", "[nvarchar](50)");
                fields.Add("AIS_ITEM_1", "[float]");
                fields.Add("AIS_ITEM_2_DESC", "[nvarchar](50)");
                fields.Add("AIS_ITEM_2", "[float]");
                fields.Add("AIS_ITEM_3_DESC", "[nvarchar](50)");
                fields.Add("AIS_ITEM_3", "[float]");
                fields.Add("AIS_ITEM_4_DESC", "[nvarchar](50)");
                fields.Add("AIS_ITEM_4", "[float]");
                fields.Add("AIS_Total", "[float]");
                fields.Add("GROSS_TOTAL_INCOME", "[float]");
                fields.Add("CVIA_SEC80C_ITEM_1_DESC", "[nvarchar](50)");
                fields.Add("CVIA_SEC80C_ITEM_1", "[float]");
                fields.Add("CVIA_SEC80C_ITEM_2_DESC", "[nvarchar](50)");
                fields.Add("CVIA_SEC80C_ITEM_2", "[float]");
                fields.Add("CVIA_SEC80C_ITEM_3_DESC", "[nvarchar](50)");
                fields.Add("CVIA_SEC80C_ITEM_3", "[float]");
                fields.Add("CVIA_SEC80C_ITEM_4_DESC", "[nvarchar](50)");
                fields.Add("CVIA_SEC80C_ITEM_4", "[float]");
                fields.Add("CVIA_SEC80C_ITEM_5_DESC", "[nvarchar](50)");
                fields.Add("CVIA_SEC80C_ITEM_5", "[float]");
                fields.Add("CVIA_SEC80C_ITEM_6_DESC", "[nvarchar](50)");
                fields.Add("CVIA_SEC80C_ITEM_6", "[float]");
                fields.Add("CVIA_SEC80C_GROSS_TOTAL", "[float]");
                fields.Add("CVIA_SEC80C_DED_TOTAL", "[float]");
                fields.Add("CVIA_SEC80CCC_GROSS_AMOUNT", "[float]");
                fields.Add("CVIA_SEC80CCC_DED_AMOUNT", "[float]");
                fields.Add("CVIA_SEC80CCD_GROSS_AMOUNT", "[float]");
                fields.Add("CVIA_SEC80CCD_DED_AMOUNT", "[float]");
                fields.Add("CVIA_SEC80CCE_TOTAL_DED_AMOUNT", "[float]");
                fields.Add("CVIA_SEC80CCF_GROSS_AMOUNT", "[float]");
                fields.Add("CVIA_SEC80CCF_DED_AMOUNT", "[float]");
                fields.Add("CVIA_SEC80CCG_GROSS_AMOUNT", "[float]");
                fields.Add("CVIA_SEC80CCG_DED_AMOUNT", "[float]");
                fields.Add("CVIA_OTH_ITEM_1_DESC", "[nvarchar](50)");
                fields.Add("CVIA_OTH_ITEM_1_GROSS_AMOUNT", "[float]");
                fields.Add("CVIA_OTH_ITEM_1_QUAL_AMOUNT", "[float]");
                fields.Add("CVIA_OTH_ITEM_1_DED_AMOUNT", "[float]");
                fields.Add("CVIA_OTH_ITEM_2_DESC", "[nvarchar](50)");
                fields.Add("CVIA_OTH_ITEM_2_GROSS_AMOUNT", "[float]");
                fields.Add("CVIA_OTH_ITEM_2_QUAL_AMOUNT", "[float]");
                fields.Add("CVIA_OTH_ITEM_2_DED_AMOUNT", "[float]");
                fields.Add("CVIA_OTH_ITEM_3_DESC", "[nvarchar](50)");
                fields.Add("CVIA_OTH_ITEM_3_GROSS_AMOUNT", "[float]");
                fields.Add("CVIA_OTH_ITEM_3_QUAL_AMOUNT", "[float]");
                fields.Add("CVIA_OTH_ITEM_3_DED_AMOUNT", "[float]");
                fields.Add("CVIA_OTH_ITEM_4_DESC", "[nvarchar](50)");
                fields.Add("CVIA_OTH_ITEM_4_GROSS_AMOUNT", "[float]");
                fields.Add("CVIA_OTH_ITEM_4_QUAL_AMOUNT", "[float]");
                fields.Add("CVIA_OTH_ITEM_4_DED_AMOUNT", "[float]");
                fields.Add("CVIA_OTH_ITEM_5_DESC", "[nvarchar](50)");
                fields.Add("CVIA_OTH_ITEM_5_GROSS_AMOUNT", "[float]");
                fields.Add("CVIA_OTH_ITEM_5_QUAL_AMOUNT", "[float]");
                fields.Add("CVIA_OTH_ITEM_5_DED_AMOUNT", "[float]");
                fields.Add("CVIA_OTH_DED_TOTAL", "[float]");
                fields.Add("CVIA_DED_TOTAL", "[float]");
                fields.Add("TOTAL_INCOME", "[float]");
                fields.Add("TAX_TOTAL_INCOME", "[float]");
                fields.Add("SCHG_TOTAL_INCOME", "[float]");
                fields.Add("ECESS_TOTAL_INCOME", "[float]");
                fields.Add("TAX_PAYABLE_AGGREGATE", "[float]");
                fields.Add("US_89_LESS", "[float]");
                fields.Add("TAX_PAYABLE", "[float]");
                fields.Add("TOTAL_TDS_DEDUCTED", "[float]");
                fields.Add("SHORTFALL_TAX", "[float]");
                fields.Add("ENTRY_MODE", "[int]");
                fields.Add("SL_NO", "[int]");
                fields.Add("TAXABLE_AMOUNT", "[float]");
                fields.Add("REPORTED_TAXABLE_AMOUNT", "[float]");
                fields.Add("TOTAL_TAX_DEDUCTED_AMOUNT", "[float]");
                fields.Add("PREVIOUS_TAX_DEDUCTED_TOTAL", "[float]");
                fields.Add("TAX_DEDUCTED_HIGHER_RATE", "[float]");
                fields.Add("BalanceCurrentEmployer", "[float]");
                fields.Add("BalancePriviousEmployer", "[float]");
                fields.Add("BrkUpTdsCurrentEmployer", "[float]");
                fields.Add("BrkUpTdsPevEmployer", "[float]");

                CheckTable(db, "TRN_SALARY_DETAILS", fields, new string[] { "SALARY_DETAILS_ID" });
                break;

            case 22:
                fields.Add("ID", "[int]");
                fields.Add("UsageType", "[int]");   //For MCA (ROC)-1,For E-Tender-2,Foreign Trade-3,Income Tax-4,Multiple Purpose-5,Other Purpose-6
                fields.Add("ClassType", "[int]");   //class1-1,class2-2,Class3-3
                fields.Add("UserType", "[int]");    //Individual-1  Organization-2   DGFT-3
                fields.Add("CirtificateType", "[int]"); //	 Signature-1  Encryption-2  Both-3
                fields.Add("CertificateValidity", "[int]"); // 1Year -1 ,2Years-2   
                fields.Add("NeedUsbToken", "[int]");  //Yes-1, No-0
                fields.Add("ApplicantName", "[nvarchar](200)");
                fields.Add("Surname", "[nvarchar](100)");
                fields.Add("Initial", "[nvarchar](100)");
                fields.Add("OrganizationName", "[nvarchar](100)");
                fields.Add("Department", "[nvarchar](100)");
                fields.Add("Gender", "[int]"); //Male-1 Female-2
                fields.Add("DOB", "[datetime]");
                fields.Add("Address", "[nvarchar](100)");
                fields.Add("PostalCode", "[int]");
                fields.Add("District", "[nvarchar](50)");
                fields.Add("State", "[nvarchar](50)");
                fields.Add("Country", "[nvarchar](50)");
                fields.Add("Pan", "[nvarchar](20)");
                fields.Add("Nationality", "[int]");
                fields.Add("MobileNo", "[nvarchar](15)");
                fields.Add("Email", "[nvarchar](100)");
                fields.Add("OrganisationType", "[int]");
                fields.Add("IdentificationDocument", "[int]");
                fields.Add("IdentificationDocumentNo", "[nvarchar](50)");
                fields.Add("AddressProofDocument", "[int]");
                fields.Add("AgentId", "[int]");
                fields.Add("Paid", "[int]");//0-not paid,1-paid
                fields.Add("PaymentRefID", "[int]");
                fields.Add("PickupAtDoor", "[int]"); //0-yes 1-no
                fields.Add("PickupCity", "[nvarchar](50)");
                fields.Add("PickupAddresSame", "[int]"); //0-Yes,No-1
                fields.Add("PickupAddress", "[nvarchar](200)");
                fields.Add("PickupAddressCity", "[nvarchar](50)");
                fields.Add("PickupAddressPostal", "[int]");
                fields.Add("Date", "[datetime]");
                fields.Add("DscStage", "[int]");//Assigned-0,Paid-1,Assigned-2,Made-3,Downloaded-4,Courier-5,OrigionalDocRecieved-6
                fields.Add("EntryTime", "[datetime]");
                fields.Add("BillNo", "[nvarchar](50)");
                fields.Add("Company", "[nvarchar](100)");
                fields.Add("Made", "[int]");
                fields.Add("Downloaded", "[int]");
                fields.Add("Complete", "[int]");
                fields.Add("DocReceived", "[int]");
                fields.Add("CompletionDate", "[datetime]");
                fields.Add("OrderNo", "[nvarchar](12)");
                fields.Add("TransactionID", "[nvarchar](50)");
                fields.Add("MIHPAYID", "[nvarchar](50)");
                fields.Add("Category", "[nvarchar](50)");
                CheckTable(db, "DscDetail", fields, new string[] { "ID" });
                break;

            case 23:
                fields.Add("ID", "[int]");
                fields.Add("Name", "[nvarchar](50)");   //For MCA (ROC)-1,For E-Tender-2,Foreign Trade-3,Income Tax-4,Multiple Purpose-5,Other Purpose-6
                fields.Add("LicenseId", "[int]");   //class1-1,class2-2,Class3-3
                fields.Add("Address", "[nvarchar](200)");    //Individual-1  Organization-2   DGFT-3
                CheckTable(db, "Company", fields, new string[] { "ID" });
                break;

            case 24:
                fields.Add("ID", "[int]");
                fields.Add("Name", "[nvarchar](100)");
                fields.Add("ContactNo", "[nvarchar](15)");
                fields.Add("Email", "[nvarchar](200)");
                fields.Add("CompanyName", "[nvarchar](100)");
                fields.Add("CompanyType", "[int]"); //Sole Proprietorship=1,Private Limited Company=2,Partnership Firm=3,Co-operatives=4,Public Limited Company=5,Joint Hindu Family Business=6,Limited Liability Partnership=7,OPC=8  
                fields.Add("State", "[int]");
                fields.Add("DIN", "[int]");
                fields.Add("DSC", "[int]");
                fields.Add("Capital", "[float]");
                fields.Add("AgentId", "[int]");
                fields.Add("Stage", "[int]");
                fields.Add("Paid", "[int]");//0-not paid,1-paid
                fields.Add("PaymentRefID", "[int]");
                fields.Add("OrderNo", "[nvarchar](12)");
                fields.Add("TransactionID", "[nvarchar](50)");
                fields.Add("MIHPAYID", "[nvarchar](50)");
                CheckTable(db, "Contact", fields, new string[] { "ID" });
                break;

            case 25:
                fields.Add("ID", "[int]");
                fields.Add("LicenseID", "[int]");
                fields.Add("Date", "[datetime]");
                fields.Add("Amount", "[float]");
                fields.Add("TransactionType", "[int]");  //Recharge-1,DSC-2
                fields.Add("RefID", "[int]"); //reference id of correspndind record like dsc or incorporate 
                fields.Add("TransactionID", "[nvarchar](50)");
                fields.Add("MIHPAYID", "[nvarchar](50)");
                CheckTable(db, "Payment", fields, new string[] { "ID" });
                break;

            case 26:
                fields.Add("ID", "[int]");
                fields.Add("Initial", "[int]"); //Shri/Mr=1,Smt./Mrs.=2, Kumari/Ms=3 
                fields.Add("FirstName", "[nvarchar](100)");
                fields.Add("MiddleName", "[nvarchar](100)");
                fields.Add("LastName", "[nvarchar](100)");
                fields.Add("PrintName", "[nvarchar](100)");
                fields.Add("Gender", "[nvarchar](5)");
                fields.Add("MaritalStatus", "[nvarchar](10)");
                fields.Add("DOB", "[datetime]");
                fields.Add("FatherFirstName", "[nvarchar](100)");
                fields.Add("FatherMiddleName", "[nvarchar](100)");
                fields.Add("FatherLastName", "[nvarchar](100)");
                fields.Add("R_Address1", "[nvarchar](100)");
                fields.Add("R_Address2", "[nvarchar](100)");
                fields.Add("R_Address3", "[nvarchar](100)");
                fields.Add("R_Address4", "[nvarchar](100)");
                fields.Add("R_Address5", "[nvarchar](100)");
                fields.Add("R_State", "[int]");
                fields.Add("R_Pin", "[int]");
                fields.Add("R_Country", "[nvarchar](10)");
                fields.Add("R_Zip", "[nvarchar](10)");
                fields.Add("O_Address1", "[nvarchar](100)");
                fields.Add("O_Address2", "[nvarchar](100)");
                fields.Add("O_Address3", "[nvarchar](100)");
                fields.Add("O_Address4", "[nvarchar](100)");
                fields.Add("O_Address5", "[nvarchar](100)");
                fields.Add("O_State", "[int]");
                fields.Add("O_Pin", "[int]");
                fields.Add("O_Country", "[nvarchar](10)");
                fields.Add("O_Zip", "[nvarchar](10)");
                fields.Add("AddressForComm", "[int]"); //Residencial-0,Office-1
                fields.Add("ISDCode", "[int]");
                fields.Add("TelephoneType", "[int]"); //Mobile-1,TelNo-2
                fields.Add("STDCode", "[int]");
                fields.Add("PhoneNo", "[nvarchar](15)");
                fields.Add("StatusOfApplication", "[int]");  //individual-0,Firm-2....
                fields.Add("AdharNo", "[nvarchar](50)");
                fields.Add("Profession", "[int]");
                fields.Add("SourceOfIncome", "[int]");
                fields.Add("AppointingAddress", "[int]"); //No-0,Yes-1
                fields.Add("ProofId", "[int]");
                fields.Add("ProofAddress", "[int]");
                fields.Add("ProofDOB", "[int]");
                fields.Add("VerifyName", "[nvarchar](100)");
                fields.Add("OtherName", "[nvarchar](100)");
                fields.Add("EmailId", "[nvarchar](50)");
                fields.Add("VerifyCapacity", "[int]");
                fields.Add("RA", "[int]");
                fields.Add("RA_Initial", "[int]"); //Shri/Mr=1,Smt./Mrs.=2, Kumari/Ms=3 
                fields.Add("RA_FName", "[nvarchar](100)");
                fields.Add("RA_MName", "[nvarchar](100)");
                fields.Add("RA_LName", "[nvarchar](100)");
                fields.Add("RA_Address1", "[nvarchar](100)");
                fields.Add("RA_Address2", "[nvarchar](100)");
                fields.Add("RA_Address3", "[nvarchar](100)");
                fields.Add("RA_Address4", "[nvarchar](100)");
                fields.Add("RA_Address5", "[nvarchar](100)");
                fields.Add("RA_City", "[nvarchar](100)");
                fields.Add("RA_State", "[int]");
                fields.Add("RA_Pin", "[nvarchar](6)");
                fields.Add("RA_Country", "[nvarchar](10)");
                fields.Add("VerifyPlace", "[nvarchar](100)");
                fields.Add("Paid", "[int]");
                fields.Add("Salaried", "[int]");
                fields.Add("TransactioId", "[nvarchar](20)");
                fields.Add("OrderNumber", "[nvarchar](20)");
                fields.Add("MIHPayID", "[nvarchar](20)");
                fields.Add("UserType", "[nvarchar](50)");
                fields.Add("Category", "[nvarchar](50)");
                fields.Add("Correction", "[nvarchar](50)");
                fields.Add("PANNumber", "[nvarchar](50)");
                fields.Add("OfficeAddressProof", "[int]");
                fields.Add("MobileNumber", "[nvarchar](50)");
                CheckTable(db, "PanDetail", fields, new string[] { "ID" });
                break;
            
            case 27:
                fields.Add("ID", "[int]");
                fields.Add("CompanyType", "[int]"); //LLP,OPC
                fields.Add("RegState", "[int]");
                fields.Add("Capital", "[float]");
                fields.Add("LastTurnoverYr1", "[nvarchar](10)");
                fields.Add("LastTurnoverAmount1", "[float]");
                fields.Add("LastTurnoverYr2", "[nvarchar](10)");
                fields.Add("LastTurnoverAmount2", "[float]");
                fields.Add("lastNetProfit1", "[float]");
                fields.Add("lastNetProfit2", "[float]");
                fields.Add("AssessmentDoneUpto", "[nvarchar](10)");
                fields.Add("flag1", "[int]");
                fields.Add("ListingDate", "[datetime]");
                fields.Add("OkToAssessment", "[int]");
                fields.Add("NetWorth", "[float]");
                fields.Add("AskingPrice", "[float]");
                fields.Add("ServiceFee", "[float]");
                fields.Add("YearOfIncorporation", "[nvarchar](10)");
                fields.Add("HeadLine", "[nvarchar](200)");
                fields.Add("GeneralSummary", "[nvarchar](2000)");
                fields.Add("EmailID", "[nvarchar](100)");
                fields.Add("ContactNo", "[nvarchar](15)");
                fields.Add("CIN", "[nvarchar](20)");
                fields.Add("City", "[nvarchar](50)");
                fields.Add("Approved", "[int]");
                fields.Add("Stage", "[int]");//Transaction stage
                fields.Add("Paid", "[int]");
                fields.Add("ListingExpiryDate", "[datetime]");
                fields.Add("OrderNo", "[nvarchar](12)");
                fields.Add("RelatedIndustry", "[nvarchar](150)");
                CheckTable(db, "SellBusiness", fields, new string[] { "ID" });
                break;

            case 28:
                fields.Add("UserID", "[int]");
                fields.Add("CompanyID", "[int]");
                CheckTable(db, "UserCompanyLink", fields, new string[] { "UserID", "CompanyID" });
                break;

            case 29:
                fields.Add("ID", "[int]");
                fields.Add("TableID", "[int]");
                fields.Add("PrimaryKeyID", "[int]");
                fields.Add("Note", "[nvarchar](400)");
                fields.Add("Date", "[datetime]");
                fields.Add("Minuts", "[int]");
                fields.Add("User", "[int]");
                fields.Add("AdminOnly", "[int]");
                CheckTable(db, "Note", fields, new string[] { "ID" });
                break;
            case 30:
                fields.Add("ID", "[int]");
                fields.Add("TableID", "[int]");
                fields.Add("PrimaryKeyID", "[int]");
                fields.Add("Note", "[nvarchar](400)");
                fields.Add("Date", "[datetime]");
                fields.Add("StageID", "[int]");
                fields.Add("Minuts", "[int]");
                fields.Add("User", "[int]");
                CheckTable(db, "Stage", fields, new string[] { "ID" });
                break;
            case 31:
                fields.Add("ID", "[int]");
                fields.Add("UserID", "[int]");
                fields.Add("CompanyID", "[int]");
                fields.Add("Stage", "[int]");
                fields.Add("Paid", "[int]");  //0-not paid,1-paid
                CheckTable(db, "BusinessRequest", fields, new string[] { "ID" });
                break;

            case 32:
                fields.Add("ID", "[int]");
                fields.Add("Pan", "[nvarchar](20)");
                fields.Add("Surname", "[nvarchar](100)");
                fields.Add("MiddleName", "[nvarchar](100)");
                fields.Add("FirstName", "[nvarchar](100)");
                fields.Add("AreaCode", "[nvarchar](10)");
                fields.Add("AOType", "[nvarchar](5)");
                fields.Add("RangeCode", "[nvarchar](5)");
                fields.Add("AONumber", "[nvarchar](5)");
                fields.Add("Jurisdiction", "[nvarchar](100)");
                fields.Add("BuildingName", "[nvarchar](100)");
                CheckTable(db, "PanVerification", fields, new string[] { "ID" });
                break;
            case 33:
                fields.Add("ID", "[int]");
                fields.Add("UserID", "[int]");
                fields.Add("TransactionID", "[nvarchar](100)");
                fields.Add("MIHPAYID", "[nvarchar](100)");
                fields.Add("Amount", "[nvarchar](50)");
                fields.Add("Paid", "[int]");
                CheckTable(db, "PanTransaction", fields, new string[] { "ID" });
                break;
            case 34:
                fields.Add("ID", "[int]");
                fields.Add("UserID", "[int]");
                fields.Add("TranscationID", "[nvarchar](20)");
                fields.Add("PANNumber", "[nvarchar](100)");
                fields.Add("PANVerified", "[int]");
                CheckTable(db, "PanTransactionVerified", fields, new string[] { "ID" });
                break;
            case 35:
                fields.Add("ID", "[int]");
                fields.Add("Name", "[nvarchar](100)");
                fields.Add("ParentID", "[int]");
                fields.Add("Content", "[image]");
                fields.Add("ContentSize", "[int]");
                CheckTable(db, "KnowledgePortal", fields, new string[] { "ID" });
                break;
            case 36:
                fields.Add("ID", "[int]");
                fields.Add("Initial", "[int]"); //Shri/Mr=1,Smt./Mrs.=2, Kumari/Ms=3 
                fields.Add("Name1", "[nvarchar](100)");
                fields.Add("Name2", "[nvarchar](100)");
                fields.Add("Name3", "[nvarchar](100)");
                fields.Add("Name4", "[nvarchar](100)");
                fields.Add("Name5", "[nvarchar](100)");
                fields.Add("Category", "[nvarchar](100)");
                fields.Add("O_Address1", "[nvarchar](100)");
                fields.Add("O_Address2", "[nvarchar](100)");
                fields.Add("O_Address3", "[nvarchar](100)");
                fields.Add("O_Address4", "[nvarchar](100)");
                fields.Add("O_Address5", "[nvarchar](100)");
                fields.Add("O_State", "[int]");
                fields.Add("O_Pin", "[int]");
                fields.Add("O_Country", "[nvarchar](10)");
                fields.Add("Nationality", "[nvarchar](10)");
                fields.Add("O_Zip", "[nvarchar](10)");
                fields.Add("ISDCode", "[int]");
                fields.Add("TelephoneType", "[int]"); //Mobile-1,TelNo-2
                fields.Add("STDCode", "[int]");
                fields.Add("PhoneNo", "[nvarchar](15)");
                fields.Add("StatusOfApplication", "[int]");  //individual-0,Firm-2....
                fields.Add("AdharNo", "[nvarchar](50)");
                fields.Add("Profession", "[int]");
                fields.Add("SourceOfIncome", "[int]");
                fields.Add("EmailId", "[nvarchar](50)");
                fields.Add("PANNumber", "[nvarchar](50)");
                fields.Add("TANNumber", "[nvarchar](50)");
                fields.Add("TCSNumber", "[nvarchar](50)");
                fields.Add("SubCategory", "[nvarchar](50)");
                fields.Add("Paid", "[int]");
                fields.Add("Salaried", "[int]");
                fields.Add("TransactionId", "[nvarchar](20)");
                fields.Add("OrderNumber", "[nvarchar](20)");
                fields.Add("MIHPayID", "[nvarchar](20)");
                fields.Add("UserType", "[nvarchar](50)");
                fields.Add("Correction", "[nvarchar](50)");
                fields.Add("MobileNumber", "[nvarchar](50)");
                fields.Add("TANNumber1", "[nvarchar](50)");
                CheckTable(db, "TanDetail", fields, new string[] { "ID" });
                break;
            default:
                return false;
        }
        return true;
    }
}

