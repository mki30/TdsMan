using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class GetInvoice : System.Web.UI.Page
{
    TransType transType;
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
        transType = (TransType)(Cmn.ToInt(Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : ""));
        if (id != "")
            GenerateInvoice(id, transType);
        else
            Response.Write("Error!");
    }
    
    private void GenerateInvoice(string id, TransType type)
    {
        if (type == TransType.Dsc)
        {
            DscDetail DT = DscDetail.GetByID(Cmn.ToInt(id));
            if (DT != null)
            {
                CreatePDF CP = new CreatePDF(this.Page, 1, "", "");
                CP.SetPageSize(400f, 300f);
                CP.AddHeading("Invoice");
                string userType = "User Type: " + Global.GetText((UserTypes)DT.UserType);
                string cerType = "Cirtificate Type: " + Global.GetText((CertificateType)DT.CirtificateType);
                string cerValidity = "Cirtificate Validity: " + Global.GetText((CertificateValidity)DT.CertificateValidity) + " Year";
                string usbToken = "User Type: " + (DT.NeedUsbToken == 0 ? "YES" : "No");
                CP.AddText(new string[] { userType, cerType, cerValidity, usbToken });
                CP.AddNewLine();
                CP.PrintInvoice(1);
            }
        }
    }
}