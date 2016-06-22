using System;
using System.Collections.Generic;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class Controls_PayUMoneycontrol : System.Web.UI.UserControl
{

    public string ResponseURL = "";

    public void CreatePostForPayment(DscDetail DT, string amt, Contact C = null, PanDetail pan = null, TanDetail tan = null, int LisenceID = 0, string CustomerName = "", string CustomerEmail = "", string CustomerPhone = "", string ResponseHandlerPage = "ResponseHandling.aspx")
    {
        Boolean IsLocal = Request.Url.ToString().Contains("localhost");
        ResponseHandlerPage = (IsLocal ? "http://localhost:50033/" : "http://fincomindia.in/") + ResponseHandlerPage;

        try
        {
            Dictionary<string, string> data = new Dictionary<string, string>(); // adding values in gash table for data post
            string txnid1 = Generatehash512(new Random().ToString() + DateTime.Now).ToString().Substring(0, 20);
            if (DT != null)
            {
                DT.TransactionID = txnid1;
                DT.Save();
            }
            if (C != null)
            {
                C.TransactionID = txnid1;
                C.Save();
            }
            License l = null;
            if (DT == null && C == null)
            {
                l = License.GetByID(LisenceID);
                if (l != null)
                {
                    Payment p = Payment.GetByID(l.ID);
                    p.TransactionID = txnid1;
                    p.Save();
                }
                else
                {
                    if (pan != null)
                    {
                        pan.TransactioId = txnid1;
                        pan.Save();
                    }
                    else if (tan != null)
                    {
                        tan.TransactionId = txnid1;
                        tan.Save();
                    }
                    else
                    {
                        PanTransaction pn = new PanTransaction();
                        pn.ID = 0;
                        pn.TransactionID = txnid1;
                        pn.Save();
                    }
                }
            }
            string firstName = CustomerName == "" ? C == null ? DT == null ? pan == null ? tan == null ? l.Name : tan.Name1 : pan.FirstName : DT.ApplicantName : C.Name : CustomerName;
            string eMail = CustomerEmail == "" ? C == null ? DT == null ? pan == null ? tan == null ? l.Email : tan.EmailId : pan.EmailId : DT.Email : C.Email : CustomerEmail;
            string Phn = CustomerPhone == "" ? C == null ? DT == null ? pan == null ? tan == null ? l.Phone : tan.MobileNumber : pan.PhoneNo : DT.MobileNo : C.ContactNo : CustomerPhone;
            string product = CustomerName == "" ? C == null ? DT == null ? pan == null ? tan == null ? "lisence" : "tan" : "pan" : "dsc" : "incorporate" : "panverification";
            data.Add("txnid", txnid1);
            //data.Add("key", ConfigurationManager.AppSettings["MERCHANT_KEY_TEMP"]);
            data.Add("key", IsLocal ? ConfigurationManager.AppSettings["MERCHANT_KEY_Local"] : ConfigurationManager.AppSettings["MERCHANT_KEY"]);
            string AmountForm = Convert.ToDecimal(amt).ToString("g29");// eliminating trailing zeros
            data.Add("amount", AmountForm.Replace(",", ""));
            data.Add("firstname", firstName);
            data.Add("email", eMail);
            data.Add("phone", Phn);
            data.Add("productinfo", product);
            data.Add("surl", ResponseHandlerPage);
            data.Add("furl", ResponseHandlerPage);
            data.Add("lastname", lastname.Text.Trim());
            data.Add("curl", curl.Text.Trim());
            data.Add("address1", address1.Text.Trim());
            data.Add("address2", address2.Text.Trim());
            data.Add("city", city.Text.Trim());
            data.Add("state", state.Text.Trim());
            data.Add("country", country.Text.Trim());
            data.Add("zipcode", zipcode.Text.Trim());
            data.Add("udf1", udf1.Text.Trim());
            data.Add("udf2", udf2.Text.Trim());
            data.Add("udf3", udf3.Text.Trim());
            data.Add("udf4", udf4.Text.Trim());
            data.Add("udf5", udf5.Text.Trim());
            data.Add("pg", pg.Text.Trim());
            data.Add("service_provider", service_provider.Text.Trim());
            string[] hashVarsSeq = ConfigurationManager.AppSettings["hashSequence"].Split('|'); // spliting hash sequence from config
            string hash_string = "";
            foreach (string hash_var in hashVarsSeq)
            {
                hash_string += (data.ContainsKey(hash_var) ? data[hash_var].ToString() : "") + '|';
            }

            //hash_string += ConfigurationManager.AppSettings["SALT_TEMP"];// appending SALT
            hash_string += IsLocal ? ConfigurationManager.AppSettings["SALT_Local"] : ConfigurationManager.AppSettings["SALT"];// appending SALT

            string hash1 = Generatehash512(hash_string).ToLower();         //generating hash
            data.Add("hash", hash1);

            //string action1 = ConfigurationManager.AppSettings["PAYU_BASE_URL_TEMP"];
            string action1 = IsLocal ? ConfigurationManager.AppSettings["PAYU_BASE_URL_Local"] : ConfigurationManager.AppSettings["PAYU_BASE_URL"];
            string strForm = PreparePOSTForm(action1, data);
            Page.Controls.Add(new LiteralControl(strForm));

        }

        catch (Exception ex)
        {
            Response.Write("<span style='color:red'>" + ex.Message + "</span>");

        }
    }
    public string Generatehash512(string text)
    {

        byte[] message = Encoding.UTF8.GetBytes(text);

        UnicodeEncoding UE = new UnicodeEncoding();
        byte[] hashValue;
        SHA512Managed hashString = new SHA512Managed();
        string hex = "";
        hashValue = hashString.ComputeHash(message);
        foreach (byte x in hashValue)
        {
            hex += String.Format("{0:x2}", x);
        }
        return hex;

    }


    public void SetValues(DscDetail DT)
    {
        amount.Text = "500";
        firstname.Text = DT.ApplicantName;
        phone.Text = DT.MobileNo;
        surl.Text = "http://localhost:50033//ResponseHandling.aspx";
        furl.Text = "http://localhost:50033//ResponseHandling.aspx";
        email.Text = DT.Email;
        productinfo.Text = "dsc";
    }


    string GetControlValue(string id)
    {
        var tmp = FindControl(id);
        if (tmp == null)
            return "";

        TextBox txt = (TextBox)tmp;
        return txt.Text;
    }

    private string PreparePOSTForm(string url, Dictionary<string, string> data)      // post form
    {
        //Set a name for the form
        string formID = "PostForm";
        //Build the form using the specified data to be posted.
        StringBuilder strForm = new StringBuilder();
        strForm.Append("<form id=\"" + formID + "\" name=\"" +
                       formID + "\" action=\"" + url +
                       "\" method=\"POST\">");

        foreach (KeyValuePair<string, string> key in data)
        {

            strForm.Append("<input type=\"hidden\" name=\"" + key.Key +
                           "\" value=\"" + key.Value + "\">");
        }


        strForm.Append("</form>");
        //Build the JavaScript which will do the Posting operation.
        StringBuilder strScript = new StringBuilder();
        strScript.Append("<script language='javascript'>");
        strScript.Append("var v" + formID + " = document." +
                         formID + ";");
        strScript.Append("v" + formID + ".submit();");
        strScript.Append("</script>");
        //Return the form and the script concatenated.
        //(The order is important, Form then JavaScript)
        return strForm.ToString() + strScript.ToString();
    }


}