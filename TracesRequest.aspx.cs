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
using System.Web.UI.WebControls;
using TDSModel;

public partial class TdsReqest : BasePage
{
    private string type = "";
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        type = QueryString("type");

        switch (type)
        {
            case "tdsfile":
                Title = "TDS file";
                heading.InnerText = "TDS File";
                break;
            case "form16-a":
                Title = "Form-16A";
                heading.InnerText = "Form 16A";
                break;
            case "form16-part-a":
                Title = "Form 16 Part-A";
                heading.InnerText = "Form 16 Part-A";
                break;
            case "form27d":
                Title = "Form 27D";
                heading.InnerText = "Form 27D";
                break;
            case "default-justification":
                Title = "Defaults/Justification Report";
                heading.InnerText = "Defaults/Justification Report";
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
            FillYearDropdown();
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

    void FillYearDropdown()
    {
        for (int i = DateTime.Today.Year; i > DateTime.Today.Year - 6; i--)
        {
            if (i < 2014)
                break;
            ListItem li = new ListItem(i.ToString() + "-" + (i + 1).ToString().Substring(2), i.ToString());
            ddFinancialYear.Items.Add(li);
            if (i == DateTime.Today.Year)
                li.Selected = true;
        }
    }

    protected void ddQuarter_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetReturnFirstChallanInfo();
    }

    private void GetReturnFirstChallanInfo()
    {
        MST_COMPANY C = MST_COMPANY.GetByTanNo(txtTan.Text);

        if (C != null)
        {
            List<TRN_BASIC_INFO> RR = TRN_BASIC_INFO.GetByFormYearQuarterCompany(ddForm.SelectedValue, Cmn.ToInt(ddFinancialYear.SelectedValue), ddQuarter.SelectedValue, C.COMPANY_ID);
            if (RR.Count > 0)
            {
                TRN_CHALLAN Chl = TRN_CHALLAN.GetFirstChallan(RR[0].BASIC_INFO_ID);
                if (Chl != null)
                {
                    txtChallanNo.Text = Chl.CHALLAN_NO;
                    txtBSRCode.Text = Chl.BSR_CODE;
                    txtDOD.Text = Cmn.ToDate(Chl.DEPOSIT_DATE).ToString("dd-MMM-yyyy");
                    txtDeposit.Text = Chl.TDS.ToString();
                    txtProvRecNo.Text = RR[0].RECEIPT_NO;
                    GetFirstThreeDeducteeRecords(Chl.CHALLAN_ID);
                }
            }
        }
    }

    private void GetFirstThreeDeducteeRecords(int chlnId)
    {
        List<TRN_DEDUCTEE_DETAILS> cdl = TRN_DEDUCTEE_DETAILS.GetByChallanID(chlnId);
        txtPanDeductee1.Text = "";
        txtTdsDeductee1.Text = "";
        txtPanDeductee2.Text = "";
        txtTdsDeductee2.Text = "";
        txtPanDeductee3.Text = "";
        txtTdsDeductee3.Text = "";

        if (cdl.Count > 0)
        {
            for (int i = 0; i < cdl.Count; i++)
            {
                switch (i)
                {
                    case 0:
                        {
                            txtPanDeductee1.Text = cdl[i].DEDUCTEE_PAN;
                            txtTdsDeductee1.Text = cdl[i].TAX_DEPOSITED_AMOUNT.ToString();
                        }
                        break;
                    case 1:
                        {
                            txtPanDeductee2.Text = cdl[i].DEDUCTEE_PAN;
                            txtTdsDeductee2.Text = cdl[i].TAX_DEPOSITED_AMOUNT.ToString();
                        }
                        break;
                    case 2:
                        {
                            txtPanDeductee3.Text = cdl[i].DEDUCTEE_PAN;
                            txtTdsDeductee3.Text = cdl[i].TAX_DEPOSITED_AMOUNT.ToString();
                        }
                        break;
                }
            }
        }
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
        TracesResponse tracesResponse = new TracesResponse();
        TracesData objTraceData = new TracesData();
        TracesLogin objLogin = new TracesLogin();
        objLogin.TAN = txtTan.Text;
        objLogin.Password = txtPass.Text;
        objLogin.UserID = txtUserId.Text;
        objLogin.CaptchaCode = txtCapchaText.Text;

        objTraceData.FAYear = ddFinancialYear.SelectedValue;
        objTraceData.Quarter = "4";//ddQuarter.SelectedValue;
        objTraceData.Forms = ((RegularReturnType)(Cmn.ToInt(ddForm.SelectedValue))).ToString().Replace("_", "");

        objTraceData.PRN_NO = txtProvRecNo.Text;

        objTraceData.PAN1 = txtPanDeductee1.Text;
        objTraceData.PAN1Amount = txtTdsDeductee1.Text == "" ? "" : Cmn.ToDbl(txtTdsDeductee1.Text).ToString("0.00");
        objTraceData.PAN2 = txtPanDeductee2.Text;
        objTraceData.PAN2Amount = txtTdsDeductee2.Text == "" ? "" : Cmn.ToDbl(txtTdsDeductee2.Text).ToString("0.00");
        objTraceData.PAN3 = txtPanDeductee3.Text;
        objTraceData.PAN3Amount = txtTdsDeductee3.Text == "" ? "" : Cmn.ToDbl(txtTdsDeductee3.Text).ToString("0.00");

        objTraceData.TaxDepositedDate = txtDOD.Text;
        objTraceData.ChallanSerialNo = txtChallanNo.Text;
        objTraceData.BSRCode = txtBSRCode.Text;
        objTraceData.ChallanAmount = txtDeposit.Text == "" ? "" : Cmn.ToDbl(txtDeposit.Text).ToString("0.00");

        switch (type)
        {
            case "tdsfile":
                tracesResponse = Global.objTraceConnect.RequestForNSDLConsoFile(objLogin, objTraceData);
                break;
            case "form16-a":
                tracesResponse = Global.objTraceConnect.RequestForDownloadForm16A(objLogin, objTraceData);
                break;
            case "form16-part-a":
                tracesResponse = Global.objTraceConnect.RequestForDownloadForm16(objLogin, objTraceData);
                break;
            case "form27d":
                tracesResponse = Global.objTraceConnect.RequestForDownloadForm27D(objLogin, objTraceData);
                break;
            case "default-justification":
                tracesResponse = Global.objTraceConnect.RequestForJustificationReportDownload(objLogin, objTraceData);
                break;
            case "tanpanfiles":
                tracesResponse = Global.objTraceConnect.DownloadConsoTAN_PANFile(objLogin, objTraceData);
                break;
            default:
                break;
        }

        if (tracesResponse.Respons == enmResponse.Success)
        {
            RequestStatus rs = (RequestStatus)(tracesResponse.CustomeTypes);
            lblMsg.Text = rs.StatusMessage;
            lblMsg.ForeColor = System.Drawing.Color.Green;
        }
        else
        {
            lblMsg.Text = tracesResponse.Message;
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }

}