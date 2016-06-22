using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;



namespace TDSModel
{
    public partial class SellBusiness
    {
        public string Message = "";

        public SellBusiness()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public SellBusiness Save()
        {
            try
            {
                using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
                {
                    Boolean IsNew = false;

                    if (ID == 0)
                    {
                        ID = 1;
                        try
                        {
                            ID = context.SellBusinesses.Max(m => m.ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToSellBusinesses(this);
                    else
                    {
                        context.CreateObjectSet<SellBusiness>().Attach(this);
                        context.ObjectStateManager.ChangeObjectState(this, EntityState.Modified);
                    }
                    context.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                Message += ex.Message;
            }
            return this;
        }

        public static string GetSelecedCompanies(string[] Companies, Boolean Admin = false)
        {
            StringBuilder sb = new StringBuilder();

            List<SellBusiness> BusinessList = SellBusiness.GetAllActive();
            int ctr = 0;
            foreach (string s in Companies)
            {
                SellBusiness S = BusinessList.FirstOrDefault(m => m.ID == Cmn.ToInt(s));
                if (S != null)
                {
                    sb.Append(S.getRow(++ctr, true));
                }
            }
            return sb.ToString();
        }

        public string getRow(int ctr, Boolean IsSelected, Boolean Admin = false, Boolean Login = false, Boolean SB = false)
        {
            string rocState = "";
            Global.State.TryGetValue((int)RegState, out rocState);
            string str = "<tr><td>" + ctr
                + "<td class='text-left'>" + (Admin ? "<a href='/BusinessSell.aspx?id=" + ID + "' target='_blank'>" : "") + Global.GetText((CompanyType)CompanyType)
                        + "<br/>" //+ OrderNo
                        + "<td class='text-left'>" + rocState + "<td>" + YearOfIncorporation + "<td class='text-right'>"
                        + ShowAmmountInDecimal(Cmn.ToDbl(Capital)) + "<td class='text-right' style='width:150px;'>"
                        + ShowAmmountInDecimal(Cmn.ToDbl(LastTurnoverAmount1))
                        + " (" + LastTurnoverYr1 + ")<br/>"
                        + ShowAmmountInDecimal(Cmn.ToDbl(LastTurnoverAmount2))
                        + " (" + LastTurnoverYr2 + ")<td class='text-right' style='width:150px;'>"
                        + ShowAmmountInDecimal(Cmn.ToDbl(lastNetProfit1))
                        + " (" + LastTurnoverYr1 + ")<br/>"
                        + ShowAmmountInDecimal(Cmn.ToDbl(lastNetProfit2))
                        + " (" + LastTurnoverYr2 + ")<td>" + AssessmentDoneUpto + "<td class='text-right'>"
                        + ShowAmmountInDecimal(Cmn.ToDbl(NetWorth)) + "<td class='text-right'>"
                        + ShowAmmountInDecimal(Cmn.ToDbl((AskingPrice + ServiceFee)))
                        + "<td class='text-right'>" + RelatedIndustry;

            if (Admin)
            {
                str += "<td>" + (ListingExpiryDate >= DateTime.Now ? Cmn.ToDate(ListingExpiryDate).ToString("dd-MMM-yy") : "-") + "<td class='text-left'>" + (Approved == 1 ? "Yes" : "No") + "";

            }
            if (Login)
            {
                if (SB)
                {
                    string[] bl = Directory.GetFiles(HttpContext.Current.Server.MapPath("~/Documents/BalanceSheet/"), "" + ID + "*");
                    if (bl.Length > 0)
                    {
                        string file = "getimage?id=" + ID + "&type=" + "BalanceSheet";
                        string ext = System.IO.Path.GetExtension("/Documents/BalanceSheet/" + ID + ".pdf");
                        str += "<td><a href='" + file + "' target='_blank'><img src='" + (ext == ".pdf" ? "/images/pdf.png" : ext == "" ? "Images/no_file_available.png" : "/images/download.png") + "' style='width:50px;height:50px;'></a>";
                    }
                    else
                        str += "<td><img src='images/no_file_available.png' style='width:50px;height:50px;'/>";
                    string[] pl = Directory.GetFiles(HttpContext.Current.Server.MapPath("~/Documents/ProfitLossSheet/"), "" + ID + "*");
                    if (pl.Length > 0)
                    {
                        string file = "getimage?id=" + ID + "&type=" + "ProfitLossSheet";
                        string ext = System.IO.Path.GetExtension("/Documents/ProfitLossSheet/" + ID + ".jpg");
                        str += "<td><a href='" + file + "' target='_blank'><img src='" + (ext == "pdf" ? "/images/pdf.png" : ext == "" ? "Images/no_file_available.png" : "/images/download.png") + "' style='width:50px;height:50px;'></a>";

                    }
                    else
                        str += "<td><img src='images/no_file_available.png' style='width:50px;height:50px;'/>";
                }
                string folder = @"\Documents\ModifiedBalanceSheet";
                string path = HttpContext.Current.Server.MapPath(folder);
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);
                string[] dirIdProof = Directory.GetFiles(HttpContext.Current.Server.MapPath("~/Documents/ModifiedBalanceSheet/"), "" + ID + "*");
                if (dirIdProof.Length > 0)
                {
                    string file = "getimage?id=" + ID + "&type=" + "ModifiedBalanceSheet";
                    string ext = System.IO.Path.GetExtension(file);
                    str += "<td><a href='" + file + "' target='_blank'><img src='" + (ext == "pdf" ? "/images/pdf.png" : ext == "" ? "images/no_file_available.png" : "/images/download.png") + "' style='width:50px;height:50px;'></a>";
                }
                else
                    str += "<td><img src='images/no_file_available.png' style='width:50px;height:50px;'/>";
                folder = @"\Documents\ModifiedProfitLossSheet";
                path = HttpContext.Current.Server.MapPath(folder);
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);
                string[] dirAddressProof = Directory.GetFiles(HttpContext.Current.Server.MapPath("~/Documents/ModifiedProfitLossSheet/"), "" + ID + "*");
                if (dirAddressProof.Length > 0)
                {
                    string file = "getimage?id=" + ID + "&type=" + "ModifiedProfitLossSheet";
                    string ext = System.IO.Path.GetExtension(file);
                    str += "<td><a href='" + file + "' target='_blank'><img src='" + (ext == "pdf" ? "/images/pdf.png" : ext == "" ? "Images/no_file_available.png" : "/images/download.png") + "' style='width:50px;height:50px;'></a>";

                }
                else
                    str += "<td><img src='images/no_file_available.png' style='width:50px;height:50px;'/>";

            }

            else
            {
                str += "<td><input type='checkbox' " + (IsSelected ? "checked='checked'" : "") + " onclick='return SaveInCookie(this," + ID + ")'>";
                string folder = @"\Documents\ModifiedBalanceSheet";
                string path = HttpContext.Current.Server.MapPath(folder);
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);
                string[] dirIdProof = Directory.GetFiles(HttpContext.Current.Server.MapPath("~/Documents/ModifiedBalanceSheet/"), "" + ID + "*");
                if (dirIdProof.Length > 0)
                {
                    if (File.Exists((HttpContext.Current.Server.MapPath("~/documents/modifiedbalancesheet/" + ID + ".jpeg"))))
                    {
                        str += "<td><a href='/preview.aspx?id=" + ID.ToString() + "&sheet=BL' class='fancybox fancybox.iframe'>Preview</a></td>";
                    }
                    else
                    {
                        str += "<td><img src='images/no_file_available.png' style='width:50px;height:50px;'/></td>";
                    }
                }
                else
                {
                    str += "<td><img src='images/no_file_available.png' style='width:50px;height:50px;'/></td>";
                }
                folder = @"\Documents\ModifiedProfitLossSheet";
                path = HttpContext.Current.Server.MapPath(folder);
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);
                string[] dirAddressProof = Directory.GetFiles(HttpContext.Current.Server.MapPath("~/Documents/ModifiedProfitLossSheet/"), "" + ID + "*");
                if (dirAddressProof.Length > 0)
                {
                    if (File.Exists((HttpContext.Current.Server.MapPath("~/documents/modifiedprofitlosssheet/" + ID + ".jpeg"))))
                    {
                        str += "<td><a href='/preview.aspx?id=" + ID.ToString() + "&sheet=PL' class='fancybox fancybox.iframe'>Preview</a></td>";
                    }
                    else
                    {
                        str += "<td><img src='images/no_file_available.png' style='width:50px;height:50px;'/></td>";
                    }
                }
                else
                {
                    str += "<td><img src='images/no_file_available.png' style='width:50px;height:50px;'/></td>";
                }

            }

            return str;
        }
        public string ShowAmmountInDecimal(double Amount)
        {
            if (Amount > 10000000)
                return (Amount / 100000).ToString("0.0");
            else
                return (Amount / 100000).ToString("0.00");
        }

        public static SellBusiness GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.SellBusinesses.FirstOrDefault(m => m.ID == ID);
            }
        }
        public static SellBusiness GetByHeadLine(string Headline)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.SellBusinesses.FirstOrDefault(m => m.HeadLine == Headline);
            }
        }
        public static List<SellBusiness> GetAllActive()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.SellBusinesses.Where(m => m.Approved == 1 && m.ListingExpiryDate > DateTime.Today).ToList();
            }
        }

        public static List<SellBusiness> GetAll()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.SellBusinesses.ToList();
            }
        }

        public static List<SellBusiness> GetByFilter(int companyType, int state, string YearOfIncorporation,
            double TurnOverMin = 0, double TurnOverMax = 0,
            double NetProfitMin = 0, double NetProfitMax = 0,
            double AskingPriceMin = 0, double AskingPriceMax = 0,
            double CapitalMin = 0, double CapitalMax = 0, Boolean ShowApproved = true, bool showExpired = false
            )
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                int a = ShowApproved == true ? 1 : 0;
                return context.SellBusinesses.Where(
                    m => (m.CompanyType == companyType || companyType == 0)
                    && (m.RegState == state || state == 0)
                    && (m.YearOfIncorporation == YearOfIncorporation || YearOfIncorporation.Length == 0)
                    && (m.LastTurnoverAmount1 >= TurnOverMin)
                    && (m.LastTurnoverAmount1 <= TurnOverMax || TurnOverMax == 0)
                    && (m.LastTurnoverAmount2 >= TurnOverMin)
                    && (m.LastTurnoverAmount2 <= TurnOverMax || TurnOverMax == 0)
                    && (m.lastNetProfit1 >= NetProfitMin)
                    && (m.lastNetProfit1 <= NetProfitMax || NetProfitMax == 0)
                    && (m.lastNetProfit2 >= NetProfitMin)
                    && (m.lastNetProfit2 <= NetProfitMax || NetProfitMax == 0)
                    && (m.AskingPrice >= AskingPriceMin)
                    && (m.AskingPrice <= AskingPriceMax || AskingPriceMax == 0)
                    && (m.Capital >= CapitalMin)
                    && (m.Capital <= CapitalMax || CapitalMax == 0)
                    && (m.Approved == (ShowApproved == true ? 1 : 0))
                    && (showExpired || m.ListingExpiryDate > DateTime.Now)
                    ).ToList();
            }
        }

        public static List<SellBusiness> GetDistinctStates()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.SellBusinesses.GroupBy(m => m.RegState).Select(grp => grp.FirstOrDefault()).ToList();
            }
        }

        public static List<SellBusiness> GetDistinctCompany()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.SellBusinesses.GroupBy(m => m.CompanyType).Select(grp => grp.FirstOrDefault()).ToList();
            }
        }

        public static List<SellBusiness> GetDistinctIncorpYears()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.SellBusinesses.GroupBy(m => m.YearOfIncorporation).Select(grp => grp.FirstOrDefault()).ToList();
            }
        }
        public static List<CounterIntKey> GetStageCount()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.SellBusinesses.GroupBy(m => m.Stage).Select(g => new CounterIntKey() { Key = g.Key, Count = g.Count() }).ToList();
            }
        }


        public static List<SellBusiness> GetByMailID(string emailId)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.SellBusinesses.Where(m => m.EmailID == emailId).OrderByDescending(m => m.LUDate).ToList();
            }
        }

        public static SellBusiness GetbyOrderNumber(string OrderNumber)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.SellBusinesses.FirstOrDefault(m => m.OrderNo == OrderNumber);
            }
        }
    }
}