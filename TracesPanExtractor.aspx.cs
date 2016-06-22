using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class TracesPanExtractor : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        Title = "Pan Name Extractor";
        if (!IsPostBack)
        {
            Global.objTraceConnect = null;
            FillYearDropdown();
            GetPanRecords();
            CreateCapcha();

            if (Request.Url.ToString().Contains("localhost"))
            {
                txtTan.Text = "MRTR03328D";
                txtUserId.Text = "rra2011";
                txtPass.Text = "Dublin2008";
            }
        }
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
    protected void getRecords(object sender, EventArgs e)
    {
        GetPanRecords();
    }
    
    private void GetPanRecords()
    {
        Dictionary<string, TRN_DEDUCTEE_DETAILS> uniqueData = new Dictionary<string, TRN_DEDUCTEE_DETAILS>();
        uniqueData.Clear();
        List<TRN_DEDUCTEE_DETAILS> CD = TRN_CHALLAN.GetByFormTypeFinYrQuarter(ddForm.SelectedValue, Cmn.ToInt(ddFinancialYear.SelectedValue), ddQuarter.SelectedValue);
        StringBuilder sb = new StringBuilder();
        if (CD.Count > 0)
        {
            foreach (TRN_DEDUCTEE_DETAILS cd in CD)
            {
                if (!uniqueData.ContainsKey(cd.DEDUCTEE_PAN))
                {
                    uniqueData.Add(cd.DEDUCTEE_PAN, cd);
                }
            }
            
            if (uniqueData.Count > 0)
            {
                sb.Append("<table id='panTable' class='table table-bordered table-condensed'><th>PAN No<th>Employee Name(entered)<th>Employee Name(extracted)<th>Status");
                foreach (KeyValuePair<string, TRN_DEDUCTEE_DETAILS> pair in uniqueData)
                {
                    sb.Append("<tr><td>" + pair.Value.DEDUCTEE_PAN+ "<td>" + pair.Value.DEDUCTEE_NAME + "<td><td>");
                }
                sb.Append("</table>");
            }
            sb.Append("<a class='btn btn-info pull-right' id='loginbutton' href='#logindiv' title='enter your login details here'>Strat Validation</a>");
        }
        lblTbl.Text = sb.ToString();
    }
    protected void lnkRefreshBurtton_Click(object sender, EventArgs e)
    {
        Global.objTraceConnect = null;
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
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "StartPanValidation()", true);
        }
        else
        {
            lblMsg.Text = tracesResponse.Message;
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
     }
}