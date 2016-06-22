using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Text;
using System.Web.Script.Serialization;
using System.Web.UI.WebControls;
using TDSModel;

public partial class PanVerification : System.Web.UI.Page
{
    String strServerResponse = "";
    HttpWebRequest request = null;
    HttpWebResponse response = (HttpWebResponse)null;
    CookieContainer objContainer = null;
    StreamReader reader = (StreamReader)null;
    Stream dataStream = (Stream)null;

    protected void Page_Load(object sender, EventArgs e)
    {
        //base.Page_Load(sender, e);
        btnFile1.Attributes.Add("onclick", "$('#" + FileUpload1.ClientID + "').click();return false;");
        string Data1 = RouteData.Values["Data1"] != null ? RouteData.Values["Data1"].ToString() : "";

        Title = "PAN Verification";
        if (!IsPostBack)
        {
            CreateCapcha();
        }
        if (Data1 == "single")
        {
            divPanel.Visible = true;
            divVerify2.Visible = true;
            divPAN.Visible = true;
            divText.Visible = true;
            divText2.Visible = true;
            divVerify.Visible = false;
            divUpload.Visible = false;
            PriceList.Visible = false;
            PanelHeading.InnerText = "Verify Single PAN free";
        }
        else if (Data1 == "multiple")
        {
            divPanel.Visible = true;
            //divVerify.Visible = true;
            divUpload.Visible = true;
            divVerify2.Visible = false;
            divPAN.Visible = false;
            divText.Visible = true;
            divText2.Visible = true;
            PriceList.Visible = true;
            PanelHeading.InnerText = "Verify Multiple PAN's";
            aPan.InnerText = "Single PAN";
            aPan.HRef = "/pan-verification-single";
        }
        else if (Request.Form["productinfo"] == "panverification")
        {
            string result = TDSModel.hash.GetValues();
            //ltText.Text = result;
            PANTransactionUpdate();
            //Cmn.WriteClientScript(this, "var amount=" + Global.AMOUNT + ";var paid=" + (Global.PAID == true ? "1" : "0"));
            divUpload.Visible = false;
            divText.Visible = true;
            divText2.Visible = true;
            divVerify.Visible = true;
            //PriceList.Visible = false;

        }
        //ltSinglePan.Text = "<script>SinglePan=" + new JavaScriptSerializer().Serialize(new PAN()) + "</script>";
    }
    public void PANTransactionUpdate()
    {
        PanTransaction Pan = PanTransaction.GetByTransactionID(Request.Form["txnid"]);
        if (Pan != null)
        {
            Pan.Paid = Request.Form["status"] == "success" ? 1 : -1;
            Pan.MIHPAYID = Request.Form["mihpayid"];
            Pan.UserID = TDSModel.User.GetByEmailID(Request.Form["email"]).ID;
            Pan.Amount = Request.Form["amount"];
            Pan.Save();
        }
        if (Request.Form["status"] == "success")
        {
            List<PAN> panList = new List<PAN>();
            List<PanTransactionVerified> listPanVerify = PanTransactionVerified.GetByUserIDNotVerified(TDSModel.User.GetByEmailID(Request.Form["email"]).ID);
            foreach (PanTransactionVerified pnv in listPanVerify)
            {
                panList.Add(new PAN() { Number = pnv.PANNumber });
            }
            Cmn.WriteClientScript(this, "var PanList=" + new JavaScriptSerializer().Serialize(panList) + ";paid=" + "1");
        }
        string mailBody = "<p>Dear " + Request.Form["email"] + ", </P>" +
          "<p>We thank you for choosing our services.</p>" +
          "<p>This is to confirm that your payment is sucessfull.<p>" +
          "<br/><p>In case you have any query, kindly call us on <br/><a href='tel:01204322456'>(0120) 432-2456</a><br/><a href='tel:919650606247'>+91 9650606247</a><br/><a href='tel:918826693260'>+91 8826693260</a><br/><br/> or write us at <br/><a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p>" +
          "</b>" +
          "<br/><p>Thanking You<br/>Team Fin Com India</p>";
        Cmn.SendEmail("Payment Successful - [#" + Pan.TransactionID + "#], Fin Com India", Request.Form["email"], Request.Form["email"], Cmn.CreateMailStructure("Payment Sucessful", Request.Form["email"], mailBody));
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
            makeHTTPGetRequest("https://incometaxindiaefiling.gov.in/e-Filing/Services/KnowYourJurisdiction.html");
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
    protected void btnPay_Click(object sender, EventArgs e)
    {
        TDSModel.User u = TDSModel.User.GetByEmailID(txtEmailId.Text);
        if (u == null)
            TDSModel.User.CreateLogin(txtName.Text, txtEmailId.Text, txtMobile.Text);
        else
            TDSModel.User.LoginAlreadyExists(txtName.Text, txtEmailId.Text, txtMobile.Text);
        PayUMoneycontrol.CreatePostForPayment(null, txtAmount.Text, null,null,null, 0, txtName.Text, txtEmailId.Text, txtMobile.Text, "pan-verification-multiple");
        foreach (PAN pan in Global.PANSList)
        {
            PanTransactionVerified pnvrfy = new PanTransactionVerified();
            pnvrfy.ID = 0;
            pnvrfy.PANNumber = pan.Number;
            pnvrfy.UserID = u.ID;
            pnvrfy.PANVerified = 0;
            pnvrfy.Save();
        }
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        FileUpload fu = FileUpload1;
        if (fu.HasFile)
        {
            List<PAN> panList = new List<PAN>();
            StreamReader reader = new StreamReader(fu.FileContent);
            while (reader.Peek() != -1)
            {
                string textLine = reader.ReadLine();
                if (textLine.Length >= 0)
                    panList.Add(new PAN() { Number = textLine });

            }
            Global.PANSList = panList;
            divData.InnerHtml = new JavaScriptSerializer().Serialize(panList);
            Cmn.WriteClientScript(this, "var PanList=" + new JavaScriptSerializer().Serialize(panList));
            divText.Visible = true;
            divText2.Visible = true;
            divVerify.Visible = true;
            //if (panList.Count <= 50)
            //{
            //    divText.Visible = true;
            //    divText2.Visible = true;
            //    divVerify.Visible = true;
            //}
            //else
            //{
            //    divPay.Visible = true;
            //    divPrice.Visible = true;
            //    if (panList.Count > 50 && panList.Count <= 100)
            //        Price.InnerHtml = "As PAN's Count is greater than 50<br/> You have to pay Rs-100<br/>Please click Pay Now button to proceed";
            //    if (panList.Count > 100 && panList.Count <= 500)
            //        Price.InnerHtml = "As PAN's Count is greater than 100<br/> You have to pay Rs-250<br/>Please click Pay Now button to proceed"; 
            //    if (panList.Count > 500 && panList.Count <= 1000)
            //        Price.InnerHtml = "As PAN's Count is greater than 500<br/> You have to pay Rs-500<br/>Please click Pay Now button to proceed"; 
            //}
            reader.Close();

        }
    }
}