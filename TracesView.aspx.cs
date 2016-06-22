using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class TracesView : BasePage
{
    private string type = "";
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        type = QueryString("type");
        switch (type)
        {
            case "downloadrequestedfile":
                Title = "Download Requested Files";
                heading.InnerText = "Download Requested Files";
                break;
            case "statementstatus":
                Title = "Statement Status";
                heading.InnerText = "Statement Status";
                break;
            case "challanstatus":
                Title = "Challan Status";
                heading.InnerText = "Challan Status";
                break;
            case "tdstcscredit":
                Title = "TDS/TCS credit";
                heading.InnerText = "TDS/TCS Credit";
                break;
            case "validate197certificate":
                Title = "Validate 197 Certificate";
                heading.InnerText = "Validate 197 Certificate";
                break;
            case "tanpanfiles":
                Title = "TAN/PAN File";
                heading.InnerText = "TAN/PAN File";
                break;
            default:
                break;
        }

        if (!IsPostBack)
        {
            Global.objTraceConnect = null;
            CreateCapcha();

            if (Request.Url.ToString().Contains("localhost"))
            {
                txtTan.Text = "MRTR03328D";
                txtUserId.Text = "rra2011";
                txtPass.Text = "Dublin2008";
            }
        }
    }

    protected void lnkRefreshBurtton_Click(object sender, EventArgs e)
    {
        CreateCapcha();
    }

    private void CreateCapcha()
    {
        Stream t = Global.objTraceConnect.MakeInitialRequest();
        if (t != null)
        {
            byte[] t1 = ReadFully(t);
            imgCaptcha.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(t1);
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
    protected void btnRequest_Click(object sender, EventArgs e)
    {
        TracesLogin objLogin = new TracesLogin();
        TracesResponse tracesResponse = new TracesResponse();

        objLogin.TAN = txtTan.Text;
        objLogin.Password = txtPass.Text;
        objLogin.UserID = txtUserId.Text;
        objLogin.CaptchaCode = txtCapchaText.Text;

        tracesResponse = Global.objTraceConnect.makeLoginToTRACES(objLogin);

        if (tracesResponse.Respons == enmResponse.Success)
        {
            if (type == "downloadrequestedfile")
            {
                DataTable table;
                tracesResponse = Global.objTraceConnect.RequestForAllDownloadList(out table);
                StringBuilder sb = new StringBuilder("<table class='table table-condensed table-striped table-bordered'><tr><th>Request Date<th>Request Number<th>Finnancial Year<th>Quarter<th>Form Type<th>Request Date<th>File Processed<th>Status<th>Remarks<th>Download");
                foreach (DataRow row in table.Rows)
                {
                    sb.Append("<tr><td>" + row["Request Date"] + "<td>" + row["Request Number"] + "<td>" + row["Finnancial Number"] + "<td>" + row["Quarter"] + "<td>" + row["Form Type"] + "<td>" + row["Request Date"] + "<td>" + row["File Processed"] + "<td>" + row["Status"] + "<td>" + row["Remarks"] + "<td><a href='#' class='dwn' data-id='" + row["Request Number"] + "'>Download</a>");
                }
                sb.Append("</table>");
                lblRequestList.Text = sb.ToString();
            }
            else if (type == "statementstatus")
            {
                FillYearDropdown();
                divStatementStatus.Visible = true;
            }
            else if (type == "challanstatus")
            {
                divChallanStatus.Visible = true;
            }
            else if (type == "tdstcscredit")
            {
                divTdsTcs.Visible = true;
                FillYearDropdown(ddFYTdsTcs);
            }
            else if (type == "validate197certificate")
            {
                div197Cirtificate.Visible = true;
                FillYearDropdown(ddFY197);
            }
        }
        else
        {
            lblMsg.Text = tracesResponse.Message;
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }

    private void FillYearDropdown(DropDownList ddList)
    {
        for (int i = DateTime.Today.Year; i > DateTime.Today.Year - 6; i--)
        {
            if (i < 2013)
                break;
            ListItem li = new ListItem(i.ToString() + "-" + (i + 1).ToString().Substring(2), i.ToString());
            ddList.Items.Add(li);
            if (i == DateTime.Today.Year)
                li.Selected = true;
        }
    }

    protected void btnDownload_Click(object sender, EventArgs e)
    {
        string requstNo = txtRefID.Text;
        Global.objTraceConnect.RequestForDownloadFile(requstNo, "");
    }
    void FillYearDropdown()
    {
        for (int i = DateTime.Today.Year; i > DateTime.Today.Year - 6; i--)
        {
            if (i < 2013)
                break;
            ListItem li = new ListItem(i.ToString() + "-" + (i + 1).ToString().Substring(2), i.ToString());
            ddFinancialYear.Items.Add(li);
            if (i == DateTime.Today.Year)
                li.Selected = true;
        }
    }
    protected void btnStatementStatus_Click(object sender, EventArgs e)
    {
        TracesResponse tracesResponse2 = new TracesResponse();
        TracesData objTraceData = new TracesData();
        objTraceData.FAYear = ddFinancialYear.SelectedValue;
        objTraceData.Quarter = ddQuarter.SelectedValue;
        objTraceData.Forms = ((RegularReturnType)(Cmn.ToInt(ddForm.SelectedValue))).ToString().Replace("_", "");
        DataTable table;
        tracesResponse2 = Global.objTraceConnect.RequestForStatusofStatementFile(objTraceData, out table);
        if (tracesResponse2.Respons == enmResponse.Success)
        {
            StringBuilder sb = new StringBuilder("<table class='table table-condensed table-striped table-bordered'><tr><th>Token Number<th>Finnancial Year<th>Statement Type<th>Form Type<th>Quarter<th>Date of Filing<th>Date of Processing<th>Status");
            foreach (DataRow row in table.Rows)
            {
                sb.Append("<tr><td>" + row["Token Number"] + "<td>" + row["Finnancial Year"] + "<td>" + row["Statement Type"] + "<td>" + row["Form Type"] + "<td>" + row["Quarter"] + "<td>" + row["Date of Filling"] + "<td>" + row["Date of Processing"] + "<td>" + row["Status"] + "");
            }
            sb.Append("</table>");
            lblStatementStatus.Text = sb.ToString();
        }
    }
    protected void btnGo_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        if (btn.ID == "btnGoOption1")
        {
            TracesResponse tracesResponse3 = new TracesResponse();
            TracesData objTraceData = new TracesData();
            objTraceData.FromChallanDepositDate = Cmn.ToDate(txtDepositFromDate.Text).ToString("dd-MMM-yyyy");
            objTraceData.ToChallanDepositDate = Cmn.ToDate(txtDepositToDate.Text).ToString("dd-MMM-yyyy");
            objTraceData.ChallanStatus = ddChallanStatus.SelectedValue;

            tracesResponse3 = Global.objTraceConnect.RequestForChallanStatusQuery1(objTraceData);
            if (tracesResponse3.Respons == enmResponse.Success)
            {
                DataTable table = (DataTable)(tracesResponse3.CustomeTypes);
                StringBuilder sb = new StringBuilder("<table class='challanDetail table table-condensed table-striped table-bordered'><tr><th>Date of Deposit<th>Challan Serial Number<th>Challan Status<th>chllan Amount<th>Recipt Number<th><th>");
                int ctr = 0;
                foreach (DataRow row in table.Rows)
                {
                    sb.Append("<tr id='tr" + ++ctr + "'><td id='DOD" + ctr + "'>" + row["Date of Deposit"] + "<td id='ChlSNo" + ctr + "'>" + row["Challan Serial Number"] + "<td>" + row["Challan Status"] + "<td id='ChlAmount" + ctr + "'>" + row["chllan Amount"] + "<td id='ReceiptNo" + ctr + "'>" + row["Recipt Number"] + "<td><a href='#' class='dwnloadCusumptionDetail' data-id='" + ctr + "'>View</a><td>");
                }
                sb.Append("</table>");
                lblChallanDetail.Text = sb.ToString();
            }
        }
        else if (btn.ID == "btnGoOption2")
        {
            TracesResponse tracesResponse = new TracesResponse();
            TracesData objTraceData = new TracesData();
            objTraceData.BSRCode = txtBSR.Text;
            objTraceData.ChallanSerialNo = txtChallanNo.Text;
            objTraceData.ChallanAmount = txtChallanAmmount.Text;
            objTraceData.TaxDepositedDate = txtDateOfDeposit.Text;

            tracesResponse = Global.objTraceConnect.RequestForChallanStatusQuery2(objTraceData);
            if (tracesResponse.Respons == enmResponse.Success)
            {
                DataTable table = (DataTable)(tracesResponse.CustomeTypes);
                StringBuilder sb = new StringBuilder("<table class='challanDetail table table-condensed table-striped table-bordered'><tr><th>Bank Code<th>Branch Code<th>Date of Deposit<th>Challan Serial Number<th>Challan Status<th>chllan Amount<th>Recipt Number<th><th>");
                foreach (DataRow row in table.Rows)
                {
                    sb.Append("<tr><td>" + row["Bank Code"] + "<td>" + row["Branch Code"] + "<td>" + row["Date of Deposit"] + "<td>" + row["Challan Serial Number"] + "<td>" + row["Challan Status"] + "<td>" + row["chllan Amount"] + "<td>" + row["Recipt Number"] + "<td><td>");
                }
                sb.Append("</table>");
                lblChallanDetail.Text = sb.ToString();
            }
        }
        else if (btn.ID == "btnTdsTcsGO")
        {
            TracesResponse tracesResponse = new TracesResponse();
            TracesData objTraceData = new TracesData();
            objTraceData.PAN1 = txtPanTdsTcs.Text; ;
            objTraceData.FAYear = ddFYTdsTcs.Text;
            objTraceData.Quarter = "6";//ddQuarterTdsTcs.SelectedValue;
            objTraceData.Forms = ((RegularReturnType)(Cmn.ToInt(ddFormTdsTcs.SelectedValue))).ToString().Replace("_", "");
            tracesResponse = Global.objTraceConnect.RequestForDeductionDetailsForDeductee(objTraceData);
            StringBuilder sb = new StringBuilder("");
            if (tracesResponse.Respons == enmResponse.Success)
            {
                ArrayList AL = (ArrayList)(tracesResponse.CustomeTypes);
                if (AL.Count > 0)
                {
                    Deductor deductor = (Deductor)AL[0];
                    sb.Append("<table class='table table-condensed table-striped table-bordered'><th colspan='6'>Statement Details");
                    sb.Append("<tr><td>TAN<td>" + deductor.TAN + "<td>Assessment Year<td>" + deductor.AssessmentYear + "<td>Token No of Regular Statement<td>" + deductor.RegularStatement + "");
                    sb.Append("<tr><td>Form Type<td>" + deductor.FormType + "<td>Quarter<td>" + deductor.Quarter + "<td>Token No of Latest Correction Statement<td>" + deductor.CorrectionStatement + "");
                    sb.Append("</table>");

                    DataTable table = (DataTable)AL[1];
                    sb.Append("<table class='table table-condensed table-striped table-bordered'><th colspan='6'>Deductee Details");
                    sb.Append("<tr><td>PAN<td>" + deductor.DeducteePAN + "<td>Name of Deductee<td>" + deductor.Deductee + "<td><td>");
                    sb.Append("<tr><td colspan='6'>");
                    sb.Append("<table class='table table-condensed table-striped table-bordered'>");
                    sb.Append("<tr><th>Deductee Detail<th>Section Code<th>Rate of<th>Transaction<th>Date of<th>Tax Deducted<th>Date of<th>Tax Deposited<th>Staus of");
                    foreach (DataRow row in table.Rows)
                    {
                        sb.Append("<tr><td>" + row["Deductee Detail Record Number"] + "<td>" + row["Section Code"] + "<td>" + row["Rate of Deduction (%)"] + "<td>" + row["Transaction Amount"] + "<td>" + row["Date of Transaction"] + "<td>" + row["Tax Deducted / Collected"] + "<td>" + row["Date of Deduction"] + "<td>" + row["Tax Deposited"] + "<td>" + row["Status of Booking"] + "");
                    }
                    sb.Append("</table>");
                    sb.Append("</table>");
                    lblStatementDetail.Text = sb.ToString();
                }
            }
        }
        else if (btn.ID == "btn197Go")
        {
            TracesResponse tracesResponse = new TracesResponse();
            Certificate197Data obj197Data = new Certificate197Data();
            obj197Data.CertificateNo = txtertificateNo.Text;
            obj197Data.PAN = txtPan.Text;
            obj197Data.FinYear = ddFY197.SelectedValue;
            tracesResponse = Global.objTraceConnect.RequestForCertificate197(obj197Data);

            if (tracesResponse.Respons == enmResponse.Success)
            {
            }
        }
    }

    protected void btnDownloadCunsuption_Click(object sender, EventArgs e)
    {
        TracesResponse tracesResponse = new TracesResponse();
        TracesData objTraceData = new TracesData();
        objTraceData.PRN_NO = txtReceiptNo.Text;
        objTraceData.ChallanSerialNo = txtChalNo.Text;
        objTraceData.ChallanAmount = txtChalAmount.Text;
        objTraceData.FromChallanDepositDate = txtDOD.Text;
        TRN_CHALLAN ch = TRN_CHALLAN.GetByChallanNo(txtChallanNo.Text);
        objTraceData.BSRCode = "6390340"; //ch.BSRNo;
        tracesResponse = Global.objTraceConnect.RequestForConsumptionDetails(objTraceData);
        if (tracesResponse.Respons == enmResponse.Success)
        {
            DataTable table = (DataTable)(tracesResponse.CustomeTypes);
            StringBuilder sb = new StringBuilder("<table class='cosumptionDetail table table-condensed table-striped table-borderd'><tr><th>Token Number<th>Finnancial Year<th>Quarter<th>Form Type<th>Claimed Amount<th>Challan Status<th>Excess Amount Claimed");
            foreach (DataRow row in table.Rows)
            {
                sb.Append("<tr><td>" + row["Token Number"] + "<td>" + row["Finnancial Year"] + "<td>" + row["Quarter"] + "<td>" + row["Form Type"] + "<td>" + row["Claimed Amount"] + "<td>" + row["Challan Status"] + "<td>" + row["Excess Amount Claimed"] + "");
            }
            sb.Append("</table>");
            lblConsumptionDetail.Text = sb.ToString();
        }
    }
}