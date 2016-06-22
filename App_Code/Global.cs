using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.IO;
using TDSModel;

public class DSCPrice
{
    public float Expenses;
    public float AgentShare;
    public float DocumentPickUp;
    public float Courier;
    public float PaymentGateway;
    public float Total
    {
        get
        {
            return Expenses + AgentShare + DocumentPickUp + Courier + PaymentGateway;
        }
    }
    public float SalePrice;
    public float TokenPrice;
    public float Vat;
}
//public enum TANCategory
//{
//    Company=1,
//    BranchOrDivisionOfACompany =2,
//    IndividualHindu Undivided Family(karta)=3,
//    Branch of Individual Business(Sole proprietorship concern) / Hindu Undivided Family(karta)=4,
//    Firm / Association of Persons / Association of Persons (Trusts) / Body of Individuals / Artificial juridical Person =5,
//    Branch of Firm / Association of Persons / Association of Persons (Trusts) / Body of Individuals / Artificial juridical Person=6
//}

public enum BusinessApproved
{
    Unapproved = 0,
    Approved = 1
}

public enum TableID
{
    DSC = 1,
    Sell_Business = 2,
    BuyBusiness = 3
}

public enum Message
{
    Valid,
    Invalid,
}

public enum TransType
{
    Recharge = 1,
    Dsc = 2,
    Incorporate = 3,
    SellBusiness = 4,
    BuyBusiness = 5,
    Pan = 6
}

public enum DscFeeType
{
    Class1 = 100,
    Class2 = 200,
    Class3 = 300
}

public class CounterIntKey
{
    public int? Key;
    public int Count;
}
public enum IdentificDocType
{
    Any_Government_Issued_Photo_ID = 158,
    Bank_Passbook = 91,
    Driving_License = 409,
    PAN_Card = 5,
    Passport = 2,
    Photo_ID_Card_Issued_by_Ministry_of_Home_Affairs_of_Centre_or_State_Government = 157,
    Post_Office_ID_Card = 156
}
public enum AdressProofDocType
{
    Aadhar_Card = 396,
    Bank_Statement = 161,
    Certificate_of_Registration_for_owned_Vehicle = 164,
    Driving_License = 93,
    Gas_Connection = 160,
    Latest_Electricity_Bill = 10,
    Latest_Telephone_Bill = 9,
    Passport = 92,
    Property_Tax_or_Corporation_or_Municipal_Corporation_receipt = 163,
    Service_Tax_or_VAT_or_Sales_Tax_registration_certificate = 162,
    Voters_ID_Card = 95,
    Water_Bill = 159
}
public enum CertificateOrganisation
{
    Annual_Report = 40,
    Certificate_of_Incorporation = 36,
    Latest_Income_Tax_Return = 41,
    Latest_Organisation_Bank_details_from_the_Bank = 43,
    Memorandum_of_Association = 37,
    Registered_Partnership_Deed = 38,
    Statement_of_Income_issued_by_Chartered_Accountant = 42,
    Valid_Business_License = 39
}


public enum IncorporateFeeType
{
    Sole_Proprietorship = 6000,
    Private_Limited_Company = 16000,
    Partnership_Firm = 6000,
    Co_operatives = 6000,
    Public_Limited_Company = 38000,
    Joint_Hindu_Family_Business = 6000,
    Limited_Liability_Partnership = 8000,
    OPC = 16000
}

public enum AdminTabs
{
    DashBoard = 0,
    DSC = 1,
    Payment = 2,
    Incorporate = 3,
    BusinessSell = 4,
    BusinessBuyRequest = 5,
    License = 6,
    PAN = 7,
    TAN = 8
}

public enum TransactionStage
{
    All = -1,
    Unassigned = 0,
    Assigned = 2,
    Made = 3,
    Downloaded = 4,
    Courier = 5,
    Original_Doc_Recieved = 6,
    Complete = 7,
    Incomplete = 8
}

public enum DSCStage
{
    None = -2,
    All = -1,
    Unassigned = 0,
    Assigned = 2,
    Made = 3,
    Downloaded = 4,
    Courier = 5,
    Original_Doc_Recieved = 6,
    Complete = 7,
    Incomplete = 8
}

public enum IncorpStage
{
    None = -2,
    All = -1,
    Unassigned = 0,
    Assigned = 1,
    Followup = 2,
    Doc_Received = 3,
    In_Process = 4,
    Complete = 5
}

public enum SellBusinessStage
{
    None = -2,
    All = -1,
    Unapproved = 0,
    Approved = 1,
    Expired = 3,
}

public enum BuyBusinessStage
{
    None = -2,
    All = -1,
    Unapproved = 0,
    Followup = 1,
    Complete = 3,
}

public enum UserTypes : int
{
    UT_Customer = 0,
    UT_Agent = 1,
    UT_AgentAdmin = 2,
    UT_Admin = 3
}

public enum CompanyType
{
    //Sole_Proprietorship=1,
    Private_Limited = 2,
    Partnership_Firm = 3,
    Co_operatives = 4,
    Public_Limited = 5,
    Joint_Hindu_Family = 6,
    Limited_Liability_Partnership = 7,
    OPC = 8,
    NBFC_Category_A = 9,
    NBFC_Category_B = 10
}

public enum UsageType
{
    MCA = 1,
    E_Tender = 2,
    Foreign_Trade = 3,
    Income_Tax = 4,
    Multiple_Purpose = 5,
    Other_Purpose = 6
}
public enum ClassType
{
    Class1 = 1,
    Class2 = 2,
    Class3 = 3,
    DGFT = 4
}
public enum DscUserType
{
    Individual = 0,
    Organization = 1
}

public enum CertificateType
{
    Signature = 0,
    Encryption = 1,
    Both = 2
}

public enum CertificateValidity
{
    One = 0,
    Two = 1
}

public enum UsbToken
{
    No = 0,
    Yes = 1
}

public enum enmResponse
{
    None = 0,
    Success = 1,
    Failed = 2,
    SessionTimeout = 3,
}
public enum Month
{
    Apr = 1,
    May = 2,
    Jun = 3,
    Jul = 4,
    Aug = 5,
    Sep = 6,
    Oct = 7,
    Nov = 8,
    Dec = 9,
    Jan = 10,
    Feb = 11,
    Mar = 12
}
public enum AmountType
{
    Income = 1,
    Deduction = 2

}
public enum Deduction
{
    PF = 1,
    //Loan=2,
    VPF = 2,
    TDS = 3,
    ProfessionTax = 4,
}
public enum Income
{
    Basic = 1,
    HRA = 2,
    TravelAll = 3,
    Medical = 4,
    SpecialAll = 5,
    Other = 6,
    DA = 7,
    LTA = 8,
    UniformAll = 9,
    ChildrenEducAll = 10
}

public enum RegularReturnType
{
    _24Q = 1,
    _26Q = 2,
    _27Q = 3,
    _27EQ = 4
}

public enum DeducteeType
{
    Company = 1,
    NonCompany = 2,
}

public enum Quarter
{
    Q1 = 1,
    Q2 = 2,
    Q3 = 3,
    Q4 = 4
}

public class Range
{
    public double Min;
    public double Max;

    public Range(double Min, double Max)
    {
        this.Min = Min;
        this.Max = Max;
    }
}

public class Global
{
    // private static string DownloadedFileName = "";
    public static HttpWebResponse _Response = null;

    public static Dictionary<string, string> DeductorType = new Dictionary<string, string>();
    public static string[] dedType = {
                     "Central Government","A",
                      "State Government","S",
                      "Statutory body (Central Govt.)","D",
                      "Statutory body (State Govt.)","E",
                      "Autonomous body (Central Govt.)","G",
                      "Autonomous body (State Govt.)","H",
                      "Local Authority (Central Govt.)","L",
                      "Local Authority (State Govt.)","N",
                      "Company","K",
                      "Branch / Division of Company","M",
                      "Association of Person (AOP)","P",
                      "Association of Person (Trust)","T",
                      "Artificial Juridical Person","J",
                      "Body of Individuals","B",
                      "Individual/HUF","Q",
                      "Firm","F"
                  };
    public static Dictionary<string, string> NSDLStatus = new Dictionary<string, string>();
    public static string[] NSDLStatusArray = {
                                            "Matched","M",
                                            "Unmatched","U",
                                            "Booked","P",
                                         };
    public static Dictionary<int, string> State = new Dictionary<int, string>();
    public static string[] StateArray = {
                                            "ANDAMAN AND NICOBAR ISLANDS","1",
                                            "ANDHRA PRADESH","2",
                                            "ARUNACHAL PRADESH","3",
                                            "ASSAM","4",
                                            "BIHAR","5 ",
                                            "CHANDIGARH","6",
                                            "DADRA & NAGAR HAVELI","7",
                                            "DAMAN & DIU","8",
                                            "DELHI","9",
                                            "GOA","10",
                                            "GUJARAT","11",
                                            "HARYANA","12",
                                            "HIMACHAL PRADESH","13",
                                            "JAMMU & KASHMIR","14",
                                            "KARNATAKA","15",
                                            "KERALA","16",
                                            "LAKSHWADEEP","17",
                                            "MADHYA PRADESH","18",
                                            "MAHARASHTRA","19",
                                            "MANIPUR","20",
                                            "MEGHALAYA","21",
                                            "MIZORAM","22",
                                            "NAGALAND","23",
                                            "ORISSA","24",
                                            "PONDICHERRY","25",
                                            "PUNJAB","26",
                                            "RAJASTHAN","27 ",
                                            "SIKKIM","28",
                                            "TAMILNADU","29",
                                            "TRIPURA","30",
                                            "UTTAR PRADESH","31",
                                            "WEST BENGAL","32",
                                            "CHHATISHGARH","33",
                                            "UTTARANCHAL","34",
                                            "JHARKHAND","35",
                                            "TELANGANA","36",
                                            "OTHERS","99"
                                         };

    public static Dictionary<string, string> Ministry = new Dictionary<string, string>();
    public static string[] MinistryArray = {
                                            
                                                 "Agriculture","01",
                                                 "Atomic Energy","02",
                                                 "Fertilizers","03",
                                                 "Chemicals and Petrochemicals","04",
                                                 "Civil Aviation and Tourism","05",
                                                 "Coal","06",
                                                 "Consumer Affairs1 Food and Public Distribution","07",
                                                 "Commerce and Textiles","08",
                                                 "Environment and Forests and Ministry of Earth Science","09",
                                                 "External Affairs and Overseas Indian Affairs","10",
                                                 "Finance","11",
                                                 "Central Board of Direct Taxes","12",
                                                 "Central Board of Excise and Customs","13",
                                                 "Contoller of Aid Accounts and Audit","14",
                                                 "Central Pension Accounting Office","15",
                                                 "Food Processing Industries","16",
                                                 "Health and Family Welfare","17",
                                                 "Home Affairs and Development of North Eastern Region","18",
                                                 "Human Resource Development","19",
                                                 "Industry","20",
                                                 "Information and Broadcasting","21",
                                                 "Telecommunication and Information Technology","22",
                                                 "Labour","23",
                                                 "Law and Justice and Company Affairs","24",
                                                 "Personnel1 Public Grievances and Pensions","25",
                                                 "Petroleum and Natural Gas","26",
                                                 "Plannning1 Statistics and Programme Implementation","27",
                                                 "Power","28",
                                                 "New and Renewable Energy","29",
                                                 "Rural Development and Panchayati Raj","30",
                                                 "Science And Technology","31",
                                                 "Space","32",
                                                 "Steel","33",
                                                 "Mines","34",
                                                 "Social Justice and Empowerment","35",
                                                 "Tribal Affairs","36",
                                                 "D4o Commerce 2Supply Division3","37",
                                                 "Shipping and Road Transport and Highways","38",
                                                 "Urban Development1 Urban Employment and Poverty Allevia","39",
                                                 "Water Resources","40",
                                                 "Presidents Secretariat","41",
                                                 "Lok Sabha Secretariat","42",
                                                 "Rajya Sabha secretariat","43",
                                                 "Election Commission","44",
                                                 "Ministry of Defence 2Controller General of Defence Accounts3","45",
                                                 "Ministry of Railways","46",
                                                 "Department of Posts","47",
                                                 "Department of Telecommunications","48",
                                                 "Andaman and Nicobar Islands Administration","49",
                                                 "Chandigarh Administration","50",
                                                 "Dadra and Nagar Haveli","51",
                                                 "Goa1 Daman and Diu","52",
                                                 "Lakshadweep","53",
                                                 "Pondicherry Administration","54",
                                                 "Pay and Accounts Officers 2Audit3","55",
                                                 "Ministry of Non conventional energy sources","56",
                                                 "Government Of NCT of Delhi","57",
                                                 "Others","99"
                                         };

    public static Dictionary<string, string> EmployeeCategory = new Dictionary<string, string>();
    public static string[] EmployeeCategoryArray = {
                                            
                                            "G-General","G",
                                            "W-Female","W",
                                            "S-Senior_Citizen","S",
                                            "O-Very_Senio_Citizen","O"
                                            };

    public static Dictionary<int, List<MST_EMPLOYEE>> Employee = new Dictionary<int, List<MST_EMPLOYEE>>();
    public static Dictionary<int, List<MST_DEDUCTEE>> Deductee = new Dictionary<int, List<MST_DEDUCTEE>>();
    public static Dictionary<int, TDSModel.User> UserList = new Dictionary<int, TDSModel.User>();
    public static Dictionary<string, string> PincodeList = new Dictionary<string, string>();
    public static Dictionary<String, String> CityListByState = new Dictionary<String, String>();
    public static List<License> LicenseList = new List<License>();


    public Global()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static int GetTime(object obj)
    {
        if (obj is TransactionStage)
        {
            switch ((TransactionStage)obj)
            {
                case TransactionStage.Unassigned: return 120;
                case TransactionStage.Assigned: return 40;
                case TransactionStage.Made: return 180;
                case TransactionStage.Downloaded: return 120;
                case TransactionStage.Courier: return 120;
                case TransactionStage.Original_Doc_Recieved: return 100;
                case TransactionStage.Complete: return 0;
                case TransactionStage.Incomplete: return 120;
            }
        }
        return 0;
    }

    public static string GetText(object obj)
    {
        if (obj is UserTypes)
        {
            switch ((UserTypes)obj)
            {
                case UserTypes.UT_Admin: return "Admin";
                case UserTypes.UT_Agent: return "Agent";
                case UserTypes.UT_AgentAdmin: return "Agent Admin";
                default:
                    return "Customer";
            }
        }

        else if (obj is ClassType)
        {
            switch ((ClassType)obj)
            {
                case ClassType.Class2: return "Class 2";
                case ClassType.Class3: return "Class 3";
                case ClassType.DGFT: return "DGFT";
            }
        }
        else if (obj is IdentificDocType)
        {
            switch ((IdentificDocType)obj)
            {
                case IdentificDocType.Any_Government_Issued_Photo_ID: return "Gov. ID";
                case IdentificDocType.Bank_Passbook: return "Bank Passbook";
                case IdentificDocType.Driving_License: return "DL";
                case IdentificDocType.PAN_Card: return "PAN";
                case IdentificDocType.Passport: return "Passport";
                case IdentificDocType.Photo_ID_Card_Issued_by_Ministry_of_Home_Affairs_of_Centre_or_State_Government: return "Gov. ID";
                case IdentificDocType.Post_Office_ID_Card: return "Postoffice ID";
            }
        }
        else if (obj is AdressProofDocType)
        {
            switch ((AdressProofDocType)obj)
            {
                case AdressProofDocType.Aadhar_Card: return "Aadhar Card";
                case AdressProofDocType.Bank_Statement: return "Bank Statement";
                case AdressProofDocType.Certificate_of_Registration_for_owned_Vehicle: return "Certificate of Registration for owned Vehicle";
                case AdressProofDocType.Driving_License: return "Driving License";
                case AdressProofDocType.Gas_Connection: return "Gas Connection";
                case AdressProofDocType.Latest_Electricity_Bill: return "Latest Electricity Bill";
                case AdressProofDocType.Latest_Telephone_Bill: return "Latest Telephone Bill";
                case AdressProofDocType.Passport: return "Passport";
                case AdressProofDocType.Property_Tax_or_Corporation_or_Municipal_Corporation_receipt: return "Property Tax or Corporation or Municipal Corporation receipt";
                case AdressProofDocType.Service_Tax_or_VAT_or_Sales_Tax_registration_certificate: return "Service Tax or VAT or Sales Tax registration certificate";
                case AdressProofDocType.Voters_ID_Card: return "Voters ID Card";
                case AdressProofDocType.Water_Bill: return "Water Bill";
            }
        }
        else if (obj is CertificateOrganisation)
        {
            switch ((CertificateOrganisation)obj)
            {
                case CertificateOrganisation.Annual_Report: return "Annual Report";
                case CertificateOrganisation.Certificate_of_Incorporation: return "Certificate of Incorporation";
                case CertificateOrganisation.Latest_Income_Tax_Return: return "Latest Income Tax Return";
                case CertificateOrganisation.Latest_Organisation_Bank_details_from_the_Bank: return "Driving License";
                case CertificateOrganisation.Memorandum_of_Association: return "Memorandum of Association";
                case CertificateOrganisation.Registered_Partnership_Deed: return "Registered Partnership Deed";
                case CertificateOrganisation.Statement_of_Income_issued_by_Chartered_Accountant: return "Statement of Income issued by Chartered Accountant";
                case CertificateOrganisation.Valid_Business_License: return "Valid Business License";

            }
        }
        else if (obj is TransactionStage)
        {
            switch ((TransactionStage)obj)
            {
                case TransactionStage.All: return "All";
                case TransactionStage.Unassigned: return "Unassigned";
                case TransactionStage.Assigned: return "Assigned";
                case TransactionStage.Made: return "Made";
                case TransactionStage.Downloaded: return "Downloaded";
                case TransactionStage.Courier: return "Courier";
                case TransactionStage.Original_Doc_Recieved: return "Doc Recieved";
                case TransactionStage.Complete: return "Complete";
                case TransactionStage.Incomplete: return "Incomplete";
            }
        }
        else if (obj is DSCStage)
        {
            switch ((DSCStage)obj)
            {
                case DSCStage.All: return "All";
                case DSCStage.Unassigned: return "Unassigned";
                case DSCStage.Assigned: return "Assigned";
                case DSCStage.Made: return "Made";
                case DSCStage.Downloaded: return "Downloaded";
                case DSCStage.Courier: return "Courier";
                case DSCStage.Original_Doc_Recieved: return "Doc Recieved";
                case DSCStage.Complete: return "Complete";
                case DSCStage.Incomplete: return "Incomplete";
            }
        }
        else if (obj is IncorpStage)
        {
            switch ((IncorpStage)obj)
            {
                case IncorpStage.All: return "All";
                case IncorpStage.Unassigned: return "Unassigned";
                case IncorpStage.Assigned: return "Assigned";
                case IncorpStage.Followup: return "Follow-Up";
                case IncorpStage.Doc_Received: return "Doc Received";
                case IncorpStage.In_Process: return "In Process";
                case IncorpStage.Complete: return "Complete";
            }
        }
        else if (obj is SellBusinessStage)
        {
            switch ((SellBusinessStage)obj)
            {
                case SellBusinessStage.All: return "All";
                case SellBusinessStage.Unapproved: return "Unapproved";
                case SellBusinessStage.Approved: return "Approved";
                case SellBusinessStage.Expired: return "Expired";
            }
        }
        else if (obj is BuyBusinessStage)
        {
            switch ((BuyBusinessStage)obj)
            {
                case BuyBusinessStage.All: return "All";
                case BuyBusinessStage.Unapproved: return "Unapproved";
                case BuyBusinessStage.Followup: return "Follow-Up";
                case BuyBusinessStage.Complete: return "Complete";
            }
        }
        else if (obj is TableID)
        {
            switch ((TableID)obj)
            {
                case TableID.DSC: return "DSC";
                case TableID.Sell_Business: return "Sell Business";
                case TableID.BuyBusiness: return "Buy Business";
            }
        }

        else if (obj is IncorporateFeeType)
        {
            switch ((IncorporateFeeType)obj)
            {
                case IncorporateFeeType.Sole_Proprietorship: return "Sole Proprietorship";
                case IncorporateFeeType.Private_Limited_Company: return "Private Limited Company";
                //case IncorporateFeeType.Partnership_Firm: return "Partnership Firm";
                //case IncorporateFeeType.Co_operatives: return "Co operativesretutn";
                case IncorporateFeeType.Public_Limited_Company: return "Public Limited Companyretutn";
                //case IncorporateFeeType.Joint_Hindu_Family_Business: return "Joint Hindu Family Business";
                case IncorporateFeeType.Limited_Liability_Partnership: return "Limited Liability Partnership";
                //case IncorporateFeeType.OPC: return "OPC";
            }

        }
        else if (obj is AdminTabs)
        {
            switch ((AdminTabs)obj)
            {
                case AdminTabs.DashBoard: return "Dashboard";
                case AdminTabs.DSC: return "DSC";
                case AdminTabs.Payment: return "Payment";
                case AdminTabs.Incorporate: return "Incorporate";
                case AdminTabs.BusinessSell: return "Sell Business";
                case AdminTabs.BusinessBuyRequest: return "Buy Request";
                case AdminTabs.License: return "License";
                case AdminTabs.PAN: return "PAN";
                case AdminTabs.TAN: return "TAN";
            }
        }

        else if (obj is CompanyType)
        {
            switch ((CompanyType)obj)
            {
                case CompanyType.Private_Limited: return "Private Limited";
                case CompanyType.Partnership_Firm: return "Partnership Firm";
                case CompanyType.Co_operatives: return "Co-operatives";
                case CompanyType.Public_Limited: return "Public Limited";
                case CompanyType.Joint_Hindu_Family: return "Joint Hindu Family";
                case CompanyType.Limited_Liability_Partnership: return "Limited Liability Partnership";
                case CompanyType.OPC: return "OPC";
                case CompanyType.NBFC_Category_A: return "NBFC Category A";
                case CompanyType.NBFC_Category_B: return "NBFC Category B";
            }
        }

        else if (obj is UsageType)
        {
            switch ((UsageType)obj)
            {

                case UsageType.MCA: return "MCA";
                case UsageType.E_Tender: return "E Tender";
                case UsageType.Foreign_Trade: return "Foreign Trade";
                case UsageType.Income_Tax: return "Income Tax";
                case UsageType.Multiple_Purpose: return "Multiple Purpose";
                case UsageType.Other_Purpose: return "Other Purpose";
            }
        }

        else if (obj is DscUserType)
        {
            switch ((DscUserType)obj)
            {

                case DscUserType.Individual: return "Individual";
                case DscUserType.Organization: return "Organization";
            }
        }

        else if (obj is CertificateType)
        {
            switch ((CertificateType)obj)
            {
                case CertificateType.Signature: return "Signature";
                case CertificateType.Encryption: return "Encryption";
                case CertificateType.Both: return "Both";
            }
        }

        else if (obj is CertificateValidity)
        {
            switch ((CertificateValidity)obj)
            {
                case CertificateValidity.One: return "One";
                case CertificateValidity.Two: return "Two";
            }
        }

        else if (obj is UsbToken)
        {
            switch ((UsbToken)obj)
            {
                case UsbToken.No: return "No";
                case UsbToken.Yes: return "Yes";
            }
        }

        else if (obj is enmResponse)
        {
            switch ((enmResponse)obj)
            {
                case enmResponse.None: return "None";
                case enmResponse.Success: return "Success";
                case enmResponse.Failed: return "Failed";
                case enmResponse.SessionTimeout: return "Session Timeout";
            }
        }

        else if (obj is Month)
        {
            switch ((Month)obj)
            {
                case Month.Apr: return "Apr";
                case Month.May: return "May";
                case Month.Jun: return "Jun";
                case Month.Jul: return "Jul";
                case Month.Aug: return "Aug";
                case Month.Sep: return "Sep";
                case Month.Oct: return "Oct";
                case Month.Nov: return "Nov";
                case Month.Dec: return "Dec";
                case Month.Jan: return "Jan";
                case Month.Feb: return "Feb";
                case Month.Mar: return "Mar";
            }
        }
        else if (obj is AmountType)
        {
            switch ((AmountType)obj)
            {
                case AmountType.Income: return "Imcome";
                case AmountType.Deduction: return "Deduction";
            }
        }

        else if (obj is Income)
        {
            switch ((Income)obj)
            {
                case Income.Basic: return "Basic";
                case Income.HRA: return "HRA";
                case Income.TravelAll: return "Travel All";
                case Income.Medical: return "Medical";
                case Income.SpecialAll: return "Special All";
                case Income.Other: return "Other";
                case Income.DA: return "DA";
                case Income.LTA: return "LTA";
                case Income.UniformAll: return "Uniform All";
                case Income.ChildrenEducAll: return "Children Education All";
            }
        }

        else if (obj is RegularReturnType)
        {
            switch ((RegularReturnType)obj)
            {
                case RegularReturnType._24Q: return "24Q";
                case RegularReturnType._26Q: return "26Q";
                case RegularReturnType._27Q: return "27Q";
                case RegularReturnType._27EQ: return "27EQ";
            }
        }

        else if (obj is DeducteeType)
        {
            switch ((DeducteeType)obj)
            {
                case DeducteeType.Company: return "Company";
                case DeducteeType.NonCompany: return "Non Company";
            }
        }

        else if (obj is Quarter)
        {
            switch ((Quarter)obj)
            {
                case Quarter.Q1: return "Q1";
                case Quarter.Q2: return "Q2";
                case Quarter.Q3: return "Q3";
                case Quarter.Q4: return "Q4";
            }
        }

        //public enum enmCHALLANIndex
        //{
        //    CHALLAN_ID,
        //    SL_NO,
        //    SECTION_ID,
        //    SECTION_NAME,
        //    DEPOSIT_DATE,
        //    BSR_CODE,
        //    CHALLAN_NO,
        //    TRANSFER_VOUCHER_NO,
        //    CHEQUE_NO,
        //    TDS,
        //    SURCHARGE,
        //    EDUCATION_CESS,
        //    INTEREST,
        //    OTHERS,
        //    TOT_TAX,
        //    CTRL_TDS,
        //    CTRL_SURCHARGE,
        //    CTRL_EDU_CESS,
        //    CTRL_TOT_TAX,
        //    CTRL_TOT,
        //    INTEREST_ALLOCATED,
        //    OTHERS_ALLOCATED,
        //    REMARKS,
        //    BOOK_ENTRY,
        //    FEE,
        //    MINOR_HEAD,
        //}

        //public enum enmSALARY_DETAILIndex
        //{
        //    SD_ID,
        //    SL_NO,
        //    EMPLOYEE_NAME,
        //    EMPLOYEE_PAN,
        //    EMPLOYEE_CATEGORY,
        //    FROM_DATE,
        //    TO_DATE,
        //    TS_BALANCE,
        //    US_16_AGGREGATE,
        //    INCOME_CHARGEABLE,
        //    AIS_TOTAL,
        //    GROSS_TOTAL_INCOME,
        //    CVIA_DED_TOTAL,
        //    TOTAL_INCOME,
        //    TAX_TOTAL_INCOME,
        //    SCHG_TOTAL_INCOME,
        //    ECESS_TOTAL_INCOME,
        //    TAX_PAYABLE_AGGREGATE,
        //    US_89_LESS,
        //    TAX_PAYABLE,
        //    TOTAL_TDS_DEDUCTED,
        //    SHORTFALL_TAX,
        //    TAXABLE_AMOUNT,
        //    REPORTED_TAXABLE_AMOUNT,
        //    TOTAL_TAX_DEDUCTED_AMOUNT,
        //    PREVIOUS_TAX_DEDUCTED_TOTAL,
        //    TAX_DEDUCTED_HIGHER_RATE,
        //}
        return "";
    }
    public static void LoadPincodeList()
    {
        string s = System.IO.File.ReadAllText(HttpContext.Current.Server.MapPath("~/Documents/File/Zoning1.txt"));
        s = s.Replace("\r\n", "^");
        string[] city = s.Split('^');
        for (int i = 1; i < city.Length - 1; i++)
        {
            string[] record = city[i].Split(',');
            string pin = record[0];
            string cty = record[1];
            string state = record[2];
            if (!CityListByState.ContainsKey(cty))
                CityListByState.Add(cty, state);
            if (!PincodeList.ContainsKey(pin))
                PincodeList.Add(pin, cty);
        }

    }
    public static void LoadGlobalData()
    {
        DeductorType.Clear();
        PincodeList.Clear();
        CityListByState.Clear();
        LoadPincodeList();
        for (int i = 0; i < dedType.Length; i += 2)
        {
            DeductorType.Add(dedType[i + 1], dedType[i]);
        }

        NSDLStatus.Clear();
        for (int i = 0; i < NSDLStatusArray.Length; i += 2)
        {
            NSDLStatus.Add(NSDLStatusArray[i + 1], NSDLStatusArray[i]);
        }

        State.Clear();
        for (int i = 0; i < StateArray.Length; i += 2)
        {
            State.Add(Cmn.ToInt(StateArray[i + 1]), StateArray[i]);
        }

        Ministry.Clear();
        for (int i = 0; i < MinistryArray.Length; i += 2)
        {
            Ministry.Add(MinistryArray[i + 1], MinistryArray[i]);
        }

        EmployeeCategory.Clear();
        for (int i = 0; i < EmployeeCategoryArray.Length; i += 2)
        {
            EmployeeCategory.Add(EmployeeCategoryArray[i + 1], EmployeeCategoryArray[i]);
        }

        List<MST_COMPANY> compList = MST_COMPANY.GetAllCompanies();
        foreach (MST_COMPANY comp in compList)
        {
            List<MST_EMPLOYEE> emp = MST_EMPLOYEE.GetByCompanyID(comp.COMPANY_ID);
            Employee.Add(comp.COMPANY_ID, emp);

            List<MST_DEDUCTEE> ded = MST_DEDUCTEE.GetByCompanyID(comp.COMPANY_ID);
            Deductee.Add(comp.COMPANY_ID, ded);
        }

        foreach (TDSModel.User u in TDSModel.User.GetAll())
        {
            UserList.Add(u.ID, u);
        }

        LicenseList.Clear();
        foreach (TDSModel.License l in TDSModel.License.GetAll())
        {
            LicenseList.Add(l);

            foreach (TDSModel.User u in UserList.Values.Where(m => m.LicenseID == l.ID))
            {
                l.UserList.Add(u);
                u.MyCompany = l;
            }
        }
    }

    public static string AppTitle
    {
        get
        {
            return "-";
        }
    }

    public static string ConnectionStringEntity
    {
        get
        {
            return @"metadata=res://*/App_Code.TDSModel.csdl|res://*/App_Code.TDSModel.ssdl|res://*/App_Code.TDSModel.msl;provider=System.Data.SqlServerCe.4.0;provider connection string=""data source=|DataDirectory|\TDS.sdf;""";
        }
    }

    public static string TdsConnnection
    {
        get
        {
            return @"Data Source=|DataDirectory|\TDS.sdf";
        }
    }

    public static int FormType
    {
        get
        {
            if (HttpContext.Current.Session["FORMTYPE"] == null)
                return -1;
            else
                return Cmn.ToInt(HttpContext.Current.Session["FORMTYPE"]);
        }
        set
        {
            HttpContext.Current.Session["FORMTYPE"] = value;
        }
    }

    public static Boolean LogInDone
    {
        get
        {
            if (HttpContext.Current.Session["LOGINDONE"] == null)
                return false;
            else
                return HttpContext.Current.Session["LOGINDONE"].ToString() == "1" ? true : false;
        }
        set
        {
            HttpContext.Current.Session["LOGINDONE"] = value ? "1" : "0";
        }
    }

    public static string UserName
    {
        get
        {
            if (HttpContext.Current.Session["USERNAME"] == null)
                return "";
            else
                return HttpContext.Current.Session["USERNAME"].ToString();
        }
        set
        {
            HttpContext.Current.Session["USERNAME"] = value;
        }
    }
    public static Boolean PAID
    {
        get
        {
            if (HttpContext.Current.Session["PAID"] == null)
                return false;
            else
                return HttpContext.Current.Session["PAID"].ToString() == "1" ? true : false;
        }
        set
        {
            HttpContext.Current.Session["PAID"] = value ? "1" : "0";
        }
    }
    public static string AMOUNT
    {
        get
        {
            if (HttpContext.Current.Session["AMOUNT"] == null)
                return "";
            else
                return HttpContext.Current.Session["AMOUNT"].ToString();
        }
        set
        {
            HttpContext.Current.Session["AMOUNT"] = value;
        }
    }
    public static string FileNameID
    {
        get
        {
            if (HttpContext.Current.Session["FileNameID"] == null)
                return "";
            else
                return HttpContext.Current.Session["FileNameID"].ToString();
        }
        set
        {
            HttpContext.Current.Session["FileNameID"] = value;
        }
    }
    public static string FileNameAdd
    {
        get
        {
            if (HttpContext.Current.Session["FileNameAdd"] == null)
                return "";
            else
                return HttpContext.Current.Session["FileNameAdd"].ToString();
        }
        set
        {
            HttpContext.Current.Session["FileNameAdd"] = value;
        }
    }
    public static List<PAN> PANSList
    {
        get
        {
            if (HttpContext.Current.Session["PANSList"] == null)
                return new List<PAN>();
            else
                return (List<PAN>)HttpContext.Current.Session["PANSList"];
        }
        set
        {
            HttpContext.Current.Session["PANSList"] = value;
        }
    }
    public static int LicenseID
    {
        get
        {
            if (HttpContext.Current.Session["LICENSEID"] == null)
                return -1;
            else
                return Cmn.ToInt(HttpContext.Current.Session["LICENSEID"]);
        }
        set
        {
            HttpContext.Current.Session["LICENSEID"] = value;
        }
    }

    public static int CompanyID
    {
        get
        {
            if (HttpContext.Current.Session["COMPANYID"] == null)
                return -1;
            else
                return Cmn.ToInt(HttpContext.Current.Session["COMPANYID"]);
        }
        set
        {
            HttpContext.Current.Session["COMPANYID"] = value;
        }
    }

    public static int ApplicationStage
    {
        get
        {
            if (HttpContext.Current.Session["STAGE"] == null)
                return -1;
            else
                return Cmn.ToInt(HttpContext.Current.Session["STAGE"]);
        }
        set
        {
            HttpContext.Current.Session["STAGE"] = value;
        }
    }

    public static UserTypes CurrentUserType
    {
        get
        {
            if (HttpContext.Current.Session["USERTYPE"] == null)
                return UserTypes.UT_Customer;
            else
            {
                return (UserTypes)Cmn.ToInt(HttpContext.Current.Session["USERTYPE"]);
            }
        }
        set
        {
            HttpContext.Current.Session["USERTYPE"] = (int)value;
        }
    }

    public static List<User> MyAgents
    {
        get
        {
            if (HttpContext.Current.Session["MyAgents"] == null)
                return null;
            else
                return (List<User>)HttpContext.Current.Session["MyAgents"];
        }
        set
        {
            HttpContext.Current.Session["MyAgents"] = value;
        }
    }

    public static string CompanyName
    {
        get
        {
            if (HttpContext.Current.Session["COMPANYNAME"] == null)
                return "";
            else
                return HttpContext.Current.Session["COMPANYNAME"].ToString();
        }

        set
        {
            HttpContext.Current.Session["COMPANYNAME"] = value;
        }
    }

    public static int UserID
    {
        get
        {
            if (HttpContext.Current.Session["USERID"] == null)
                return -1;
            else
                return Cmn.ToInt(HttpContext.Current.Session["USERID"]);
        }
        set
        {
            HttpContext.Current.Session["USERID"] = value;
        }
    }

    public static int FinancialYear
    {
        get
        {
            if (HttpContext.Current.Session["FINYEAR"] == null)
                return -1;
            else
                return Cmn.ToInt(HttpContext.Current.Session["FINYEAR"]);
        }
        set
        {
            HttpContext.Current.Session["FINYEAR"] = value;
        }
    }

    public static int FinancialYearID
    {
        get
        {
            if (HttpContext.Current.Session["FinancialYearID"] == null)
                return -1;
            else
                return Cmn.ToInt(HttpContext.Current.Session["FinancialYearID"]);
        }
        set
        {
            HttpContext.Current.Session["FinancialYearID"] = value;
        }
    }

    public static string Culture
    {
        get
        {
            if (HttpContext.Current.Session["Culture"] == null)
                return "en-US";
            else
                return HttpContext.Current.Session["Culture"].ToString();
        }

        set
        {
            HttpContext.Current.Session["Culture"] = value;
        }
    }

    public static string FromPage
    {
        get
        {
            if (HttpContext.Current.Session["FROMPAGE"] == null)
                return "";
            else
                return HttpContext.Current.Session["FROMPAGE"].ToString();
        }
        set
        {
            HttpContext.Current.Session["FROMPAGE"] = value;
        }
    }

    public static Boolean IsAdmin
    {
        get
        {
            if (HttpContext.Current.Session["ISADMIN"] == null)
                return false;
            else
                return HttpContext.Current.Session["ISADMIN"].ToString() == "1" ? true : false;
        }
        set
        {
            HttpContext.Current.Session["ISADMIN"] = value ? "1" : "0";
        }
    }


    public static string GetRootPathVirtual       //get vertual path
    {
        get
        {
            string host = (HttpContext.Current.Request.Url.IsDefaultPort) ?
            HttpContext.Current.Request.Url.Host :
            HttpContext.Current.Request.Url.Authority;
            host = String.Format("{0}://{1}", HttpContext.Current.Request.Url.Scheme, host);
            if (HttpContext.Current.Request.ApplicationPath == "/")
                return host;
            else
                return host + HttpContext.Current.Request.ApplicationPath;
        }
    }

    public static void GCCollect()
    {
        System.GC.Collect();
        System.GC.WaitForPendingFinalizers();
    }

    public static HttpWebResponse Last_HttpResponse
    {
        get
        {
            if (HttpContext.Current.Session["HttpResponse_Captcha"] == null)
                return null;
            else
                return (HttpWebResponse)HttpContext.Current.Session["HttpResponse_Captcha"];
        }
        set
        {
            HttpContext.Current.Session["HttpResponse_Captcha"] = value;
        }
    }

    public static Dictionary<string, string> cookieList
    {
        get
        {
            if (HttpContext.Current.Session["cookieList"] == null)
                return new Dictionary<string, string>();
            else
                return (Dictionary<string, string>)HttpContext.Current.Session["cookieList"];
        }
    }

    public static Dictionary<string, string> AddToCookieList(string Name, string Value)
    {
        Dictionary<string, string> d = cookieList;

        if (!d.ContainsKey(Name))
            d.Add(Name, Value);
        else
            d[Name] = Value;
        return d;
    }

    public static CookieCollection GetCookieCollection()
    {
        CookieCollection CC = new CookieCollection();
        foreach (KeyValuePair<string, string> KVP in CC)
        {
            CC.Add(new Cookie(KVP.Key, KVP.Value));
        }
        return CC;
    }

    public static string Captcha
    {
        get
        {
            if (HttpContext.Current.Session["Captcha"] == null)
                return "";
            else
                return (string)HttpContext.Current.Session["Captcha"];
        }
        set
        {
            HttpContext.Current.Session["Captcha"] = value;
        }
    }


    public static HttpWebRequest request
    {
        get
        {
            if (HttpContext.Current.Session["request"] == null)
                return null;
            else
                return (HttpWebRequest)HttpContext.Current.Session["request"];
        }
        set
        {
            HttpContext.Current.Session["request"] = value;
        }
    }
    public static HttpWebResponse response
    {
        get
        {
            if (HttpContext.Current.Session["response"] == null)
                return null;
            else
                return (HttpWebResponse)HttpContext.Current.Session["response"];
        }
        set
        {
            HttpContext.Current.Session["response"] = value;
        }
    }


    public static CookieContainer objContainer
    {
        get
        {
            if (HttpContext.Current.Session["objContainer"] == null)
                return new CookieContainer();
            else
                return (CookieContainer)HttpContext.Current.Session["objContainer"];
        }
        set
        {
            HttpContext.Current.Session["objContainer"] = value;
        }
    }

    public static TracesConnect objTraceConnect
    {
        get
        {
            if (HttpContext.Current.Session["objTraceConnect"] == null)
                return new TracesConnect();
            else
                return (TracesConnect)HttpContext.Current.Session["objTraceConnect"];
        }
        set
        {
            HttpContext.Current.Session["objTraceConnect"] = value;
        }
    }

    public static string FacebookAppID
    {
        get
        {
            return "1625167551050014";
        }
    }

    public static string FacebookSECRETID
    {
        get
        {
            return "ece7404dfca32777e3183597d0fdf672";
        }
    }


    public static string GoogleAppID
    {
        get
        {
            return "788348538794-thv9av0hi7ps1nhe8iqdunk60v1s439d.apps.googleusercontent.com";
        }
    }
    public static string GoogleSECRETID
    {
        get
        {
            return "KPo_y9OG-kbesgxN0cBdlbkn";
        }
    }

    public static DSCPrice GetDSCPrice(int Years, string ClassType, string EntityType, string SingatureType, string token)
    {
        DSCPrice dp = new DSCPrice();

        dp.Expenses = 200;
        dp.AgentShare = 60;
        dp.DocumentPickUp = 200;
        dp.Courier = 80;
        dp.PaymentGateway = 27.3f;
        dp.SalePrice = 810f;
        dp.TokenPrice = 0f;
        if (token == "0")  //Yes
            dp.TokenPrice = 500f;
        dp.Vat = 12.36f;

        switch (ClassType)
        {
            case "2": //class2
                switch (EntityType)
                {
                    case "0":  //individual 
                        switch (SingatureType)
                        {
                            case "2":  //both
                                dp.Expenses = 400;
                                dp.AgentShare = 120;
                                dp.SalePrice = 1710;
                                break;
                        }

                        break;
                    case "1": //organization
                        dp.Expenses = 300;
                        switch (SingatureType)
                        {
                            case "2":  //both
                                dp.SalePrice = 1710;
                                break;
                        }
                        break;
                }
                if (Years == 1)
                {
                    dp.SalePrice += 180;
                }
                break;

            case "3": //class3
                dp.AgentShare = 100;
                dp.Expenses = 1250;
                dp.SalePrice = 1800;
                switch (SingatureType)
                {
                    case "2":        //both
                        dp.Expenses = 1850;
                        dp.SalePrice = 2700;
                        break;
                }
                if (Years == 1)  //in case of 2 years
                {
                    dp.Expenses += 250;
                    dp.SalePrice += 450;
                }

                //if (Years == 1)
                //{
                //    dp.SalePrice += 180;
                //}
                break;

            case "4"://DGFT
                dp.Expenses = 0f;
                dp.AgentShare = 0f;
                switch (Years)
                {
                    case 0:
                        dp.SalePrice = 2250f;
                        dp.PaymentGateway = 75.84f;
                        break;
                    case 1:
                        dp.SalePrice = 2925f;
                        dp.PaymentGateway = 98.60f;
                        break;
                }
                break;
        }
        return dp;
    }
}
