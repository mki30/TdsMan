using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class Controls_BuyBusinessFilter : System.Web.UI.UserControl
{
    static List<Range> CapitalRange = new List<Range>();
    static List<Range> TurnoverRange = new List<Range>();
    static List<Range> AskingPriceRange = new List<Range>();
    static List<Range> ProfitRange = new List<Range>();
    string[] SelectedCompanies = null;
    public static string stage = "";

    bool admin = false;
    public bool ShowForAdmin
    {
        get
        {
            return admin;
        }
        set
        {
            admin = value;
        }
    }
    public string Header = "<br/><div class='panel panel-info'><div class='panel-heading'>Search Result<span class='pull-right'> Amount ( in Lacs ) </span></div><table class='table table-condensed table-bordered' style='text-align:center;background:white'><tr><th>#<th>Company Type<th>ROC<th class='text-center'>Incorp<th class='text-right'>Capital<th class='text-right'>Turnover<th class='text-right'>Net Profit<th class='text-center'>Assessed Upto<th class='text-right'>Net Worth<th class='text-right'>Asking Price<th class='text-right'>Related Industry<th>Shortlist<th>BS<th>PL";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (admin)
            Header += "<th class='text-center'>Expiry Date<th>Approved";
        if (!admin)
            Header += "<th>";

        if (!IsPostBack)
        {
            if (CapitalRange.Count == 0)
            {
                CapitalRange.Clear();
                CapitalRange.Add(new Range(0, 10));
                CapitalRange.Add(new Range(10, 20));
                CapitalRange.Add(new Range(20, 50));
                CapitalRange.Add(new Range(50, 100));
                CapitalRange.Add(new Range(100, 200));
                CapitalRange.Add(new Range(200, 500));
                CapitalRange.Add(new Range(500, 99999999));
                ProfitRange = AskingPriceRange = TurnoverRange = CapitalRange;
            }
            ddTurnover.Items.Add(new ListItem("Any", ""));
            ddNetProfit.Items.Add(new ListItem("Any", ""));
            ddAskingPrice.Items.Add(new ListItem("Any", ""));
            ddCapital.Items.Add(new ListItem("Any", ""));
            for (int i = 0; i < CapitalRange.Count; i++)
            {
                Range r = CapitalRange[i];
                ListItem li = new ListItem(r.Min + "-" + r.Max.ToString().Replace("99999999", ">"), i.ToString());
                ddCapital.Items.Add(li);
                ddTurnover.Items.Add(li);
                ddAskingPrice.Items.Add(li);
                ddNetProfit.Items.Add(li);
            }
            //ddStateFilter.Items.Clear();
            //ddCompanyTypeFilter.Items.Clear();
            //ddIncorpYear.Items.Clear();
            //ddStateFilter.Items.Add(new ListItem("--All--", "0"));
            //ddIncorpYear.Items.Add(new ListItem("--All--", ""));
            //List<SellBusiness> BusinessList = SellBusiness.GetAllActive();
            //string Data;
            //ddCompanyTypeFilter.Items.Add(new ListItem("--All--", "0"));
            //foreach (var sb in BusinessList.GroupBy(m => m.CompanyType).ToList())
            //{
            //    ddCompanyTypeFilter.Items.Add(new ListItem(Global.GetText((CompanyType)sb.Key) + " (" + BusinessList.Where(m => m.CompanyType == sb.Key).Count() + ")", sb.Key.ToString()));
            //}
            //ddCompanyTypeFilter.SelectedIndex = 1;
            FillDropDown();
            //if (admin)
            //{
            //    chkApproved.Checked = false;
            //}


        }

        ShowData();
    }
    public void SetStage(SellBusinessStage Stage)
    {
        stage = Stage.ToString();
    }
    private void FillDropDown(string selectiontype = "")
    {
        string Data;
        List<SellBusiness> BusinessList; BusinessList = SellBusiness.GetAllActive();
        if (selectiontype == "company" || selectiontype == "")
        {
            ddCompanyTypeFilter.Items.Clear();
            ddCompanyTypeFilter.Items.Add(new ListItem("--All--", "0"));
            foreach (var sb in BusinessList.Where(m=>m.CompanyType!=1).GroupBy(m => m.CompanyType).ToList())
            {
                ddCompanyTypeFilter.Items.Add(new ListItem(Global.GetText((CompanyType)sb.Key) + " (" + BusinessList.Where(m => m.CompanyType == sb.Key).Count() + ")", sb.Key.ToString()));
            }
        }
        if (selectiontype == "state" || selectiontype == "")
        {
            if (ddCompanyTypeFilter.SelectedValue != "0")
                BusinessList = BusinessList.Where(m => m.CompanyType == Cmn.ToInt(ddCompanyTypeFilter.SelectedValue)).ToList();
            ddStateFilter.Items.Clear();
            ddStateFilter.Items.Add(new ListItem("--All--", "0"));
            foreach (var sb in BusinessList.GroupBy(m => m.RegState).ToList())
            {
                if (Global.State.TryGetValue((int)sb.Key, out Data))
                    ddStateFilter.Items.Add(new ListItem(Data + " (" + BusinessList.Where(m => m.RegState == sb.Key).Count() + ")", sb.Key.ToString()));
            }
        }

        if (selectiontype == "year" || selectiontype == "")
        {
            if (ddStateFilter.SelectedValue != "0")
                BusinessList = BusinessList.Where(m => m.RegState == Cmn.ToInt(ddStateFilter.SelectedValue) && m.CompanyType == Cmn.ToInt(ddCompanyTypeFilter.SelectedValue)).ToList();
            ddIncorpYear.Items.Clear();
            ddIncorpYear.Items.Add(new ListItem("--All--", ""));
            foreach (var sb in BusinessList.GroupBy(m => m.YearOfIncorporation).ToList())
            {
                ddIncorpYear.Items.Add(new ListItem(sb.Key + " (" + BusinessList.Where(m => m.YearOfIncorporation == sb.Key).Count() + ")", sb.Key.ToString()));
            }
        }
    }

    public void ShowAdminFilter(bool show)
    {
        if (show)
            AdminChks.Visible = true;
    }

    private string GetSelecedCompanies()
    {
        if (admin)
            return "";
        StringBuilder sb = new StringBuilder(); 
        if (Request.Cookies["SelectedCompanies"] != null)
        {
            SelectedCompanies = Server.UrlDecode(Request.Cookies["SelectedCompanies"].Value).Split(',');
            sb.Append(SellBusiness.GetSelecedCompanies(SelectedCompanies));
        } return sb.ToString();
    }

    private void ShowData()
    {
        Range Turnover = null, NetProfit = null, Capital = null, AskingPrice = null;
        Boolean IsApproved = stage == "Approved" || stage == "" ? true : false;
        Boolean IsExpired = stage == "Expired" ? true : false;
        if (ddTurnover.SelectedValue != "")
            Turnover = TurnoverRange[Cmn.ToInt(ddTurnover.SelectedValue)];

        if (ddNetProfit.SelectedValue != "")
            NetProfit = ProfitRange[Cmn.ToInt(ddNetProfit.SelectedValue)];

        if (ddCapital.SelectedValue != "")
            Capital = CapitalRange[Cmn.ToInt(ddCapital.SelectedValue)];

        if (ddAskingPrice.SelectedValue != "")
            AskingPrice = AskingPriceRange[Cmn.ToInt(ddAskingPrice.SelectedValue)];

        List<SellBusiness> SBL = SellBusiness.GetByFilter(
            Cmn.ToInt(ddCompanyTypeFilter.SelectedValue),
            Cmn.ToInt(ddStateFilter.SelectedValue),
            ddIncorpYear.SelectedValue,
            Turnover != null ? Turnover.Min * 100000 : 0,
            Turnover != null ? Turnover.Max * 100000 : 0,
            NetProfit != null ? NetProfit.Min * 100000 : 0,
            NetProfit != null ? NetProfit.Max * 100000 : 0,
            AskingPrice != null ? AskingPrice.Min * 100000 : 0,
            AskingPrice != null ? AskingPrice.Max * 100000 : 0,
            Capital != null ? Capital.Min * 100000 : 0,
            Capital != null ? Capital.Max * 100000 : 0, IsApproved, IsExpired
           );
        SBL = SBL.Where(m => m.CompanyType != 1 && m.CompanyType != 0).ToList();
        StringBuilder sb = new StringBuilder();
        string Selected = GetSelecedCompanies();
        if (Selected.Length > 0)
        {
            sb.Append(Header.Replace("Search Result           Amount(in Lacs)", "Selected Companies<a class='btn btn-warning pull-right' style='margin-top:-5px;' href='/buy-business/request'>submit</a>") + Selected + "</table></div>");
        }
        sb.Append(Header);


        int ctr = 0;
        if (SBL.Count == 0)
        {
            sb.Append("<tr><td colspan='10'>No records found!");
        }
        else
        {
            foreach (SellBusiness SB in SBL)
            {
                Boolean IsSelected = SelectedCompanies != null && SelectedCompanies.Contains(SB.ID.ToString());
                Boolean ShowCheck = admin == true ? false : true;
                sb.Append(SB.getRow(++ctr, IsSelected, admin));
            }
        }
        sb.Append("</table></div>");
        sellbusiness.Visible = true;
        lblReport.Text = sb.ToString();
    }

    protected void ddCompanyTypeFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillDropDown("state");
        ShowData();
    }
    protected void ddIncorpYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillDropDown("none");
        ShowData();
    }
    protected void ddStateFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillDropDown("year");
        ShowData();
    }
    protected void chkApproved_CheckedChanged(object sender, EventArgs e)
    {
        ShowData();
    }
    protected void ChkExpired_CheckedChanged(object sender, EventArgs e)
    {
        ShowData();
    }

}