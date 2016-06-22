using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Collections.Specialized;

public partial class TanVerification : System.Web.UI.Page
{
    String strServerResponse = "";
    HttpWebRequest request = null;
    HttpWebResponse response = (HttpWebResponse)null;
    CookieContainer objContainer = null;
    StreamReader reader = (StreamReader)null;
    Stream dataStream = (Stream)null;

    protected void Page_Load(object sender, EventArgs e)
    {
        Title = "PAN Verification";
        if (!IsPostBack)
        {
            FillStateDropDown();
            CreateCapcha();
        }
    }
    
    private void CreateCapcha()
    {
        Stream t = GetCaptchaForPANVerify();
        if (t != null)
        {
            byte[] t1 = ReadFully(t);
            imgCaptcha.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(t1);
        }
    }

    //For Captcha
    public Stream GetCaptchaForPANVerify()
    {   
        try
        {
            makeHTTPGetRequest("https://incometaxindiaefiling.gov.in/e-Filing/Services/KnowYourTanLink.html");
            request = (HttpWebRequest)WebRequest.Create("https://incometaxindiaefiling.gov.in/e-Filing/CreateCaptcha.do");
            request.Method = "GET";
            request.Accept = "image/png,image/*;q=0.8,*/*;q=0.5";
            request.UserAgent = "Mozilla/5.0 (Windows NT 6.1; rv:15.0) Gecko/20100101 Firefox/15.0";
            request.ContentType = "text/html; charset=utf-8";
            request.KeepAlive = true;
            request.CookieContainer = objContainer;
            if (response.Cookies != null && response.Cookies.Count > 0)
                objContainer.Add(response.Cookies);
            foreach (Cookie cookie in response.Cookies)
                objContainer.Add(new Cookie(cookie.Name.Trim(), cookie.Value.Trim(), "/", cookie.Domain));
            for (int index = 0; index < objContainer.GetCookies(request.RequestUri).Count; ++index)
            {
                Cookie cookie = objContainer.GetCookies(request.RequestUri)[index];
            }
            return request.GetResponse().GetResponseStream();
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Some error occured!" + ex.Message;
            return null;
        }
    }

    public static byte[] ReadFully(Stream input)
    {
        byte[] buffer = new byte[16 * 1024];
        using (MemoryStream ms = new MemoryStream())
        {
            int read;
            while ((read = input.Read(buffer, 0, buffer.Length)) > 0)
            {
                ms.Write(buffer, 0, read);
            }
            return ms.ToArray();
        }
    }

    //Get Pan Details
    void GetPANData()
    {
        //"<div class='panel panel-primary'><div class='panel-heading'>Tan Detail</div><div class'panel-body'>"
        StringBuilder str = new StringBuilder();
        try
        {
            StringBuilder sbData = new StringBuilder();
            sbData.Append("requestId=");
            sbData.Append("&tanCategory=" + ddTanCategory.SelectedValue + "");  //CRWPK1976L
            sbData.Append("&tanState=" + ddState.SelectedValue + "&searchOption=tan&tanName=&tanNo=" + txtTan.Text + "&captchaCode=" + txtCapchaText.Text + "");
            string result = makeHTTPPostRequest("https://incometaxindiaefiling.gov.in/e-Filing/Services/KnowYourTan.html", sbData);
            //divData.InnerHtml = result;

            if (result.Contains("Invalid Code. Please enter the number as appearing in the Image"))
            {
                divData.InnerHtml = "<span style='color:red;'>Invalid capcha! please try again</span>";
                return;
            }
            else if (result.Contains("No record found"))
            {
                divData.InnerHtml = "No record found";
                return;
            }

            else if (result.Contains("//div[@class=\"error\"]"))
            {
                divData.InnerHtml = "Some Error occured";
                return;
            }
            
            string[] f = result.Replace("\r", "").Replace("\t", "").Split('\n');
            string Tan = "", Catagory = "", Name = "", Address = "", Pan = "", Status = "", EmailId1 = "", EmailId2 = "", TanAOCode = "", AreaCode = "", AOType = "", RangeCode = "", AONumber = "";
            for (int i = 0; i < f.Length; i++)
            {
                if (f[i].Contains("<th>TAN</th>"))
                    Tan = f[i + 1];
                if (f[i].Contains("<th>Category of Deductor</th>"))
                    Catagory = f[i + 1];
                if (f[i].Contains("<th>Name</th>"))
                    Name = f[i + 1];
                if (f[i].Contains("<th>Address</th>"))
                    Address = f[i + 1] + f[i + 2] + f[i + 3];
                if (f[i].Contains("<th>PAN</th>"))
                    Pan = f[i + 1];
                if (f[i].Contains("<th>STATUS</th>"))
                    Status = f[i + 2];
                if (f[i].Contains("<th>E-Mail ID1</th>"))
                    EmailId1 = f[i + 1];
                if (f[i].Contains("<th>E-Mail ID2</th>"))
                    EmailId2 = f[i + 1];
                if (f[i].Contains("<th>TAN AO Code</th"))
                    TanAOCode = f[i + 1];
                if (f[i].Contains("<th>Area Code</th>"))
                    AreaCode = f[i + 1];
                if (f[i].Contains("<th>AO Type</th>"))
                    AOType = f[i + 1];
                if (f[i].Contains("<th>Range Code</th>"))
                    RangeCode = f[i + 1];
                if (f[i].Contains("<th>AO Number</th>"))
                    AONumber = f[i + 1];
            }

            str.Append("<table class='table table-bordered table-condensed' style='width:100%;'><tr><th colspan='2'>Tan Details<tr><td>TAN" + Tan
                + "<tr><td>Category of Deductor" + Catagory
                + "<tr><td>Name" + Name
                + "<tr><td>Address" + Address
                + "<tr><td>PAN" + Pan
                + "<tr><td>Status" + Status
                + "<tr><td>Email ID1" + EmailId1
                + "<tr><td>Email ID2" + EmailId2
                + "<tr><td>TAN AO Code" + TanAOCode
                + "<tr><td>Area Code" + AreaCode
                + "<tr><td>AO Type" + AOType
                + "<tr><td>Range Code" + RangeCode
                + "<tr><td>AO Number" + AONumber + "</table>");
            divData.InnerHtml = str.ToString();
        }
        catch (Exception ex)
        {
            divData.InnerHtml = "Some error occured! Please try again.." + ex.Message;
        }
    }

    protected void btnGetData_Click(object sender, EventArgs e)
    {
        GetPANData();
    }

    //Get / Post Request
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
    
    private string makeHTTPGetRequest(string strURL)
    {
        request = (HttpWebRequest)WebRequest.Create(strURL);

        request = (HttpWebRequest)WebRequest.Create(strURL);
        request.KeepAlive = false;
        request.Method = "GET";
        request.UserAgent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.57 Safari/537.17";
        request.Accept = "text/html";
        request.Timeout = 1000000000;

        if (request.CookieContainer == null)
            objContainer = request.CookieContainer = new CookieContainer();

        Global._Response = response = (HttpWebResponse)request.GetResponse();
        request.CookieContainer.Add(response.Cookies);
        dataStream = response.GetResponseStream();
        reader = new StreamReader(dataStream);
        strServerResponse = reader.ReadToEnd();
        reader.Close();
        dataStream.Close();
        response.Close();
        return strServerResponse;
    }
    protected void lnkRefreshBurtton_Click(object sender, EventArgs e)
    {
        CreateCapcha();
    }

    private void FillStateDropDown()
    {
        ddState.Items.Add(new ListItem("--Select--", ""));
        foreach (KeyValuePair<int, string> kvp in Global.State)
        {
            ddState.Items.Add(new ListItem(kvp.Value, (kvp.Key.ToString())));
        }
    }
}