
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pan : System.Web.UI.Page
{
    string Data1 = "";
    private ThreadObject TO = new ThreadObject();
    string SearchType = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        SearchType = Request.RawUrl.Contains("tan") ? "tan" : "pan";
        Data1 = RouteData.Values["Data1"] != null ? RouteData.Values["Data1"].ToString() : "";
        switch (Data1)
        {
            //case "newpan":
            //    frme.Src = "https://tin.tin.nsdl.com/pan/form49A.html";
            //    frme.Attributes.Add("height", "1900");
            //    Title = "New PAN";
            //    break;
            //case "correction":
            //    frme.Src = "https://tin.tin.nsdl.com/pan/correction.html";
            //    frme.Attributes.Add("height", "2400");
            //    Title = "PAN Correction";
            //    break;
            case "new-for-nris":
                frme.Src = "https://tin.tin.nsdl.com/pan/form49AA.html";
                frme.Attributes.Add("height", "1900");
                Title = "New PAN for NRIs";
                break;
            case "correction-for-nris":
                frme.Src = "https://tin.tin.nsdl.com/pan/correction.html";
                frme.Attributes.Add("height", "2400");
                Title = "PAN correction for NRIs";
                break;
            case "status":
                divAbouPan.Visible = false;
                frme.Visible = false;
                divPanStatus.Visible = true;
                Title = SearchType.ToUpper() + " Status";
                pnlHeading.InnerText = "Track your " + SearchType.ToUpper() + " Application Status";
                if (SearchType == "tan")
                {
                    trName.Visible = false;
                    trDOB.Visible = false;
                    //ddSelect.Items.RemoveAt(0); ddSelect.Items.RemoveAt(1);
                    //ddSelect.Visible = false;
                    //lblAck.Visible = true;
                    trSearch.Visible = false;
                }
                break;
            case "aboutpan":
                divAbouPan.Visible = true;
                frme.Visible = false;
                Title = "About PAN";
                break;
            default:
                frme.Src = "https://tin.tin.nsdl.com/pan/form49A.html";
                break;
        }
    }



    protected void btnSumbit_Click(object sender, EventArgs e)
    {
        if (SearchType == "tan")
        {
            Build_TanRequest(TO, txtAcknowledge.Value);
        }
        else
        {
            if (ddSelect.Value == "A")
                Build_PanRequestAck(TO, txtAcknowledge.Value);
            else if (ddSelect.Value == "N")
                Build_PanRequestName(TO, txtLName.Value, txtFName.Value, txtMName.Value, ddDD.Value, ddMM.Value, txtYear.Value);
        }
        TO.BuildRequest();
        AddOnPreRenderCompleteAsync(new BeginEventHandler(BeginAsyncOperation), new EndEventHandler(EndAsyncOperation));
    }

    IAsyncResult BeginAsyncOperation(object sender, EventArgs e, AsyncCallback cb, object state)
    {
        IAsyncResult asyncResult = null;
        try
        {
            asyncResult = (IAsyncResult)TO.myRequest.BeginGetResponse(cb, state);
        }
        catch (WebException ex)
        {

            myAsyncResult a = new myAsyncResult();
            return a;
        }

        return asyncResult;
    }


    void EndAsyncOperation(IAsyncResult ar)
    {
        try
        {
            using (WebResponse response = TO.myRequest.EndGetResponse(ar))
            {
                using (StreamReader reader = new StreamReader(response.GetResponseStream()))
                {
                    TO.DataDownloaded = reader.ReadToEnd();
                }
            }

            TO.ProcessDataDownloaded();
            ShowPanStatus();
        }
        catch (Exception ex)
        {
            lblError.Attributes.Add("Style", "color:red");
            lblError.Text = TO.Error == "OK" ? "Please enter correct information" : TO.Error;
        }
    }

    void ShowPanStatus()
    {
        if (TO.Error == "OK")
        {
            Cmn.ProcessHTML(TO);
            //lblError.Text = TO.DataProcessed;
            string[] Lines = TO.DataProcessed.Split('\n');
            StringBuilder str = new StringBuilder("<table>");
            int count = 1;
            string text = Lines[6];
            foreach (string L in Lines)
            {
                if (count == 7) continue;
                else str.Append("<tr><th style='width:250px;'>" + L.Replace(",", "<td colspan='2'>"));
                count++;
            }
            str.Append("</table>");
            str.Append("<br/><p>" + text);
            lblError.Text = str.ToString();

        }
        else
        {
            lblError.Attributes.Add("Style", "color:red");
            lblError.Text = TO.Error == "Index was outside the bounds of array" ? "Please enter correct information" : TO.Error;
        }
    }

    public static void Build_PanRequestAck(ThreadObject TO, string ackNumber)
    {
        DateTime dt = TO.RunDate;
        TO.HtmlDataTables = new[] { "Acknowledgment Number" };
        TO.ResponsesInvalid = new[] { "Please enter valid 15 digit PAN acknowledgement number." };
        TO.ResponsesValid = null;
        TO.PostData = ("ST_SEARCH_TYPE=" + "P");
        TO.PostData += ("&ST_SEARCH_OPTION=" + "A");
        TO.PostData += ("&ST_ACK_NUM=" + ackNumber);
        TO.PostData += ("&ST_STATUS=" + "N");
        TO.PostData += ("&ST_ACK=" + "N");
        TO.PostData += ("&ST_NAME=" + "N");


        TO.RequestURL = @"https://tin.tin.nsdl.com/tan/servlet/PanStatusTrack";
        TO.Referer = @"https://tin.tin.nsdl.com";

        TO.TimeOut = 15000;

    }
    public static void Build_PanRequestName(ThreadObject TO, string LName = "", string FName = "", string MName = "", string dd = "", string mm = "", string yy = "")
    {
        DateTime dt = TO.RunDate;
        TO.HtmlDataTables = new[] { "Acknowledgment Number" };
        TO.ResponsesInvalid = new[] { "Please enter Date of Birth." };
        TO.ResponsesValid = null;
        TO.PostData = ("ST_SEARCH_TYPE=" + "P");
        TO.PostData += ("&ST_SEARCH_OPTION=" + "N");
        TO.PostData += ("&ST_LST_MN_NM=" + LName);
        TO.PostData += ("&ST_FST_MN_NM=" + FName);
        TO.PostData += ("&ST_MDL_MN_NM=" + MName);
        TO.PostData += ("&ST_DT_BRTH_DD=" + dd);
        TO.PostData += ("&ST_DT_BRTH_MM=" + mm);
        TO.PostData += ("&ST_DT_BRTH_YYYY=" + yy);
        TO.RequestURL = @"https://tin.tin.nsdl.com/tan/servlet/PanStatusTrack";
        TO.Referer = @"https://tin.tin.nsdl.com";
        TO.TimeOut = 15000;

    }
    public static void Build_TanRequest(ThreadObject TO, string ackNumber)
    {
        DateTime dt = TO.RunDate;
        TO.HtmlDataTables = new[] { "Acknowledgment Number" };
        TO.ResponsesInvalid = new[] { "Please enter valid 9 or 14 digit TAN acknowledgement number." };
        TO.ResponsesValid = null;
        TO.PostData = ("ST_SEARCH_TYPE=" + "T");
        TO.PostData += ("&ST_SEARCH_OPTION=" + "A");
        TO.PostData += ("&ST_ACK_NUM=" + ackNumber);
        TO.RequestURL = @"https://tin.tin.nsdl.com/tan/servlet/StatusTrack";
        TO.Referer = @"https://tin.tin.nsdl.com";

        TO.TimeOut = 15000;

    }
}