
using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Globalization;
using System.IO;
using System.IO.Compression;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Cmn
/// </summary>
/// 
public class myAsyncResult : IAsyncResult
{

    object IAsyncResult.AsyncState
    {
        get { throw new NotImplementedException(); }
    }

    System.Threading.WaitHandle IAsyncResult.AsyncWaitHandle
    {
        get { throw new NotImplementedException(); }
    }

    bool IAsyncResult.CompletedSynchronously
    {
        get { return true; }
    }

    bool IAsyncResult.IsCompleted
    {
        get { return false; }
    }
}

public class Cmn
{

    const Boolean UseCache = true;

    public Cmn()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static DateTime MinDate = new DateTime(1900, 1, 1);

    public static string GetEncode(Page pg)
    {
        string encodings = pg.Request.Headers.Get("Accept-Encoding");
        string encode = "no";

        if (encodings != null)
        {
            encodings = encodings.ToLower();
            if (encodings.Contains("gzip"))
            {
                pg.Response.AppendHeader("Content-Encoding", "gzip");
                encode = "gzip";
            }
            else if (encodings.Contains("deflate"))
            {
                pg.Response.AppendHeader("Content-Encoding", "deflate");
                encode = "deflate";
            }
        }
        return encode;
    }

    public static void WriteFile(string str, string FileName, string CompressionType)
    {
        byte[] buffer = System.Text.Encoding.ASCII.GetBytes(str);

        switch (CompressionType)
        {
            case "gzip":
                {
                    FileStream sw = new FileStream(FileName, FileMode.Create);
                    GZipStream gz = new GZipStream(sw, CompressionMode.Compress);
                    gz.Write(buffer, 0, buffer.Length);
                    gz.Close();
                    sw.Close();
                }
                break;
            case "deflate":
                {
                    FileStream sw = new FileStream(FileName, FileMode.Create);
                    DeflateStream dz = new DeflateStream(sw, CompressionMode.Compress);
                    dz.Write(buffer, 0, buffer.Length);
                    dz.Close();
                    sw.Close();
                }
                break;
            default:
                {
                    StreamWriter sw = new StreamWriter(FileName, false);
                    sw.Write(str);
                    sw.Close();
                }
                break;
        }

        File.SetCreationTime(FileName, DateTime.Now);
    }

    public static void WriteResponse(Page p, string Message, string Compression = "")
    {
        if (Compression == "")
            Compression = GetEncode(p);
        if (Compression == "no" || string.IsNullOrEmpty(Compression))
            p.Response.Write(Message);
        else
            p.Response.BinaryWrite(GetCompressed(Message, Compression));
    }

    public static byte[] GetCompressed(string str, string CompressionType = "gzip")      //Compreess Data 
    {
        byte[] buffer = System.Text.Encoding.ASCII.GetBytes(str);
        MemoryStream ms = new MemoryStream();

        switch (CompressionType)
        {
            case "gzip":
                {
                    GZipStream gz = new GZipStream(ms, CompressionMode.Compress, true);
                    gz.Write(buffer, 0, buffer.Length);
                    gz.Close();
                }
                break;
            case "deflate":
                {
                    DeflateStream dz = new DeflateStream(ms, CompressionMode.Compress);
                    dz.Write(buffer, 0, buffer.Length);
                    dz.Close();
                }
                break;
        }
        byte[] compressedData = (byte[])ms.ToArray();
        return compressedData;
    }

    public static string GetUnCompressed(byte[] Data, int Size)             //Uncompreess Data
    {
        if (Data == null)
            return string.Empty;
        MemoryStream ms = new MemoryStream(Data);
        GZipStream gz = null;
        try
        {
            gz = new GZipStream(ms, CompressionMode.Decompress);
            byte[] decompressedBuffer = new byte[Size];
            int DataLength = gz.Read(decompressedBuffer, 0, Size);
            using (MemoryStream msDec = new MemoryStream())
            {
                msDec.Write(decompressedBuffer, 0, DataLength);
                msDec.Position = 0;
                string s = new StreamReader(msDec).ReadToEnd();
                return s;
            }
        }
        catch
        {
            //return ex.Message;
        }
        finally
        {
            ms.Close();
            gz.Close();
        }
        return string.Empty;
    }


    public static string CheckString(string text)
    {
        return text.Replace("'", "").Replace("\"", "").Replace("@", "").Replace("?", "").Replace("*", "");
    }

    public static void LogException(string ModuleName, string FunctionName, Exception ex)
    {
        if (HttpContext.Current.Application["ERROR_IDS"] == null)
        {
            HttpContext.Current.Application["ERROR_IDS"] = new Dictionary<string, int>();
            HttpContext.Current.Application["ERROR_LIST"] = new Dictionary<int, string>();
        }

        Dictionary<string, int> ErrorLog = (Dictionary<string, int>)HttpContext.Current.Application["ERROR_IDS"];
        if (!ErrorLog.ContainsKey(ModuleName + "_" + FunctionName))
        {
            ErrorLog.Add(ModuleName + "_" + FunctionName, ErrorLog.Count + 1);
        }

        //get the id of the error
        int i = ErrorLog[ModuleName + "_" + FunctionName];
        Dictionary<int, string> ErrorList = (Dictionary<int, string>)HttpContext.Current.Application["ERROR_LIST"];

        if (!ErrorList.ContainsKey(i))
            ErrorList.Add(i, "");

        ErrorList[i] = ModuleName + ":" + FunctionName + ":" + ex.Message + ":" + DateTime.Now.ToString();

    }

    public static string ValidateInput(string Data, int Length, Boolean CheckforValidDate, Boolean ConvertToUpper, Boolean CleanInput)
    {
        if (Length > 0)
            if (Data.Length > Length)
                Data = Data.Substring(0, Length);

        if (ConvertToUpper)
            Data = Data.ToUpper();

        if (CleanInput)
            Data = Data.Replace("'", "").Replace("%", "").Replace("*", "").Replace(" ", "");

        return Data;
    }

    public static DateTime GetIndiaTime()
    {
        return DateTime.Now.ToUniversalTime().AddHours(5).AddMinutes(30);
    }

    public static void WriteClientScript(Page pg, string Client_Script)
    {
        ClientScriptManager cs = pg.ClientScript;
        string csname1 = "S1";
        if (!cs.IsClientScriptBlockRegistered(pg.GetType(), csname1))
        {
            StringBuilder cstext2 = new StringBuilder();
            cstext2.Append("<script language='javascript' type='text/javascript'> \n");
            cstext2.Append(Client_Script);
            cstext2.Append("</script>");
            cs.RegisterClientScriptBlock(pg.GetType(), csname1, cstext2.ToString(), false);
        }
    }

    public static DateTime ToDate(string txt)
    {
        DateTime X;
        if (DateTime.TryParse(txt, out X) == false)
            return Cmn.MinDate;
        return X;
    }

    public static DateTime ToDate(object obj)
    {
        if (obj == null)
            return Cmn.MinDate;

        DateTime X;
        if (DateTime.TryParse(obj.ToString(), out X) == false)
            return Cmn.MinDate;

        return X;
    }

    public static decimal ToDec(TextBox txt)
    {
        decimal X;
        if (decimal.TryParse(txt.Text, out X) == false)
            return 0;

        return X;
    }

    public static decimal ToDec(string txt)
    {
        decimal X;
        if (decimal.TryParse(txt, out X) == false)
            return 0;

        return X;
    }

    public static double ToDbl(object txt)
    {
        double X;
        if (double.TryParse(txt.ToString(), out X) == false)
            return 0;

        return X;
    }

    public static int ToInt(TextBox txt)
    {
        int X;
        if (int.TryParse(txt.Text, out X) == false)
            return 0;

        return X;
    }

    public static int ToInt(string txt, int DefaultValue)
    {
        int X;
        if (int.TryParse(txt, out X) == false)
            return DefaultValue;
        return X;
    }

    public static int ToInt(object txt)
    {
        if (txt == null)
            return 0;
        int X;
        if (int.TryParse(txt.ToString(), out X) == false)
            return 0;

        return X;
    }

    public static int ToInt(string txt)
    {
        int X;
        if (int.TryParse(txt, out X) == false)
            return 0;

        return X;
    }

    public static string ProperCase(string str)
    {
        CultureInfo cultureInfo = Thread.CurrentThread.CurrentCulture;
        TextInfo textInfo = cultureInfo.TextInfo;
        return textInfo.ToTitleCase(str.Trim().ToLower());
    }

    public static void ClearTextBoxes(Control parent)   //reset fields in form
    {
        foreach (Control ctl in parent.Controls)
        {
            if (ctl.GetType().ToString().Equals("System.Web.UI.WebControls.TextBox"))
                ((TextBox)ctl).Text = "";

            if (ctl.GetType().ToString().Equals("System.Web.UI.WebControls.CheckBox"))
                ((CheckBox)ctl).Checked = false;

            if (ctl.GetType().ToString().Equals("System.Web.UI.WebControls.DropDownList"))
                ((DropDownList)ctl).SelectedIndex = -1;

            if (ctl.Controls.Count > 0)
                ClearTextBoxes(ctl);
        }
    }

    public static void GetAllClientID(Control parent, ref string strCtl)
    {
        foreach (Control ctl in parent.Controls)
        {
            //if (ctl.GetType().ToString().Equals("System.Web.UI.WebControls.TextBox"))
            if (ctl.ID != null)
                strCtl += "var " + ctl.ID + "=\"#" + ctl.ClientID + "\";\n";

            try
            {
                if (ctl.Controls.Count > 0)
                    GetAllClientID(ctl, ref strCtl);
            }
            catch (Exception Ex)
            {
                string str = Ex.Message;
            }
        }
    }

    public static string ConvertNumberToWord(Int32 numberVal)
    {
        string[] powers = new string[] { "Thousand ", "Million ", "Billion " };
        string[] ones = new string[] { "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen" };
        string[] tens = new string[] { "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety" };
        string wordValue = "";
        if (numberVal == 0) return "Zero";
        if (numberVal < 0)
        {
            wordValue = "Negative ";
            numberVal = -numberVal;
        }
        long[] partStack = new long[] { 0, 0, 0, 0 };
        int partNdx = 0;
        while (numberVal > 0)
        {
            partStack[partNdx++] = numberVal % 1000;
            numberVal /= 1000;
        }
        for (int i = 3; i >= 0; i--)
        {
            long part = partStack[i];
            if (part >= 100)
            {
                wordValue += ones[part / 100 - 1] + " Hundred ";
                part %= 100;
            }
            if (part >= 20)
            {
                if ((part % 10) != 0) wordValue += tens[part / 10 - 2] + " " + ones[part % 10 - 1] + " ";
                else wordValue += tens[part / 10 - 2] + " ";
            }
            else if (part > 0) wordValue += ones[part - 1] + " ";
            if (part != 0 && i > 0) wordValue += powers[i - 1];
        }
        return wordValue;
    }

    public static double CalcDistance(double lat1, double lon1, double lat2, double lon2, char unit = 'K')    //calculate distance betwwen two loc in googlemap
    {
        var theta = lon1 - lon2;
        var dist = Math.Sin(deg2rad(lat1)) * Math.Sin(deg2rad(lat2)) + Math.Cos(deg2rad(lat1)) * Math.Cos(deg2rad(lat2)) * Math.Cos(deg2rad(theta));
        dist = Math.Acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
        if (unit == 'K')
        {
            dist = dist * 1.609344;
        }
        else if (unit == 'N')
        {
            dist = dist * 0.8684;
        }
        return (dist);
    }

    private static double deg2rad(double deg)
    {
        return (deg * Math.PI / 180.0);
    }

    private static double rad2deg(double rad)
    {
        return (rad / Math.PI * 180.0);
    }

    public static string GetFormString(string FieldName)
    {
        NameValueCollection nvc = HttpContext.Current.Request.Form;
        if (nvc[FieldName] != null)
            return nvc[FieldName];

        return "";
    }

    public static string GenerateSlug(string phrase)     //returns-clear-urlname
    {
        if (string.IsNullOrWhiteSpace(phrase)) phrase = string.Empty;
        string str = RemoveAccent(phrase).Replace("&", "and").ToLower();
        // invalid chars           
        str = Regex.Replace(str, @"[^a-z0-9\s-]", "");
        // convert multiple spaces into one space   
        str = Regex.Replace(str, @"\s+", " ").Trim();
        // convert multiple - into one space   
        str = Regex.Replace(str, @"\-+", " ").Trim();
        // cut and trim 
        //str = str.Substring(0, str.Length <= 45 ? str.Length : 45).Trim();
        str = Regex.Replace(str, @"\s", "-"); //replace space with hyphens   
        return str;
    }

    public static string RemoveAccent(string txt)
    {
        byte[] bytes = System.Text.Encoding.GetEncoding("Cyrillic").GetBytes(txt);
        return System.Text.Encoding.ASCII.GetString(bytes);
    }


    public static void LogError(Exception ex, string Message, string fileName = "")      //
    {
        string Folder = HttpContext.Current.Server.MapPath(@"~\Error\");
        if (!Directory.Exists(Folder))
            Directory.CreateDirectory(Folder);
        string Filename = HttpContext.Current.Server.MapPath(@"~\Error\" + (!string.IsNullOrWhiteSpace(fileName) ? fileName : DateTime.Now.ToString("dd-MMM-yyyy").Replace('-', '_')) + ".txt");

        string Error = DateTime.Now.ToString() + Environment.NewLine;

        if (!string.IsNullOrEmpty(Message))
            Error += Message + Environment.NewLine;

        if (ex != null)
        {
            Error += ex.Message + Environment.NewLine;
            if (string.IsNullOrWhiteSpace(fileName))
                Error += ex.StackTrace + Environment.NewLine;
        }
        try
        {
            File.AppendAllText(Filename, Error);
        }
        catch { }
    }

    public static string GetImageFileName(string ID, string path, string fileextention = "")
    {
        string fileName;
        for (int i = 1; ; i++)
        {
            fileName = HttpContext.Current.Server.MapPath(path + ID + "_" + i) + (fileextention == "" ? ".jpg" : fileextention);
            if (!File.Exists(fileName))
                break;
        }
        return Path.GetFileName(fileName);
    }

    public static void Download(FileInfo file, Page page) //download file from server directory
    {
        Stream s = File.OpenRead(file.FullName);
        Byte[] buffer = new Byte[s.Length];
        try { s.Read(buffer, 0, (Int32)s.Length); }
        finally { s.Close(); }
        page.Response.ClearHeaders();
        page.Response.ClearContent();
        page.Response.ContentType = "application/octet-stream";
        page.Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
        page.Response.BinaryWrite(buffer);
        page.Response.End();
    }

    public static double CalculateTax(double TaxableAmount)
    {
        double f1 = 250000.0;
        double f2 = 500000.0;
        double f3 = 1000000.0;

        if (TaxableAmount <= f1)
            return 0;

        double tax = 0;

        if (TaxableAmount <= f2)
            tax = (TaxableAmount - f1) * .1;
        else if (TaxableAmount <= f3)
            tax = (TaxableAmount - f2) * .2 + 25000;
        else
            tax = (TaxableAmount - f3) * .3 + 125000;
        return Math.Round(tax);
    }

    public static double CalculateSurcharge(double tax)
    {
        double surcharge = 0;
        if (tax > 10000000)
            surcharge = tax * 0.01;
        return Math.Round(surcharge);
    }

    public static double CalculateCess(double tax)
    {
        return tax * 0.03;
    }

    public static string CreateRandomPassword(int pasLenth)
    {
        string allowedChars = "";
        allowedChars = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,";
        allowedChars += "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,";
        allowedChars += "1,2,3,4,5,6,7,8,9,0,!,@,#,$,%,&,?";
        char[] sep = { ',' };
        string[] arr = allowedChars.Split(sep);
        string passwordString = "";
        string temp = "";
        Random rand = new Random();
        for (int i = 0; i < pasLenth; i++)
        {
            temp = arr[rand.Next(0, arr.Length)];
            passwordString += temp;
        }
        return passwordString;
    }

    public static string SendEmail(string Subject, string EmailTo, string Name, string mailBody, string[] files = null, string id = "")
    {
        SmtpClient client = new SmtpClient();
        client.DeliveryMethod = SmtpDeliveryMethod.Network;
        client.EnableSsl = true;
        client.Host = "smtp.gmail.com";
        client.Port = 587;

        // setup Smtp authentication
        NetworkCredential credentials = new NetworkCredential("contact@fincomindia.in", "fincom2015");

        client.UseDefaultCredentials = false;
        client.Credentials = credentials;

        MailMessage msg = new MailMessage();
        msg.From = new MailAddress("contact@fincomindia.in");
        msg.To.Add(new MailAddress(EmailTo));
        msg.CC.Add(new MailAddress("contact@fincomindia.in"));
        //msg.Bcc.Add(new MailAddress("rraprop@gmail.com"));
        msg.Subject = Subject;
        msg.IsBodyHtml = true;
        msg.Body = string.Format(mailBody);

        Attachment at = null;

        if (files != null)
        {
            foreach (string s in files)
            {
                at = new Attachment(s);
                msg.Attachments.Add(at);

            }
        }

        try
        {
            client.Send(msg);
            return "Your mail data been successfully sent to your email address.";
        }
        catch (Exception ex)
        {
            return "Error occured while sending your message." + ex.Message;
        }
    }
    public static Boolean DownloadFile(string SaveURL, string DownloadURL, Boolean isSizeCheck = false, string CustomMessage = "", int companyID = 0)
    {
        using (var client = new WebClient())
        {
            try
            {
                Boolean isDownload = true;
                if (isSizeCheck)
                {
                    isDownload = false;
                    if (CheckHTTPFileLength(DownloadURL) > 24731)
                        isDownload = true;
                }
                if (isDownload)
                    client.DownloadFile(DownloadURL, SaveURL);
                return true;

            }
            catch (Exception ex)
            {
                Cmn.LogError(ex, "File Download Error Check " + CustomMessage + " URL:" + DownloadURL, (companyID == 0 ? "FileDownload" : companyID.ToString()));
                return false;
            }
        }
    }
    public static long CheckHTTPFileLength(string fileName)
    {
        HttpWebRequest req = (HttpWebRequest)WebRequest.Create(fileName);
        req.Method = "HEAD";
        HttpWebResponse resp = (HttpWebResponse)(req.GetResponse());

        return resp.ContentLength;
    }

    public static void ProcessHTML(object _ThreadObject)
    {
        ThreadObject T = (ThreadObject)_ThreadObject;

        if (T.ResponsesInvalid != null)
        {
            foreach (string sl in T.ResponsesInvalid)
            {
                if (T.DataDownloaded.Contains(sl))
                {
                    T.DataProcessed = sl;
                    T.Error = sl;
                    return;
                }
            }
        }

        //indinan rail train time table fix
        string strTD = "<TD ALIGN = Center </td>";
        if (T.DataDownloaded.Contains(strTD))
        {
            T.DataDownloaded = T.DataDownloaded.Replace(strTD, "<TD></td>");
        }
        strTD = "<FONT COLOR = red>";
        if (T.DataDownloaded.Contains(strTD))
        {
            T.DataDownloaded = T.DataDownloaded.Replace(strTD, "");
        }

        strTD = "<TR>\n<TR>";//fix for indian rail availability
        if (T.DataDownloaded.Contains(strTD))
        {
            T.DataDownloaded = T.DataDownloaded.Replace(strTD, "</tr><tr>");
        }

        // for www.indianrail.gov.in/cgi_bin/inet_srcdest_cgi_date.cgi
        strTD = "</span>\n<TD TITLE";
        if (T.DataDownloaded.Contains(strTD)) { T.DataDownloaded = T.DataDownloaded.Replace(strTD, "</span></TD><TD TITLE"); }
        strTD = "</A>\n<TD>";
        if (T.DataDownloaded.Contains(strTD)) { T.DataDownloaded = T.DataDownloaded.Replace(strTD, "</A></TD><TD>"); }
        strTD = "')\">\n<TD>";
        if (T.DataDownloaded.Contains(strTD))
        {
            T.DataDownloaded = T.DataDownloaded.Replace("  CHECKED", "");
            T.DataDownloaded = T.DataDownloaded.Replace(strTD, "')\"></TD><TD>");
        }


        HtmlAgilityPack.HtmlDocument doc = new HtmlAgilityPack.HtmlDocument();
        doc.LoadHtml(T.DataDownloaded);


        HtmlNodeCollection htables = doc.DocumentNode.SelectNodes("//table");
        if (htables == null)
        {
            T.Error = "No table found";
            T.Success = true;
            T.DataProcessed = T.Error;
        }

        string str;
        Boolean flag;
        StringBuilder strRet = new StringBuilder();

        try
        {
            foreach (HtmlNode tb in htables)
            {
                flag = false;

                foreach (HtmlNode tr in tb.ChildNodes)
                {
                    if (tr.Name == "tr")
                    {
                        str = GetRow(tr.ChildNodes, T, ref flag);
                        if (str.Length > 0)
                            strRet.Append(str + "\n");
                    }


                    if (tr.Name == "tbody" || tr.Name == "thead")
                    {
                        foreach (HtmlNode trs in tr.ChildNodes)
                        {
                            if (trs.Name == "tr")
                            {
                                str = GetRow(trs.ChildNodes, T, ref flag);
                                if (str.Length > 0)
                                    strRet.Append(str + "\n");
                            }
                        }
                    }
                }
            }

        }
        catch //(Exception ex)
        {
            //ErrorMessage = ex.Message;
        }

        T.Error = "OK";
        T.Success = true;
        T.DataProcessed = strRet.ToString();
    }

    static string GetRow(HtmlNodeCollection nc, ThreadObject T, ref Boolean flag)
    {
        string str = "", txt;
        foreach (HtmlNode td in nc)
        {
            if (td.Name == "td" || td.Name == "th")
            {
                txt = td.InnerText.Replace("\n", "").Replace(",", "").Replace("&nbsp;", "").Trim();
                if (T.TdTextWithTitle && td.Attributes["title"] != null)
                    txt += "~" + td.Attributes["title"].Value.Replace(",", " ");

                if (string.IsNullOrEmpty(txt))
                    txt = " ";
                if (flag == false)
                {
                    if (T.HtmlDataTables == null)
                        flag = true;
                    else
                    {
                        foreach (string s in T.HtmlDataTables) { if (txt == s) { flag = true; break; } }
                    }

                }

                if (flag)
                {
                    str += (str.Length > 0 ? "," : "") + txt;
                }
            }
        }

        return str;
    }

    public static string GetTableHTML(object _ThreadObject)
    {
        ThreadObject T = (ThreadObject)_ThreadObject;
        HtmlAgilityPack.HtmlDocument doc = new HtmlAgilityPack.HtmlDocument();
        doc.LoadHtml(T.DataDownloaded);
        //doc.Load(T.Data);

        HtmlNodeCollection htables = doc.DocumentNode.SelectNodes("//table");
        if (htables == null)
        {
            T.Error = "No table found";
            T.Success = true;
            T.DataProcessed = T.Error;
        }

        string str, AllTables = "";
        Boolean flag;
        StringBuilder strRet = new StringBuilder();

        try
        {
            foreach (HtmlNode tb in htables)
            {
                flag = false;

                foreach (HtmlNode tr in tb.ChildNodes)
                {
                    if (tr.Name == "tr")
                    {
                        str = GetRow(tr.ChildNodes, T, ref flag);
                        if (str.Length > 0)
                        {
                            AllTables += tb.OuterHtml;
                            goto ProcessNext;
                        }
                    }


                    if (tr.Name == "tbody" || tr.Name == "thead")
                    {
                        foreach (HtmlNode trs in tr.ChildNodes)
                        {
                            if (trs.Name == "tr")
                            {
                                str = GetRow(trs.ChildNodes, T, ref flag);
                                if (str.Length > 0)
                                {
                                    AllTables += tb.OuterHtml;
                                    goto ProcessNext;
                                }
                            }
                        }
                    }
                }

            ProcessNext: ;

            }

        }
        catch //(Exception ex)
        {
            //ErrorMessage = ex.Message;
        }

        return AllTables;
    }

    public static string GetHTMLContent(string Data, string Tag)
    {
        HtmlAgilityPack.HtmlDocument doc = new HtmlAgilityPack.HtmlDocument();
        doc.LoadHtml(Data);
        HtmlNodeCollection hTags = doc.DocumentNode.SelectNodes("//" + Tag);
        if (hTags == null)
        {
            return "Not Found";
        }

        StringBuilder strRet = new StringBuilder();

        try
        {
            foreach (HtmlNode tb in hTags)
            {
                strRet.AppendLine(tb.InnerText);
            }

            return strRet.ToString();
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
    }


    public static string CreateMailStructure(string subject, string to, string content)
    {
        return "<html><div style='font: inherit; font-size: 100%; margin: 0; padding: 0; background-color: #f5f5f5; font-family: Arial,sans-serif; font-size: 13px; color: #575757; line-height: 1.4'>" +
"<div>" +
 "<table style='max-width: 615px; vertical-align: top; margin: 0 auto; padding: 0; font: inherit; border-spacing: 0; border-collapse: collapse'>" +
     "<tbody>" +
         "<tr height='50px;' style='vertical-align: bottom; background-color: #f5f5f5; font-size: 11px; color: #575757'>" +
             "<td style='text-align: right; padding-bottom: 5px; padding-right: 5px; padding-left: 5px'>" +
             "</td>" +
         "</tr>" +
         "<tr>" +
             "<td colspan='2' height='100%' style='background-color: #ffffff'>" +
                 "<img src='http://fincomindia.com/Images/FinCom.png' style='vertical-align: bottom; width: 90px; min-height: 32px; padding-left: 5%; padding-top: 5%' class='CToWUd'>" +
                 "<span style='font-size: 24px; line-height: 37px; font-weight: thin; color: #878787; white-space: nowrap; padding-left: 10px; padding-top: 5%'>Fin Com India</span>" +
                 "<p style='padding-bottom: 10px; padding: 0 5%'>" +
                     "<span style='font-size: 21px; line-height: 25px; color: #000000; font-weight: normal'>" + subject + "</span>" +
                 "</p>" +
                    "<div dir='ltr'>" +
                     "<div style='padding: 0 5%'>" +
                         "<p>To: " + to + "<span dir='ltr'></span></p>" +
                     "</div>" +
                     "<div style='padding: 0 5%'>" +
                         "<table border='0' cellpadding='0' cellspacing='0' style='font: inherit; color: #878787; border-spacing: 0; border-collapse: collapse' width='100%'>" +
                             "<tbody>" +
                                 "<tr style='margin-bottom: 20px' width='100%'>" +
                                     "<td style='padding-bottom: 15px; padding-right: 15px; padding-left: 0' valign='middle'>" +
                                         "<p style='margin: 0; padding: 0'>" + content +

                                         "</p>" +
                                     "</td>" +
                                    "</tr>" +
                             "</tbody>" +
                         "</table>" +
                     "</div>" +
                 "</div>" +
             "</td>" +
         "</tr>" +
         "<tr height='100px' style='vertical-align: top; background-color: #f5f5f5'>" +
             "<td colspan='2' style='border-top: 2px solid #f1f1f1'>" +
                 "<table style='font: inherit; font-size: 11px; margin-top: 5px; border-spacing: 0; border-collapse: collapse; margin-left: 5px' width='100%'>" +
                     "<tbody>" +
                         "<tr style='vertical-align: top'>" +
                             "<td>Fin Com India T - 5, Aditya City Centre, Vaibhav Khand, Indirapuram, Ghaziabad - 201014, UP, India | <a href='http://www.fincomindia.in' style='text-decoration: none; color: #4c90fe' target='_blank'>FinComIndia.in</a>" +
                                 "<br />" +
                             "</td>" +
                         "</tr>" +
                     "</tbody>" +
                 "</table>" +
             "</td>" +
         "</tr>" +
     "</tbody>" +
 "</table>" +
"</div>" +
"</div></html>";
    }
}
