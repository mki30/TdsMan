
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for hash
/// </summary>


namespace TDSModel
{
    public partial class hash
    {
        public string Message = "";

        public hash()
        {
        }
        public static string GetValues()
        {
            string result="";
            string merc_hash_string = (HttpContext.Current.Request.Url.ToString().Contains("localhost") ? ConfigurationManager.AppSettings["SALT_Local"] : ConfigurationManager.AppSettings["SALT"]) + "|" + HttpContext.Current.Request.Form["status"];
            string[] merc_hash_vars_seq = ConfigurationManager.AppSettings["hashSequence"].Split('|'); Array.Reverse(merc_hash_vars_seq);
            foreach (string merc_hash_var in merc_hash_vars_seq)
            {
                merc_hash_string += "|";
                merc_hash_string = merc_hash_string + (HttpContext.Current.Request.Form[merc_hash_var] != null ? HttpContext.Current.Request.Form[merc_hash_var] : "");
            }
            string merc_hash = Generatehash512(merc_hash_string).ToLower();
            if (merc_hash != HttpContext.Current.Request.Form["hash"])
                result += "<h1 style='text-align:center;color:red;'> Transaction failed </h1><br/>";
            else
                result += "<h1 style='text-align:center;color:green;'> Thank you</h1><br/><h4 style='text-align:center;color:green;'>Your Transaction ID is " + HttpContext.Current.Request.Form["txnid"] + ". Payment of Rs." + Convert.ToDecimal(HttpContext.Current.Request.Form["amount"]).ToString("g29") + " is done sucessfully." + "</h4>" + "<br/>" + "<br/>" + "<br/>";
            return result;
            //if (merc_hash != HttpContext.Current.Request.Form["hash"])
            //    ltText.Text = "<h1 style='text-align:center;color:red;'> Transaction failed </h1><br/>";
            //else
            //    ltText.Text = "<h1 style='text-align:center;color:green;'> Thank you</h1><br/><h4 style='text-align:center;color:green;'>Your Transaction ID is " + HttpContext.Current.Request.Form["txnid"] + ". Payment of Rs." + Convert.ToDecimal(HttpContext.Current.Request.Form["amount"]).ToString("g29") + " is done sucessfully." + "</h4>" + "<br/>" + "<br/>" + "<br/>";
        }
        public static string Generatehash512(string text)
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
}