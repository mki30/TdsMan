using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class AdminPage : BasePage
{
    AdminTabs Tab;
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        //if (Request.Url.ToString().Contains("localhost"))
        //{
        //    Global.UserName = "admin@gmail.com";
        //    Global.CurrentUserType = UserTypes.UT_Admin;
        //}
        Tab = (AdminTabs)QueryStringInt("tab", 0);
        //    stagefilter = (AdminTabs)QueryStringInt("tab", 0);
        if (!IsPostBack)
        {
            StringBuilder strTabs = new StringBuilder("<table style='text-transform:none;width:auto;'><tr>");
            foreach (AdminTabs tab in Enum.GetValues(typeof(AdminTabs)))
            {
                if (Global.CurrentUserType != UserTypes.UT_Admin && (tab == AdminTabs.Payment || tab == AdminTabs.License || tab == AdminTabs.DashBoard))
                    continue;
                strTabs.Append("<td><a style='text-transform:none' href='/adminpanel?tab=" + (int)tab
                    + "&stagefilter=0' class='btn " + (tab == Tab ? "btn-info" : "btn-default") + " btn-sm'>" + Global.GetText(tab) + "</a>&nbsp;");
            }
            ltAdminTabs.Text = strTabs.Append("</table>").ToString();

            if (Global.CurrentUserType != UserTypes.UT_Admin && Tab == AdminTabs.DashBoard)
                Tab = AdminTabs.DSC;
            if (Tab == AdminTabs.DashBoard)
                ShowDashBoard();
            else
                ltStatusFilter.Text = ShowData(Tab);
        }
        BuyBusinessFilter.ShowAdminFilter(true);
        //  BuyBusinessFilter.ShowData()
        BuyBusinessFilter.ShowForAdmin = true;
    }

    string ShowData(AdminTabs Tab, Boolean ShowDetails = true)
    {
        panelDashBoard.Visible = false;
        pnlDSC.Visible = false;
        pnlPayment.Visible = false;
        pnlIncorporate.Visible = false;
        pnlSellBusiness.Visible = false;
        pnlLicence.Visible = false;
        BuyBusinessFilter.Visible = false;

        switch (Tab)
        {
            case AdminTabs.DSC: return ShowDSCTab(ShowDetails);
            case AdminTabs.Payment: ShowPaymentData(ShowDetails); break;
            case AdminTabs.Incorporate: return ShowIncorporateData(ShowDetails);
            case AdminTabs.BusinessSell: return ShowISellBusinessData(ShowDetails);
            // ShowSellBusinessTab(ShowDetails);
            case AdminTabs.BusinessBuyRequest: return ShowBuyBusinessReqest(ShowDetails);
            case AdminTabs.License: ShowLicenseData(); break;
            //case AdminTabs.PAN: ShowPANData(); break;
            //case AdminTabs.PAN: ShowpANData(); break;
        }
        return "";
    }

    //pAN
    //string ShowpANData(Boolean ShowDetails)
    //{
    //    StringBuilder str = new StringBuilder("");
    //    PANS Stage = !ShowDetails ? DSCStage.None : (DSCStage)QueryStringInt("stagefilter", 0);
    //    pnlDSC.Visible = true;
    //    Title = "Admin-DSC";
    //    List<DscDetail> DscDetailList = null;
    //    List<DscDetail> DscList = DscDetail.GetAll(); ;
    //    if (Global.CurrentUserType == UserTypes.UT_Admin || Global.CurrentUserType == UserTypes.UT_AgentAdmin)
    //        DscDetailList = DscDetail.GetIncompleteAndCompletedWithMonthAndPaid(Global.LicenseID);
    //    else
    //        DscDetailList = DscDetail.GetIncompleteAndCompletedWithMonthAndPaid(Global.LicenseID, Global.UserID);
    //    List<DscDetail> list = null;
    //    foreach (DSCStage stage in Enum.GetValues(typeof(DSCStage)))
    //    {
    //        if (stage == DSCStage.None) continue;
    //        if (Global.CurrentUserType != UserTypes.UT_Admin)
    //            continue;
    //        switch (stage)
    //        {
    //            case DSCStage.Unassigned: list = DscDetailList.Where(m => m.AgentId == null).ToList(); break;
    //            case DSCStage.Assigned: list = DscDetailList.Where(m => m.AgentId != null && m.Made != 1).ToList(); break;
    //            case DSCStage.Made: list = DscDetailList.Where(m => m.Made == 1 && m.Downloaded != 1).ToList(); break;
    //            case DSCStage.Downloaded: list = DscDetailList.Where(m => m.Downloaded == 1 & string.IsNullOrEmpty(m.BillNo)).ToList(); break;
    //            case DSCStage.Courier: list = DscDetailList.Where(m => m.Downloaded == 1 & !string.IsNullOrEmpty(m.BillNo)).ToList(); break;
    //            case DSCStage.Original_Doc_Recieved: list = DscDetailList.Where(m => m.DocReceived == 1).ToList(); break;
    //            case DSCStage.Complete: list = DscDetail.GetAllComplete(); break;
    //            case DSCStage.Incomplete: list = DscList.Where(m => m.Paid != 1).ToList(); break;
    //        }
    //        string count = list.Count == 0 ? "" : list.Count.ToString();
    //        //str.Append("<td><a style='text-transform:none;width:auto;' href='/adminpanel?tab=" + (int)AdminTabs.DSC + "&stagefilter="
    //        //    + (int)stage + "' class='btn btn-sm " + ((int)stage == (int)Stage ? "btn-primary" : "btn-default") + "'>"
    //        //    + Global.GetText(stage) + "&nbsp;<span class='badge badge-info'>" + count + "</span>");

    //        str.Append("<a style='text-transform:none;width:auto;' href='/adminpanel?tab=" + (int)AdminTabs.DSC + "&stagefilter="
    //            + (int)stage + "' class='btn btn-sm " + ((int)stage == (int)Stage ? "btn-primary" : "btn-default") + "'>"
    //            + Global.GetText(stage) + "&nbsp;<span class='badge badge-info'>" + count + "</span>");

    //        if ((int)stage != (int)TransactionStage.All)
    //        {
    //            List<DscDetail> DscDetailCriticalList = list.Where(m => m.DscStage == (int)stage && m.EntryTime != null && (DateTime.Now - Cmn.ToDate(m.EntryTime)).TotalMinutes > Global.GetTime(stage)).ToList();

    //            if (DscDetailCriticalList.Count > 0)
    //                str.Append(" / <span class='badge alert-danger' style='background-color:#FA9090;'>" + count + "</span>");
    //        }
    //        str.Append("</a>");

    //        if (stage == Stage && ShowDetails)
    //            ShowDscRecords((int)Stage, list);
    //    }

    //    return str.ToString();
    //}

    ///Dsc
    string ShowDSCTab(Boolean ShowDetails)
    {
        //StringBuilder str = new StringBuilder("<table><tr>");
        StringBuilder str = new StringBuilder("");
        DSCStage Stage = !ShowDetails ? DSCStage.None : (DSCStage)QueryStringInt("stagefilter", 0);
        pnlDSC.Visible = true;
        Title = "Admin-DSC";
        List<DscDetail> DscDetailList = null;
        List<DscDetail> DscList = DscDetail.GetAll();
        if (Global.CurrentUserType == UserTypes.UT_Admin || Global.CurrentUserType == UserTypes.UT_AgentAdmin)
            DscDetailList = DscDetail.GetIncompleteAndCompletedWithMonthAndPaid(Global.LicenseID);
        else
            DscDetailList = DscDetail.GetIncompleteAndCompletedWithMonthAndPaid(Global.LicenseID, Global.UserID);
        List<DscDetail> list = null;
        foreach (DSCStage stage in Enum.GetValues(typeof(DSCStage)))
        {
            if (stage == DSCStage.None) continue;
            if (Global.CurrentUserType != UserTypes.UT_Admin)
                continue;
            switch (stage)
            {
                case DSCStage.Unassigned: list = DscDetailList.Where(m => m.AgentId == null).ToList(); break;
                case DSCStage.Assigned: list = DscDetailList.Where(m => m.AgentId != null && m.Made != 1).ToList(); break;
                case DSCStage.Made: list = DscDetailList.Where(m => m.Made == 1 && m.Downloaded != 1).ToList(); break;
                case DSCStage.Downloaded: list = DscDetailList.Where(m => m.Downloaded == 1 & string.IsNullOrEmpty(m.BillNo)).ToList(); break;
                case DSCStage.Courier: list = DscDetailList.Where(m => m.Downloaded == 1 & !string.IsNullOrEmpty(m.BillNo)).ToList(); break;
                case DSCStage.Original_Doc_Recieved: list = DscDetailList.Where(m => m.DocReceived == 1).ToList(); break;
                case DSCStage.Complete: list = DscDetail.GetAllComplete(); break;
                case DSCStage.Incomplete: list = DscList.Where(m => m.Paid != 1).ToList(); break;
            }
            string count = list.Count == 0 ? "" : list.Count.ToString();
            //str.Append("<td><a style='text-transform:none;width:auto;' href='/adminpanel?tab=" + (int)AdminTabs.DSC + "&stagefilter="
            //    + (int)stage + "' class='btn btn-sm " + ((int)stage == (int)Stage ? "btn-primary" : "btn-default") + "'>"
            //    + Global.GetText(stage) + "&nbsp;<span class='badge badge-info'>" + count + "</span>");

            str.Append("<a style='text-transform:none;width:auto;' href='/adminpanel?tab=" + (int)AdminTabs.DSC + "&stagefilter="
                + (int)stage + "' class='btn btn-sm " + ((int)stage == (int)Stage ? "btn-primary" : "btn-default") + "'>"
                + Global.GetText(stage) + "&nbsp;<span class='badge badge-info'>" + count + "</span>");

            if ((int)stage != (int)TransactionStage.All)
            {
                List<DscDetail> DscDetailCriticalList = list.Where(m => m.DscStage == (int)stage && m.EntryTime != null && (DateTime.Now - Cmn.ToDate(m.EntryTime)).TotalMinutes > Global.GetTime(stage)).ToList();

                if (DscDetailCriticalList.Count > 0)
                    str.Append(" / <span class='badge alert-danger' style='background-color:#FA9090;'>" + count + "</span>");
            }
            str.Append("</a>");

            if (stage == Stage && ShowDetails)
                ShowDscRecords((int)Stage, list);
        }

        return str.ToString();
        //"</table>"
    }

    //seLL BUSINESS PREVIOUS FUNCTION

    string ShowSellBusinessTab(Boolean ShowDetails)
    {
        BuyBusinessFilter.Visible = true;
        pnlSellBusiness.Visible = true;
        Title = "Admin-Sell Business";

        SellBusinessStage Stage = !ShowDetails ? SellBusinessStage.None : (SellBusinessStage)QueryStringInt("stagefilter", 0);

        BuyBusinessFilter.SetStage(Stage);

        StringBuilder str = new StringBuilder("<table><tr>");
        string dscCounts = "";

        List<CounterIntKey> BusinessSellStageCount = SellBusiness.GetStageCount();

        foreach (SellBusinessStage stage in Enum.GetValues(typeof(SellBusinessStage)))
        {
            if (stage == SellBusinessStage.None) continue;
            var count = BusinessSellStageCount.FirstOrDefault(m => m.Key == (int)stage);
            dscCounts += "<td><a style='text-transform:none;width:auto;' href='/adminpanel?tab=" + (int)Tab + "&stagefilter="
                + (int)stage + "' class='btn btn-sm " + ((int)stage == (int)Stage ? "btn-primary" : "btn-default") + "'>"
                + Global.GetText(stage) + (count != null ? "&nbsp;<span class='badge badge-info'>" + count.Count + "</span>" : "")
                + "</a>&nbsp;";
        }
        str.Append(dscCounts);
        return str.Append("</table>").ToString();
    }
   
    private void ShowSellBusinessRecords(int StageFilter, List<SellBusiness> list)
    {
        lblDscList.Text = "You do not have access to this module";
        StringBuilder sb = new StringBuilder();


        int ctr = 0;

        if (list.Count > 0)
        {
            sb.Append("<table style='margin-top:0px' class='table table-condensed table-bordered'><tr><th>#<th>CompanyType/OrderNo" +
                "<th>State<th>Year Of Incorporation<th>Capital<th>Turn Over<th>Profit<th>Assessment Done Upto<th>Net Worth <th>Asking Price<th>Expiry Date<th>Approved");

            //sb.Append("<th>Doc1<th>Doc2<th>Upload<th>Time Taken");

            foreach (SellBusiness s in list)
                sb.Append(s.getRow(++ctr, false, true));
        }
        else
            sb.Append("No record found!");

        sb.Append("</table>");

        lblDscList.Text = sb.ToString();

        //if (StageFilter == (int)TransactionStage.Unassigned)
        //    CheckIncompleteRecords(list);
    }
    string ShowBuyBusinessReqest(Boolean ShowDetails)
    {
        pnlBuyBusiness.Visible = true;
        Title = "Admin-Buy Reuest";
        string dscCounts = "";

        BuyBusinessStage Stage = !ShowDetails ? BuyBusinessStage.None : (BuyBusinessStage)QueryStringInt("stagefilter", 0);
        StringBuilder str = new StringBuilder("<table><tr>");
        List<CounterIntKey> BuyBusinessStageCount = BusinessRequest.GetStageCount();
        foreach (BuyBusinessStage stage in Enum.GetValues(typeof(BuyBusinessStage)))
        {
            if (stage == BuyBusinessStage.None) continue;
            var count = BuyBusinessStageCount.FirstOrDefault(m => m.Key == (int)stage);
            dscCounts += "<td><a style='text-transform:none;width:auto;' href='/adminpanel?tab=" + (int)Tab + "&stagefilter="
                + (int)stage + "' class='btn btn-sm " + ((int)stage == (int)Stage ? "btn-primary" : "btn-default") + "'>"
                + Global.GetText(stage) + (count != null ? "&nbsp;<span class='badge badge-info'>" + count.Count + "</span>" : "")
                + "</a>&nbsp;";

        }
        str.Append(dscCounts);
        str.Append("</table>");

        if (ShowDetails)
        {
            List<BusinessRequest> BusinessRequestUsers = BusinessRequest.GetAllUser();
            List<BusinessRequest> AllBusinessRequest = BusinessRequest.GetAll();
            List<SellBusiness> BusinessList = SellBusiness.GetAllActive();


            foreach (BusinessRequest BR in BusinessRequestUsers)
            {

                TDSModel.User U = TDSModel.User.GetByID((int)BR.UserID);
                if (U != null)
                {
                    lblBuyBusinessList.Controls.Add(new Literal()
                    {
                        Text = "<div class='panel panel-primary'><div class='panel-heading'>" + U.Name + "," + U.EmailID + ", " + U.ContactNo + "</div><div class='panel-body'><table class='table'>"
                    });

                    //lblBuyBusinessList.Controls.Add(new Literal() { Text = "<tr><td style='width:10%;vertical-align:top!important ' title='" + U.ID + "'>" + U.Name + "," + U.EmailID + ", " + U.ContactNo + "<td><table style='width:100%'>" });

                    int ctr = 0;
                    foreach (BusinessRequest b in AllBusinessRequest.Where(m => m.UserID == U.ID))
                    {
                        SellBusiness bus = BusinessList.FirstOrDefault(m => m.ID == (int)b.CompanyID);
                        if (bus != null)
                        {
                            lblBuyBusinessList.Controls.Add(new Literal() { Text = bus.getRow(++ctr, false) });
                            lblBuyBusinessList.Controls.Add(new Literal() { Text = "<tr><td colspan='11'>" });
                            Controls_StageControl userControl = (Controls_StageControl)LoadControl("/Controls/StageControl.ascx");
                            userControl.ShowStages(TableID.BuyBusiness, b.ID);
                            lblBuyBusinessList.Controls.Add(userControl);
                            lblBuyBusinessList.Controls.Add(new Literal() { Text = "<tr><td colspan='11'>" });
                            Controls_NotesControl userControl2 = (Controls_NotesControl)LoadControl("/Controls/NotesControl.ascx");
                            userControl2.ShowNotes(TableID.BuyBusiness, b.ID);
                            lblBuyBusinessList.Controls.Add(userControl2);
                        }
                        else
                        {
                            lblBuyBusinessList.Controls.Add(new Literal() { Text = "<tr><td colspan='11'>Company Deleted - " + b.CompanyID });
                        }
                    }
                    lblBuyBusinessList.Controls.Add(new Literal() { Text = "</table></div></div>" });
                }
            }
        }
        return str.ToString();
    }

    void ShowDashBoard()
    {

        StringBuilder str = new StringBuilder("<table class='table table-bordered'>");
        try
        {
            foreach (AdminTabs tab in Enum.GetValues(typeof(AdminTabs)))
            {
                if (tab == AdminTabs.License || tab == AdminTabs.DashBoard || tab == AdminTabs.Payment)
                    continue;
                str.Append("<tr><td>" + Global.GetText(tab));
                str.Append("<td>" + ShowData(tab, false));
            }
        }
        catch (Exception ex)
        {
            str.Append(ex.Message + ex.StackTrace);
        }
        str.Append("</table>");
        ltDashBoard.Text = str.ToString();
        panelDashBoard.Visible = true;
        Title = "Dash Board";
    }

    private void ShowDscRecords(int StageFilter, List<DscDetail> list)
    {
        lblDscList.Text = "You do not have access to this module";
        StringBuilder sb = new StringBuilder();

        Boolean ShowAssign = Global.CurrentUserType == UserTypes.UT_Admin || Global.CurrentUserType == UserTypes.UT_AgentAdmin;
        Boolean ShowPay = Global.CurrentUserType == UserTypes.UT_Admin || Global.CurrentUserType == UserTypes.UT_AgentAdmin;

        int ctr = 0;

        if (list.Count > 0)
        {
            sb.Append("<table style='margin-top:0px' class='table table-condensed table-bordered'><tr><th>#<th>Name/Mobile" +
                "<th>Email<th  style='width:80px;'>Date<th style='width:300px;'>Certificate");
            if (ShowAssign)
                sb.Append("<th>Assign");
            sb.Append("<th>Doc1<th>Doc2<th>Upload<th>Time Taken");
            if (StageFilter == (int)DSCStage.All)
                sb.Append("<th>Stage");

            foreach (DscDetail dt in list)
                sb.Append(dt.GetDSCRow(++ctr, ShowAssign, StageFilter));
        }
        else
            sb.Append("No record found!");

        sb.Append("</table>");

        lblDscList.Text = sb.ToString();

        if (StageFilter == (int)TransactionStage.Unassigned)
            CheckIncompleteRecords(list);
    }

    private void CheckIncompleteRecords(List<DscDetail> list)
    {
        foreach (DscDetail dt in list)
        {
            bool complete = true;
            string[] dirIdProof = Directory.GetFiles((Server.MapPath("/Documents/IdProof/")), "" + dt.ID + "*");
            if (dirIdProof.Length < 0)
                complete = false;
            string[] dirAddressProof = Directory.GetFiles((Server.MapPath("/Documents/AddressProof/")), "" + dt.ID + "*");
            if (dirIdProof.Length < 0)
                complete = false;
            string[] dirAdminDoc = Directory.GetFiles((Server.MapPath("/Documents/AdminDoc/")), "" + dt.ID + "*");
            if (dirAdminDoc.Length < 0)
                complete = false;
            if (complete == false)
            {
                dt.DscStage = (int)TransactionStage.Incomplete;
                dt.Save();
            }
        }
    }

    private void ShowPaymentData(Boolean ShowDetails)
    {
        pnlPayment.Visible = true;
        Title = "Admin-Paymemnt";

        List<Payment> PL = Payment.GetByLicenseID(Global.LicenseID).OrderByDescending(m => m.Date).ToList();
        StringBuilder sb = new StringBuilder();
        if (PL.Count == 0)
        {
            sb.Append("Please select a license");
            lblRechargeLink.Visible = false;
        }
        else
        {

            lblRechargeLink.Visible = true;
            sb.Append("<table class='table table-condensed table-bordered'><tr><th>#<th>Date<th>Time<th>Amount<th>Trans Type");
            int ctr = 0;
            double totalAmount = 0;
            foreach (Payment P in PL)
            {
                string link = "";

                if (P.TransactionType == (int)TransType.Recharge)
                    link = "<span>" + (TransType)P.TransactionType + "</span>";
                sb.Append("<tr><td>" + (++ctr) + "<td>" + Cmn.ToDate(P.Date).ToString("dd-MMM-yy") + "<td>" + Cmn.ToDate(P.Date).ToString("hh:mm:ss tt")
                        + "<td>" + Cmn.ToDbl(P.Amount).ToString("0.00") + "<td>" + link);
                totalAmount += (double)(P.Amount);
            }
            sb.Append("<tr><th>Total<th><th><th>" + totalAmount.ToString("0.00") + "<th></tr>");
            sb.Append("</table>");
        }
        lblPaymentTable.Text = sb.ToString();
    }

    //sELL BUSINESS NEW FUNCTION

    string ShowISellBusinessData(Boolean ShowDetails)
    {
        StringBuilder str = new StringBuilder("<table><tr>");
        pnlSellBusiness.Visible = true;
        Title = "Admin-Sell Business";
        SellBusinessStage Stage = !ShowDetails ? SellBusinessStage.None : (SellBusinessStage)QueryStringInt("stagefilter", 0);
        //stage counter
        List<SellBusiness> list = null;
        switch (Global.CurrentUserType)
        {
            case UserTypes.UT_Admin: list = SellBusiness.GetAll(); break;
            // case UserTypes.UT_AgentAdmin: list = SellBusiness.GetByLicenseID(Global.LicenseID); break;
            default: list = SellBusiness.GetAllActive(); break;
        }

        // filter out records for the current stage
        if (Stage != SellBusinessStage.All)
            list = list.Where(m => m.Stage == (int)Stage).ToList();

        foreach (SellBusinessStage stage in Enum.GetValues(typeof(SellBusinessStage)))
        {
            if (stage == SellBusinessStage.None)
                continue;
            List<SellBusiness> listCurrentTab = SellBusiness.GetAll();
            listCurrentTab = listCurrentTab.Where(m => m.Stage == (int)stage).ToList();
            string count = listCurrentTab.Count == 0 ? "" : listCurrentTab.Count.ToString();
            str.Append("<td><a style='text-transform:none;width:auto;' href='/adminpanel?tab=" + (int)AdminTabs.BusinessSell + "&stagefilter="
                + (int)stage + "' class='btn btn-sm " + ((int)stage == (int)Stage ? "btn-primary" : "btn-default") + "'>"
                + Global.GetText(stage) + (list != null ? "&nbsp;<span class='badge badge-info'>" + count + "</span>" : "")
                + "</a>&nbsp;");
        }

        str.Append("</table>");

        if (!ShowDetails)
            return str.ToString();

        str.Append("<table class='table table-condensed table-bordered'><tr><th>#<th>Company Type<th>ROC<th class='text-center'>Incorp<th class='text-right'>Capital<th class='text-right'>Turnover<th class='text-right'>Net Profit<th class='text-center'>Assessed Upto<th class='text-right'>Net Worth<th class='text-right'>Asking Price<th class='text-right'>Related Industry<th>Expiry Date<th>Approved<th>BS<th>PL<th>Modified BS<th>Modified PL");

        int ctr = 0;
        string s = "";
        foreach (SellBusiness SB in list)
        {
            s += SB.getRow(++ctr, false, true, true, true);
        }
        str.Append(s);
        str.Append("</table>");

        lblSellBusiness.Text = str.ToString();

        return "";
    }

    //iNCORPORATE

    string ShowIncorporateData(Boolean ShowDetails)
    {
        //StringBuilder str = new StringBuilder("<table><tr>");
        StringBuilder str = new StringBuilder("");
        pnlIncorporate.Visible = true;
        Title = "Admin-Incorporate";
        IncorpStage Stage = !ShowDetails ? IncorpStage.None : (IncorpStage)QueryStringInt("stagefilter", 0);
        //stage counter
        List<Contact> list = null;

        switch (Global.CurrentUserType)
        {
            case UserTypes.UT_Admin: list = Contact.GetAll(); break;
            case UserTypes.UT_AgentAdmin: list = Contact.GetByLicenseID(Global.LicenseID); break;
            default: list = Contact.GetByAgentID(Global.UserID); break;
        }

        // filter out records for the current stage
        if (Stage != IncorpStage.All)
            list = list.Where(m => m.Stage == (int)Stage).ToList();

        foreach (TransactionStage stage in Enum.GetValues(typeof(TransactionStage)))
        {
            List<Contact> listCurrentTab = Contact.GetAll();
            string count = listCurrentTab.Count == 0 ? "" : listCurrentTab.Count.ToString();
            listCurrentTab = listCurrentTab.Where(m => m.Stage == (int)stage).ToList();
            //str.Append("<td><a style='text-transform:none;width:auto;' href='/adminpanel?tab=" + (int)AdminTabs.Incorporate + "&stagefilter="
            //    + (int)stage + "' class='btn btn-sm " + ((int)stage == (int)Stage ? "btn-primary" : "btn-default") + "'>"
            //    + Global.GetText(stage) + (list != null ? "&nbsp;<span class='badge badge-info'>" + count + "</span>" : "")
            //    + "</a>&nbsp;");
            str.Append("<a style='text-transform:none;width:auto;' href='/adminpanel?tab=" + (int)AdminTabs.Incorporate + "&stagefilter="
                + (int)stage + "' class='btn btn-sm " + ((int)stage == (int)Stage ? "btn-primary" : "btn-default") + "'>"
                + Global.GetText(stage) + (list != null ? "&nbsp;<span class='badge badge-info'>" + count + "</span>" : "")
                + "</a>&nbsp;");
        }

        //str.Append("</table>");

        if (!ShowDetails)
            return str.ToString();

        lblIncorporateList.Text = "You do not have access to this module";

        str.Append("<table class='table table-condensed table-bordered'><tr><th>#<th>Applicant Name<th>Email<th>Contact No<th>Organization Type<th>State<th>DIN<th>DSC<th>Capital<th>Assign<th>Pay");

        int ctr = 0;
        foreach (Contact C in list)
        {
            str.Append(GetIncorporateRow(++ctr, C));
        }
        str.Append("</table>");

        lblIncorporateList.Text = str.ToString();

        return "";
    }

    private string GetIncorporateRow(int ctr, Contact C)
    {
        StringBuilder sb = new StringBuilder();
        string State = "";
        if (C.State != null)
            Global.State.TryGetValue(Cmn.ToInt(C.State), out State);

        TDSModel.User u = null;
        if (C.AgentId != null)
            Global.UserList.TryGetValue((int)C.AgentId, out u);

        sb.Append("<tr><td>" + (ctr) + "<td>" + C.Name + "<a/><td>"
            + C.Email + "<td>" + C.ContactNo + "<td>" + (C.CompanyType != null ? Global.GetText((CompanyType)C.CompanyType) : "") + "<td>" + State + "<td>" + C.DIN + "<td>" + C.DSC + "<td>" + C.Capital + "");

        sb.Append("<td><a class='fancybox350 fancybox.iframe' href='/AssignTask.aspx?taskid=" + C.ID + "&transtype=" + (int)TransType.Incorporate + "&agentid=" + (C.AgentId != null ? C.AgentId : 0) + "' target='blank'>" + (u != null ? u.Name : "Assign") + "</a>");
        string companyType = "";
        if (C.CompanyType != null)
            companyType = ((CompanyType)C.CompanyType).ToString();
        sb.Append("<td><a class='fancybox350 fancybox.iframe' href='/ServiceFee.aspx?id=" + C.ID + "&serviceclass=" + companyType + "" + "&servicetype=" + TransType.Incorporate + "'>Pay</a>");

        return sb.ToString();
    }
    //LICENSE
    private void ShowLicenseData()
    {
        pnlLicence.Visible = true;
        Title = "Admin-License Management";
        StringBuilder str = new StringBuilder();
        List<License> L = License.GetAll(Global.LicenseID);
        int ctr = 0;

        foreach (License l in L.OrderByDescending(m => m.LicenseType))
        {
            ctr++;
            str.Append("<div class='panel panel-primary'><div class='panel-heading'>" + ctr + ". <a style='color:white' href='/Admin/EditLicense.aspx?id=" + l.ID + "' class='fancybox400 fancybox.iframe'>" + l.Name + (l.LicenseType == 1 ? "- Agent" : " - Client") + "</a></div><div class='panel-body'>");
            str.Append("<table class='table'><tr><td>Address<th>");
            str.Append(l.Address + "<td>Email<th>" + l.Email + "<td>Phone <th>" + l.Phone + "<td>Balance<th>" + Payment.GetAvlBal(l.ID)
                + "<td><a href='/Admin/EditUser.aspx?id=0&licenseid=" + l.ID + "' class='pull-right fancybox400 fancybox.iframe'>+Add User</a></table><table>");
            List<TDSModel.User> U = TDSModel.User.GetUsersByLicenseID(l.ID);

            if (U.Count > 0)
            {
                str.Append("<table style='width:50%' class='table table-bordered table-condensed'><tr><th>#<th>Name<th>Email ID<th>Password<th>User Type");
                int ctr1 = 1;
                foreach (TDSModel.User u in U)
                {
                    str.Append("<tr><td>" + ctr1++ + "<td><a href='/Admin/EditUser.aspx?id=" + u.ID + "&licenseid=" + l.ID + "' class='fancybox400 fancybox.iframe'>" + u.Name + "</a><td>" + u.EmailID + "<td>" + u.Password + "");
                    str.Append("<td>" + Global.GetText((UserTypes)u.UserType));
                }
                str.Append("</table>");

            }
            //MST_COMPANY C = MST_COMPANY.GetByLicenceID(l.ID);
            //str.Append("<table class='table table-bordered table-condensed' style='width:50%'><tr><th>SNo<th>Company Name");
            //ctr = 0;
            //if (C != null)
            //{
            //    str.Append("<tr><td>" + ++ctr+ "<td>" + C.COMPANY_NAME + "");
            //}
            //str.Append("</table>");
            str.Append("</table></div></div>");
        }

        lblLicense.Text = str.ToString();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ltAdminTabs.Visible = false;
        divStatusFilter.Visible = false;
        divAdminPanels.Visible = false;

        // search on customer name, email , mobile, order number 
        StringBuilder sb = new StringBuilder();
        List<TDSModel.User> UL = TDSModel.User.GetbySearch(txtSearch.Text);
        if (UL.Count > 0)
        {
            sb.Append("<h1>User</h1><table class='table table-bordered table-condensed'><tr><th>User Name<th>Email<th>Contact No");
            foreach (TDSModel.User U in UL)
            {
                sb.Append("<tr><td><a href='/customer?id=" + U.EmailID + "' target='_blank'>" + U.Name + "<td>" + U.EmailID + "<td>" + (U.ContactNo != null ? U.ContactNo : "-") + "");
            }
            sb.Append("</table>");
        }
        else
        {
            SellBusiness SB = TDSModel.SellBusiness.GetbyOrderNumber(txtSearch.Text);
            if (SB != null)
            {
                sb.Append("<h1>Sell Business</h1><table class='table table-condensed'><tr>");
                sb.Append(SB.getRow(1, false, true));
                sb.Append("</table>");
            }
            else
            {
                DscDetail DT = DscDetail.GetbyOrderNumber(txtSearch.Text);
                if (DT != null)
                {
                    sb.Append("<h1>DSC</h1><table class='table table-condensed table-bordered'><tr><th>#<th>Name/Mobile" +
                             "<th>Email<th  style='width:80px;'>Date<th style='width:300px;'>Certificate<th>Assign" +
                              "<th>Doc1<th>Doc2<th>Upload<th>Time Taken<th>Stage");
                    sb.Append("<tr><td>");
                    sb.Append(DT.GetDSCRow(0, true, (int)DSCStage.All));
                    sb.Append("</table>");
                }
                else
                {
                    Contact C = Contact.GetbyOrderNumber(txtSearch.Text);
                    if (C != null)
                    {
                        sb.Append("<h1>Incorporate</h1><table class='table table-condensed table-bordered'><tr><th>#<th>Applicant Name<th>Email<th>Contact No<th>Organization Type<th>State<th>DIN<th>DSC<th>Capital<th>Assign<th>Pay");
                        sb.Append(GetIncorporateRow(1, C));
                        sb.Append("</table>");
                    }
                    else
                        sb.Append("No record found!");
                }
            }
        }
        lblSearchResult.Text = sb.ToString();
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        var master = (MasterPage2)Page.Master;
        master.OnSomethingSelected += MasterSelected;
    }

    private void MasterSelected(object sender, string selectedValue)
    {
        ShowData(Tab);
    }
}