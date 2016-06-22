using System;
using System.IO;
using System.Net;
using System.Text;
using System.Web.Script.Serialization;
using TDSModel;

public partial class VerifyPan : BasePage
{

    protected new void Page_Load(object sender, EventArgs e)
    {
        string PAN = Request.QueryString["pan"] != null ? Request.QueryString["pan"].ToString() : "";
        string Captcha = Request.QueryString["captcha"] != null ? Request.QueryString["captcha"].ToString() : "";
        GetPANData(PAN, Captcha);
    }

    //Get Pan Details
    void GetPANData(string PANNumber, string Captcha)
    {
        PAN pan = new PAN() { Number = PANNumber };
        PanVerification panver = PanVerification.GetByPan(PANNumber);
            try
            {
                if (panver == null)
                {
                    StringBuilder sbData = new StringBuilder();
                    sbData.Append("requestId=");
                    sbData.Append("&panOfDeductee=" + PANNumber);  //CRWPK1976L
                    sbData.Append("&captchaCode=" + Captcha);
                    string result = makeHTTPPostRequest("https://incometaxindiaefiling.gov.in/e-Filing/Services/KnowYourJurisdiction.html ", sbData);

                    if (result.Contains("Invalid Code. Please enter the number as appearing in the Image"))
                    {
                        pan.Error = "Invalid capcha! please try again";
                    }
                    else if (result.Contains("//div[@class=\"error\"]"))
                    {
                        pan.Error = "Some Error occured";
                    }
                    else
                    {
                        string[] f = result.Replace("\r", "").Replace("\t", "").Replace("<td>", "").Split('\n');

                        for (int i = 0; i < f.Length; i++)
                        {
                            if (f[i].ToUpper().Contains("SURNAME"))
                                pan.Surname = f[i + 1].Trim();

                            if (f[i].ToUpper().Contains("MIDDLE NAME"))
                                pan.MiddleName = f[i + 1].Trim();

                            if (f[i].ToUpper().Contains("FIRST NAME"))
                                pan.FirstName = f[i + 1].Trim();

                            if (f[i].ToUpper().Contains("AREA CODE"))
                                pan.AreaCode = f[i + 1].Trim();

                            if (f[i].ToUpper().Contains("AO TYPE"))
                                pan.AOType = f[i + 1].Trim();

                            if (f[i].ToUpper().Contains("RANGE CODE"))
                                pan.RangeCode = f[i + 1].Trim();

                            if (f[i].ToUpper().Contains("AO NUMBER"))
                                pan.AONumber = f[i + 1].Trim();

                            if (f[i].ToUpper().Contains("JURISDICTION"))
                                pan.Jurisdiction = f[i + 1].Trim();

                            if (f[i].ToUpper().Contains("BUILDING NAME"))
                                pan.BuildingName = f[i + 1].Trim();
                        }
                        Save(pan);
                    }
                }
                else
                {
                    pan.Surname = panver.Surname;
                    pan.FirstName = panver.FirstName;
                    pan.MiddleName = panver.MiddleName;
                    pan.AONumber = panver.AONumber;
                    pan.AOType = panver.AOType;
                    pan.AreaCode = panver.AreaCode;
                    pan.BuildingName = panver.BuildingName;
                    pan.Jurisdiction = panver.Jurisdiction;
                    
                }
            }
               
            catch (Exception ex)
            {
                pan.Error = "Some error occured! Please try again.." + ex.Message;
            }
            Response.Write(new JavaScriptSerializer().Serialize(pan));
            PanTransactionVerified pnv = PanTransactionVerified.GetByPAN(pan.Number);
        if(pnv!=null)
        {
            pnv.PANVerified = 1;
            pnv.Save();
        }
    }
    public void Save(PAN pan)
    {
        PanVerification panverified = PanVerification.GetByPan(pan.Number);
        if (panverified == null)
        {
            panverified = new PanVerification();
            panverified.ID = 0;
        }
        panverified.Pan = pan.Number;
        panverified.AONumber = pan.AONumber;
        panverified.AOType = pan.AOType;
        panverified.AreaCode = pan.AreaCode;
        panverified.BuildingName = pan.BuildingName;
        panverified.FirstName = pan.FirstName;
        panverified.Jurisdiction = pan.Jurisdiction;
        panverified.MiddleName = pan.MiddleName;
        panverified.Surname = pan.Surname;
        panverified.Save();


    }
    //Get / Post Request
    public string makeHTTPPostRequest(string strURL, StringBuilder sbData)
    {
        String strServerResponse = "";
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(strURL);
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

        CookieContainer objContainer = null;
        if (request.CookieContainer == null)
            objContainer = request.CookieContainer = new CookieContainer();
        string hostBase = "fincomindia.in";
        if (Request.Url.Host.ToLower().Contains("localhost"))
            hostBase = "localhost";
        foreach (string cookie in Request.Cookies)
            objContainer.Add(new Cookie(cookie.Trim(), Request.Cookies[cookie].Value.Trim(), "/", hostBase));

        request.CookieContainer = objContainer;

        request.CookieContainer.Add(Global._Response.Cookies);

        Stream dataStream = (Stream)null;
        if (!string.IsNullOrEmpty(Convert.ToString((object)sbData)))
        {
            dataStream = ((WebRequest)request).GetRequestStream();
            dataStream.Write(buffer, 0, buffer.Length);
            dataStream.Close();
        }
        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        dataStream = response.GetResponseStream();
        StreamReader reader = new StreamReader(dataStream);
        strServerResponse = reader.ReadToEnd();
        reader.Close();
        dataStream.Close();
        response.Close();
        return strServerResponse;
    }
}
