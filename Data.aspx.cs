using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.Script.Serialization;
using TDSModel;
using System.Web;
using System.Net;
using System.Net.Mail;

public partial class Data : BasePage
{
    StringBuilder str = new StringBuilder();
    Boolean AppendError = true;

    protected new void Page_Load(object sender, EventArgs e)
    {
        // GEtData();
        //  GetDetailbyPin("201014");
        Action = QueryString("Action");
        string Data1 = Request.QueryString["Data1"] != null ? Request.QueryString["Data1"].ToString() : "";
        string Data2 = Request.QueryString["Data2"] != null ? Request.QueryString["Data2"].ToString() : "";
        string Data3 = Request.QueryString["Data3"] != null ? Request.QueryString["Data3"].ToString() : "";
        string Data4 = Request.QueryString["Data4"] != null ? Request.QueryString["Data4"].ToString() : "";
        string Data5 = Request.QueryString["Data5"] != null ? Request.QueryString["Data5"].ToString() : "";
        string Data6 = Request.QueryString["Data6"] != null ? Request.QueryString["Data6"].ToString() : "";
        string abc = HttpContext.Current.Request.UserAgent;
        string term = Request.QueryString["term"] != null ? Request.QueryString["term"].ToString() : "";

        string Error = "";

        try
        {
            switch (Action)
            {
                case "GetPan":
                    {
                        //StringBuilder str = new StringBuilder();
                        //try
                        //{
                        //}
                        //catch (Exception ex)
                        //{
                        //    //divData.InnerHtml = "Some error occured! Please try again.." + ex.Message;
                        //}
                    }
                    break;

                case "SaveIncomleteDscData":
                    {
                        AppendError = false;
                        NameValueCollection nvc = Request.Form;
                        if (nvc != null)
                        {
                            try
                            {
                                DscDetail DT = DscDetail.GetByID(Cmn.ToInt(Data1));
                                if (DT == null)
                                    DT = new DscDetail();

                                DT.ApplicantName = nvc["givenname"];
                                DT.Surname = nvc["surname"];
                                DT.Initial = nvc["initial"];
                                DT.Gender = Cmn.ToInt(nvc["ddGender"]);
                                DT.Address = nvc["address"];
                                DT.PostalCode = Cmn.ToInt(nvc["postalcodes"]);
                                DT.District = nvc["district"];
                                DT.State = nvc["state"];
                                DT.Pan = nvc["pannos"];
                                DT.Nationality = Cmn.ToInt(nvc["nationality"]);
                                DT.IdentificationDocument = Cmn.ToInt(nvc["identificationdocs"]);
                                DT.IdentificationDocumentNo = nvc["iddocnumber"];
                                DT.AddressProofDocument = Cmn.ToInt(nvc["addrsproofdocs"]);
                                DT.PickupAddresSame = Cmn.ToInt(nvc["physicalverification"]);
                                DT.PickupCity = nvc["pickupcities"];
                                DT.DOB = Cmn.ToDate(nvc["txtDOB"]);
                                DT.Email = nvc["emailid"];
                                DT.MobileNo = nvc["mobilenumber"];
                                DT.UserType = Cmn.ToInt(nvc["ddUserType"]);
                                DT.CirtificateType = Cmn.ToInt(nvc["ddCertificateType"]);
                                DT.CertificateValidity = Cmn.ToInt(nvc["ddCertificateValidity"]);
                                DT.NeedUsbToken = Cmn.ToInt(nvc["ddUsbToken"]);
                                DT.DscStage = (int)TransactionStage.Incomplete;

                                if (nvc["givenname"] != "" && nvc["emailid"] != "" && nvc["mobilenumber"] != "")
                                {
                                    DT.Save();
                                    if (DT.Email != "")
                                    {
                                        string mailBody_Incomplete = "<p>Dear <b>" + DT.ApplicantName + "</b></P>" +
                                        "<p>Thank you for considering us!</p><br/>" +
                                        "<p>We found that you have could not successfully complete your transaction at <href='http://fincomindia.in'>www.fincomindia.in</a><p><br/>" +
                                        "<p>Kindly let us know the problem that you encountered. We would be happy to assist you in this matter. For any assistance you can call us on <a href='tel:01204322456'>(0120) 432-2456</a>, <a href='tel:919650606247'>+91 9650606247</a>, <a href='tel:918826693260'>+91 8826693260</a> or write us at <a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p><br/><br/>" +
                                        "<p>Thanking You<br/>Team Fin Com India</p>";
                                        Cmn.SendEmail("Invoice:FinComIndia", DT.Email, DT.ApplicantName, Cmn.CreateMailStructure("Incomplete Transaction", DT.Email, mailBody_Incomplete)); //Incomplete
                                    }
                                    str.Append(DT.ID);
                                }
                            }
                            catch
                            {
                                AppendError = true;
                                Error += "FAILED";
                            }
                        }
                    }
                    break;

                case "GetPricing":
                    {
                        string usageType = Data1;
                        string classType = Data2;
                        string userType = Data3;
                        string certType = Data4;
                        string validity = Data5;
                        string usbToken = Data6;

                        string content = "";
                        DSCPrice dp = Global.GetDSCPrice(Cmn.ToInt(validity), classType, userType, certType, usbToken);
                        content = new JavaScriptSerializer().Serialize(dp);
                        str.Append(content);
                    }
                    break;

                case "SearchEnmployee":
                    {
                        string content = "{}";
                        if (string.IsNullOrWhiteSpace(term))
                            return;
                        term = term.ToLower();

                        List<MST_EMPLOYEE> empList;
                        Global.Employee.TryGetValue(1, out empList);

                        if (empList != null)
                        {
                            var listE = empList.Where(m => m.EMPLOYEE_NAME_.ToLower().Contains(term)).Take(15).ToList();
                            var newList = listE.Select(m => new { name = m.EMPLOYEE_NAME_.ToString(), pan = m.EMPLOYEE_PAN }).ToList();
                            content = new JavaScriptSerializer().Serialize(newList);
                        }

                        //var listS = Global.Employee.Keys.Where(m => m.ToLower().Contains(term)).Take(15).ToList();
                        //var newList = listS.Select(m => new { id = m.ID.ToString(), urlname = Global.GetRootPathVirtual + "/project/" + m.URLName.ToLower(), label = m.SearchName + "-<span style='color:#08c; font-style:italic;'>project</span>", value = m.SearchName, type = "P" }).ToList();

                        //if (Data1 == "0") //Exclude builders from map search
                        //{
                        //    var listBuilder = Global.BuilderList.Values.Where(m => m.AgentCompany != null && m.AgentCompany.ToLower().Contains(term)).Take(5).ToList();
                        //    newList.AddRange(listBuilder.Select(m => new { id = m.ID.ToString(), urlname = Global.GetRootPathVirtual + "/builder/" + m.AgentName.ToLower(), label = m.AgentCompany + "-<span style='color:orange; font-style:italic;'>Builder</sapn>", value = m.AgentCompany, type = "B" }).ToList());
                        //}

                        //var listC = Global.CityList.Values.Where(m => m.Name.ToLower().StartsWith(term)).Take(5).ToList();
                        //newList.AddRange(listC.Select(m => new { id = m.ID.ToString(), urlname = "", label = m.Name, value = m.Name, type = "C" }).ToList());

                        Response.Write(content);
                        return;

                    }


                case "TracePanValidation":
                    {
                        AppendError = false;
                        TracesResponse tracesResponse = new TracesResponse();
                        string Pan = Data1;
                        string panName = "";
                        tracesResponse = Global.objTraceConnect.RequestForPANValidation(Pan, out panName);
                        if (tracesResponse.Respons == enmResponse.Success)
                        {
                            str.Append(panName);
                        }
                    }
                    break;
                case "CreateReturnTextFile": AppendError = false; Response.Write(CreateReturnTextFile(Cmn.ToInt(Data1))); break;
                case "DownloadCSIFile": AppendError = false; Response.Write(DownloadCSIFile(Cmn.ToInt(Data1))); break;
                case "CreateFVUFile": AppendError = false; Response.Write(DownloadCSIFile(Cmn.ToInt(Data1), 1)); break;
                case "GetEmployee":
                    {
                        AppendError = false;
                        MST_EMPLOYEE E = MST_EMPLOYEE.GetByID(Cmn.ToInt(Data1));
                        var newlist = new
                        {
                            PAN = E.EMPLOYEE_PAN,
                            Year = (DateTime.Now.Year).ToString()
                        };
                        str.Append(new JavaScriptSerializer().Serialize(newlist));
                    }; break;
                case "GetPageDetail":
                    {
                        AppendError = false;
                        string data = new WebClient().DownloadString(Data1 + "&TAN=" + Data2 + "&PRN=" + Data3);
                        str.Append(data);
                    }
                    break;
                case "GetChallanInfo":
                    {
                        AppendError = false;
                        string[] dateFrom = Data3.Split('-');
                        string[] dateTo = Data4.Split('-');
                        string url = Data1 + "&TAN_NO=" + Data2 + "&TAN_FROM_DT_DD=" + dateFrom[0] + "&TAN_FROM_DT_MM=" + dateFrom[1] + "&TAN_FROM_DT_YY="
                            + dateFrom[2] + "&TAN_TO_DT_DD=" + dateTo[0] + "&TAN_TO_DT_MM=" + dateTo[1] + "&TAN_TO_DT_YY=" + dateTo[2] + "&submit=View%20Challan%20details";
                        string data = new WebClient().DownloadString(url);
                        str.Append(data);
                    }
                    break;
                case "SaveAcceptFlag":
                    {
                        TRN_BASIC_INFO rr = TRN_BASIC_INFO.GetByTokenNo(Data1);
                        if (rr != null)
                        {
                            rr.ACCEPT_FLAG = 1;
                            rr.Save();
                        }
                    }
                    break;
                case "UpdateEmployeeSalaryData":
                    {
                        string data = GetFormString("EmployeeData");

                        if (string.IsNullOrWhiteSpace(data))
                        {
                            str.Append("Error!");
                            return;
                        }
                        EmployeeSalary ES = EmployeeSalary.GetByEnmpIDAndFinYear(Cmn.ToInt(Data1), Cmn.ToInt(Data2));

                        if (ES == null)
                            ES = new EmployeeSalary();
                        ES.EmployeeID = Cmn.ToInt(Data1);
                        ES.FinancialYear = Cmn.ToInt(Data2);
                        ES.Data = Cmn.GetCompressed(data);
                        ES.DataSize = data.Length;
                        ES.Save();
                    }
                    break;
                case "GetEmployeeSalaryData":
                    {
                        EmployeeSalary ES = EmployeeSalary.GetByEnmpIDAndFinYear(Cmn.ToInt(Data1), Cmn.ToInt(Data2));
                        if (ES != null)
                        {
                            string data = Cmn.GetUnCompressed(ES.Data, Cmn.ToInt(ES.DataSize));
                            str.Append(data);
                        }
                    }
                    break;
                case "GetChallan":
                    {
                        List<TRN_DEDUCTEE_DETAILS> CD = TRN_DEDUCTEE_DETAILS.GetByEmployeeIDandFY(Cmn.ToInt(Data1), Cmn.ToInt(Data2));
                        if (CD.Count > 0)
                        {
                            var newlist = CD.Select(a => new
                            {
                                month = GetFYMonth(Cmn.ToDate(a.DEDUCTED_DATE).Month),
                                challan = GetChallanInfo((int)a.CHALLAN_ID)
                            }).ToList();
                            str.Append(new JavaScriptSerializer().Serialize(newlist));
                        }
                    }
                    break;
                case "UpdateIncomeExpense":
                    {
                        string data = GetFormString("IncomeExpenseData");
                        int year = Cmn.ToInt(Data1);
                        int compID = Cmn.ToInt(Data2);
                        IncomeExpense IE = IncomeExpense.GetByYearCompanyID(year, compID);
                        if (IE == null)
                            IE = new IncomeExpense();
                        IE.Year = year;
                        IE.CompanyID = compID;
                        IE.Data = Cmn.GetCompressed(data);
                        IE.DataSize = data.Length;
                        IE.Save();
                    }
                    break;
                case "LoadIncomeExpense":
                    {
                        IncomeExpense IE = IncomeExpense.GetByYearCompanyID(Cmn.ToInt(Data1), Cmn.ToInt(Data2));
                        if (IE != null)
                        {
                            string data = Cmn.GetUnCompressed(IE.Data, Cmn.ToInt(IE.DataSize));
                            str.Append(data);
                        }
                    }
                    break;
                case "LoadSalaryData":
                    {
                        List<EmployeeSalary> ES = EmployeeSalary.GetByFinYear(Cmn.ToInt(Data1));
                        Dictionary<string, string> expense = new Dictionary<string, string>();

                        double[] monthTotalAmt = new double[12];
                        double[] monthTotalTds = new double[12];
                        foreach (EmployeeSalary es in ES)
                        {
                            string data = Cmn.GetUnCompressed(es.Data, (int)es.DataSize);
                            Dictionary<string, object> d = (Dictionary<string, object>)new JavaScriptSerializer().DeserializeObject(data);
                            for (int i = 1; i <= 12; i++)
                            {
                                object amt;
                                if (d.TryGetValue("txtTotalIncome" + i + "", out amt))
                                {
                                    monthTotalAmt[i - 1] += Cmn.ToDbl(amt);
                                }
                                object tds;
                                if (d.TryGetValue("txtTDS" + i + "", out tds))
                                {
                                    monthTotalTds[i - 1] += Cmn.ToDbl(tds);
                                }
                            }
                        }
                        for (int i = 1; i <= 12; i++)
                        {
                            expense.Add("txtExpenses1_" + i + "", monthTotalAmt[i - 1].ToString());
                            expense.Add("txtTDS" + i + "", monthTotalTds[i - 1].ToString());
                        }
                        str.Append(new JavaScriptSerializer().Serialize(expense));
                    }
                    break;

                case "GetTDSData":
                    {
                        Dictionary<string, string> expense = new Dictionary<string, string>();
                        List<TRN_DEDUCTEE_DETAILS> CD = TRN_DEDUCTEE_DETAILS.GetByEmployeeIDandYear(Cmn.ToInt(Data1), Cmn.ToInt(Data2));

                        if (CD.Count > 0)
                        {
                            var newlist = CD.Select(a => new
                            {

                                month = GetFYMonth(a.DEDUCTED_DATE.Value.Month),
                                tds = a.TAX_DEPOSITED_AMOUNT

                            }).ToList();
                            str.Append(new JavaScriptSerializer().Serialize(newlist));
                        }
                    }
                    break;
                case "GetDetailbyPin": GetDetailbyPin(Data1);
                    break;
                case "SaveFileSB":
                    {
                        string folder = FolderCheck("~/import/");
                        foreach (string f in Request.Files.AllKeys)
                        {
                            HttpPostedFile file = Request.Files[f];
                            string Upload = Data1 == "FileUpload1" ? "1" : Data1 == "FileUpload2" ? "2" : "";
                            Boolean MBL = Data1 == "FileUpload3"; Boolean MPL = Data1 == "FileUpload4"; Boolean Modified = MBL || MPL;
                            string ext = System.IO.Path.GetExtension(file.FileName);
                            if (Modified)
                            {
                                if (MBL)
                                {
                                    string path = FolderCheck("~/Documents/ModifiedBalanceSheet");
                                    file.SaveAs(path + "/" + Path.GetFileName(Data2 + "" + ext));
                                }
                                else if (MPL)
                                {
                                    string path = FolderCheck("~/Documents/ModifiedProfitLossSheet");
                                    file.SaveAs(path + "/" + Path.GetFileName(Data2 + "" + ext));
                                }
                            }
                            else
                            {
                                string filePath = Path.GetFullPath(file.FileName);
                                if (Upload == "1")
                                    Global.FileNameID = file.FileName;
                                if (Upload == "2")
                                    Global.FileNameAdd = file.FileName;
                                file.SaveAs(folder + Path.GetFileName(file.FileName));
                            }
                            str.Append(file.FileName);
                        }
                        AppendError = false;
                    }
                    break;
                case "SaveFile":
                    {
                        string folder = FolderCheck("~/import/");
                        foreach (string f in Request.Files.AllKeys)
                        {
                            HttpPostedFile file = Request.Files[f];
                            string Upload = Data1 == "FileUpload1" ? "1" : Data1 == "FileUpload2" ? "2" : Data1 == "FileUpload5" ? "2" : "";
                            Boolean Page1 = Data1 == "FileUpload3"; Boolean Page2 = Data1 == "FileUpload4"; Boolean Page = Page1 || Page2;
                            string ext = System.IO.Path.GetExtension(file.FileName);
                            if (Page)
                            {
                                if (Page1)
                                {
                                    string path = FolderCheck("~/Documents/Form");
                                    file.SaveAs(path + "/" + Path.GetFileName(Data2 + "_Page1" + ext));
                                }
                                else if (Page2)
                                {
                                    string path = FolderCheck("~/Documents/Form");
                                    if (!Directory.Exists(path))
                                    {
                                        Directory.CreateDirectory(path);
                                    }
                                    file.SaveAs(path + "/" + Path.GetFileName(Data2 + "_Page2" + ext));
                                }
                            }
                            else
                            {
                                string filePath = Path.GetFullPath(file.FileName);
                                if (Upload == "1")
                                    Global.FileNameID = file.FileName;
                                if (Upload == "2")
                                    Global.FileNameAdd = file.FileName;
                                file.SaveAs(folder + "/" + Path.GetFileName(file.FileName));
                            }
                            str.Append(file.FileName);
                        }
                        AppendError = false;
                    }
                    break;
                case "SavePANs":
                    {
                        string folder = FolderCheck("~/resume/");
                        foreach (string f in Request.Files.AllKeys)
                        {
                            HttpPostedFile file = Request.Files[f];
                            List<PAN> panList = new List<PAN>();
                            StreamReader reader = new StreamReader(file.InputStream);
                            while (reader.Peek() != -1)
                            {
                                string textLine = reader.ReadLine();
                                if (textLine.Length >= 0)
                                    panList.Add(new PAN() { Number = textLine });

                            }
                            Global.PANSList = panList;
                            string data = new JavaScriptSerializer().Serialize(panList);
                            str.Append(file.FileName.ToString() + "^" + data);
                        }
                        AppendError = false;
                    }
                    break;
            }

            Response.Write((AppendError ? Error + "~" : "") + str.ToString());    //at last write responce to caller
        }

        catch (Exception ex)
        {
            ErrorWriter(ex);
            Error = ex.Message + ex.StackTrace + "-" + Error;
            Response.Write((AppendError ? Error + "~" : "") + str.ToString());
        }
        finally
        {
            if (str.Length == 0 && Action != "GetServices")
                Error += "No Data Found";
        }
    }
    public static string FolderCheck(string Path)
    {
        bool IsExists = Directory.Exists(HttpContext.Current.Server.MapPath(Path));
        if (!IsExists)
            Directory.CreateDirectory(HttpContext.Current.Server.MapPath(Path));
        return HttpContext.Current.Server.MapPath(Path);
    }
    public void GetDetailbyPin(string pin)
    {
        string city = "", state = "";
        foreach (KeyValuePair<string, string> kvp in Global.PincodeList)
        {
            if (kvp.Key == pin)
                city = kvp.Value;
        }
        foreach (KeyValuePair<string, string> kvp in Global.CityListByState)
        {
            if (kvp.Key == city)
                state = kvp.Value;
        }
        str.Append(city + "^" + state);
    }
    public void GEtData()
    {
        Dictionary<String, String> CityListByState = new Dictionary<String, String>();
        string s = System.IO.File.ReadAllText(@"C:\Users\vimal_rra\Desktop\Zoning1.txt");
        s = s.Replace("\r\n", "^");
        string[] city = s.Split('^');
        for (int i = 1; i < city.Length - 1; i++)
        {
            string[] record = city[i].Split(',');
            string cty = record[1];
            string state = record[2];
            if (!CityListByState.ContainsKey(cty))
                CityListByState.Add(cty, state);
        }
        string folder = Server.MapPath("~/Documents/File");
        if (!Directory.Exists(folder))
            Directory.CreateDirectory(folder);
        string str = "";
        foreach (KeyValuePair<string, string> kvp in CityListByState)
        {
            str += kvp.Key + "," + kvp.Value + "^";
        }
        System.IO.File.WriteAllText(folder + "/state.txt", str);
    }
    string DownloadCSIFile(int ReturnID, int Step = 0)
    {
        //return "OK";
        TRN_BASIC_INFO RR = TRN_BASIC_INFO.GetByID(ReturnID);
        MST_COMPANY C = MST_COMPANY.GetByID((int)RR.COMPANY_ID);
        List<TRN_CHALLAN> CL = TRN_CHALLAN.GetByFormID(ReturnID);
        DateTime minDate = CL.Min(m => (DateTime)m.DEPOSIT_DATE);
        DateTime maxDate = CL.Max(m => (DateTime)m.DEPOSIT_DATE);

        string[] dateFrom = minDate.ToString("dd-MM-yyyy").Split('-');
        string[] dateTo = maxDate.ToString("dd-MM-yyyy").Split('-');

        string Path = @"C:\TDS\" + C.COMPANY_NAME + "\\" + RR.YEAR + "\\" + RR.FORM_NO + "\\" + RR.QTR + "\\";

        if (Step == 0)
        {
            try
            {
                string uriString = "https://tin.tin.nsdl.com/oltas/servlet/TanSearch/?appUser=T&TAN_NO=" + C.TAN_NO + "&TAN_FROM_DT_DD=" + dateFrom[0] + "&TAN_FROM_DT_MM=" + dateFrom[1] + "&TAN_FROM_DT_YY=" + dateFrom[2] + "&TAN_TO_DT_DD=" + dateTo[0] + "&TAN_TO_DT_MM=" + dateTo[1] + "&TAN_TO_DT_YY=" + dateTo[2] + "&submit=Download Challan file";
                WebClient webClient = new WebClient();
                String s = webClient.DownloadString(new Uri(uriString));

                if (!Directory.Exists(Path))
                    Directory.CreateDirectory(Path);

                File.WriteAllText(Path + RR.QTR + ".csi", s);
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
        else
        {
            string fileName = "24Q";
            if (RR.FORM_NO == "24Q")
                fileName = "24Q" + RR.QTR + ".txt";
            else if (RR.FORM_NO == "26Q")
                fileName = "26Q" + RR.QTR + ".txt";

            string str = "start javaw -jar \""
            + @"d:\FVU 4.4\TDS_FVU_STANDALONE_4.4.jar"" "
            + "\"" + Path + fileName + "\" "
            + "\"" + Path + "Error.err" + "\" "
            + "\"" + Path + "FVU.fvu" + "\" "
            + "\"0\" \"4.4\" \"1\" "
            + "\"" + Path + RR.QTR + ".csi\" \"\"";

            File.WriteAllText(Path + "FVU.bat", str);
        }
        return "OK";
    }


    string CreateReturnTextFile(int ReturnID)
    {
        return "OK";
        TRN_BASIC_INFO rr = TRN_BASIC_INFO.GetByID(ReturnID);

        StringBuilder str = new StringBuilder();

        //MST_COMPANY comp = MST_COMPANY.GetByID((int)rr.COMPANY_ID);
        TRN_COMPANY_INFO comp = TRN_COMPANY_INFO.GetByID((int)rr.COMPANY_ID);
        List<TRN_CHALLAN> challanlist = TRN_CHALLAN.GetByFormID(ReturnID).OrderBy(m => m.CHALLAN_ID).ToList();

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
                + "^R"   //4
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

            //List<RegularReturn> RR = RegularReturn.GetByFormYearQuarterCompany(FormType, FinancialYear, Quarter, CompanyID);
            //if (RR.Count == 0) return;
            //RegularReturn rr = RR[0];

            //TDS Statement for Salary category (Batch Header Record)
            str.Append((++ctr) //1 
               + "^BH"  //2
               + "^1" //3
               + "^" + challanlist.Count //4
               + "^24Q"//5
               + "^" //6
               + "^" //7
               + "^"//8
               + "^" + rr.PREV_PRN_NO //9
               + "^" //10
               + "^" //11
               + "^" //12
               + "^" + comp.TAN_NO //13
               + "^" //14
               + "^" + comp.TAN_NO //15
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
               + "^" + (rr.PREV_PRN_NO != "" ? "Y" : "N")//52
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
              + "^" + Cmn.ToDbl(ch.INTEREST).ToString("0.00") //34 
              + "^" + Cmn.ToDbl(ch.OTHERS).ToString("0.00")  //35 
              + "^"  //36-DD CHEQUE NO OF CHALLAN
              + "^N" //37 
              + "^" //38 
              + "^" + Cmn.ToDbl(ch.LATE_FEE).ToString("0.00") //39
              + "^" + ch.MINOR_HEAD_ID //40 
              + "^" //41 
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
                  + "^" + chdctr //+ E.EmployeeRefNo //7 *
                  + "^"//8
                  + "^" //9
                  + "^" + E.EMPLOYEE_PAN //10
                  + "^" //11
                  + "^" //12
                  + "^" + E.EMPLOYEE_NAME_ //13
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
                  + "^" + cd.SECTION_ID//33
                  + "^" //34
                  + "^" //35
                  + "^" //36
                  + "^" //37
                  + "^" //38
                  + "^" //39
                 );
                str.Append(Environment.NewLine);
            }

            if (rr.QTR == "Q4")
            {
                int sdcounter = 1;
                int noOfsdRecords = 0;
                List<TRN_SALARY_DETAILS> SD = TRN_SALARY_DETAILS.GetByFormID(ReturnID);
                noOfsdRecords = SD.Count;
                foreach (TRN_SALARY_DETAILS sd in SD)
                {
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
                      + "^" + Cmn.ToDbl(sd.TOTAL_INCOME + sd.BalancePriviousEmployer).ToString("0.00")//13*
                      + "^" //14
                      + "^" + noOfsdRecords //15
                      + "^"  //16*
                      + "^" + Cmn.ToDbl(sd.INCOME_CHARGEABLE).ToString("0.00")//17
                      + "^" + Cmn.ToDbl(sd.AIS_Total).ToString("0.00")//18
                      + "^" + Cmn.ToDbl(sd.GROSS_TOTAL_INCOME).ToString("0.00")//19
                      + "^" //20
                      + "^" //21*
                      + "^" //22*
                      + "^" + Cmn.ToDbl(sd.TOTAL_INCOME).ToString("0.00")//23
                      + "^" + Cmn.ToDbl(sd.TAX_PAYABLE).ToString("0.00")//24
                      + "^" + Cmn.ToDbl(sd.SCHG_TOTAL_INCOME).ToString("0.00") //25
                      + "^" + Cmn.ToDbl(sd.ECESS_TOTAL_INCOME).ToString("0.00") //26
                      + "^" + Cmn.ToDbl(sd.US_89_LESS).ToString("0.00")//27
                      + "^" + Cmn.ToDbl(sd.TAX_PAYABLE - sd.US_89_LESS)//28
                      + "^" + Cmn.ToDbl(sd.BrkUpTdsCurrentEmployer + sd.BrkUpTdsPevEmployer).ToString("0.00")//29
                      + "^" + Cmn.ToDbl(sd.SHORTFALL_TAX).ToString("0.00")//30
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

        }

        //Company C = Company.GetByID(CompanyID);
        //string compName = C.CompanyName;

        string Path = @"C:\TDS\" + comp.COMPANY_NAME + "\\" + rr.YEAR + "\\" + rr.FORM_NO + "\\" + rr.QTR + "\\";

        string fileName = "24Q";
        if (rr.FORM_NO == "24Q")
            fileName = "24Q" + rr.QTR + ".txt";
        else if (rr.FORM_NO == "24Q")
            fileName = "26Q" + rr.QTR + ".txt";

        if (!Directory.Exists(Path))
            Directory.CreateDirectory(Path);

        File.WriteAllText(Path + fileName, str.ToString().ToUpper());

        return "OK";
    }

    private object GetFYMonth(int oldmonth)
    {
        int newmonth = oldmonth - 3;
        if (newmonth < 1)
            newmonth += 12;
        return newmonth;
    }

    void ErrorWriter(Exception ex, string Message = "")
    {
        File.AppendAllText(Server.MapPath(@"~\error.txt"), ex.Message + ex.StackTrace);
    }

    object GetChallanInfo(int ChallanID)
    {
        TRN_CHALLAN c = TRN_CHALLAN.GetByID(ChallanID);
        if (c != null)
        {
            var newlist = new
            {
                challanno = c.CHALLAN_NO,
                tds = c.TDS
            };
            return newlist;
        }

        return new { };
    }

    public string Download(string URL, string PostData, string FileToWrite, string Cookie = "")
    {
        string Result = "";
        string Error = "";
        WebRequest objRequest = HttpWebRequest.Create(URL);
        objRequest.Method = "POST";
        objRequest.ContentType = "application/x-www-form-urlencoded";

        ((HttpWebRequest)objRequest).UserAgent = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36";

        objRequest.Timeout = 5000;

        if (Cookie != "")
            objRequest.Headers.Add("Cookie", Cookie);

        if (PostData.Length > 0)
        {
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] data = data = encoding.GetBytes(PostData);
            objRequest.ContentLength = data.Length;

            Stream newStream = objRequest.GetRequestStream();
            newStream.Write(data, 0, data.Length);
            newStream.Close();
        }
        else
        {
            objRequest.Method = "GET";
            objRequest.ContentLength = 0;
        }

        try
        {
            using (HttpWebResponse response = (HttpWebResponse)objRequest.GetResponse())
            {
                if ((response.StatusCode == HttpStatusCode.OK))
                {
                    using (StreamReader sr = new StreamReader(response.GetResponseStream()))
                    {
                        Result = sr.ReadToEnd();
                        //string Data = sr.ReadToEnd();
                        //File.WriteAllText(FileToWrite, Data);
                    }
                }
            }
        }
        catch (Exception ex) { Error = ex.Message; }
        return Result;
    }

    String strServerResponse = "";
    HttpWebRequest request = null;
    CookieContainer objContainer = null;
    StreamReader reader = (StreamReader)null;
    Stream dataStream = (Stream)null;
    HttpWebResponse response = (HttpWebResponse)null;

    public string makeHTTPPostRequest(string strURL, StringBuilder sbData)
    {
        request = (HttpWebRequest)WebRequest.Create(strURL);
        request.KeepAlive = false;
        byte[] buffer = (byte[])null;
        if (!string.IsNullOrEmpty(Convert.ToString((object)sbData)))
            buffer = Encoding.UTF8.GetBytes(((object)sbData).ToString());

        if (!string.IsNullOrEmpty(Convert.ToString((object)sbData)))
            request.ContentLength = (long)buffer.Length;

        if (sbData != null)
        {
            request.Method = "POST";
            request.Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
            request.UserAgent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17";
            request.ContentType = "application/x-www-form-urlencoded";
            request.Timeout = 1000000000;
        }

        if (request.CookieContainer == null)
            objContainer = request.CookieContainer = new CookieContainer();
        string hostBase = "fincomindia.in";
        if (Request.Url.Host.ToLower().Contains("localhost"))
            hostBase = "localhost";
        foreach (string cookie in Request.Cookies)
            objContainer.Add(new Cookie(cookie.Trim(), Request.Cookies[cookie].Value.Trim(), "/", hostBase));

        request.CookieContainer = objContainer;

        request.CookieContainer.Add(Global._Response.Cookies);

        if (!string.IsNullOrEmpty(Convert.ToString((object)sbData)))
        {
            dataStream = ((WebRequest)request).GetRequestStream();
            dataStream.Write(buffer, 0, buffer.Length);
            dataStream.Close();
        }
        response = (HttpWebResponse)request.GetResponse();
        dataStream = response.GetResponseStream();
        reader = new StreamReader(dataStream);
        strServerResponse = reader.ReadToEnd();
        reader.Close();
        dataStream.Close();
        response.Close();
        return strServerResponse;
    }

}

