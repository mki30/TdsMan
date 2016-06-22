using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class Controls_ReturnFormFilterl : System.Web.UI.UserControl
{
    int fy = 0;
    string formType = "";
    string quarter = "";
    int companyid = 0;
    int challanid = 0;
    
    public event EventHandler SelectionChange;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            formType = Request.QueryString["formtype"];
            fy = Cmn.ToInt(Request.QueryString["fy"]);
            quarter = Request.QueryString["quarter"]==null?"":Request.QueryString["quarter"];
            companyid = Cmn.ToInt(Request.QueryString["companyid"]);
            challanid = Cmn.ToInt(Request.QueryString["challanid"]);
            
            if (Request.Cookies["ReturnFormFilter"] != null)
            {
                ddFormNo.SelectedValue = Request.Cookies["ReturnFormFilter"]["FormType"];
                ddQuarter.SelectedValue = Request.Cookies["ReturnFormFilter"]["Quarter"];
            }
            
            if (fy != 0 || quarter != "" || companyid != 0 || challanid != 0)
            {
                ddQuarter.SelectedValue = quarter;
                ddFormNo.SelectedValue = formType;
            }
            FillChallanDropdown();
        }
    }

    protected void ddFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (SelectionChange != null)
            SelectionChange.Invoke(sender, e);
        FillChallanDropdown();
    }

    protected void ddChallans_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (SelectionChange != null)
            SelectionChange.Invoke(sender, e);
    }
    
    void FillChallanDropdown()
    {
        List<TRN_BASIC_INFO> RR = TRN_BASIC_INFO.GetByFormYearQuarterCompany(ddFormNo.SelectedValue, Global.FinancialYear, ddQuarter.SelectedValue, Global.CompanyID);
        if (RR.Count == 0) return;
        TRN_BASIC_INFO ret = RR[0];
        ddChallans.Items.Clear();
        ddChallans.Items.Add(new ListItem("All", "-1"));
        if (ret != null)
        {
            List<TRN_CHALLAN> challanList = TRN_CHALLAN.GetByFormID(ret.BASIC_INFO_ID);
            foreach (TRN_CHALLAN ch in challanList)
            {
                ddChallans.Items.Add(new ListItem(Cmn.ToDate(ch.DEPOSIT_DATE).ToString("dd-MMM-yyyy") + "-" + ch.CHALLAN_NO, ch.CHALLAN_ID.ToString()));
            }
        }
        if (challanid != 0)
        {
            ddChallans.SelectedValue = challanid.ToString();
        }
    }

    public void removeTopItemFromQtrDropdown()
    {
        ddQuarter.Items.Remove(ddQuarter.Items.FindByValue("-1"));
    }
    //void FillYearDropdown()
    //{
    //    ddFinancialYear.Items.Add(new ListItem("-Select-", "-1"));
    //    for (int i = DateTime.Today.Year; i > DateTime.Today.Year - 6; i--)
    //    {
    //        if (i < 2014)
    //            break;
    //        ListItem li = new ListItem(i.ToString() + "-" + (i + 1).ToString().Substring(2), i.ToString());
    //        ddFinancialYear.Items.Add(li);
    //        if (i == DateTime.Today.Year)
    //            li.Selected = true;
    //    }
    //}

    //public int CompanyID
    //{
    //    get
    //    {
    //        return Cmn.ToInt(ddCompany.SelectedValue);
    //    }
    //}

    public string FormType
    {
        get
        {
            return ddFormNo.SelectedValue;
        }
    }

    //public int FinancialYear
    //{
    //    get
    //    {
    //        return Cmn.ToInt(ddFinancialYear.SelectedValue);
    //    }
    //}

    public string Quarter
    {
        get
        {
            return ddQuarter.SelectedValue;
        }

    }

    public int ChallanID
    {
        get
        {
            return Cmn.ToInt(ddChallans.SelectedValue);
        }
   }

    public void HideForm()
    {
        //tdFormLabel.Visible = false;
        //tdFormData.Visible = false;
        form.Visible = false;
    }

    public void HideQuarter()
    {
        //tdQuarter.Visible = false;
        //tdQuarterData.Visible = false;
        qtr.Visible = false;
    }

    public void ShowForm()
    {
        //tdFormLabel.Visible = true;
        //tdFormData.Visible = true;
        form.Visible = true;
    }
    public void ShowQuarter()
    {
    //    tdQuarter.Visible = true;
    //    tdQuarterData.Visible = true;
        qtr.Visible = true;
    }

    public void HideChallan()
    {
    //    tdChallanLabel.Visible = false;
    //    tdChallanData.Visible = false;
        chln.Visible = false;
    }
    string QueryString(string Key, string Default = "")
    {
        return Request.QueryString[Key] != null ? Request.QueryString[Key].ToString() : Default;
    }
}


