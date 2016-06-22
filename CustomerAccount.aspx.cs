using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class Admin_CustomerAccount : BasePage
{
    string userid = "";
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        userid = QueryString("id", "");
        if (Global.UserName == "" && userid == "")
            Response.Write("/account/login.aspx");
        if (!IsPostBack)
            GetDscRecords();
    }
    private void GetDscRecords()
    {
        StringBuilder sb = new StringBuilder();
        List<DscDetail> DTL;
        if (userid != "")
            DTL = DscDetail.GetByMailID(userid);
        else
            DTL = DscDetail.GetByMailID(Global.UserName);

        lblCustomerData.Controls.Add(new Literal() { Text = "<h5>Dsc</h5><table class='table  table-bordered'><tr><th>#<th>Name<th>Dsc Type<th>Class Type<th>Gender<th>DOB<th>Mobile No<th>Current Stage" });
        if (DTL.Count > 0)
        {
            int ctr = 0;
            foreach (DscDetail DT in DTL)
            {
                if (DT.UserType == null) continue;
                lblCustomerData.Controls.Add(new Literal() { Text = "<tr><td>" + ++ctr });
                try
                {
                    lblCustomerData.Controls.Add(new Literal() { Text = "<td><a href='DscApplicationForm.aspx?id=" + DT.ID + "' target='_blank'>" + DT.ApplicantName + "</a>" });
                    lblCustomerData.Controls.Add(new Literal()
                         {
                             Text = "<td>" + (DscUserType)DT.UserType + "<td>" + (ClassType)DT.ClassType + "<td>"
                              + (DT.Gender.ToString() == "1" ? "Male" : "Female") + "<td>" + Cmn.ToDate(DT.DOB).ToString("dd-MMM-yy") + "<td>" + DT.MobileNo + "<td>" + Global.GetText((TransactionStage)DT.DscStage) + ""
                         });
                }
                catch
                {
                }
                lblCustomerData.Controls.Add(new Literal() { Text = "<tr><td colspan='8'>" });
                Controls_NotesControl userControl = (Controls_NotesControl)LoadControl("/Controls/NotesControl.ascx");
                userControl.ID = DT.ID.ToString();
                userControl.ShowNotes(TableID.DSC, DT.ID);
                lblCustomerData.Controls.Add(userControl);
            }
        }
        lblCustomerData.Controls.Add(new Literal() { Text = "</table>" });
        ShowSellBusinessReqest();
        ShowBuyBusinessReqest();
        ShowIncorporateData();
        ShowAppliedPAN();
        ShowPANsList();

    }
    private void ShowAppliedPAN()
    {
        StringBuilder sb = new StringBuilder();
        List<PanDetail> PDL;
        if (userid != "")
            PDL = PanDetail.GetByMailID(userid);
        else
            PDL = PanDetail.GetByMailID(Global.UserName);

        sb.Append("<h5>PAN</h5><table class='table table striped table-bordered'><tr><th>#<th>Name<th>PAN Type<th>Gender<th>DOB<th>Mobile No<th>Current Stage");
        if (PDL.Count > 0)
        {
            int ctr = 0;
            foreach (PanDetail PD in PDL)
            {  
                try
                {
                    sb.Append("<tr>");
                    sb.Append("<td><a href='pan-application-new?id=" + PD.ID + "' target='_blank'>" + PD.FirstName + "</a>");
                    sb.Append("<td>" + PD.Category + "<td>"
                              + (PD.Gender.ToString() == "M" ? "Male" : "Female") + "<td>" + Cmn.ToDate(PD.DOB).ToString("dd-MMM-yy") + "<td>" + PD.MobileNumber + "<td>" + "" + "<td>" + ""
                         );
                    sb.Append("</tr>");
                }
                catch
                {
                }

            }
        }
        lblPAN.Text = sb.Append("</table>").ToString();

    }

    private void ShowPANsList()
    {
        StringBuilder sb = new StringBuilder("<h5>Verified PANs List</h5>");
        List<PanTransactionVerified> pnvlist = PanTransactionVerified.GetByUserID(TDSModel.User.GetByEmailID(Global.UserName).ID);
        sb.Append("<table class='table table-condensed table-bordered'><th>#<th>PAN<th>Surname<th>Middle Name<th>First Name<th>Area Code<th>AO Type<th>Range Code<th>AO Number<th>Jurisdiction<th>Building Name");
        int i = 1;
        foreach (PanTransactionVerified pnv in pnvlist)
        {
            PanVerification p = PanVerification.GetByPan(pnv.PANNumber);
            sb.Append("<tr><td>" + i + "<td>" + p.Pan + "<td>" + p.Surname + "<td>" + p.MiddleName + "<td>" + p.FirstName + "<td>" + p.AreaCode + "<td>" + p.AOType + "<td>" + p.RangeCode + "<td>" + p.AONumber + "<td>" + p.Jurisdiction + "<td>" + p.BuildingName);
            i++;
        }
        sb.Append("</table>");
        lblVerifiedPAN.Text = sb.ToString();
    }
    private void ShowIncorporateData()
    {
        StringBuilder sb = new StringBuilder();
        List<Contact> IL = Contact.GetByEmail(Global.UserName);
        if (IL.Count > 0)
        {
            sb.Append("<h5>Incorporation Requests</h5><table class='table table-condensed table-bordered'><tr><th>#<th>Applicant Name<th>Email<th>Contact No<th>Organization Type<th>State<th>DIN<th>DSC<th>Capital");
            int ctr = 0;
            foreach (Contact C in IL)
            {
                string State = "";
                Global.State.TryGetValue(Cmn.ToInt(C.State), out State);

                TDSModel.User u = null;
                if (C.AgentId != null)
                    Global.UserList.TryGetValue((int)C.AgentId, out u);

                sb.Append("<tr><td>" + (++ctr) + "<td>" + C.Name + "<a/><td>"
                    + C.Email + "<td>" + C.ContactNo + "<td>" + (C.CompanyType != null ? Global.GetText((CompanyType)C.CompanyType) : "") + "<td>" + State + "<td>" + C.DIN + "<td>" + C.DSC + "<td>" + C.Capital + "");
            }
            sb.Append("</table>");
            lblIncorporate.Text = sb.ToString();
        }
    }

    private void ShowSellBusinessReqest()
    {
        List<SellBusiness> SBL = SellBusiness.GetByMailID(Global.UserName);
        if (SBL.Count > 0)
        {
            lblSaleBusinessReq.Controls.Add(new Literal() { Text = "<h5>Sell Business Requests</h5><table class='table table-bordered'><tr><th>#<th>Company Type<th>ROC<th>Incorp<th>Capital<th>Turnover<th>Net Profit<th>Assessed Upto<th>Net Worth<th>Asking Price<th>Expiry Date<th>Approved<th>Balance Sheet<th>PL Sheet<th>Modified Balance Sheet<th>Modified PL Sheet" });
            int ctr = 0;
            foreach (SellBusiness SB in SBL)
            {
                lblSaleBusinessReq.Controls.Add(new Literal() { Text = SB.getRow(++ctr, false, true, (Global.LogInDone ? true : false), true) });
            }
            lblSaleBusinessReq.Controls.Add(new Literal() { Text = "</table>" });
        }
    }

    public string ShowAmmountInDecimal(double Amount)
    {
        if (Amount > 10000000)
            return (Amount / 100000).ToString("0.0");
        else
            return (Amount / 100000).ToString("0.00");
    }
    private void ShowBuyBusinessReqest()
    {
        lblBuyBusinessList.Controls.Add(new Literal() { Text = "<h5>Business Requests</h5><table class='table table-bordered'>" });
        List<BusinessRequest> BRL = BusinessRequest.GetAllUser();

        foreach (BusinessRequest BR in BRL)
        {
            TDSModel.User U = TDSModel.User.GetByID((int)BR.UserID);
            lblBuyBusinessList.Controls.Add(new Literal() { Text = "<tr><td>ID<td>" + U.ID + "<td>" + U.Name + "<td>" + U.EmailID + "<td>" + U.ContactNo + "<td><td colspan='4'><td>Balance Sheet<td>PL Sheet" });
            List<BusinessRequest> br = BusinessRequest.GetCompamnies((int)BR.UserID);
            foreach (BusinessRequest b in br)
            {
                lblBuyBusinessList.Controls.Add(new Literal() { Text = GetSelecedCompanies(new string[] { b.CompanyID.ToString() }) });
                lblBuyBusinessList.Controls.Add(new Literal() { Text = "<tr><td><td>" });

                Controls_StageControl userControl = (Controls_StageControl)LoadControl("/Controls/StageControl.ascx");
                userControl.ShowStages(TableID.BuyBusiness, b.ID);
                lblBuyBusinessList.Controls.Add(userControl);

                lblBuyBusinessList.Controls.Add(new Literal() { Text = "<td colspan='10'>" });
                Controls_NotesControl userControl2 = (Controls_NotesControl)LoadControl("/Controls/NotesControl.ascx");
                userControl2.ShowNotes(TableID.BuyBusiness, b.ID);
                lblBuyBusinessList.Controls.Add(userControl2);
            }
        }

        lblBuyBusinessList.Controls.Add(new Literal() { Text = "</table>" });
    }
    public static string GetSelecedCompanies(string[] Companies)
    {
        StringBuilder sb = new StringBuilder();

        List<SellBusiness> BusinessList = SellBusiness.GetAllActive();
        int ctr = 0;
        foreach (string s in Companies)
        {
            SellBusiness S = BusinessList.FirstOrDefault(m => m.ID == Cmn.ToInt(s));
            if (S != null)
            {
                sb.Append(S.getRow(++ctr, true, false, (Global.LogInDone ? true : false)));
            }
        }
        return sb.ToString();
    }
}