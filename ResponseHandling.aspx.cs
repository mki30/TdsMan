using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Security.Cryptography;
using System.Text;
using TDSModel;

public partial class ResponseHandling : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string type = Request.Form["productinfo"];
        GetValues();
        switch (type)
        {
            case "dsc": DscUpdate(); break;
            case "incorporate": IncorporateUpdate(); break;
            case "lisence": LISENCEUPDATE(); break;
            case "pan": PANUpdate(); break;
            case "tan": TANUpdate(); break;
            default: showMessage(); break;
        }
    }

    public void showMessage()
    {
        ltText.Text = "<h1 style='text-align:center;'> Transaction failed </h1><br/>";
    }
    public void GetValues()
    {
        string merc_hash_string = (Request.Url.ToString().Contains("localhost") ? ConfigurationManager.AppSettings["SALT_Local"] : ConfigurationManager.AppSettings["SALT"]) + "|" + Request.Form["status"];
        string[] merc_hash_vars_seq = ConfigurationManager.AppSettings["hashSequence"].Split('|'); Array.Reverse(merc_hash_vars_seq);
        foreach (string merc_hash_var in merc_hash_vars_seq)
        {
            merc_hash_string += "|";
            merc_hash_string = merc_hash_string + (Request.Form[merc_hash_var] != null ? Request.Form[merc_hash_var] : "");
        }
        string merc_hash = Generatehash512(merc_hash_string).ToLower();
        if (merc_hash != Request.Form["hash"])
            ltText.Text = "<h1 style='text-align:center;color:red;'> Transaction failed </h1><br/>";
        else
            ltText.Text = "<h1 style='text-align:center;color:green;'> Thank you</h1><br/><h4 style='text-align:center;color:green;'>Your Transaction ID is " + Request.Form["txnid"] + ". Payment of Rs." + Convert.ToDecimal(Request.Form["amount"]).ToString("g29") + " is done sucessfully." + "</h4>" + "<br/>" + "<br/>" + "<br/>";
    }
    public void LISENCEUPDATE()
    {
        Payment p = Payment.GetByTransactionID(Request.Form["txnid"]);
        if (p != null)
        {
            p.TransactionType = Request.Form["status"] == "success" ? 1 : -1;
            p.Amount = Cmn.ToInt(Request.Form["amount"]);
            p.MIHPAYID = Request.Form["mihpayid"];
            p.Save();
            EmailControl.EmailInit("incorporate", "tc", p.ID, true);
        }
    }
    public void DscUpdate()
    {
        DscDetail DT = DscDetail.GetByTransactionID(Request.Form["txnid"]);
        if (DT != null)
        {
            DT.Paid = Request.Form["status"] == "success" ? 1 : -1;
            DT.MIHPAYID = Request.Form["mihpayid"];
            DT.Save();
            EmailControl.EmailInit("dsc", "tc", DT.ID, true);
        }

    }
    public void PANUpdate()
    {
        PanDetail pan = PanDetail.GetByTransactionID(Request.Form["txnid"]);
        if (pan != null)
        {
            pan.Paid = Request.Form["status"] == "success" ? 1 : -1;
            pan.MIHPayID= Request.Form["mihpayid"];
            pan.Save();
            EmailControl.EmailInit("pan", "tc", pan.ID, true);
        }

    }
    public void TANUpdate()
    {
        TanDetail TAN = TanDetail.GetByTransactionID(Request.Form["txnid"]);
        if (TAN != null)
        {
            TAN.Paid = Request.Form["status"] == "success" ? 1 : -1;
            TAN.MIHPayID = Request.Form["mihpayid"];
            TAN.Save();
            EmailControl.EmailInit("pan", "tc", TAN.ID, true);
        }

    }
    public void IncorporateUpdate()
    {
        Contact C = Contact.GetByTransactionID(Request.Form["txnid"]);
        if (C != null)
        {
            C.Paid = Request.Form["status"] == "success" ? 1 : -1;
            C.MIHPAYID = Request.Form["mihpayid"];
            C.Save();
            EmailControl.EmailInit("incorporate", "tc", C.ID, true);
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




}
