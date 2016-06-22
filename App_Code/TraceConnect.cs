// Decompiled with JetBrains decompiler
// Type: TDSMAN.Classes.TracesConnect
// Assembly: TDSMAN, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 952B4D48-0FC3-44A5-A16A-36F971D7C17C
// Assembly location: C:\Program Files (x86)\TDSMAN FY 2014-15(trial)\TDSMAN.exe

using HtmlAgilityPack;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.IO;
using System.Net;
using System.Net.Configuration;
using System.Net.Security;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

public class TracesConnect
{
    private string strURL = "";
    private HttpWebRequest request = (HttpWebRequest)null;
    private HttpWebResponse response = (HttpWebResponse)null;
    private Stream dataStream = (Stream)null;
    private StreamReader reader = (StreamReader)null;
    private string strServerResponse = "";
    private CookieContainer objContainer = new CookieContainer();
    private List<ErrorDB<int, string, string>> objMsgDictionary = new List<ErrorDB<int, string, string>>();
    private string strBaseURL = "https://www.tdscpc.gov.in/app/";
    private string strCaptchBaseURL = "https://www.tdscpc.gov.in/app/srv/";
    private bool bnlSessionExists = false;

    public TracesConnect()
    {
        //Constructor Logic
    }

    public bool IsSessionExists
    {
        get
        {
            return this.bnlSessionExists;
        }
        set
        {
            this.bnlSessionExists = true;
        }
    }

    public TracesResponse IsChallanExistsInConsolidate(TracesData objTraceData, TracesLogin objLogin)
    {
        TracesResponse tracesResponse1 = new TracesResponse();
        tracesResponse1.Respons = enmResponse.Success;
        if (!this.bnlSessionExists)
        {
            tracesResponse1 = this.makeLoginToTRACES(objLogin);
            if (tracesResponse1.Respons == enmResponse.Failed)
                return tracesResponse1;
        }
        this.strServerResponse = this.makeHTTPGetRequest(this.strBaseURL + "ded/nsdlconsofile.xhtml");
        if (!this.IsStringExists(this.strServerResponse, "//form[@id=\"requestnsdlconsoForm\"]"))
        {
            tracesResponse1.Message = "Server Error";
            tracesResponse1.Respons = enmResponse.SessionTimeout;
            return tracesResponse1;
        }
        else
        {
            TracesResponse tracesResponse2 = this.IsServerError(this.strServerResponse, "//span[@id=\"err_Summary\"]");
            if (tracesResponse2.Respons == enmResponse.Failed)
            {
                tracesResponse2.Message = "Server Error";
                tracesResponse2.Respons = enmResponse.Failed;
                return tracesResponse2;
            }
            else
            {
                StringBuilder sbData = new StringBuilder();
                sbData.Append("finYr=" + objTraceData.FAYear);
                sbData.Append("&qrtr=" + objTraceData.Quarter);
                sbData.Append("&frmType=" + objTraceData.Forms);
                sbData.Append("&download_conso=Go");
                sbData.Append("&requestnsdlconsoForm_SUBMIT=1");
                Dictionary<string, string> dictionary1 = this.TraceViewStateData(this.strServerResponse, "//form[@id=\"requestnsdlconsoForm\"]");
                if (dictionary1.Count <= 0)
                {
                    tracesResponse2.Message = "Server Error";
                    tracesResponse2.Respons = enmResponse.SessionTimeout;
                    return tracesResponse2;
                }
                else
                {
                    foreach (KeyValuePair<string, string> keyValuePair in dictionary1)
                    {
                        if (keyValuePair.Key == "javax.faces.ViewState")
                            sbData.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                    }
                    this.strServerResponse = this.makeHTTPPostRequest(this.strBaseURL + "ded/nsdlconsofile.xhtml", sbData);
                    Dictionary<string, string> dictionary2 = this.TraceViewStateData(this.strServerResponse, "//form[@id=\"dedkyc\"]");
                    tracesResponse2.CustomeTypes = (object)dictionary2;
                    return tracesResponse2;
                }
            }
        }
    }

    public TracesResponse IsChallanExistsInDefaults(TracesData objTraceData, TracesLogin objLogin)
    {
        TracesResponse tracesResponse1 = new TracesResponse();
        tracesResponse1.Respons = enmResponse.Success;
        if (!this.bnlSessionExists)
        {
            tracesResponse1 = this.makeLoginToTRACES(objLogin);
            if (tracesResponse1.Respons == enmResponse.Failed)
                return tracesResponse1;
        }
        this.strServerResponse = this.makeHTTPGetRequest(this.strBaseURL + "ded/justrepdwnld.xhtml");
        if (!this.IsStringExists(this.strServerResponse, "//form[@id=\"justificationForm\"]"))
        {
            tracesResponse1.Message = "Server Error";
            tracesResponse1.Respons = enmResponse.SessionTimeout;
            return tracesResponse1;
        }
        else
        {
            TracesResponse tracesResponse2 = this.IsServerError(this.strServerResponse, "//span[@id=\"err_Summary\"]");
            if (tracesResponse2.Respons == enmResponse.Failed)
            {
                tracesResponse2.Message = "Server Error";
                tracesResponse2.Respons = enmResponse.Failed;
                return tracesResponse2;
            }
            else
            {
                StringBuilder sbData = new StringBuilder();
                sbData.Append("finYr=" + objTraceData.FAYear);
                sbData.Append("&qrtr=" + objTraceData.Quarter);
                sbData.Append("&frmType=" + objTraceData.Forms);
                sbData.Append("&download_justReport=Go");
                Dictionary<string, string> dictionary1 = this.TraceViewStateData(this.strServerResponse, "//form[@id=\"justificationForm\"]");
                if (dictionary1.Count <= 0)
                {
                    tracesResponse2.Message = "Server Error";
                    tracesResponse2.Respons = enmResponse.SessionTimeout;
                    return tracesResponse2;
                }
                else
                {
                    foreach (KeyValuePair<string, string> keyValuePair in dictionary1)
                    {
                        if (keyValuePair.Key == "javax.faces.ViewState")
                            sbData.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                    }
                    this.strServerResponse = this.makeHTTPPostRequest(this.strBaseURL + "ded/justrepdwnld.xhtml", sbData);
                    Dictionary<string, string> dictionary2 = this.TraceViewStateData(this.strServerResponse, "//form[@id=\"dedkyc\"]");
                    tracesResponse2.CustomeTypes = (object)dictionary2;
                    return tracesResponse2;
                }
            }
        }
    }

    public TracesResponse IsChallanExistsInForm16(TracesData objTraceData, TracesLogin objLogin)
    {
        TracesResponse tracesResponse1 = new TracesResponse();
        tracesResponse1.Respons = enmResponse.Success;
        if (!this.bnlSessionExists)
        {
            tracesResponse1 = this.makeLoginToTRACES(objLogin);
            if (tracesResponse1.Respons == enmResponse.Failed)
                return tracesResponse1;
        }
        this.strServerResponse = this.makeHTTPGetRequest(this.strBaseURL + "ded/download16.xhtml");
        if (!this.IsStringExists(this.strServerResponse, "//form[@id=\"bulkPan\"]"))
        {
            tracesResponse1.Message = "Server Error";
            tracesResponse1.Respons = enmResponse.SessionTimeout;
            return tracesResponse1;
        }
        else
        {
            TracesResponse tracesResponse2 = this.IsServerError(this.strServerResponse, "//span[@id=\"err_Summary\"]");
            if (tracesResponse2.Respons == enmResponse.Failed)
            {
                tracesResponse2.Message = "Server Error";
                tracesResponse2.Respons = enmResponse.Failed;
                return tracesResponse2;
            }
            else
            {
                StringBuilder sbData1 = new StringBuilder();
                sbData1.Append("dwnldFormBulkType=13");
                sbData1.Append("&bulkfinYr=" + objTraceData.FAYear);
                sbData1.Append("&bulkGo=Go");
                sbData1.Append("&bulkPan_SUBMIT=1");
                Dictionary<string, string> dictionary1 = this.TraceViewStateData(this.strServerResponse, "//form[@id=\"bulkPan\"]");
                if (dictionary1.Count <= 0)
                {
                    tracesResponse2.Message = "Server Error";
                    tracesResponse2.Respons = enmResponse.SessionTimeout;
                    return tracesResponse2;
                }
                else
                {
                    foreach (KeyValuePair<string, string> keyValuePair in dictionary1)
                    {
                        if (keyValuePair.Key == "javax.faces.ViewState")
                            sbData1.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                    }
                    this.strServerResponse = this.makeHTTPPostRequest(this.strBaseURL + "ded/download16.xhtml", sbData1);
                    TracesResponse tracesResponse3 = this.IsServerError(this.strServerResponse, "//ul[@id=\"err_Summary\"]");
                    if (tracesResponse3.Respons == enmResponse.Failed)
                    {
                        tracesResponse3.Respons = enmResponse.Failed;
                        return tracesResponse3;
                    }
                    else if (!this.IsStringExists(this.strServerResponse, "//form[@id=\"deducteeDetails\"]"))
                    {
                        tracesResponse3.Message = "Server Error";
                        tracesResponse3.Respons = enmResponse.SessionTimeout;
                        return tracesResponse3;
                    }
                    else
                    {
                        Dictionary<string, string> dictionary2 = this.TraceViewStateData(this.strServerResponse, "//form[@id=\"deducteeDetails\"]");
                        if (dictionary2.Count <= 0)
                        {
                            tracesResponse3.Message = "Server Error";
                            tracesResponse3.Respons = enmResponse.SessionTimeout;
                            return tracesResponse3;
                        }
                        else
                        {
                            StringBuilder sbData2 = new StringBuilder();
                            sbData2.Append("j_id1972728517_7cc7de5f=submit");
                            foreach (KeyValuePair<string, string> keyValuePair in dictionary2)
                                sbData2.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                            this.strServerResponse = this.makeHTTPPostRequest(this.strBaseURL + "ded/form16adetls.xhtml", sbData2);
                            if (!this.IsStringExists(this.strServerResponse, "//form[@id=\"dedkyc1\"]"))
                            {
                                tracesResponse3.Message = "Server Error";
                                tracesResponse3.Respons = enmResponse.SessionTimeout;
                                return tracesResponse3;
                            }
                            else
                            {
                                Dictionary<string, string> dictionary3 = this.TraceViewStateData(this.strServerResponse, "//form[@id=\"dedkyc1\"]");
                                tracesResponse3.CustomeTypes = (object)dictionary3;
                                return tracesResponse3;
                            }
                        }
                    }
                }
            }
        }
    }

    public TracesResponse IsChallanExistsInForm16A(TracesData objTraceData, TracesLogin objLogin)
    {
        TracesResponse tracesResponse1 = new TracesResponse();
        tracesResponse1.Respons = enmResponse.Success;
        if (!this.bnlSessionExists)
        {
            tracesResponse1 = this.makeLoginToTRACES(objLogin);
            if (tracesResponse1.Respons == enmResponse.Failed)
                return tracesResponse1;
        }
        this.strServerResponse = this.makeHTTPGetRequest(this.strBaseURL + "ded/download16a.xhtml");
        if (!this.IsStringExists(this.strServerResponse, "//form[@id=\"bulkSearch\"]"))
        {
            tracesResponse1.Message = "Server Error";
            tracesResponse1.Respons = enmResponse.SessionTimeout;
            return tracesResponse1;
        }
        else
        {
            TracesResponse tracesResponse2 = this.IsServerError(this.strServerResponse, "//span[@id=\"err_Summary\"]");
            if (tracesResponse2.Respons == enmResponse.Failed)
            {
                tracesResponse2.Message = "Server Error";
                tracesResponse2.Respons = enmResponse.Failed;
                return tracesResponse2;
            }
            else
            {
                StringBuilder sbData1 = new StringBuilder();
                sbData1.Append("dwnldFormBulkType=14");
                sbData1.Append("&bulkfinYr=" + objTraceData.FAYear);
                sbData1.Append("&bulkquarter=" + objTraceData.Quarter);
                sbData1.Append("&bulkformType=" + objTraceData.Forms);
                sbData1.Append("&bulkGo=Go");
                sbData1.Append("&bulkSearch_SUBMIT=1");
                Dictionary<string, string> dictionary1 = this.TraceViewStateData(this.strServerResponse, "//form[@id=\"bulkSearch\"]");
                if (dictionary1.Count <= 0)
                {
                    tracesResponse2.Message = "Server Error";
                    tracesResponse2.Respons = enmResponse.SessionTimeout;
                    return tracesResponse2;
                }
                else
                {
                    foreach (KeyValuePair<string, string> keyValuePair in dictionary1)
                    {
                        if (keyValuePair.Key == "javax.faces.ViewState")
                            sbData1.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                    }
                    this.strServerResponse = this.makeHTTPPostRequest(this.strBaseURL + "ded/download16a.xhtml", sbData1);
                    TracesResponse tracesResponse3 = this.IsServerError(this.strServerResponse, "//ul[@id=\"err_Summary\"]");
                    if (tracesResponse3.Respons == enmResponse.Failed)
                    {
                        tracesResponse3.Respons = enmResponse.Failed;
                        return tracesResponse3;
                    }
                    else if (!this.IsStringExists(this.strServerResponse, "//form[@id=\"deducteeDetails\"]"))
                    {
                        tracesResponse3.Message = "Server Error";
                        tracesResponse3.Respons = enmResponse.SessionTimeout;
                        return tracesResponse3;
                    }
                    else
                    {
                        Dictionary<string, string> dictionary2 = this.TraceViewStateData(this.strServerResponse, "//form[@id=\"deducteeDetails\"]");
                        if (dictionary2.Count <= 0)
                        {
                            tracesResponse3.Message = "Server Error";
                            tracesResponse3.Respons = enmResponse.SessionTimeout;
                            return tracesResponse3;
                        }
                        else
                        {
                            StringBuilder sbData2 = new StringBuilder();
                            sbData2.Append("j_id1972728517_7cc7de5f=submit");
                            foreach (KeyValuePair<string, string> keyValuePair in dictionary2)
                                sbData2.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                            this.strServerResponse = this.makeHTTPPostRequest(this.strBaseURL + "ded/form16adetls.xhtml", sbData2);
                            if (!this.IsStringExists(this.strServerResponse, "//form[@id=\"dedkyc\"]"))
                            {
                                tracesResponse3.Message = "Server Error";
                                tracesResponse3.Respons = enmResponse.SessionTimeout;
                                return tracesResponse3;
                            }
                            else
                            {
                                Dictionary<string, string> dictionary3 = this.TraceViewStateData(this.strServerResponse, "//form[@id=\"dedkyc\"]");
                                tracesResponse3.CustomeTypes = (object)dictionary3;
                                return tracesResponse3;
                            }
                        }
                    }
                }
            }
        }
    }

    public TracesResponse NoValidPANdeductee(TracesData objTraceData)
    {
        TracesResponse tracesResponse1 = new TracesResponse();
        tracesResponse1.Respons = enmResponse.Success;
        this.strServerResponse = this.makeHTTPGetRequest(this.strBaseURL + "ded/nsdlconsofile.xhtml");
        if (!this.IsStringExists(this.strServerResponse, "//form[@id=\"requestnsdlconsoForm\"]"))
        {
            tracesResponse1.Message = "Server Error";
            tracesResponse1.Respons = enmResponse.SessionTimeout;
            return tracesResponse1;
        }
        else
        {
            TracesResponse tracesResponse2 = this.IsServerError(this.strServerResponse, "//span[@id=\"err_Summary\"]");
            if (tracesResponse2.Respons == enmResponse.Failed)
            {
                tracesResponse2.Message = "Server Error";
                tracesResponse2.Respons = enmResponse.Failed;
                return tracesResponse2;
            }
            else
            {
                StringBuilder sbData = new StringBuilder();
                sbData.Append("finYr=" + objTraceData.FAYear);
                sbData.Append("&qrtr=" + objTraceData.Quarter);
                sbData.Append("&frmType=" + objTraceData.Forms);
                sbData.Append("&download_conso=Go");
                sbData.Append("&requestnsdlconsoForm_SUBMIT=1");
                Dictionary<string, string> dictionary1 = this.TraceViewStateData(this.strServerResponse, "//form[@id=\"requestnsdlconsoForm\"]");
                if (dictionary1.Count <= 0)
                {
                    tracesResponse2.Message = "Server Error";
                    tracesResponse2.Respons = enmResponse.SessionTimeout;
                    return tracesResponse2;
                }
                else
                {
                    foreach (KeyValuePair<string, string> keyValuePair in dictionary1)
                    {
                        if (keyValuePair.Key == "javax.faces.ViewState")
                            sbData.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                    }
                    this.strServerResponse = this.makeHTTPPostRequest(this.strBaseURL + "ded/nsdlconsofile.xhtml", sbData);
                    Dictionary<string, string> dictionary2 = this.TraceViewStateData(this.strServerResponse, "//form[@id=\"dedkyc\"]");
                    tracesResponse2.CustomeTypes = (object)dictionary2;
                    return tracesResponse2;
                }
            }
        }
    }

    public TracesResponse RequestForAllDownloadList(out DataTable table)
    {
        table = (DataTable)null;
        string str1 = "";
        TracesResponse tracesResponse = new TracesResponse();
        try
        {
            str1 = this.makeHTTPGetRequest(this.strBaseURL + "ded/filedownload.xhtml");
            if (tracesResponse.Respons == enmResponse.Failed)
                return tracesResponse;
            string str2 = this.makeHTTPJSONRequest(this.strBaseURL + "srv/GetReqListServlet?reqtype=0&rows=100&sord=asc");
            if (!string.IsNullOrEmpty(str2))
                table = this.JsonParser(str2);
            tracesResponse = this.IsServerError(str2, "//span[@id=\"err_Summary\"]");
            if (tracesResponse.Respons == enmResponse.Failed)
                return tracesResponse;
        }
        catch (Exception ex)
        {
            tracesResponse.Respons = enmResponse.Failed;
            tracesResponse.Message = ex.Message;
        }
        return tracesResponse;
    }

    public TracesResponse RequestForDownloadListByReqNo(string ReqNo, out DataTable table)
    {
        table = (DataTable)null;
        string str1 = "";
        TracesResponse tracesResponse = new TracesResponse();
        try
        {
            str1 = this.makeHTTPGetRequest(this.strBaseURL + "ded/filedownload.xhtml");
            if (tracesResponse.Respons == enmResponse.Failed)
                return tracesResponse;
            string str2 = this.makeHTTPJSONRequest(this.strBaseURL + "GetReqListServlet?reqtype=2&reqNo=" + ReqNo + "&rows=100&sord=asc");
            if (!string.IsNullOrEmpty(str2))
                table = this.JsonParser(str2);
            tracesResponse = this.IsServerError(str2, "//span[@id=\"err_Summary\"]");
            if (tracesResponse.Respons == enmResponse.Failed)
                return tracesResponse;
        }
        catch (Exception ex)
        {
            tracesResponse.Respons = enmResponse.Failed;
            tracesResponse.Message = ex.Message;
        }
        return tracesResponse;
    }

    public TracesResponse RequestForDownloadListByDate(string FromDate, string ToDate, out DataTable table)
    {
        table = (DataTable)null;
        string str1 = "";
        TracesResponse tracesResponse = new TracesResponse();
        try
        {
            str1 = this.makeHTTPGetRequest(this.strBaseURL + "ded/filedownload.xhtml");
            if (tracesResponse.Respons == enmResponse.Failed)
                return tracesResponse;
            string str2 = this.makeHTTPJSONRequest(this.strBaseURL + "GetReqListServlet?reqtype=1&frmDate=" + FromDate + "&toDate=" + ToDate + "&rows=100&sord=asc");
            if (!string.IsNullOrEmpty(str2))
                table = this.JsonParser(str2);
            tracesResponse = this.IsServerError(str2, "//span[@id=\"err_Summary\"]");
            if (tracesResponse.Respons == enmResponse.Failed)
                return tracesResponse;
        }
        catch (Exception ex)
        {
            this.Logoff();
            tracesResponse.Respons = enmResponse.Failed;
            tracesResponse.Message = ex.Message;
        }
        return tracesResponse;
    }

    public TracesResponse RequestForDownloadFile(string strReqNo, string strPath)
    {
        TracesResponse tracesResponse = new TracesResponse();
        tracesResponse.Respons = enmResponse.Success;
        try
        {
            string str = "srv/DownloadServlet?reqNo=" + strReqNo;
            string input = this.CheckDownloadURL(this.strBaseURL + str);
            List<string> list = new List<string>();
            if (Regex.IsMatch(input, "downloadmultiple.xhtml?"))
                list = this.getDownloadAnchorLink(this.makeHTTPGetRequest(this.strBaseURL + "ded/downloadmultiple.xhtml?reqNo=" + strReqNo));
            string strURL = this.strBaseURL + str;
            if (list.Count != 0)
                strURL = "https://www.tdscpc.gov.in" + list[0];
            this.strURL = this.GetFileLocation(strURL);
            if (string.IsNullOrEmpty(this.strURL))
            {
                tracesResponse.Respons = enmResponse.Failed;
                tracesResponse.Message = "due to Traces server failure !!";
                return tracesResponse;
            }
            else if (Regex.IsMatch(this.strURL, "ibm_security_logout"))
            {
                tracesResponse.Respons = enmResponse.SessionTimeout;
                tracesResponse.Message = "Session Timeout Login again !!";
                return tracesResponse;
            }
            else
            {
                if (!this.makeHttpDownloadRequest(this.strURL, strPath))
                    tracesResponse.Respons = enmResponse.Failed;
                TDSMAN1.T_DownloadedFileNameFromTraces = this.strURL.Substring(this.strURL.LastIndexOf("/") + 1, this.strURL.Length - 1 - this.strURL.LastIndexOf("/"));
            }
        }
        catch (Exception ex)
        {
            tracesResponse.Message = ex.Message;
            tracesResponse.Respons = enmResponse.Failed;
        }
        return tracesResponse;
    }

    public TracesResponse RequestForStatusofStatementFile(TracesData objData, out DataTable table)
    {
        table = (DataTable)null;
        TracesResponse tracesResponse = new TracesResponse();
        tracesResponse.Respons = enmResponse.Success;
        try
        {
            this.strServerResponse = this.makeHTTPGetRequest(this.strBaseURL + "ded/stmtstatus.xhtml");
            if (!this.IsStringExists(this.strServerResponse, "//form[@id=\"stmtFiledStatus\"]"))
            {
                tracesResponse.Message = "Server Error";
                tracesResponse.Respons = enmResponse.SessionTimeout;
                return tracesResponse;
            }
            else
            {
                StringBuilder sbData = new StringBuilder();
                sbData.Append("_search=false");
                sbData.Append("&rows=100");
                sbData.Append("&page=1");
                sbData.Append("&sidx=");
                sbData.Append("&sord=asc");
                string s = this.makeHTTPPostRequest(this.strBaseURL + "ded/srv/DedStmtStatusServlet?financialYear=" + objData.FAYear + "&quarter=" + objData.Quarter + "&formType=" + objData.Forms + "&reqType=1", sbData);
                if (!string.IsNullOrEmpty(s))
                {
                    table = new DataTable();
                    table.Columns.Add("Token Number");
                    table.Columns.Add("Finnancial Year");
                    table.Columns.Add("Statement Type");
                    table.Columns.Add("Form Type");
                    table.Columns.Add("Quarter");
                    table.Columns.Add("Date of Filling");
                    table.Columns.Add("Date of Processing");
                    table.Columns.Add("Status");
                    string str = "Test";
                    DataRow row = (DataRow)null;
                    using (JsonTextReader jsonTextReader = new JsonTextReader((TextReader)new StringReader(s)))
                    {
                        while (jsonTextReader.Read())
                        {
                            switch (jsonTextReader.TokenType)
                            {
                                case JsonToken.PropertyName:
                                    str = jsonTextReader.Value.ToString();
                                    break;
                                case JsonToken.Integer:
                                case JsonToken.Float:
                                case JsonToken.String:
                                case JsonToken.Null:
                                    switch (str)
                                    {
                                        case "finyear":
                                            row = table.NewRow();
                                            row["Finnancial Year"] = (object)jsonTextReader.Value.ToString();
                                            break;
                                        case "quarter":
                                            row["Quarter"] = (object)jsonTextReader.Value.ToString();
                                            break;
                                        case "formtype":
                                            row["Form Type"] = (object)jsonTextReader.Value.ToString();
                                            break;
                                        case "tokenno":
                                            row["Token Number"] = (object)jsonTextReader.Value.ToString();
                                            break;
                                        case "dtoffiling":
                                            row["Date of Filling"] = (object)jsonTextReader.Value.ToString();
                                            break;
                                        case "status":
                                            row["Status"] = (object)jsonTextReader.Value.ToString();
                                            break;
                                        case "dtofprcng":
                                            row["Date of Processing"] = (object)jsonTextReader.Value.ToString();
                                            break;
                                        case "stmnttype":
                                            row["Statement Type"] = (object)Convert.ToString(jsonTextReader.Value);
                                            table.Rows.Add(row);
                                            break;
                                    }
                                    break;
                            }
                        }
                    }
                }
                else
                {
                    tracesResponse.Respons = enmResponse.Failed;
                    tracesResponse.Message = "Server error";
                }
            }
        }
        catch (Exception ex)
        {
            tracesResponse.Respons = !Regex.IsMatch(ex.Message, "410") ? enmResponse.Failed : enmResponse.SessionTimeout;
            tracesResponse.Message = ex.Message;
        }
        return tracesResponse;
    }

    public TracesResponse RequestForChallanStatusQuery1(TracesData objData)
    {
        DataTable dataTable = new DataTable();
        TracesResponse tracesResponse = new TracesResponse();
        tracesResponse.Respons = enmResponse.Success;
        try
        {
            this.strServerResponse = this.makeHTTPGetRequest(this.strBaseURL + "ded/challanstatusquery.xhtml");
            if (!this.IsStringExists(this.strServerResponse, "//form[@id=\"chlnStatusForm1\"]"))
            {
                tracesResponse.Message = "Server Error";
                tracesResponse.Respons = enmResponse.SessionTimeout;
                return tracesResponse;
            }
            else
            {
                StringBuilder sbData = new StringBuilder();
                sbData.Append("_search=false");
                sbData.Append("&rows=2000");
                sbData.Append("&page=1");
                sbData.Append("&sidx=");
                sbData.Append("&sord=");
                this.strServerResponse = this.makeHTTPPostRequest(this.strBaseURL + "ded/srv/ChlnStatusServlet?reqtype=0&sdate=" + objData.FromChallanDepositDate + "&edate=" + objData.ToChallanDepositDate + "&cstatus=" + objData.ChallanStatus, sbData);
                if (!string.IsNullOrEmpty(this.strServerResponse))
                {
                    dataTable = new DataTable();
                    dataTable.Columns.Add("Bank Code");
                    dataTable.Columns.Add("Branch Code");
                    dataTable.Columns.Add("Date of Deposit");
                    dataTable.Columns.Add("Challan Serial Number");
                    dataTable.Columns.Add("Challan Status");
                    dataTable.Columns.Add("chllan Amount");
                    dataTable.Columns.Add("Recipt Number");
                    string str = "Test";
                    DataRow row = (DataRow)null;
                    using (JsonTextReader jsonTextReader = new JsonTextReader((TextReader)new StringReader(this.strServerResponse)))
                    {
                        while (jsonTextReader.Read())
                        {
                            switch (jsonTextReader.TokenType)
                            {
                                case JsonToken.PropertyName:
                                    str = jsonTextReader.Value.ToString();
                                    break;
                                case JsonToken.Integer:
                                case JsonToken.Float:
                                case JsonToken.String:
                                case JsonToken.Null:
                                    switch (str)
                                    {
                                        case "dateOfDep":
                                            row = dataTable.NewRow();
                                            row["Date of Deposit"] = (object)jsonTextReader.Value.ToString();
                                            break;
                                        case "bankCode":
                                            row["Bank Code"] = (object)jsonTextReader.Value.ToString();
                                            break;
                                        case "branchCode":
                                            row["Branch Code"] = (object)jsonTextReader.Value.ToString();
                                            break;
                                        case "chlnSNo":
                                            row["Challan Serial Number"] = (object)jsonTextReader.Value.ToString();
                                            break;
                                        case "chlnStatus":
                                            row["Challan Status"] = (object)jsonTextReader.Value.ToString();
                                            break;
                                        case "chlnAmt":
                                            row["chllan Amount"] = (object)jsonTextReader.Value.ToString();
                                            break;
                                        case "recptNum":
                                            row["Recipt Number"] = (object)jsonTextReader.Value.ToString();
                                            dataTable.Rows.Add(row);
                                            break;
                                    }
                                    break;
                            }
                        }
                    }
                }
                else
                {
                    tracesResponse.Respons = enmResponse.Failed;
                    tracesResponse.Message = "Server error";
                }
                tracesResponse.CustomeTypes = (object)dataTable;
            }
        }
        catch (Exception ex)
        {
            tracesResponse.Respons = !Regex.IsMatch(ex.Message, "410") ? enmResponse.Failed : enmResponse.SessionTimeout;
            tracesResponse.Message = ex.Message;
        }
        return tracesResponse;
    }

    public TracesResponse RequestForChallanStatusQuery2(TracesData objData)
    {
        StringBuilder sbData = new StringBuilder();
        DataTable dataTable = new DataTable();
        TracesResponse tracesResponse = new TracesResponse();
        tracesResponse.Respons = enmResponse.Success;
        try
        {
            this.strServerResponse = this.makeHTTPGetRequest(this.strBaseURL + "ded/challanstatusquery.xhtml");
            if (!this.IsStringExists(this.strServerResponse, "//form[@id=\"chlnStatusForm2\"]"))
            {
                tracesResponse.Message = "Server Error";
                tracesResponse.Respons = enmResponse.SessionTimeout;
                return tracesResponse;
            }
            else
            {
                sbData.Append("_search=false");
                sbData.Append("&rows=2000");
                sbData.Append("&page=1");
                sbData.Append("&sidx=");
                sbData.Append("&sord=");
                this.strServerResponse = this.makeHTTPPostRequest(this.strBaseURL + "ded/srv/ChlnStatusServlet?reqtype=1&bsrCode=" + objData.BSRCode + "&chlnSNo=" + objData.ChallanSerialNo + "&chlnAmt=" + objData.ChallanAmount + "&dateOfDep=" + objData.TaxDepositedDate, sbData);
                if (!string.IsNullOrEmpty(this.strServerResponse))
                {
                    dataTable = new DataTable();
                    dataTable.Columns.Add("Bank Code");
                    dataTable.Columns.Add("Branch Code");
                    dataTable.Columns.Add("Date of Deposit");
                    dataTable.Columns.Add("Challan Serial Number");
                    dataTable.Columns.Add("Challan Status");
                    dataTable.Columns.Add("chllan Amount");
                    dataTable.Columns.Add("Recipt Number");
                    string str = "Test";
                    DataRow row = (DataRow)null;
                    using (JsonTextReader jsonTextReader = new JsonTextReader((TextReader)new StringReader(this.strServerResponse)))
                    {
                        while (jsonTextReader.Read())
                        {
                            switch (jsonTextReader.TokenType)
                            {
                                case JsonToken.PropertyName:
                                    str = jsonTextReader.Value.ToString();
                                    break;
                                case JsonToken.Integer:
                                case JsonToken.Float:
                                case JsonToken.String:
                                case JsonToken.Null:
                                    switch (str)
                                    {
                                        case "dateOfDep":
                                            row = dataTable.NewRow();
                                            row["Date of Deposit"] = (object)jsonTextReader.Value.ToString();
                                            break;
                                        case "bankCode":
                                            row["Bank Code"] = (object)jsonTextReader.Value.ToString();
                                            break;
                                        case "branchCode":
                                            row["Branch Code"] = (object)jsonTextReader.Value.ToString();
                                            break;
                                        case "chlnSNo":
                                            row["Challan Serial Number"] = (object)jsonTextReader.Value.ToString();
                                            break;
                                        case "chlnStatus":
                                            row["Challan Status"] = (object)jsonTextReader.Value.ToString();
                                            break;
                                        case "chlnAmt":
                                            row["chllan Amount"] = (object)jsonTextReader.Value.ToString();
                                            break;
                                        case "recptNum":
                                            row["Recipt Number"] = (object)jsonTextReader.Value.ToString();
                                            dataTable.Rows.Add(row);
                                            break;
                                    }
                                    break;
                            }
                        }
                    }
                }
                else
                {
                    tracesResponse.Respons = enmResponse.Failed;
                    tracesResponse.Message = "Server error";
                }
                tracesResponse.CustomeTypes = (object)dataTable;
            }
        }
        catch (Exception ex)
        {
            tracesResponse.Respons = !Regex.IsMatch(ex.Message, "410") ? enmResponse.Failed : enmResponse.SessionTimeout;
            tracesResponse.Message = ex.Message;
        }
        return tracesResponse;
    }

    public TracesResponse RequestForConsumptionDetails(TracesData objData)
    {
        StringBuilder sbData = new StringBuilder();
        DataTable dataTable = new DataTable();
        TracesResponse tracesResponse = new TracesResponse();
        tracesResponse.Respons = enmResponse.Success;
        try
        {
            sbData.Append("_search=false");
            sbData.Append("&rows=2000");
            sbData.Append("&page=1");
            sbData.Append("&sidx=tokenNum");
            sbData.Append("&sord=desc");
            this.strServerResponse = this.makeHTTPPostRequest(this.strBaseURL + "ded/srv/ChlnStatusServlet?reqtype=2&recptNum=" + objData.PRN_NO + "&chlnSNo=" + objData.ChallanSerialNo + "&chlnAmt=" + objData.ChallanAmount + "&dateOfDep=" + objData.FromChallanDepositDate + "&bsrCode=" + objData.BSRCode, sbData);
            if (!string.IsNullOrEmpty(this.strServerResponse))
            {
                int num = 0;
                dataTable = new DataTable();
                dataTable.Columns.Add("Token Number");
                dataTable.Columns.Add("Finnancial Year");
                dataTable.Columns.Add("Quarter");
                dataTable.Columns.Add("Form Type");
                dataTable.Columns.Add("Claimed Amount");
                dataTable.Columns.Add("Challan Status");
                dataTable.Columns.Add("Excess Amount Claimed");
                dataTable.Columns.Add("Available Amount");
                string str = "Test";
                DataRow row = (DataRow)null;
                using (JsonTextReader jsonTextReader = new JsonTextReader((TextReader)new StringReader(this.strServerResponse)))
                {
                    while (jsonTextReader.Read())
                    {
                        switch (jsonTextReader.TokenType)
                        {
                            case JsonToken.PropertyName:
                                str = jsonTextReader.Value.ToString();
                                break;
                            case JsonToken.Integer:
                            case JsonToken.Float:
                            case JsonToken.String:
                            case JsonToken.Null:
                                switch (str)
                                {
                                    case "rowCount":
                                        num = Convert.ToInt32(jsonTextReader.Value);
                                        break;
                                    case "tokenNum":
                                        row = dataTable.NewRow();
                                        row["Token Number"] = (object)jsonTextReader.Value.ToString();
                                        break;
                                    case "finYr":
                                        row["Finnancial Year"] = (object)jsonTextReader.Value.ToString();
                                        break;
                                    case "qtr":
                                        row["Quarter"] = (object)jsonTextReader.Value.ToString();
                                        break;
                                    case "formType":
                                        row["Form Type"] = (object)jsonTextReader.Value.ToString();
                                        break;
                                    case "claimAmt":
                                        row["Claimed Amount"] = (object)jsonTextReader.Value.ToString();
                                        break;
                                    case "chlnStatus":
                                        row["Challan Status"] = (object)jsonTextReader.Value.ToString();
                                        break;
                                    case "excessAmt":
                                        row["Excess Amount Claimed"] = (object)jsonTextReader.Value.ToString();
                                        break;
                                    case "availAmt":
                                        if (num > 0)
                                        {
                                            row["Available Amount"] = (object)jsonTextReader.Value.ToString();
                                            dataTable.Rows.Add(row);
                                            break;
                                        }
                                        else
                                            break;
                                }
                                break;
                        }
                    }
                }
            }
            else
            {
                tracesResponse.Respons = enmResponse.Failed;
                tracesResponse.Message = "Server error";
            }
            tracesResponse.CustomeTypes = (object)dataTable;
        }
        catch (Exception ex)
        {
            tracesResponse.Respons = !Regex.IsMatch(ex.Message, "410") ? enmResponse.Failed : enmResponse.SessionTimeout;
            tracesResponse.Message = ex.Message;
        }
        return tracesResponse;
    }

    public TracesResponse RequestForDeductionDetailsForDeductee(TracesData objData)
    {
        TracesResponse tracesResponse = new TracesResponse();
        Deductor deductor = new Deductor();
        try
        {
            this.strServerResponse = this.makeHTTPGetRequest(this.strBaseURL + "ded/tdstcscredit.xhtml");
            if (!this.IsStringExists(this.strServerResponse, "//form[@id=\"viewTdsTcsCredit\"]"))
            {
                tracesResponse.Message = "Server Error";
                tracesResponse.Respons = enmResponse.SessionTimeout;
                return tracesResponse;
            }
            else
            {
                StringBuilder sbData1 = new StringBuilder();
                sbData1.Append("pan=" + objData.PAN1);
                sbData1.Append("&financialYear=" + objData.FAYear);
                sbData1.Append("&quarter=" + objData.Quarter);
                sbData1.Append("&formType=" + objData.Forms);
                sbData1.Append("&clickGo=1");
                deductor.DeducteePAN = objData.PAN1;
                foreach (KeyValuePair<string, string> keyValuePair in this.TraceViewStateData(this.strServerResponse, "//form[@id=\"viewTdsTcsCredit\"]"))
                {
                    switch (keyValuePair.Key)
                    {
                        case "tan":
                            sbData1.Append("&tan=" + keyValuePair.Value);
                            deductor.TAN = keyValuePair.Value;
                            break;
                        case "currYear":
                            sbData1.Append("&currYear=" + keyValuePair.Value);
                            break;
                        case "currQtr":
                            sbData1.Append("&currQtr=" + keyValuePair.Value);
                            break;
                        case "viewTdsTcsCredit_SUBMIT":
                            sbData1.Append("&viewTdsTcsCredit_SUBMIT=" + keyValuePair.Value);
                            break;
                        case "javax.faces.ViewState":
                            sbData1.Append("&javax.faces.ViewState=" + HttpUtility.UrlEncode(keyValuePair.Value));
                            break;
                    }
                }
                this.strServerResponse = this.makeHTTPPostRequest(this.strBaseURL + "ded/tdstcscredit.xhtml", sbData1);
                tracesResponse = this.IsServerError(this.strServerResponse, "//ul[@id=\"err_Summary\"]");
                if (tracesResponse.Respons == enmResponse.Failed)
                {
                    tracesResponse.Respons = enmResponse.Failed;
                    return tracesResponse;
                }
                else
                {
                    deductor.AssessmentYear = this.RetrieveElementValue(this.strServerResponse, "//form[@id=\"tabStmtChlnData\"]", "//span[@id=\"stmtDetail_assyear\"]", TracesConnect.enmElementType.InnerText);
                    deductor.RegularStatement = this.RetrieveElementValue(this.strServerResponse, "//form[@id=\"tabStmtChlnData\"]", "//span[@id=\"stmtDetail_tokNoRegStmt\"]", TracesConnect.enmElementType.InnerText);
                    deductor.CorrectionStatement = this.RetrieveElementValue(this.strServerResponse, "//form[@id=\"tabStmtChlnData\"]", "//span[@id=\"stmtDetail_tokNoLstStmt\"]", TracesConnect.enmElementType.InnerText);
                    string str1 = this.RetrieveElementValue(this.strServerResponse, "//form[@id=\"dispMsg\"]", "//input[@id=\"stmtMstrId\"]", TracesConnect.enmElementType.Value);
                    StringBuilder sbData2 = new StringBuilder();
                    sbData2.Append("_search=false");
                    sbData2.Append("&rows=2000");
                    sbData2.Append("&page=1");
                    sbData2.Append("&sidx=");
                    sbData2.Append("&sord=asc");
                    this.strServerResponse = this.makeHTTPPostRequest(this.strBaseURL + "ded/srv/DedTdsTcsSevlet?pan=" + objData.PAN1 + "&stmtMstrId=" + str1 + "&finYear=" + objData.FAYear + "&quarter=" + objData.Quarter, sbData2);
                    DataTable dataTable = (DataTable)null;
                    if (!string.IsNullOrEmpty(this.strServerResponse))
                    {
                        dataTable = new DataTable();
                        dataTable.Columns.Add("Deductee Detail Record Number");
                        dataTable.Columns.Add("Section Code");
                        dataTable.Columns.Add("Rate of Deduction (%)");
                        dataTable.Columns.Add("Transaction Amount");
                        dataTable.Columns.Add("Date of Transaction");
                        dataTable.Columns.Add("Tax Deducted / Collected");
                        dataTable.Columns.Add("Date of Deduction");
                        dataTable.Columns.Add("Tax Deposited");
                        dataTable.Columns.Add("Status of Booking");
                        string str2 = "Test";
                        DataRow row = (DataRow)null;
                        using (JsonTextReader jsonTextReader = new JsonTextReader((TextReader)new StringReader(this.strServerResponse)))
                        {
                            while (jsonTextReader.Read())
                            {
                                switch (jsonTextReader.TokenType)
                                {
                                    case JsonToken.PropertyName:
                                        str2 = jsonTextReader.Value.ToString();
                                        break;
                                    case JsonToken.Integer:
                                    case JsonToken.Float:
                                    case JsonToken.String:
                                    case JsonToken.Null:
                                        switch (str2)
                                        {
                                            case "dedNam":
                                                deductor.Deductee = jsonTextReader.Value.ToString();
                                                break;
                                            case "rowCount":
                                                deductor.NoOfDetailsRecord = Convert.ToInt32(jsonTextReader.Value);
                                                break;
                                            case "dedDetRNo":
                                                row = dataTable.NewRow();
                                                row["Deductee Detail Record Number"] = (object)jsonTextReader.Value.ToString();
                                                break;
                                            case "secCode":
                                                row["Section Code"] = (object)jsonTextReader.Value.ToString();
                                                break;
                                            case "dedRate":
                                                row["Rate of Deduction (%)"] = (object)jsonTextReader.Value.ToString();
                                                break;
                                            case "transAmnt":
                                                row["Transaction Amount"] = (object)jsonTextReader.Value.ToString();
                                                break;
                                            case "transDate":
                                                row["Date of Transaction"] = (object)jsonTextReader.Value.ToString();
                                                break;
                                            case "taxDeducted":
                                                row["Tax Deducted / Collected"] = (object)jsonTextReader.Value.ToString();
                                                break;
                                            case "deductionDate":
                                                row["Date of Deduction"] = (object)jsonTextReader.Value.ToString();
                                                break;
                                            case "taxDeposited":
                                                row["Tax Deposited"] = (object)jsonTextReader.Value.ToString();
                                                break;
                                            case "status":
                                                row["Status of Booking"] = (object)jsonTextReader.Value.ToString();
                                                dataTable.Rows.Add(row);
                                                break;
                                        }
                                        break;
                                }
                            }
                        }
                    }
                    else
                    {
                        tracesResponse.Respons = enmResponse.Failed;
                        tracesResponse.Message = "Server error";
                    }
                    tracesResponse.CustomeTypes = (object)new ArrayList()
            {
              (object) deductor,
              (object) dataTable
            };
                }
            }
        }
        catch (Exception ex)
        {
            tracesResponse.Respons = enmResponse.Failed;
            tracesResponse.Message = ex.Message;
        }
        return tracesResponse;
    }

    public TracesResponse RequestForNSDLConsoFile(TracesLogin objLogin, TracesData objTraceData)
    {
        TracesResponse tracesResponse = new TracesResponse();
        try
        {
            if (!this.IsSessionExists)
            {
                tracesResponse = this.makeLoginToTRACES(objLogin);
                if (tracesResponse.Respons == enmResponse.Failed)
                    return tracesResponse;
            }
            string request = this.makeHTTPGetRequest(this.strBaseURL + "ded/nsdlconsofile.xhtml");
            if (!this.IsStringExists(request, "//form[@id=\"requestnsdlconsoForm\"]"))
            {
                string str = this.RetrieveElementValue(request, "//div[@class=\"padLeft5 margintop20\"]", "//span[@class=\"boldFont\"]", TracesConnect.enmElementType.InnerText);
                if (!string.IsNullOrEmpty(str))
                {
                    tracesResponse.Message = str;
                    tracesResponse.Respons = enmResponse.Failed;
                    return tracesResponse;
                }
                else
                {
                    tracesResponse.Message = "Server Error";
                    tracesResponse.Respons = enmResponse.SessionTimeout;
                    return tracesResponse;
                }
            }
            else
            {
                tracesResponse = this.IsServerError(request, "//span[@id=\"err_Summary\"]");
                if (tracesResponse.Respons == enmResponse.Failed)
                {
                    this.Logoff();
                    tracesResponse.Respons = enmResponse.Failed;
                    return tracesResponse;
                }
                else
                {
                    StringBuilder sbData1 = new StringBuilder();
                    sbData1.Append("finYr=" + objTraceData.FAYear);
                    sbData1.Append("&qrtr=" + objTraceData.Quarter);
                    sbData1.Append("&frmType=" + objTraceData.Forms);
                    sbData1.Append("&download_conso=Go");
                    Dictionary<string, string> dictionary1 = this.TraceViewStateData(request, "//form[@id=\"requestnsdlconsoForm\"]");
                    if (dictionary1.Count <= 0)
                    {
                        this.Logoff();
                        tracesResponse.Message = "Server Error";
                        tracesResponse.Respons = enmResponse.SessionTimeout;
                        return tracesResponse;
                    }
                    else
                    {
                        foreach (KeyValuePair<string, string> keyValuePair in dictionary1)
                            sbData1.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                        string str1 = this.makeHTTPPostRequest(this.strBaseURL + "ded/nsdlconsofile.xhtml", sbData1);
                        tracesResponse = this.IsServerError(str1, "//ul[@id=\"err_Summary\"]");
                        if (tracesResponse.Respons == enmResponse.Failed)
                        {
                            this.Logoff();
                            tracesResponse.Respons = enmResponse.Failed;
                            return tracesResponse;
                        }
                        else if (!this.IsStringExists(str1, "//form[@id=\"dedkyc\"]"))
                        {
                            this.Logoff();
                            this.bnlSessionExists = false;
                            tracesResponse.Message = "Please Enter Valid Finnancial Details";
                            tracesResponse.Respons = enmResponse.SessionTimeout;
                            return tracesResponse;
                        }
                        else
                        {
                            StringBuilder sbData2 = new StringBuilder();
                            sbData2.Append("authcode=" + objTraceData.AuthenticationCode);
                            sbData2.Append("&stmtSpecKyc=1");
                            sbData2.Append("&bforeLogin=3");
                            sbData2.Append("&token=" + objTraceData.PRN_NO);
                            if (objTraceData.IsNoChallanCheck)
                                sbData2.Append("&cinbinCheck=" + objTraceData.IsNoChallanCheck);
                            sbData2.Append("&cinbinValue=" + objTraceData.IsNoChallan);
                            sbData2.Append("&bkEntryFlgChk=" + objTraceData.IsPaymentByBookAdjustmentCheck);
                            sbData2.Append("&bkEntryValue=" + objTraceData.IsPaymentByBookAdjustment);
                            if (objTraceData.panAmtValueCheck)
                                sbData2.Append("&panAmtCheck=" + objTraceData.panAmtValueCheck);
                            sbData2.Append("&panAmtValue=" + objTraceData.panAmtValue);
                            if (!objTraceData.IsNoChallanCheck)
                            {
                                sbData2.Append("&bsr=" + objTraceData.BSRCode);
                                sbData2.Append("&dtoftaxdep=" + objTraceData.TaxDepositedDate);
                                sbData2.Append("&csn=" + objTraceData.ChallanSerialNo);
                                sbData2.Append("&chlnamt=" + objTraceData.ChallanAmount);
                            }
                            if (!objTraceData.panAmtValueCheck)
                            {
                                sbData2.Append("&pan1=" + objTraceData.PAN1);
                                sbData2.Append("&amt1=" + objTraceData.PAN1Amount);
                                sbData2.Append("&pan2=" + objTraceData.PAN2);
                                sbData2.Append("&amt2=" + objTraceData.PAN2Amount);
                                sbData2.Append("&pan3=" + objTraceData.PAN3);
                                sbData2.Append("&amt3=" + objTraceData.PAN3Amount);
                            }
                            sbData2.Append("&clickKYC=Proceed");
                            sbData2.Append("&dedkyc_SUBMIT=1");
                            Dictionary<string, string> dictionary2 = this.TraceViewStateData(str1, "//form[@id=\"dedkyc\"]");
                            foreach (KeyValuePair<string, string> keyValuePair in dictionary2)
                                sbData2.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                            if (dictionary2.Count <= 0)
                            {
                                this.Logoff();
                                this.bnlSessionExists = false;
                                tracesResponse.Message = "Server Error";
                                tracesResponse.Respons = enmResponse.SessionTimeout;
                                return tracesResponse;
                            }
                            else
                            {
                                string str2 = this.makeHTTPPostRequest(this.strBaseURL + "ded/kyc3form.xhtml", sbData2);
                                if (!this.IsStringExists(str2, "//form[@id=\"dedkyc\"]"))
                                {
                                    this.bnlSessionExists = false;
                                    tracesResponse.Message = "Server Error";
                                    tracesResponse.Respons = enmResponse.SessionTimeout;
                                    return tracesResponse;
                                }
                                else
                                {
                                    tracesResponse = this.IsServerError(str2, "//div[@id=\"err_Summary\"]");
                                    if (tracesResponse.Respons == enmResponse.Failed)
                                    {
                                        this.Logoff();
                                        tracesResponse.Respons = enmResponse.Failed;
                                        return tracesResponse;
                                    }
                                    else
                                    {
                                        string str3 = this.RetrieveElementValue(str2, "//form[@id=\"dedkyc\"]", "//input[@id=\"authcode\"]", TracesConnect.enmElementType.Value);
                                        Dictionary<string, string> dictionary3 = this.TraceViewStateData(str2, "//form[@id=\"dedkyc\"]");
                                        StringBuilder sbData3 = new StringBuilder();
                                        sbData3.Append("authcode=" + HttpUtility.UrlEncode(str3.Trim()));
                                        sbData3.Append("&redirect=" + HttpUtility.UrlEncode("Proceed with Transaction"));
                                        sbData3.Append("&dedkyc_SUBMIT=1");
                                        foreach (KeyValuePair<string, string> keyValuePair in dictionary3)
                                        {
                                            if (keyValuePair.Key == "javax.faces.ViewState")
                                                sbData3.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                                        }
                                        Dictionary<string, string> dictionary4 = this.TraceViewStateData(this.makeHTTPPostRequest(this.strBaseURL + "ded/kyc3confirm.xhtml", sbData3), "//form[@id=\"downloadreqspec\"]");
                                        StringBuilder stringBuilder = new StringBuilder();
                                        foreach (KeyValuePair<string, string> keyValuePair in dictionary4)
                                        {
                                            if (keyValuePair.Key == "finYr")
                                                stringBuilder.Append("fy=" + keyValuePair.Value);
                                            if (keyValuePair.Key == "qrtr")
                                            {
                                                if (keyValuePair.Value == "")
                                                    stringBuilder.Append("&qr=0");
                                                else
                                                    stringBuilder.Append("&qr=" + keyValuePair.Value);
                                            }
                                            if (keyValuePair.Key == "formType")
                                                stringBuilder.Append("&ft=" + keyValuePair.Value);
                                            if (keyValuePair.Key == "dwldType")
                                                stringBuilder.Append("&dt=" + keyValuePair.Value);
                                        }
                                        string str4 = this.RetrieveElementValue(this.makeHTTPGetRequest(this.strBaseURL + "srv/CreateDwnldReqServlet?" + ((object)stringBuilder).ToString()), "//div[@class='margintop20']", "//h5", TracesConnect.enmElementType.InnerText);
                                        if (!string.IsNullOrEmpty(str4))
                                        {
                                            tracesResponse.CustomeTypes = (object)new RequestStatus()
                                            {
                                                AuthenticationCode = str3,
                                                StatusMessage = str4
                                            };
                                            tracesResponse.Respons = enmResponse.Success;
                                        }
                                        this.Logoff();
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            this.Logoff();
            this.bnlSessionExists = false;
            tracesResponse.Respons = enmResponse.Failed;
            tracesResponse.Message = ex.Message;
        }
        return tracesResponse;
    }

    public TracesResponse RequestForJustificationReportDownload(TracesLogin objLogin, TracesData objTraceData)
    {
        TracesResponse tracesResponse = new TracesResponse();
        try
        {
            if (!this.IsSessionExists)
            {
                tracesResponse = this.makeLoginToTRACES(objLogin);
                if (tracesResponse.Respons == enmResponse.Failed)
                    return tracesResponse;
            }
            string request = this.makeHTTPGetRequest(this.strBaseURL + "ded/justrepdwnld.xhtml");
            if (!this.IsStringExists(request, "//form[@id=\"justificationForm\"]"))
            {
                tracesResponse.Message = "Server Error";
                tracesResponse.Respons = enmResponse.SessionTimeout;
                this.Logoff();
                return tracesResponse;
            }
            else
            {
                tracesResponse = this.IsServerError(this.strServerResponse, "//span[@id=\"err_Summary\"]");
                if (tracesResponse.Respons == enmResponse.Failed)
                {
                    tracesResponse.Message = "Server Error";
                    tracesResponse.Respons = enmResponse.Failed;
                    this.Logoff();
                    return tracesResponse;
                }
                else
                {
                    StringBuilder sbData1 = new StringBuilder();
                    sbData1.Append("finYr=" + objTraceData.FAYear);
                    sbData1.Append("&qrtr=" + objTraceData.Quarter);
                    sbData1.Append("&frmType=" + objTraceData.Forms);
                    sbData1.Append("&download_justReport=Go");
                    Dictionary<string, string> dictionary1 = this.TraceViewStateData(request, "//form[@id=\"justificationForm\"]");
                    if (dictionary1.Count <= 0)
                    {
                        tracesResponse.Message = "Server Error";
                        tracesResponse.Respons = enmResponse.SessionTimeout;
                        this.Logoff();
                        return tracesResponse;
                    }
                    else
                    {
                        foreach (KeyValuePair<string, string> keyValuePair in dictionary1)
                            sbData1.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                        string str1 = this.makeHTTPPostRequest(this.strBaseURL + "ded/justrepdwnld.xhtml", sbData1);
                        tracesResponse = this.IsServerError(str1, "//ul[@id=\"err_Summary\"]");
                        if (tracesResponse.Respons == enmResponse.Failed)
                        {
                            this.Logoff();
                            tracesResponse.Respons = enmResponse.Failed;
                            return tracesResponse;
                        }
                        else if (!this.IsStringExists(str1, "//form[@id=\"dedkyc\"]"))
                        {
                            tracesResponse.Message = "Server Error";
                            this.Logoff();
                            tracesResponse.Respons = enmResponse.SessionTimeout;
                            return tracesResponse;
                        }
                        else
                        {
                            StringBuilder sbData2 = new StringBuilder();
                            sbData2.Append("authcode=" + objTraceData.AuthenticationCode);
                            sbData2.Append("&stmtSpecKyc=1");
                            sbData2.Append("&bforeLogin=3");
                            sbData2.Append("&token=" + objTraceData.PRN_NO);
                            if (objTraceData.IsNoChallanCheck)
                                sbData2.Append("&cinbinCheck=" + objTraceData.IsNoChallanCheck);
                            sbData2.Append("&cinbinValue=" + objTraceData.IsNoChallan);
                            sbData2.Append("&bkEntryFlgChk=" + objTraceData.IsPaymentByBookAdjustmentCheck);
                            sbData2.Append("&bkEntryValue=" + objTraceData.IsPaymentByBookAdjustment);
                            if (objTraceData.panAmtValueCheck)
                                sbData2.Append("&panAmtCheck=" + objTraceData.panAmtValueCheck);
                            sbData2.Append("&panAmtValue=" + objTraceData.panAmtValue);
                            if (!objTraceData.IsNoChallanCheck)
                            {
                                sbData2.Append("&bsr=" + objTraceData.BSRCode);
                                sbData2.Append("&dtoftaxdep=" + objTraceData.TaxDepositedDate);
                                sbData2.Append("&csn=" + objTraceData.ChallanSerialNo);
                                sbData2.Append("&chlnamt=" + objTraceData.ChallanAmount);
                            }
                            if (!objTraceData.panAmtValueCheck)
                            {
                                sbData2.Append("&pan1=" + objTraceData.PAN1);
                                sbData2.Append("&amt1=" + objTraceData.PAN1Amount);
                                sbData2.Append("&pan2=" + objTraceData.PAN2);
                                sbData2.Append("&amt2=" + objTraceData.PAN2Amount);
                                sbData2.Append("&pan3=" + objTraceData.PAN3);
                                sbData2.Append("&amt3=" + objTraceData.PAN3Amount);
                            }
                            sbData2.Append("&clickKYC=Proceed");
                            sbData2.Append("&dedkyc_SUBMIT=1");
                            Dictionary<string, string> dictionary2 = this.TraceViewStateData(str1, "//form[@id=\"dedkyc\"]");
                            foreach (KeyValuePair<string, string> keyValuePair in dictionary2)
                                sbData2.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                            if (dictionary2.Count <= 0)
                            {
                                tracesResponse.Message = "Server Error";
                                tracesResponse.Respons = enmResponse.SessionTimeout;
                                this.Logoff();
                                return tracesResponse;
                            }
                            else
                            {
                                string str2 = this.makeHTTPPostRequest(this.strBaseURL + "ded/kyc3form.xhtml", sbData2);
                                if (!this.IsStringExists(str2, "//form[@id=\"dedkyc\"]"))
                                {
                                    tracesResponse.Message = "Server Error";
                                    tracesResponse.Respons = enmResponse.SessionTimeout;
                                    this.Logoff();
                                    return tracesResponse;
                                }
                                else
                                {
                                    tracesResponse = this.IsServerError(str2, "//div[@id=\"err_Summary\"]");
                                    if (tracesResponse.Respons == enmResponse.Failed)
                                    {
                                        tracesResponse.Respons = enmResponse.Failed;
                                        this.Logoff();
                                        return tracesResponse;
                                    }
                                    else
                                    {
                                        string str3 = this.RetrieveElementValue(str2, "//form[@id=\"dedkyc\"]", "//input[@id=\"authcode\"]", TracesConnect.enmElementType.Value);
                                        Dictionary<string, string> dictionary3 = this.TraceViewStateData(str2, "//form[@id=\"dedkyc\"]");
                                        StringBuilder sbData3 = new StringBuilder();
                                        sbData3.Append("authcode=" + HttpUtility.UrlEncode(str3.Trim()));
                                        sbData3.Append("&redirect=" + HttpUtility.UrlEncode("Proceed with Transaction"));
                                        sbData3.Append("&dedkyc_SUBMIT=1");
                                        foreach (KeyValuePair<string, string> keyValuePair in dictionary3)
                                        {
                                            if (keyValuePair.Key == "javax.faces.ViewState")
                                                sbData3.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                                        }
                                        Dictionary<string, string> dictionary4 = this.TraceViewStateData(this.makeHTTPPostRequest(this.strBaseURL + "ded/kyc3confirm.xhtml", sbData3), "//form[@id=\"downloadreqspec\"]");
                                        StringBuilder stringBuilder = new StringBuilder();
                                        foreach (KeyValuePair<string, string> keyValuePair in dictionary4)
                                        {
                                            if (keyValuePair.Key == "finYr")
                                                stringBuilder.Append("fy=" + keyValuePair.Value);
                                            if (keyValuePair.Key == "qrtr")
                                            {
                                                if (keyValuePair.Value == "")
                                                    stringBuilder.Append("&qr=0");
                                                else
                                                    stringBuilder.Append("&qr=" + keyValuePair.Value);
                                            }
                                            if (keyValuePair.Key == "formType")
                                                stringBuilder.Append("&ft=" + keyValuePair.Value);
                                            if (keyValuePair.Key == "dwldType")
                                                stringBuilder.Append("&dt=" + keyValuePair.Value);
                                        }
                                        string str4 = this.RetrieveElementValue(this.makeHTTPGetRequest(this.strBaseURL + "srv/CreateDwnldReqServlet?" + ((object)stringBuilder).ToString()), "//div[@class='margintop20']", "//h5", TracesConnect.enmElementType.InnerText);
                                        if (!string.IsNullOrEmpty(str4))
                                        {
                                            tracesResponse.CustomeTypes = (object)new RequestStatus()
                                            {
                                                AuthenticationCode = str3,
                                                StatusMessage = str4
                                            };
                                            tracesResponse.Respons = enmResponse.Success;
                                        }
                                        this.Logoff();
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            tracesResponse.Respons = enmResponse.Failed;
            tracesResponse.Message = ex.Message;
            this.Logoff();
        }
        return tracesResponse;
    }

    public TracesResponse RequestForDownloadForm16A(TracesLogin objLogin, TracesData objTraceData)
    {
        TracesResponse tracesResponse = new TracesResponse();
        try
        {
            if (!this.IsSessionExists)
            {
                tracesResponse = this.makeLoginToTRACES(objLogin);
                if (tracesResponse.Respons == enmResponse.Failed)
                    return tracesResponse;
            }
            string request = this.makeHTTPGetRequest(this.strBaseURL + "ded/download16a.xhtml");
            if (!this.IsStringExists(request, "//form[@id=\"bulkSearch\"]"))
            {
                tracesResponse.Message = "Server Error";
                tracesResponse.Respons = enmResponse.SessionTimeout;
                this.Logoff();
                return tracesResponse;
            }
            else
            {
                StringBuilder sbData1 = new StringBuilder();
                sbData1.Append("dwnldFormBulkType=14");
                sbData1.Append("&bulkfinYr=" + objTraceData.FAYear);
                sbData1.Append("&bulkquarter=" + objTraceData.Quarter);
                sbData1.Append("&bulkformType=" + objTraceData.Forms);
                sbData1.Append("&bulkGo=Go");
                sbData1.Append("&bulkSearch_SUBMIT=1");
                Dictionary<string, string> dictionary1 = this.TraceViewStateData(request, "//form[@id=\"bulkSearch\"]");
                if (dictionary1.Count <= 0)
                {
                    tracesResponse.Message = "Server Error";
                    tracesResponse.Respons = enmResponse.SessionTimeout;
                    this.Logoff();
                    return tracesResponse;
                }
                else
                {
                    foreach (KeyValuePair<string, string> keyValuePair in dictionary1)
                    {
                        if (keyValuePair.Key == "javax.faces.ViewState")
                        {
                            sbData1.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                            break;
                        }
                    }
                    string str1 = this.makeHTTPPostRequest(this.strBaseURL + "ded/download16a.xhtml", sbData1);
                    tracesResponse = this.IsServerError(str1, "//ul[@id=\"err_Summary\"]");
                    if (tracesResponse.Respons == enmResponse.Failed)
                    {
                        tracesResponse.Respons = enmResponse.Failed;
                        this.Logoff();
                        return tracesResponse;
                    }
                    else if (!this.IsStringExists(str1, "//form[@id=\"deducteeDetails\"]"))
                    {
                        tracesResponse.Message = "Server Error";
                        tracesResponse.Respons = enmResponse.SessionTimeout;
                        this.Logoff();
                        return tracesResponse;
                    }
                    else
                    {
                        Dictionary<string, string> dictionary2 = this.TraceViewStateData(str1, "//form[@id=\"deducteeDetails\"]");
                        if (dictionary2.Count <= 0)
                        {
                            tracesResponse.Message = "Server Error";
                            tracesResponse.Respons = enmResponse.SessionTimeout;
                            this.Logoff();
                            return tracesResponse;
                        }
                        else
                        {
                            StringBuilder sbData2 = new StringBuilder();
                            sbData2.Append("j_id1972728517_7cc7de5f=submit");
                            foreach (KeyValuePair<string, string> keyValuePair in dictionary2)
                                sbData2.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                            string str2 = this.makeHTTPPostRequest(this.strBaseURL + "ded/form16adetls.xhtml", sbData2);
                            if (!this.IsStringExists(str2, "//form[@id=\"dedkyc\"]"))
                            {
                                tracesResponse.Message = "Server Error";
                                tracesResponse.Respons = enmResponse.SessionTimeout;
                                this.Logoff();
                                return tracesResponse;
                            }
                            else
                            {
                                StringBuilder sbData3 = new StringBuilder();
                                sbData3.Append("authcode=" + objTraceData.AuthenticationCode);
                                sbData3.Append("&stmtSpecKyc=1");
                                sbData3.Append("&bforeLogin=3");
                                sbData3.Append("&token=" + objTraceData.PRN_NO);
                                if (objTraceData.IsNoChallanCheck)
                                    sbData3.Append("&cinbinCheck=" + objTraceData.IsNoChallanCheck);
                                sbData3.Append("&cinbinValue=" + objTraceData.IsNoChallan);
                                sbData3.Append("&bkEntryFlgChk=" + objTraceData.IsPaymentByBookAdjustmentCheck);
                                sbData3.Append("&bkEntryValue=" + objTraceData.IsPaymentByBookAdjustment);
                                if (objTraceData.panAmtValueCheck)
                                    sbData3.Append("&panAmtCheck=" + objTraceData.panAmtValueCheck);
                                sbData3.Append("&panAmtValue=" + objTraceData.panAmtValue);
                                if (!objTraceData.IsNoChallanCheck)
                                {
                                    sbData3.Append("&bsr=" + objTraceData.BSRCode);
                                    sbData3.Append("&dtoftaxdep=" + objTraceData.TaxDepositedDate);
                                    sbData3.Append("&csn=" + objTraceData.ChallanSerialNo);
                                    sbData3.Append("&chlnamt=" + objTraceData.ChallanAmount);
                                }
                                if (!objTraceData.panAmtValueCheck)
                                {
                                    sbData3.Append("&pan1=" + objTraceData.PAN1);
                                    sbData3.Append("&amt1=" + objTraceData.PAN1Amount);
                                    sbData3.Append("&pan2=" + objTraceData.PAN2);
                                    sbData3.Append("&amt2=" + objTraceData.PAN2Amount);
                                    sbData3.Append("&pan3=" + objTraceData.PAN3);
                                    sbData3.Append("&amt3=" + objTraceData.PAN3Amount);
                                }
                                sbData3.Append("&clickKYC=Proceed");
                                sbData3.Append("&dedkyc_SUBMIT=1");
                                Dictionary<string, string> dictionary3 = this.TraceViewStateData(str2, "//form[@id=\"dedkyc\"]");
                                foreach (KeyValuePair<string, string> keyValuePair in dictionary3)
                                    sbData3.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                                if (dictionary3.Count <= 0)
                                {
                                    tracesResponse.Message = "Server Error";
                                    tracesResponse.Respons = enmResponse.SessionTimeout;
                                    return tracesResponse;
                                }
                                else
                                {
                                    string str3 = this.makeHTTPPostRequest(this.strBaseURL + "ded/kyc3form.xhtml", sbData3);
                                    if (!this.IsStringExists(str3, "//form[@id=\"dedkyc\"]"))
                                    {
                                        tracesResponse.Message = "Server Error";
                                        tracesResponse.Respons = enmResponse.SessionTimeout;
                                        return tracesResponse;
                                    }
                                    else
                                    {
                                        tracesResponse = this.IsServerError(str3, "//div[@id=\"err_Summary\"]");
                                        if (tracesResponse.Respons == enmResponse.Failed)
                                        {
                                            tracesResponse.Respons = enmResponse.Failed;
                                            return tracesResponse;
                                        }
                                        else
                                        {
                                            string str4 = this.RetrieveElementValue(str3, "//form[@id=\"dedkyc\"]", "//input[@id=\"authcode\"]", TracesConnect.enmElementType.Value);
                                            Dictionary<string, string> dictionary4 = this.TraceViewStateData(str3, "//form[@id=\"dedkyc\"]");
                                            StringBuilder sbData4 = new StringBuilder();
                                            sbData4.Append("authcode=" + HttpUtility.UrlEncode(str4.Trim()));
                                            sbData4.Append("&redirect=" + HttpUtility.UrlEncode("Proceed with Transaction"));
                                            sbData4.Append("&dedkyc_SUBMIT=1");
                                            foreach (KeyValuePair<string, string> keyValuePair in dictionary4)
                                            {
                                                if (keyValuePair.Key == "javax.faces.ViewState")
                                                    sbData4.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                                            }
                                            string str5 = this.RetrieveElementValue(this.makeHTTPPostRequest(this.strBaseURL + "ded/kyc3confirm.xhtml", sbData4), "//div[@class='margintop20']", "//h5", TracesConnect.enmElementType.InnerText);
                                            if (!string.IsNullOrEmpty(str5))
                                            {
                                                tracesResponse.CustomeTypes = (object)new RequestStatus()
                                                {
                                                    AuthenticationCode = str4,
                                                    StatusMessage = str5
                                                };
                                                tracesResponse.Respons = enmResponse.Success;
                                            }
                                            this.Logoff();
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            tracesResponse.Respons = enmResponse.Failed;
            tracesResponse.Message = ex.Message;
            this.Logoff();
        }
        return tracesResponse;
    }

    public TracesResponse RequestForDownloadForm16(TracesLogin objLogin, TracesData objTraceData)
    {
        TracesResponse tracesResponse = new TracesResponse();
        try
        {
            if (!this.IsSessionExists)
            {
                tracesResponse = this.makeLoginToTRACES(objLogin);
                if (tracesResponse.Respons == enmResponse.Failed)
                    return tracesResponse;
            }
            string request = this.makeHTTPGetRequest(this.strBaseURL + "ded/download16.xhtml");
            if (!this.IsStringExists(request, "//form[@id=\"bulkPan\"]"))
            {
                tracesResponse.Message = "Server Error";
                tracesResponse.Respons = enmResponse.SessionTimeout;
                this.Logoff();
                return tracesResponse;
            }
            else
            {
                StringBuilder sbData1 = new StringBuilder();
                sbData1.Append("dwnldFormBulkType=13");
                sbData1.Append("&bulkfinYr=" + objTraceData.FAYear);
                sbData1.Append("&bulkGo=Go");
                sbData1.Append("&bulkPan_SUBMIT=1");
                Dictionary<string, string> dictionary1 = this.TraceViewStateData(request, "//form[@id=\"bulkPan\"]");
                if (dictionary1.Count <= 0)
                {
                    tracesResponse.Message = "Server Error";
                    tracesResponse.Respons = enmResponse.SessionTimeout;
                    this.Logoff();
                    return tracesResponse;
                }
                else
                {
                    foreach (KeyValuePair<string, string> keyValuePair in dictionary1)
                    {
                        if (keyValuePair.Key == "javax.faces.ViewState")
                        {
                            sbData1.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                            break;
                        }
                    }
                    string str1 = this.makeHTTPPostRequest(this.strBaseURL + "ded/download16.xhtml", sbData1);
                    tracesResponse = this.IsServerError(str1, "//ul[@id=\"err_Summary\"]");
                    if (tracesResponse.Respons == enmResponse.Failed)
                    {
                        tracesResponse.Respons = enmResponse.Failed;
                        return tracesResponse;
                    }
                    else if (!this.IsStringExists(str1, "//form[@id=\"deducteeDetails\"]"))
                    {
                        tracesResponse.Message = "Server Error";
                        tracesResponse.Respons = enmResponse.SessionTimeout;
                        return tracesResponse;
                    }
                    else
                    {
                        Dictionary<string, string> dictionary2 = this.TraceViewStateData(str1, "//form[@id=\"deducteeDetails\"]");
                        if (dictionary2.Count <= 0)
                        {
                            tracesResponse.Message = "Server Error";
                            tracesResponse.Respons = enmResponse.SessionTimeout;
                            return tracesResponse;
                        }
                        else
                        {
                            StringBuilder sbData2 = new StringBuilder();
                            sbData2.Append("j_id1972728517_7cc7de5f=submit");
                            foreach (KeyValuePair<string, string> keyValuePair in dictionary2)
                                sbData2.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                            string str2 = this.makeHTTPPostRequest(this.strBaseURL + "ded/form16adetls.xhtml", sbData2);
                            if (!this.IsStringExists(str2, "//form[@id=\"dedkyc\"]"))
                            {
                                tracesResponse.Message = "Server Error";
                                tracesResponse.Respons = enmResponse.SessionTimeout;
                                return tracesResponse;
                            }
                            else
                            {
                                StringBuilder sbData3 = new StringBuilder();
                                sbData3.Append("authcode=" + objTraceData.AuthenticationCode);
                                sbData3.Append("&stmtSpecKyc=1");
                                sbData3.Append("&bforeLogin=3");
                                sbData3.Append("&token=" + objTraceData.PRN_NO);
                                if (objTraceData.IsNoChallanCheck)
                                    sbData3.Append("&cinbinCheck=" + objTraceData.IsNoChallanCheck);
                                sbData3.Append("&cinbinValue=" + objTraceData.IsNoChallan);
                                sbData3.Append("&bkEntryFlgChk=" + objTraceData.IsPaymentByBookAdjustmentCheck);
                                sbData3.Append("&bkEntryValue=" + objTraceData.IsPaymentByBookAdjustment);
                                if (objTraceData.panAmtValueCheck)
                                    sbData3.Append("&panAmtCheck=" + objTraceData.panAmtValueCheck);
                                sbData3.Append("&panAmtValue=" + objTraceData.panAmtValue);
                                if (!objTraceData.IsNoChallanCheck)
                                {
                                    sbData3.Append("&bsr=" + objTraceData.BSRCode);
                                    sbData3.Append("&dtoftaxdep=" + objTraceData.TaxDepositedDate);
                                    sbData3.Append("&csn=" + objTraceData.ChallanSerialNo);
                                    sbData3.Append("&chlnamt=" + objTraceData.ChallanAmount);
                                }
                                if (!objTraceData.panAmtValueCheck)
                                {
                                    sbData3.Append("&pan1=" + objTraceData.PAN1);
                                    sbData3.Append("&amt1=" + objTraceData.PAN1Amount);
                                    sbData3.Append("&pan2=" + objTraceData.PAN2);
                                    sbData3.Append("&amt2=" + objTraceData.PAN2Amount);
                                    sbData3.Append("&pan3=" + objTraceData.PAN3);
                                    sbData3.Append("&amt3=" + objTraceData.PAN3Amount);
                                }
                                sbData3.Append("&clickKYC=Proceed");
                                sbData3.Append("&dedkyc_SUBMIT=1");
                                Dictionary<string, string> dictionary3 = this.TraceViewStateData(str2, "//form[@id=\"dedkyc\"]");
                                foreach (KeyValuePair<string, string> keyValuePair in dictionary3)
                                    sbData3.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                                if (dictionary3.Count <= 0)
                                {
                                    tracesResponse.Message = "Server Error";
                                    tracesResponse.Respons = enmResponse.SessionTimeout;
                                    this.Logoff();
                                    return tracesResponse;
                                }
                                else
                                {
                                    string str3 = this.makeHTTPPostRequest(this.strBaseURL + "ded/kyc3form.xhtml", sbData3);
                                    if (!this.IsStringExists(str3, "//form[@id=\"dedkyc\"]"))
                                    {
                                        tracesResponse.Message = "Server Error";
                                        tracesResponse.Respons = enmResponse.SessionTimeout;
                                        this.Logoff();
                                        return tracesResponse;
                                    }
                                    else
                                    {
                                        tracesResponse = this.IsServerError(str3, "//div[@id=\"err_Summary\"]");
                                        if (tracesResponse.Respons == enmResponse.Failed)
                                        {
                                            tracesResponse.Respons = enmResponse.Failed;
                                            this.Logoff();
                                            return tracesResponse;
                                        }
                                        else
                                        {
                                            string str4 = this.RetrieveElementValue(str3, "//form[@id=\"dedkyc\"]", "//input[@id=\"authcode\"]", TracesConnect.enmElementType.Value);
                                            Dictionary<string, string> dictionary4 = this.TraceViewStateData(str3, "//form[@id=\"dedkyc\"]");
                                            StringBuilder sbData4 = new StringBuilder();
                                            sbData4.Append("authcode=" + HttpUtility.UrlEncode(str4.Trim()));
                                            sbData4.Append("&redirect=" + HttpUtility.UrlEncode("Proceed with Transaction"));
                                            sbData4.Append("&dedkyc_SUBMIT=1");
                                            foreach (KeyValuePair<string, string> keyValuePair in dictionary4)
                                            {
                                                if (keyValuePair.Key == "javax.faces.ViewState")
                                                    sbData4.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                                            }
                                            string str5 = this.RetrieveElementValue(this.makeHTTPPostRequest(this.strBaseURL + "ded/kyc3confirm.xhtml", sbData4), "//div[@class='margintop20']", "//h5", TracesConnect.enmElementType.InnerText);
                                            if (!string.IsNullOrEmpty(str5))
                                            {
                                                tracesResponse.CustomeTypes = (object)new RequestStatus()
                                                {
                                                    AuthenticationCode = str4,
                                                    StatusMessage = str5
                                                };
                                                tracesResponse.Respons = enmResponse.Success;
                                            }
                                            this.Logoff();
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            tracesResponse.Respons = enmResponse.Failed;
            tracesResponse.Message = ex.Message;
            this.Logoff();
        }
        return tracesResponse;
    }

    public TracesResponse RequestForDownloadForm27D(TracesLogin objLogin, TracesData objTraceData)
    {
        TracesResponse tracesResponse = new TracesResponse();
        try
        {
            if (!this.IsSessionExists)
            {
                tracesResponse = this.makeLoginToTRACES(objLogin);
                if (tracesResponse.Respons == enmResponse.Failed)
                    return tracesResponse;
            }
            string request = this.makeHTTPGetRequest(this.strBaseURL + "ded/download27d.xhtml");
            if (!this.IsStringExists(request, "//form[@id=\"bulkSearch\"]"))
            {
                tracesResponse.Message = "Server Error";
                tracesResponse.Respons = enmResponse.SessionTimeout;
                this.Logoff();
                return tracesResponse;
            }
            else
            {
                StringBuilder sbData1 = new StringBuilder();
                sbData1.Append("dwnldFormBulkType=19");
                sbData1.Append("&bulkfinYr=" + objTraceData.FAYear);
                sbData1.Append("&bulkquarter=" + objTraceData.Quarter);
                sbData1.Append("&bulkGo=Go");
                sbData1.Append("&bulkSearch_SUBMIT=1");
                Dictionary<string, string> dictionary1 = this.TraceViewStateData(request, "//form[@id=\"bulkSearch\"]");
                if (dictionary1.Count <= 0)
                {
                    tracesResponse.Message = "Server Error";
                    tracesResponse.Respons = enmResponse.SessionTimeout;
                    this.Logoff();
                    return tracesResponse;
                }
                else
                {
                    foreach (KeyValuePair<string, string> keyValuePair in dictionary1)
                    {
                        if (keyValuePair.Key == "javax.faces.ViewState")
                        {
                            sbData1.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                            break;
                        }
                    }
                    string str1 = this.makeHTTPPostRequest(this.strBaseURL + "ded/download27d.xhtml", sbData1);
                    tracesResponse = this.IsServerError(str1, "//ul[@id=\"err_Summary\"]");
                    if (tracesResponse.Respons == enmResponse.Failed)
                    {
                        tracesResponse.Respons = enmResponse.Failed;
                        this.Logoff();
                        return tracesResponse;
                    }
                    else if (!this.IsStringExists(str1, "//form[@id=\"deducteeDetails\"]"))
                    {
                        tracesResponse.Message = "Server Error";
                        tracesResponse.Respons = enmResponse.SessionTimeout;
                        this.Logoff();
                        return tracesResponse;
                    }
                    else
                    {
                        Dictionary<string, string> dictionary2 = this.TraceViewStateData(str1, "//form[@id=\"deducteeDetails\"]");
                        if (dictionary2.Count <= 0)
                        {
                            tracesResponse.Message = "Server Error";
                            tracesResponse.Respons = enmResponse.SessionTimeout;
                            this.Logoff();
                            return tracesResponse;
                        }
                        else
                        {
                            StringBuilder sbData2 = new StringBuilder();
                            sbData2.Append("j_id2143335333_643da170=submit");
                            foreach (KeyValuePair<string, string> keyValuePair in dictionary2)
                                sbData2.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                            string str2 = this.makeHTTPPostRequest(this.strBaseURL + "ded/form27ddetls.xhtml", sbData2);
                            if (!this.IsStringExists(str2, "//form[@id=\"dedkyc1\"]"))
                            {
                                tracesResponse.Message = "Server Error";
                                tracesResponse.Respons = enmResponse.SessionTimeout;
                                this.Logoff();
                                return tracesResponse;
                            }
                            else
                            {
                                StringBuilder sbData3 = new StringBuilder();
                                sbData3.Append("&stmtSpecKyc=1");
                                sbData3.Append("&bforeLogin=3");
                                sbData3.Append("&token=" + objTraceData.PRN_NO);
                                if (objTraceData.IsNoChallanCheck)
                                    sbData3.Append("&cinbinCheck=" + objTraceData.IsNoChallanCheck);
                                sbData3.Append("&cinbinValue=" + objTraceData.IsNoChallan);
                                sbData3.Append("&bkEntryFlgChk=" + objTraceData.IsPaymentByBookAdjustmentCheck);
                                sbData3.Append("&bkEntryValue=" + objTraceData.IsPaymentByBookAdjustment);
                                if (objTraceData.panAmtValueCheck)
                                    sbData3.Append("&panAmtCheck=" + objTraceData.panAmtValueCheck);
                                sbData3.Append("&panAmtValue=" + objTraceData.panAmtValue);
                                if (!objTraceData.IsNoChallanCheck)
                                {
                                    sbData3.Append("&bsr=" + objTraceData.BSRCode);
                                    sbData3.Append("&dtoftaxdep=" + objTraceData.TaxDepositedDate);
                                    sbData3.Append("&csn=" + objTraceData.ChallanSerialNo);
                                    sbData3.Append("&chlnamt=" + objTraceData.ChallanAmount);
                                }
                                if (!objTraceData.panAmtValueCheck)
                                {
                                    sbData3.Append("&pan1=" + objTraceData.PAN1);
                                    sbData3.Append("&amt1=" + objTraceData.PAN1Amount);
                                    sbData3.Append("&pan2=" + objTraceData.PAN2);
                                    sbData3.Append("&amt2=" + objTraceData.PAN2Amount);
                                    sbData3.Append("&pan3=" + objTraceData.PAN3);
                                    sbData3.Append("&amt3=" + objTraceData.PAN3Amount);
                                }
                                sbData3.Append("&clickKYC=Proceed");
                                sbData3.Append("&dedkyc_SUBMIT=1");
                                Dictionary<string, string> dictionary3 = this.TraceViewStateData(str2, "//form[@id=\"dedkyc1\"]");
                                foreach (KeyValuePair<string, string> keyValuePair in dictionary3)
                                    sbData3.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                                if (dictionary3.Count <= 0)
                                {
                                    tracesResponse.Message = "Server Error";
                                    tracesResponse.Respons = enmResponse.SessionTimeout;
                                    this.Logoff();
                                    return tracesResponse;
                                }
                                else
                                {
                                    string str3 = this.makeHTTPPostRequest(this.strBaseURL + "ded/kyc3form.xhtml", sbData3);
                                    if (!this.IsStringExists(str3, "//form[@id=\"dedkyc\"]"))
                                    {
                                        tracesResponse.Message = "Server Error";
                                        tracesResponse.Respons = enmResponse.SessionTimeout;
                                        this.Logoff();
                                        return tracesResponse;
                                    }
                                    else
                                    {
                                        tracesResponse = this.IsServerError(str3, "//div[@id=\"err_Summary\"]");
                                        if (tracesResponse.Respons == enmResponse.Failed)
                                        {
                                            tracesResponse.Respons = enmResponse.Failed;
                                            this.Logoff();
                                            return tracesResponse;
                                        }
                                        else
                                        {
                                            string str4 = this.RetrieveElementValue(str3, "//form[@id=\"dedkyc\"]", "//input[@id=\"authcode\"]", TracesConnect.enmElementType.Value);
                                            Dictionary<string, string> dictionary4 = this.TraceViewStateData(str3, "//form[@id=\"dedkyc\"]");
                                            StringBuilder sbData4 = new StringBuilder();
                                            sbData4.Append("authcode=" + HttpUtility.UrlEncode(str4.Trim()));
                                            sbData4.Append("&redirect=" + HttpUtility.UrlEncode("Proceed with Transaction"));
                                            sbData4.Append("&dedkyc_SUBMIT=1");
                                            foreach (KeyValuePair<string, string> keyValuePair in dictionary4)
                                            {
                                                if (keyValuePair.Key == "javax.faces.ViewState")
                                                    sbData4.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                                            }
                                            string str5 = this.RetrieveElementValue(this.makeHTTPPostRequest(this.strBaseURL + "ded/kyc3confirm.xhtml", sbData4), "//div[@class='margintop20']", "//h5", TracesConnect.enmElementType.InnerText);
                                            if (!string.IsNullOrEmpty(str5))
                                            {
                                                tracesResponse.CustomeTypes = (object)new RequestStatus()
                                                {
                                                    AuthenticationCode = str4,
                                                    StatusMessage = str5
                                                };
                                                tracesResponse.Respons = enmResponse.Success;
                                            }
                                            this.Logoff();
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            tracesResponse.Respons = enmResponse.Failed;
            tracesResponse.Message = ex.Message;
            this.Logoff();
        }
        return tracesResponse;
    }

    public TracesResponse RequestForCertificate197(Certificate197Data objCertData)
    {
        TracesResponse tracesResponse = new TracesResponse();
        DataTable dataTable = new DataTable();
        try
        {
            string request = this.makeHTTPGetRequest(this.strBaseURL + "ded/197certiverfication.xhtml");
            if (!this.IsStringExists(request, "//form[@id=\"certiValidation\"]"))
            {
                string str = this.RetrieveElementValue(request, "//div[@class=\"padLeft5 margintop20\"]", "//span[@class=\"boldFont\"]", TracesConnect.enmElementType.InnerText);
                if (!string.IsNullOrEmpty(str))
                {
                    tracesResponse.Message = str;
                    tracesResponse.Respons = enmResponse.Failed;
                    return tracesResponse;
                }
                else
                {
                    tracesResponse.Message = "Session Timeout";
                    tracesResponse.Respons = enmResponse.SessionTimeout;
                    return tracesResponse;
                }
            }
            else if (tracesResponse.Respons == enmResponse.Failed)
            {
                tracesResponse.Respons = enmResponse.Failed;
                return tracesResponse;
            }
            else
            {
                string sbData = "_search=false&nd=1396609417964&rows=100&page=1&sidx=&sord=asc";
                string s = this.makeHTTPJSONPostRequest(this.strBaseURL + "ded/srv/CertiVerifyServlet?certiNo=" + objCertData.CertificateNo + "&deducteePan=" + objCertData.PAN + "&financialYear=" + objCertData.FinYear + "&reqType=1", sbData);
                string strRowCount = "0";
                if (!string.IsNullOrEmpty(s))
                    dataTable = this.JsonParserForCertificateValidation(s, out strRowCount);
                tracesResponse.CustomeTypes = (object)new ArrayList()
          {
            (object) strRowCount,
            (object) dataTable
          };
                tracesResponse.Respons = enmResponse.Success;
            }
        }
        catch (Exception ex)
        {
            this.Logoff();
            this.bnlSessionExists = false;
            tracesResponse.Respons = enmResponse.Failed;
            tracesResponse.Message = ex.Message;
        }
        return tracesResponse;
    }

    private void ServerMessageRepository()
    {
        this.objMsgDictionary.Clear();
        this.objMsgDictionary.Add(new ErrorDB<int, string, string>(1, "Invalid details", "Invalid details"));
        this.objMsgDictionary.Add(new ErrorDB<int, string, string>(4, "You have 3 attempts left", "You have 3 attempts left"));
        this.objMsgDictionary.Add(new ErrorDB<int, string, string>(6, "You have 2 attempts left", "You have 2 attempts left"));
        this.objMsgDictionary.Add(new ErrorDB<int, string, string>(8, "You have 1 attempts left", "You have 1 attempts left"));
        this.objMsgDictionary.Add(new ErrorDB<int, string, string>(10, "Statement is not available with TRACES at present", "Statement is not available with TRACES at present"));
        this.objMsgDictionary.Add(new ErrorDB<int, string, string>(12, "Conso file will not be available temporarily. Inconvenience is regretted", "Conso file will not be available temporarily. Inconvenience is regretted"));
    }

    private TracesResponse IsServerError1(string strServerResponse)
    {
        TracesResponse tracesResponse = new TracesResponse();
        tracesResponse.Respons = enmResponse.Success;
        this.ServerMessageRepository();
        foreach (ErrorDB<int, string, string> errorDb in this.objMsgDictionary)
        {
            if (Regex.IsMatch(strServerResponse, errorDb.KEY2, RegexOptions.IgnoreCase))
            {
                tracesResponse.Respons = enmResponse.Failed;
                tracesResponse.Message = errorDb.KEY3;
            }
        }
        return tracesResponse;
    }

    private TracesResponse IsServerError(string strServerResponse, string strXQuery)
    {
        string str = "";
        TracesResponse tracesResponse = new TracesResponse();
        tracesResponse.Respons = enmResponse.Success;
        HtmlDocument htmlDocument = new HtmlDocument();
        htmlDocument.LoadHtml(strServerResponse);
        HtmlNodeCollection htmlNodeCollection = htmlDocument.DocumentNode.SelectNodes(strXQuery);
        if (htmlNodeCollection == null)
            return tracesResponse;
        for (int index = 0; index < htmlNodeCollection.Count; ++index)
            str = htmlNodeCollection[index].InnerText.Replace("\t", "");
        if (!string.IsNullOrEmpty(str))
        {
            tracesResponse.Message = str;
            tracesResponse.Respons = enmResponse.Failed;
        }
        return tracesResponse;
    }

    private TracesResponse IsServerError(string strServerResponse, List<string> strXQuery)
    {
        string str = "";
        TracesResponse tracesResponse = new TracesResponse();
        tracesResponse.Respons = enmResponse.Success;
        HtmlDocument htmlDocument = new HtmlDocument();
        htmlDocument.LoadHtml(strServerResponse);
        HtmlNode documentNode = htmlDocument.DocumentNode;
        foreach (string xpath in strXQuery)
        {
            HtmlNodeCollection htmlNodeCollection = documentNode.SelectNodes(xpath);
            if (htmlNodeCollection == null)
                return tracesResponse;
            for (int index = 0; index < htmlNodeCollection.Count; ++index)
                str = htmlNodeCollection[index].InnerText.Replace("\t", "");
            if (!string.IsNullOrEmpty(str))
            {
                tracesResponse.Message = str;
                tracesResponse.Respons = enmResponse.Failed;
            }
        }
        return tracesResponse;
    }

    private bool IsStringExists(string strServerResponse, string strXQuery)
    {
        new TracesResponse().Respons = enmResponse.Success;
        HtmlDocument htmlDocument = new HtmlDocument();
        htmlDocument.LoadHtml(strServerResponse);
        return htmlDocument.DocumentNode.SelectNodes(strXQuery) != null;
    }

    private string makeLoginToTRACES1(TracesLogin login)
    {
        this.request = (HttpWebRequest)WebRequest.Create(this.strBaseURL + "login.xhtml");
        this.request.CookieContainer = this.objContainer;
        this.request.KeepAlive = false;
        this.request.Method = "GET";
        this.response = (HttpWebResponse)this.request.GetResponse();
        this.dataStream = this.response.GetResponseStream();
        this.reader = new StreamReader(this.dataStream);
        this.strServerResponse = this.reader.ReadToEnd();
        this.reader.Close();
        this.dataStream.Close();
        this.response.Close();
        StringBuilder sbData = new StringBuilder();
        sbData.Append("j_username=" + login.UserID);
        sbData.Append("&j_password=" + login.Password);
        this.strServerResponse = this.makeHTTPPostRequest(this.strBaseURL + "j_security_check", sbData);
        return this.strServerResponse;
    }

    private bool IsConditionMatch(string strResponse, string strPattern)
    {
        return Regex.IsMatch(strResponse, strPattern, RegexOptions.IgnoreCase);
    }

    public TracesResponse makeLoginToTRACES(TracesLogin login)
    {
        TracesResponse tracesResponse = new TracesResponse();
        StringBuilder sbData = new StringBuilder();
        try
        {
            sbData.Append("username=" + login.UserID);
            sbData.Append("&j_username=" + login.UserID + "^" + login.TAN);
            sbData.Append("&j_password=" + HttpUtility.UrlEncode(login.Password));
            sbData.Append("&j_tanPan=" + login.TAN);
            sbData.Append("&j_captcha=" + login.CaptchaCode);
            this.strServerResponse = this.makeHTTPPostRequest(this.strBaseURL + "j_security_check", sbData);
            if (string.IsNullOrEmpty(this.strServerResponse))
            {
                this.IsSessionExists = false;
                tracesResponse.Respons = enmResponse.Failed;
                tracesResponse.Message = "Login Failed or Server Error";
                return tracesResponse;
            }
            else
            {
                tracesResponse = this.IsServerError(this.strServerResponse, "//span[@id=\"err_Summary\"]");
                if (tracesResponse.Respons == enmResponse.Failed)
                {
                    this.IsSessionExists = false;
                    return tracesResponse;
                }
                else if (!this.IsConditionMatch(this.strServerResponse, login.TAN))
                {
                    tracesResponse.Respons = enmResponse.Failed;
                    tracesResponse.Message = "Login Failed or Server Error";
                    return tracesResponse;
                }
                else
                {
                    this.IsSessionExists = true;
                    tracesResponse.Respons = enmResponse.Success;
                    tracesResponse.Message = "";
                    return tracesResponse;
                }
            }
        }
        catch (Exception ex)
        {
            tracesResponse.Respons = enmResponse.Failed;
            tracesResponse.Message = ex.Message;
            return tracesResponse;
        }
    }

    public TracesResponse Logoff()
    {
        TracesResponse tracesResponse = new TracesResponse();
        try
        {
            this.makeHTTPGetRequest(this.strBaseURL + "logout.xhtml");
            this.bnlSessionExists = false;
            tracesResponse.Respons = enmResponse.Success;
        }
        catch
        {
            tracesResponse.Respons = enmResponse.Failed;
        }
        return tracesResponse;
    }

    public TracesResponse Logoff_bak()
    {
        TracesResponse tracesResponse = new TracesResponse();
        try
        {
            this.request = (HttpWebRequest)WebRequest.Create(this.strBaseURL + "/logout.xhtml");
            this.request.CookieContainer = this.objContainer;
            this.request.KeepAlive = true;
            this.response = (HttpWebResponse)this.request.GetResponse();
            this.dataStream = this.response.GetResponseStream();
            this.reader = new StreamReader(this.dataStream);
            this.strServerResponse = this.reader.ReadToEnd();
            this.reader.Close();
            this.dataStream.Close();
            this.response.Close();
            this.bnlSessionExists = false;
            tracesResponse.Respons = enmResponse.Success;
        }
        catch
        {
            tracesResponse.Respons = enmResponse.Failed;
        }
        return tracesResponse;
    }

    private string makeHTTPPostRequest1(string strURL, StringBuilder sbData)
    {
        this.request = (HttpWebRequest)WebRequest.Create(strURL);
        this.request.Method = "POST";
        this.request.Credentials = CredentialCache.DefaultCredentials;
        this.request.ServicePoint.Expect100Continue = false;
        byte[] bytes = new ASCIIEncoding().GetBytes(((object)sbData).ToString());
        this.request.ContentType = "application/x-www-form-urlencoded";
        this.request.ContentLength = (long)bytes.Length;
        if (sbData != null)
        {
            this.request.Headers.GetType().InvokeMember("ChangeInternal", BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.InvokeMethod, (Binder)null, (object)this.request.Headers, new object[2]
        {
          (object) "Host",
          (object) "www.tdscpc.gov.in"
        });
            this.request.Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
            this.request.UserAgent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.152 Safari/537.22";
            this.request.Headers.Add("Accept-Encoding: gzip,deflate,sdch");
            this.request.Headers.Add("Accept-Language: en-US,en;q=0.8");
            this.request.Headers.Add("Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.3");
            this.request.Headers.Add("Cache-Control: max-age=0");
            this.request.Headers.Add("Origin: https://www.tdscpc.gov.in");
            this.request.Referer = "https://www.tdscpc.gov.in/app/ded/panverify.xhtml";
            this.request.Timeout = 100000;
            this.request.ReadWriteTimeout = 1000000000;
            this.request.Headers.GetType().InvokeMember("ChangeInternal", BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.InvokeMethod, Type.DefaultBinder, (object)this.request.Headers, new object[2]
        {
          (object) "Connection",
          (object) "Keep-Alive"
        });
        }
        if (this.request.CookieContainer == null)
            this.request.CookieContainer = this.objContainer;
        this.request.CookieContainer.Add(new Uri("https://www.tdscpc.gov.in/app/"), this.response.Cookies);
        ((WebRequest)this.request).GetRequestStream().Write(bytes, 0, bytes.Length);
        this.response = (HttpWebResponse)this.request.GetResponse();
        string str = this.response.ResponseUri.ToString();
        if (!string.IsNullOrEmpty(str))
            str = str.Substring(str.LastIndexOf("/") + 1);
        if (str == "login.xhtml")
        {
            this.strServerResponse = str;
            return this.strServerResponse;
        }
        else
        {
            this.dataStream = this.response.GetResponseStream();
            this.reader = new StreamReader(this.dataStream);
            this.strServerResponse = this.reader.ReadToEnd();
            this.reader.Close();
            this.dataStream.Close();
            this.response.Close();
            return this.strServerResponse;
        }
    }

    private string makeHTTPPostRequest(string strURL, StringBuilder sbData)
    {
        this.request = (HttpWebRequest)WebRequest.Create(strURL);
        this.request.KeepAlive = false;
        byte[] buffer = (byte[])null;
        if (!string.IsNullOrEmpty(Convert.ToString((object)sbData)))
            buffer = Encoding.UTF8.GetBytes(((object)sbData).ToString());
        if (!string.IsNullOrEmpty(Convert.ToString((object)sbData)))
            this.request.ContentLength = (long)buffer.Length;
        if (sbData != null)
        {
            this.request.Method = "POST";
            this.request.Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
            this.request.UserAgent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17";
            this.request.ContentType = "application/x-www-form-urlencoded";
            this.request.Timeout = 1000000000;
        }

        if (this.request.CookieContainer == null)
            this.request.CookieContainer = this.objContainer;

        this.request.CookieContainer.Add(this.response.Cookies);
        if (!string.IsNullOrEmpty(Convert.ToString((object)sbData)))
        {
            this.dataStream = ((WebRequest)this.request).GetRequestStream();
            this.dataStream.Write(buffer, 0, buffer.Length);
            this.dataStream.Close();
        }
        this.response = (HttpWebResponse)this.request.GetResponse();
        this.dataStream = this.response.GetResponseStream();
        this.reader = new StreamReader(this.dataStream);
        this.strServerResponse = this.reader.ReadToEnd();
        this.reader.Close();
        this.dataStream.Close();
        this.response.Close();

        //setting to global response
        Global.objTraceConnect = this;
        return this.strServerResponse;
    }

    private string makeHTTPGetRequest(string strURL)
    {
        try
        {
            TracesConnect.SetAllowUnsafeHeaderParsing();
            ServicePointManager.ServerCertificateValidationCallback = (RemoteCertificateValidationCallback)delegate
            {
                return true;
            };
            this.request = (HttpWebRequest)WebRequest.Create(strURL);
            this.request.KeepAlive = false;
            this.request.Method = "GET";
            this.request.UserAgent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17";
            this.request.Accept = "text/html";
            this.request.Timeout = 1000000000;
            if (this.request.CookieContainer == null)
                this.request.CookieContainer = this.objContainer;
            this.response = (HttpWebResponse)this.request.GetResponse();
            this.request.CookieContainer.Add(this.response.Cookies);
            this.dataStream = this.response.GetResponseStream();
            this.reader = new StreamReader(this.dataStream);
            this.strServerResponse = this.reader.ReadToEnd();
            this.reader.Close();
            this.dataStream.Close();
            this.response.Close();

            //setting to global response
            Global.objTraceConnect = this;

            return this.strServerResponse;
        }
        catch
        {
            return "";
        }
    }

    public Stream getCaptchaCode()
    {
        this.bnlSessionExists = false;
        this.request = (HttpWebRequest)WebRequest.Create(this.strCaptchBaseURL + "GetCaptchaImg");
        this.request.Method = "GET";
        this.request.Accept = "image/png,image/*;q=0.8,*/*;q=0.5";
        this.request.UserAgent = "Mozilla/5.0 (Windows NT 6.1; rv:15.0) Gecko/20100101 Firefox/15.0";
        this.request.ContentType = "text/html; charset=utf-8";
        this.request.KeepAlive = true;
        this.request.CookieContainer = this.objContainer;
        if (this.response.Cookies != null && this.response.Cookies.Count > 0)
            this.objContainer.Add(this.response.Cookies);
        foreach (Cookie cookie in this.response.Cookies)
            this.objContainer.Add(new Cookie(cookie.Name.Trim(), cookie.Value.Trim(), "/", cookie.Domain));

        if (!string.IsNullOrEmpty(((NameValueCollection)this.response.Headers)["Set-Cookie"]))
        {
            for (int index = 0; index < this.objContainer.GetCookies(this.request.RequestUri).Count; ++index)
            {
                Cookie cookie = this.objContainer.GetCookies(this.request.RequestUri)[index];
            }

        }

        //setting to global response
        Global.objTraceConnect = this;

        return this.request.GetResponse().GetResponseStream();
    }

    private string makeHTTPJSONRequest(string strURL)
    {
        this.request = (HttpWebRequest)WebRequest.Create(strURL);
        string str = "";
        this.request.ServicePoint.Expect100Continue = false;
        this.request.Method = "GET";
        this.request.UserAgent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17";
        this.request.ContentType = "application/json";
        ((NameValueCollection)this.request.Headers).Add("Cache-Control", "no-cache");
        if (this.request.CookieContainer == null)
            this.request.CookieContainer = this.objContainer;
        this.response = (HttpWebResponse)this.request.GetResponse();
        this.request.CookieContainer.Add(this.response.Cookies);
        using (Stream responseStream = this.response.GetResponseStream())
        {
            using (StreamReader streamReader = new StreamReader(responseStream))
                str = streamReader.ReadToEnd();
        }
        return str;
    }

    private string makeHTTPJSONPostRequest(string strURL, string sbData)
    {
        this.request = (HttpWebRequest)WebRequest.Create(strURL);
        this.request.KeepAlive = false;
        byte[] buffer = (byte[])null;
        if (!string.IsNullOrEmpty(Convert.ToString(sbData)))
            buffer = Encoding.UTF8.GetBytes(((object)sbData).ToString());
        if (!string.IsNullOrEmpty(Convert.ToString(sbData)))
            this.request.ContentLength = (long)buffer.Length;
        if (sbData != null)
        {
            this.request.Method = "POST";
            this.request.Accept = "application/json, text/javascript, */*; q=0.01";
            this.request.UserAgent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36";
            this.request.ContentType = "application/x-www-form-urlencoded";
            ((NameValueCollection)this.request.Headers).Add("X-Requested-With", "XMLHttpRequest");
            this.request.Timeout = 1000000000;
        }
        if (this.request.CookieContainer == null)
            this.request.CookieContainer = this.objContainer;
        this.request.CookieContainer.Add(this.response.Cookies);
        if (!string.IsNullOrEmpty(Convert.ToString(sbData)))
        {
            this.dataStream = ((WebRequest)this.request).GetRequestStream();
            this.dataStream.Write(buffer, 0, buffer.Length);
            this.dataStream.Close();
        }
        this.response = (HttpWebResponse)this.request.GetResponse();
        this.dataStream = this.response.GetResponseStream();
        this.reader = new StreamReader(this.dataStream);
        this.strServerResponse = this.reader.ReadToEnd();
        this.reader.Close();
        this.dataStream.Close();
        this.response.Close();
        return this.strServerResponse;
    }

    private bool makeHttpDownloadRequest(string strURL, string strPath)
    {
        bool flag = true;
        try
        {
            TracesConnect.SetAllowUnsafeHeaderParsing();
            ServicePointManager.ServerCertificateValidationCallback = (RemoteCertificateValidationCallback)delegate
            {
                return true;
            };
            this.request = (HttpWebRequest)WebRequest.Create(strURL);
            this.request.KeepAlive = true;
            this.request.Timeout = 300000;
            this.request.AllowWriteStreamBuffering = false;
            this.request.AllowAutoRedirect = false;
            this.request.UserAgent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17";
            this.request.CookieContainer = this.objContainer;
            this.request.CookieContainer.Add(this.response.Cookies);
            this.response = (HttpWebResponse)this.request.GetResponse();

            //long length = 120000L;
            //this.dataStream = this.response.GetResponseStream();
            //string str = strURL.Substring(strURL.LastIndexOf("/") + 1);
            //if (string.IsNullOrEmpty(str))
            //    str = "File.zip";
            //FileStream fileStream = new FileStream(strPath + "\\" + str, FileMode.Create);
            //byte[] buffer = new byte[length];
            //for (int count = this.dataStream.Read(buffer, 0, buffer.Length); count > 0; count = this.dataStream.Read(buffer, 0, buffer.Length))
            //    fileStream.Write(buffer, 0, count);
            //HttpContext.Current.Response.Headers.Add(this.response.Headers);

            HttpContext.Current.Response.AppendHeader("content-disposition", "attachment; filename=abc");
            HttpContext.Current.Response.ContentType = "application/zip";
            HttpContext.Current.Response.WriteFile(this.response.ResponseUri.ToString());

            this.response.Close();
            //fileStream.Close();
            //this.dataStream.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return flag;
    }

    private string GetFileLocation(string strURL)
    {
        this.request = (HttpWebRequest)WebRequest.Create(strURL);
        this.request.KeepAlive = true;
        this.request.Timeout = 300000;
        this.request.AllowWriteStreamBuffering = false;
        this.request.AllowAutoRedirect = false;
        this.request.UserAgent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17";
        this.request.CookieContainer = this.objContainer;
        this.request.CookieContainer.Add(this.response.Cookies);
        this.response = (HttpWebResponse)this.request.GetResponse();
        return ((NameValueCollection)this.response.Headers)["Location"];
    }

    private string CheckDownloadURL(string strURL)
    {
        this.request = (HttpWebRequest)WebRequest.Create(strURL);
        this.request.KeepAlive = true;
        this.request.Timeout = 300000;
        this.request.AllowWriteStreamBuffering = false;
        this.request.AllowAutoRedirect = false;
        this.request.UserAgent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17";
        this.request.CookieContainer = this.objContainer;
        this.request.CookieContainer.Add(this.response.Cookies);
        this.response = (HttpWebResponse)this.request.GetResponse();
        this.dataStream = this.response.GetResponseStream();
        this.reader = new StreamReader(this.dataStream);
        this.strServerResponse = this.reader.ReadToEnd();
        this.reader.Close();
        this.dataStream.Close();
        this.response.Close();
        return this.strServerResponse;
    }

    private DataTable JsonParser(string s)
    {
        DataTable dataTable = new DataTable();
        dataTable.Columns.Add("Request Date");
        dataTable.Columns.Add("Request Number");
        dataTable.Columns.Add("Finnancial Number");
        dataTable.Columns.Add("Quarter");
        dataTable.Columns.Add("Form Type");
        dataTable.Columns.Add("File Processed");
        dataTable.Columns.Add("Status");
        dataTable.Columns.Add("Remarks");
        string str = "Test";
        DataRow row = (DataRow)null;
        using (JsonTextReader jsonTextReader = new JsonTextReader((TextReader)new StringReader(s)))
        {
            while (jsonTextReader.Read())
            {
                switch (jsonTextReader.TokenType)
                {
                    case JsonToken.PropertyName:
                        str = jsonTextReader.Value.ToString();
                        break;
                    case JsonToken.Integer:
                    case JsonToken.Float:
                    case JsonToken.String:
                    case JsonToken.Null:
                        switch (str)
                        {
                            case "reqDate":
                                row = dataTable.NewRow();
                                row["Request Date"] = (object)jsonTextReader.Value.ToString();
                                break;
                            case "reqNo":
                                row["Request Number"] = (object)jsonTextReader.Value.ToString();
                                break;
                            case "finYr":
                                row["Finnancial Number"] = (object)jsonTextReader.Value.ToString();
                                break;
                            case "qrtr":
                                row["Quarter"] = (object)jsonTextReader.Value.ToString();
                                break;
                            case "frmType":
                                row["Form Type"] = (object)jsonTextReader.Value.ToString();
                                break;
                            case "dntype":
                                row["File Processed"] = (object)jsonTextReader.Value.ToString();
                                break;
                            case "status":
                                row["Status"] = (object)jsonTextReader.Value.ToString();
                                break;
                            case "remarks":
                                row["Remarks"] = (object)Convert.ToString(jsonTextReader.Value);
                                dataTable.Rows.Add(row);
                                break;
                        }
                        break;
                }
            }
        }
        return dataTable;
    }

    private DataTable JsonParserForCertificateValidation(string s, out string strRowCount)
    {
        strRowCount = "";
        DataTable dataTable = new DataTable();
        dataTable.Columns.Add("Sr.No.");
        dataTable.Columns.Add("Certificate Number");
        dataTable.Columns.Add("Financial Year");
        dataTable.Columns.Add("PAN of the Deductee");
        dataTable.Columns.Add("Name of Deductee");
        dataTable.Columns.Add("Valid From");
        dataTable.Columns.Add("Valid To");
        dataTable.Columns.Add("Section Code");
        dataTable.Columns.Add("Nature of Payment");
        dataTable.Columns.Add("Rate of TDS as per Certificate");
        dataTable.Columns.Add("Certificate Limit (Amount)(Rs.)");
        dataTable.Columns.Add("Amount Consumed(Rs.)");
        dataTable.Columns.Add("Date of Issue");
        string str = "Test";
        DataRow row = (DataRow)null;
        using (JsonTextReader jsonTextReader = new JsonTextReader((TextReader)new StringReader(s)))
        {
            while (jsonTextReader.Read())
            {
                switch (jsonTextReader.TokenType)
                {
                    case JsonToken.PropertyName:
                        str = jsonTextReader.Value.ToString();
                        break;
                    case JsonToken.Integer:
                    case JsonToken.Float:
                    case JsonToken.String:
                    case JsonToken.Null:
                        switch (str)
                        {
                            case "rowCount":
                                strRowCount = jsonTextReader.Value.ToString();
                                break;
                            case "serialno":
                                row = dataTable.NewRow();
                                row["Sr.No."] = (object)jsonTextReader.Value.ToString();
                                break;
                            case "certino":
                                row["Certificate Number"] = (object)jsonTextReader.Value.ToString();
                                break;
                            case "finyear":
                                row["Financial Year"] = (object)jsonTextReader.Value.ToString();
                                break;
                            case "deducteepan":
                                row["PAN of the Deductee"] = (object)jsonTextReader.Value.ToString();
                                break;
                            case "dedname":
                                row["Name of Deductee"] = (object)jsonTextReader.Value.ToString();
                                break;
                            case "validfrm":
                                row["Valid From"] = (object)jsonTextReader.Value.ToString();
                                break;
                            case "validto":
                                row["Valid To"] = (object)jsonTextReader.Value.ToString();
                                break;
                            case "seccode":
                                row["Section Code"] = (object)Convert.ToString(jsonTextReader.Value);
                                break;
                            case "natofpayment":
                                row["Nature of Payment"] = (object)Convert.ToString(jsonTextReader.Value);
                                break;
                            case "rateoftds":
                                row["Rate of TDS as per Certificate"] = (object)Convert.ToString(jsonTextReader.Value);
                                break;
                            case "certilimit":
                                row["Certificate Limit (Amount)(Rs.)"] = (object)Convert.ToString(jsonTextReader.Value);
                                break;
                            case "amtconsume":
                                row["Amount Consumed(Rs.)"] = (object)Convert.ToString(jsonTextReader.Value);
                                break;
                            case "issuedate":
                                row["Date of Issue"] = (object)Convert.ToString(jsonTextReader.Value);
                                dataTable.Rows.Add(row);
                                break;
                        }
                        break;
                }
            }
        }
        return dataTable;
    }

    private HttpStatusCode IsConnected(string strURL)
    {
        try
        {
            HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create(strURL);
            httpWebRequest.AllowAutoRedirect = false;
            this.response = (HttpWebResponse)httpWebRequest.GetResponse();
            return this.response.StatusCode;
        }
        catch
        {
            return HttpStatusCode.Forbidden;
        }
    }

    public static bool SetAllowUnsafeHeaderParsing()
    {
        Assembly assembly = Assembly.GetAssembly(typeof(SettingsSection));
        if (assembly != null)
        {
            Type type = assembly.GetType("System.Net.Configuration.SettingsSectionInternal");
            if (type != null)
            {
                object obj = type.InvokeMember("Section", BindingFlags.Static | BindingFlags.NonPublic | BindingFlags.GetProperty, (Binder)null, (object)null, new object[0]);
                if (obj != null)
                {
                    FieldInfo field = type.GetField("useUnsafeHeaderParsing", BindingFlags.Instance | BindingFlags.NonPublic);
                    if (field != null)
                    {
                        field.SetValue(obj, (object)true);
                        return true;
                    }
                }
            }
        }
        return false;
    }

    private Dictionary<string, string> TraceHiddenField(string strHTML, string xPathQuery)
    {
        Dictionary<string, string> dictionary = new Dictionary<string, string>();
        HtmlDocument htmlDocument = new HtmlDocument();
        htmlDocument.LoadHtml(strHTML);
        HtmlNodeCollection htmlNodeCollection1 = htmlDocument.DocumentNode.SelectNodes(xPathQuery);
        if (htmlNodeCollection1 == null)
            return dictionary;
        dictionary.Clear();
        if (htmlNodeCollection1 != null && htmlNodeCollection1.Count > 0)
        {
            foreach (HtmlNode htmlNode in (IEnumerable<HtmlNode>)htmlNodeCollection1)
            {
                HtmlNodeCollection htmlNodeCollection2 = htmlNode.SelectNodes("//input[@type='hidden']");
                if (htmlNodeCollection2 != null && htmlNodeCollection2.Count > 0)
                {
                    for (int index = 0; index < htmlNodeCollection2.Count; ++index)
                    {
                        if (!dictionary.ContainsKey(htmlNodeCollection2[index].Attributes["name"].Value))
                            dictionary.Add(htmlNodeCollection2[index].Attributes["name"].Value, htmlNodeCollection2[index].Attributes["value"].Value);
                    }
                }
            }
        }
        return dictionary;
    }

    private Dictionary<string, string> TraceViewStateData(string strHTML, string xPathQuery)
    {
        Dictionary<string, string> dictionary = new Dictionary<string, string>();
        HtmlDocument htmlDocument = new HtmlDocument();
        htmlDocument.LoadHtml(strHTML);
        HtmlNodeCollection htmlNodeCollection1 = htmlDocument.DocumentNode.SelectNodes(xPathQuery);
        if (htmlNodeCollection1 == null)
            return dictionary;
        dictionary.Clear();
        if (htmlNodeCollection1 != null && htmlNodeCollection1.Count > 0)
        {
            foreach (HtmlNode htmlNode in (IEnumerable<HtmlNode>)htmlNodeCollection1)
            {
                HtmlNodeCollection htmlNodeCollection2 = htmlNode.SelectNodes("//input[@type='hidden']");
                if (htmlNodeCollection2 != null && htmlNodeCollection2.Count > 0)
                {
                    for (int index = 0; index < htmlNodeCollection2.Count; ++index)
                    {
                        if (!dictionary.ContainsKey(htmlNodeCollection2[index].Attributes["name"].Value))
                            dictionary.Add(htmlNodeCollection2[index].Attributes["name"].Value, htmlNodeCollection2[index].Attributes["value"].Value);
                    }
                }
            }
        }
        return dictionary;
    }

    private string RetrieveElementValue(string strHTML, string xPathQuery, string strNode, TracesConnect.enmElementType enmElement)
    {
        string str = "";
        HtmlDocument htmlDocument = new HtmlDocument();
        htmlDocument.LoadHtml(strHTML);
        HtmlNodeCollection htmlNodeCollection1 = htmlDocument.DocumentNode.SelectNodes(xPathQuery);
        if (htmlNodeCollection1 == null || (htmlNodeCollection1 == null || htmlNodeCollection1.Count <= 0))
            return str;
        foreach (HtmlNode htmlNode in (IEnumerable<HtmlNode>)htmlNodeCollection1)
        {
            HtmlNodeCollection htmlNodeCollection2 = htmlNode.SelectNodes(strNode);
            if (htmlNodeCollection2 != null && htmlNodeCollection2.Count > 0)
            {
                for (int index = 0; index < htmlNodeCollection2.Count; ++index)
                {
                    switch (enmElement)
                    {
                        case TracesConnect.enmElementType.InnerText:
                            str = htmlNodeCollection2[index].InnerText;
                            break;
                        case TracesConnect.enmElementType.InnerHTML:
                            str = htmlNodeCollection2[index].InnerHtml;
                            break;
                        case TracesConnect.enmElementType.Value:
                            str = htmlNodeCollection2[index].Attributes["value"].Value;
                            break;
                        case TracesConnect.enmElementType.Name:
                            str = htmlNodeCollection2[index].Attributes["name"].Value;
                            break;
                    }
                }
            }
        }
        return str;
    }

    private void BugFix_CookieDomain(CookieContainer cookieContainer)
    {
        Hashtable hashtable = (Hashtable)typeof(CookieContainer).InvokeMember("m_domainTable", BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.GetField, (Binder)null, (object)cookieContainer, new object[0]);
        foreach (string str1 in new ArrayList(hashtable.Keys))
        {
            string str2 = str1;
            if ((int)str2[0] == 46)
            {
                string str3 = str2.Remove(0, 1);
                hashtable[(object)str3] = hashtable[(object)str1];
            }
        }
    }
    
    public Stream MakeInitialRequest()
    {
        this.makeHTTPGetRequest("https://www.tdscpc.gov.in/app/login.xhtml");
        return this.getCaptchaCode();
        //Global.objTraceConnect = this;
    }

    private string RetrievePANName(string strHTML)
    {
        string str = "NOT AVAILABLE";
        HtmlDocument htmlDocument = new HtmlDocument();
        htmlDocument.LoadHtml(strHTML);
        HtmlNodeCollection htmlNodeCollection = htmlDocument.DocumentNode.SelectNodes("//td[@id='name']");
        if (htmlNodeCollection != null && htmlNodeCollection.Count > 0)
        {
            for (int index = 0; index < htmlNodeCollection.Count; ++index)
                str = htmlNodeCollection[index].InnerText;
        }
        return str;
    }

    public Stream GetCaptchaForPANVerify()
    {
        this.makeHTTPGetRequest("https://incometaxindiaefiling.gov.in/e-Filing/Services/KnowYourJurisdiction.html");
        this.request = (HttpWebRequest)WebRequest.Create("https://incometaxindiaefiling.gov.in/e-Filing/CreateCaptcha.do");
        this.request.Method = "GET";
        this.request.Accept = "image/png,image/*;q=0.8,*/*;q=0.5";
        this.request.UserAgent = "Mozilla/5.0 (Windows NT 6.1; rv:15.0) Gecko/20100101 Firefox/15.0";
        this.request.ContentType = "text/html; charset=utf-8";
        this.request.KeepAlive = true;
        this.request.CookieContainer = this.objContainer;
        if (this.response.Cookies != null && this.response.Cookies.Count > 0)
            this.objContainer.Add(this.response.Cookies);
        foreach (Cookie cookie in this.response.Cookies)
            this.objContainer.Add(new Cookie(cookie.Name.Trim(), cookie.Value.Trim(), "/", cookie.Domain));
        for (int index = 0; index < this.objContainer.GetCookies(this.request.RequestUri).Count; ++index)
        {
            Cookie cookie = this.objContainer.GetCookies(this.request.RequestUri)[index];
        }
        return this.request.GetResponse().GetResponseStream();
    }

    public TracesResponse VerifyPAN(string strPan, string strCaptchaCode)
    {
        StringBuilder sbData = new StringBuilder();
        TracesResponse tracesResponse1 = new TracesResponse();
        PANVerifierDetails panVerifierDetails = new PANVerifierDetails();
        sbData.Append("requestId=");
        sbData.Append("&panOfDeductee=" + strPan);
        sbData.Append("&captchaCode=" + strCaptchaCode);
        string str1 = this.makeHTTPPostRequest("https://incometaxindiaefiling.gov.in/e-Filing/Services/KnowYourJurisdiction.html ", sbData);
        TracesResponse tracesResponse2 = this.IsServerError(str1, "//div[@class=\"error\"]");
        if (tracesResponse2.Respons == enmResponse.Failed)
        {
            tracesResponse2.Respons = enmResponse.Failed;
            return tracesResponse2;
        }
        else
        {
            HtmlDocument htmlDocument = new HtmlDocument();
            htmlDocument.LoadHtml(str1);
            if (Regex.IsMatch(str1, "PAN does not exist"))
            {
                tracesResponse2.Message = "PAN does not exist";
                tracesResponse2.Respons = enmResponse.Failed;
                return tracesResponse2;
            }
            else
            {
                HtmlNode documentNode = htmlDocument.DocumentNode;
                string str2 = "";
                tracesResponse2.Respons = enmResponse.Success;
                foreach (HtmlNode htmlNode in (IEnumerable<HtmlNode>)htmlDocument.DocumentNode.SelectNodes("//table[@class='grid']//tr//td"))
                {
                    if (str2 != "")
                    {
                        string str3 = htmlNode.InnerText.Replace("\n", "").Replace("\r", "").Replace("\t", "");
                        if (str2.ToUpper() == "SURNAME")
                            panVerifierDetails.Surname = str3;
                        if (str2.ToUpper() == "MIDDLE NAME")
                            panVerifierDetails.MiddleName = str3;
                        if (str2.ToUpper() == "FIRST NAME")
                            panVerifierDetails.FirstName = str3;
                        if (str2.ToUpper() == "AREA CODE")
                            panVerifierDetails.AreaCode = str3;
                        if (str2.ToUpper() == "AO TYPE")
                            panVerifierDetails.AOType = str3;
                        if (str2.ToUpper() == "RANGE CODE")
                            panVerifierDetails.RangeCode = str3;
                        if (str2.ToUpper() == "AO NUMBER")
                            panVerifierDetails.AONumber = str3;
                        if (str2.ToUpper() == "JURISDICTION")
                            panVerifierDetails.Jurisdiction = str3;
                        if (str2.ToUpper() == "BUILDING NAME")
                            panVerifierDetails.BuildingName = str3;
                    }
                    str2 = htmlNode.InnerText.Replace("\n", "").Replace("\r", "").Replace("\t", "");
                }
                tracesResponse2.CustomeTypes = (object)panVerifierDetails;
                return tracesResponse2;
            }
        }
    }

    public TracesResponse DownloadConsoTAN_PANFile(TracesLogin objLogin, TracesData objTraceData)
    {
        TracesResponse tracesResponse = new TracesResponse();
        try
        {
            if (!this.IsSessionExists)
            {
                tracesResponse = this.makeLoginToTRACES(objLogin);
                if (tracesResponse.Respons == enmResponse.Failed)
                    return tracesResponse;
            }
            string request = this.makeHTTPGetRequest(this.strBaseURL + "ded/panverify.xhtml");
            if (!this.IsStringExists(request, "//form[@id=\"pandetailsForm2\"]"))
            {
                string str = this.RetrieveElementValue(request, "//div[@class=\"padLeft5 margintop20\"]", "//span[@class=\"boldFont\"]", TracesConnect.enmElementType.InnerText);
                if (!string.IsNullOrEmpty(str))
                {
                    tracesResponse.Message = str;
                    tracesResponse.Respons = enmResponse.Failed;
                    return tracesResponse;
                }
                else
                {
                    tracesResponse.Message = "Server Error";
                    tracesResponse.Respons = enmResponse.SessionTimeout;
                    return tracesResponse;
                }
            }
            else
            {
                StringBuilder sbData1 = new StringBuilder();
                sbData1.Append("finYr=" + objTraceData.FAYear);
                sbData1.Append("&qrtr=" + objTraceData.Quarter);
                sbData1.Append("&frmType=" + objTraceData.Forms);
                sbData1.Append("&frmType2=" + objTraceData.Forms);
                sbData1.Append("&clickGo2=Go");
                Dictionary<string, string> dictionary1 = this.TraceViewStateData(request, "//form[@id=\"pandetailsForm2\"]");
                if (dictionary1.Count <= 0)
                {
                    this.Logoff();
                    tracesResponse.Message = "Server Error";
                    tracesResponse.Respons = enmResponse.SessionTimeout;
                    return tracesResponse;
                }
                else
                {
                    foreach (KeyValuePair<string, string> keyValuePair in dictionary1)
                    {
                        if (keyValuePair.Key != "pandetailsForm1_SUBMIT")
                            sbData1.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                    }
                    string str1 = this.makeHTTPPostRequest(this.strBaseURL + "ded/panverify.xhtml", sbData1);
                    tracesResponse = this.IsServerError(str1, "//ul[@id=\"err_Summary\"]");
                    if (tracesResponse.Respons == enmResponse.Failed)
                    {
                        this.Logoff();
                        tracesResponse.Respons = enmResponse.Failed;
                        return tracesResponse;
                    }
                    else if (!this.IsStringExists(str1, "//form[@id=\"dedkyc\"]"))
                    {
                        this.Logoff();
                        this.bnlSessionExists = false;
                        tracesResponse.Message = "Please Enter Valid Finnancial Details";
                        tracesResponse.Respons = enmResponse.SessionTimeout;
                        return tracesResponse;
                    }
                    else
                    {
                        StringBuilder sbData2 = new StringBuilder();
                        sbData2.Append("&stmtSpecKyc=1");
                        sbData2.Append("&bforeLogin=3");
                        sbData2.Append("&token=" + objTraceData.PRN_NO);
                        if (objTraceData.IsNoChallanCheck)
                            sbData2.Append("&cinbinCheck=" + objTraceData.IsNoChallanCheck);
                        sbData2.Append("&cinbinValue=" + objTraceData.IsNoChallan);
                        sbData2.Append("&bkEntryFlgChk=" + objTraceData.IsPaymentByBookAdjustmentCheck);
                        sbData2.Append("&bkEntryValue=" + objTraceData.IsPaymentByBookAdjustment);
                        if (objTraceData.panAmtValueCheck)
                            sbData2.Append("&panAmtCheck=" + objTraceData.panAmtValueCheck);
                        sbData2.Append("&panAmtValue=" + objTraceData.panAmtValue);
                        if (!objTraceData.IsNoChallanCheck)
                        {
                            sbData2.Append("&bsr=" + objTraceData.BSRCode);
                            sbData2.Append("&dtoftaxdep=" + objTraceData.TaxDepositedDate);
                            sbData2.Append("&csn=" + objTraceData.ChallanSerialNo);
                            sbData2.Append("&chlnamt=" + objTraceData.ChallanAmount);
                        }
                        if (!objTraceData.panAmtValueCheck)
                        {
                            sbData2.Append("&pan1=" + objTraceData.PAN1);
                            sbData2.Append("&amt1=" + objTraceData.PAN1Amount);
                            sbData2.Append("&pan2=" + objTraceData.PAN2);
                            sbData2.Append("&amt2=" + objTraceData.PAN2Amount);
                            sbData2.Append("&pan3=" + objTraceData.PAN3);
                            sbData2.Append("&amt3=" + objTraceData.PAN3Amount);
                        }
                        sbData2.Append("&clickKYC=Proceed");
                        Dictionary<string, string> dictionary2 = this.TraceViewStateData(str1, "//form[@id=\"dedkyc\"]");
                        foreach (KeyValuePair<string, string> keyValuePair in dictionary2)
                            sbData2.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                        if (dictionary2.Count <= 0)
                        {
                            this.Logoff();
                            this.bnlSessionExists = false;
                            tracesResponse.Message = "Server Error";
                            tracesResponse.Respons = enmResponse.SessionTimeout;
                            return tracesResponse;
                        }
                        else
                        {
                            string str2 = this.makeHTTPPostRequest(this.strBaseURL + "ded/kyc3form.xhtml", sbData2);
                            if (!this.IsStringExists(str2, "//form[@id=\"dedkyc\"]"))
                            {
                                this.bnlSessionExists = false;
                                tracesResponse.Message = "Server Error";
                                tracesResponse.Respons = enmResponse.SessionTimeout;
                                return tracesResponse;
                            }
                            else
                            {
                                tracesResponse = this.IsServerError(str2, "//div[@id=\"err_Summary\"]");
                                if (tracesResponse.Respons == enmResponse.Failed)
                                {
                                    string str3 = this.HTMLTagAttributeValue(this.strServerResponse, "//input[@id=\"frmType0\"]", "value");
                                    string str4 = this.HTMLTagAttributeValue(this.strServerResponse, "//input[@id=\"finYr0\"]", "value");
                                    string str5 = this.HTMLTagAttributeValue(this.strServerResponse, "//input[@id=\"qrtr0\"]", "value");
                                    if (tracesResponse.Message.Replace("\n", "") == "Token Number is not valid for Regular Statement")
                                        tracesResponse.CustomeTypes = (object)new List<string>()
                      {
                        str4,
                        str3,
                        str5
                      };
                                    this.Logoff();
                                    tracesResponse.Respons = enmResponse.Failed;
                                    return tracesResponse;
                                }
                                else
                                {
                                    string str3 = this.RetrieveElementValue(str2, "//form[@id=\"dedkyc\"]", "//input[@id=\"authcode\"]", TracesConnect.enmElementType.Value);
                                    Dictionary<string, string> dictionary3 = this.TraceViewStateData(str2, "//form[@id=\"dedkyc\"]");
                                    StringBuilder sbData3 = new StringBuilder();
                                    sbData3.Append("authcode=" + HttpUtility.UrlEncode(str3.Trim()));
                                    sbData3.Append("&redirect=" + HttpUtility.UrlEncode("Proceed with Transaction"));
                                    sbData3.Append("&dedkyc_SUBMIT=1");
                                    foreach (KeyValuePair<string, string> keyValuePair in dictionary3)
                                        sbData3.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                                    Dictionary<string, string> dictionary4 = this.TraceViewStateData(this.makeHTTPPostRequest(this.strBaseURL + "ded/kyc3confirm.xhtml", sbData3), "//form[@id=\"downloadreq\"]");
                                    if (dictionary4.Count <= 0)
                                    {
                                        this.Logoff();
                                        this.bnlSessionExists = false;
                                        tracesResponse.Message = "Server Error";
                                        tracesResponse.Respons = enmResponse.SessionTimeout;
                                        return tracesResponse;
                                    }
                                    else
                                    {
                                        StringBuilder stringBuilder = new StringBuilder();
                                        foreach (KeyValuePair<string, string> keyValuePair in dictionary4)
                                        {
                                            if (keyValuePair.Key == "finYr")
                                                stringBuilder.Append("fy=" + keyValuePair.Value);
                                            if (keyValuePair.Key == "qrtr")
                                            {
                                                if (keyValuePair.Value == "")
                                                    stringBuilder.Append("&qr=0");
                                                else
                                                    stringBuilder.Append("&qr=" + keyValuePair.Value);
                                            }
                                            if (keyValuePair.Key == "formType")
                                                stringBuilder.Append("&ft=" + keyValuePair.Value);
                                            if (keyValuePair.Key == "dwldType")
                                                stringBuilder.Append("&dt=" + keyValuePair.Value);
                                        }
                                        string str4 = this.RetrieveElementValue(this.makeHTTPGetRequest(this.strBaseURL + "srv/CreateDwnldReqServlet?" + ((object)stringBuilder).ToString()), "//div[@class='margintop20']", "//h5", TracesConnect.enmElementType.InnerText);
                                        if (!string.IsNullOrEmpty(str4))
                                        {
                                            tracesResponse.CustomeTypes = (object)new RequestStatus()
                                            {
                                                AuthenticationCode = str3,
                                                StatusMessage = str4
                                            };
                                            tracesResponse.Respons = enmResponse.Success;
                                        }
                                        this.Logoff();
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            this.Logoff();
            this.bnlSessionExists = false;
            tracesResponse.Respons = enmResponse.Failed;
            tracesResponse.Message = ex.Message;
        }
        return tracesResponse;
    }

    private string HTMLTagAttributeValue(string strHTML, string xPathQuery, string strAttName)
    {
        HtmlDocument htmlDocument = new HtmlDocument();
        htmlDocument.LoadHtml(strHTML);
        return htmlDocument.DocumentNode.SelectNodes(xPathQuery)[0].Attributes[strAttName].Value;
    }

    public bool IsValidPAN(string PAN_No)
    {
        try
        {
            this.strServerResponse = this.makeHTTPGetRequest("https://onlineservices.tin.egov-nsdl.com/etaxnew/tdsnontds.jsp");
            if (!this.IsStringExists(this.strServerResponse, "//form[@name=\"selectform\"]"))
                return false;
            string str = this.HTMLTagAttributeValue(this.strServerResponse, "//form[@name=\"selectform\"]", "action");
            if (string.IsNullOrEmpty(str))
                return false;
            StringBuilder sbData1 = new StringBuilder();
            sbData1.Append("browser_type=IE");
            sbData1.Append("&from_tdsnontds=Y");
            sbData1.Append("&R2=280");
            this.strServerResponse = this.makeHTTPPostRequest("https://onlineservices.tin.egov-nsdl.com/etaxnew/" + str, sbData1);
            StringBuilder sbData2 = new StringBuilder();
            sbData2.Append("AssessYear=");
            sbData2.Append("&Add_State=");
            sbData2.Append("&Name=");
            sbData2.Append("&Add_PIN=");
            sbData2.Append("&Add_Line1=");
            sbData2.Append("&Add_Line2=");
            sbData2.Append("&Add_Line3=");
            sbData2.Append("&Add_Line4=");
            sbData2.Append("&Add_Line5=");
            sbData2.Append("&PAN=" + PAN_No);
            sbData2.Append("&ChallanNo=");
            sbData2.Append("&MinorHeadRadio=");
            sbData2.Append("&MajorHeadRadio=");
            this.strServerResponse = this.makeHTTPPostRequest("https://onlineservices.tin.egov-nsdl.com/etaxnew/PopulateBankServlet", sbData2);
            return !Regex.IsMatch(this.strServerResponse, "Invalid PAN", RegexOptions.IgnoreCase);
        }
        catch
        {
            return false;
        }
    }

    private List<string> getDownloadAnchorLink(string strHTML)
    {
        HtmlDocument htmlDocument = new HtmlDocument();
        htmlDocument.LoadHtml(strHTML);
        List<string> list = new List<string>();
        HtmlNodeCollection htmlNodeCollection = htmlDocument.DocumentNode.SelectNodes("//a");
        if (htmlNodeCollection != null)
        {
            foreach (HtmlNode htmlNode in (IEnumerable<HtmlNode>)htmlNodeCollection)
            {
                HtmlAttribute htmlAttribute = htmlNode.Attributes["href"];
                list.Add(((object)htmlAttribute.Value).ToString().Replace("&amp;", "&").Replace("\r\n", ""));
            }
        }
        return list;
    }

    public TracesResponse RequestForPANValidation(string strPAN)
    {
        TracesResponse tracesResponse = new TracesResponse();
        string str = "";
        try
        {
            string request = this.makeHTTPGetRequest(this.strBaseURL + "ded/panverify.xhtml");
            if (!this.IsStringExists(request, "//form[@id=\"pandetailsForm1\"]"))
            {
                tracesResponse.Respons = enmResponse.SessionTimeout;
                return tracesResponse;
            }
            else
            {
                StringBuilder sbData = new StringBuilder();
                sbData.Append("pannumber=" + strPAN.Trim());
                sbData.Append("&frmType1=24Q");
                sbData.Append("&clickGo1=Go");
                sbData.Append("&pandetailsForm1_SUBMIT=1");
                Dictionary<string, string> dictionary = this.TraceViewStateData(request, "//form[@id=\"pandetailsForm1\"]");
                foreach (KeyValuePair<string, string> keyValuePair in dictionary)
                {
                    if ("javax.faces.ViewState" == keyValuePair.Key)
                        sbData.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                }
                str = this.makeHTTPPostRequest(this.strBaseURL + "ded/panverify.xhtml", sbData);
                if (tracesResponse.Respons == enmResponse.Failed)
                    return tracesResponse;
                PANDetails panDetails = new PANDetails();
                panDetails.PAN = strPAN;
                foreach (KeyValuePair<string, string> keyValuePair in dictionary)
                {
                    if (((object)keyValuePair.Key).ToString().ToUpper() == "STATUS")
                        panDetails.Status = keyValuePair.Value;
                    if (((object)keyValuePair.Key).ToString().ToUpper() == "NAME")
                        panDetails.Name = keyValuePair.Value;
                }
                tracesResponse.CustomeTypes = (object)panDetails;
                tracesResponse.Respons = enmResponse.Success;
            }
        }
        catch (Exception ex)
        {
            tracesResponse.Message = ex.Message;
            tracesResponse.Respons = enmResponse.Failed;
        }
        return tracesResponse;
    }

    public TracesResponse RequestForPANValidation(string strPAN, out string strName)
    {
        TracesResponse tracesResponse = new TracesResponse();
        strName = "";
        try
        {
            string request = this.makeHTTPGetRequest(this.strBaseURL + "ded/panverify.xhtml");
            if (!this.IsStringExists(request, "//form[@id=\"pandetailsForm1\"]"))
            {
                tracesResponse.Respons = enmResponse.SessionTimeout;
                return tracesResponse;
            }
            else
            {
                StringBuilder sbData = new StringBuilder();
                sbData.Append("pannumber=" + strPAN.Trim());
                sbData.Append("&frmType1=24Q");
                sbData.Append("&clickGo1=Go");
                sbData.Append("&pandetailsForm1_SUBMIT=1");
                foreach (KeyValuePair<string, string> keyValuePair in this.TraceViewStateData(request, "//form[@id=\"pandetailsForm1\"]"))
                {
                    if ("javax.faces.ViewState" == keyValuePair.Key)
                    {
                        sbData.Append("&" + keyValuePair.Key + "=" + HttpUtility.UrlEncode(keyValuePair.Value));
                        break;
                    }
                }
                string strHTML = this.makeHTTPPostRequest(this.strBaseURL + "ded/panverify.xhtml", sbData);
                if (tracesResponse.Respons == enmResponse.Failed)
                    return tracesResponse;
                strName = this.RetrievePANName(strHTML);
                tracesResponse.Respons = enmResponse.Success;
            }
        }
        catch (Exception ex)
        {
            tracesResponse.Message = ex.Message;
            tracesResponse.Respons = enmResponse.Failed;
        }
        return tracesResponse;
    }
    

    private enum enmElementType
    {
        InnerText,
        InnerHTML,
        Value,
        Name,
    }
}

