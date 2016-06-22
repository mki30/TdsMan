using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace TDSModel
{
    public partial class TRN_CHALLAN
    {
        public string Message = "";

        public TRN_CHALLAN()
        {

        }
        
        public TRN_CHALLAN Save()
        {
            try
            {
                using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
                {
                    Boolean IsNew = false;

                    if (CHALLAN_ID == 0)
                    {
                        CHALLAN_ID = 1;
                        try
                        {
                            CHALLAN_ID = context.TRN_CHALLAN.Max(m => m.CHALLAN_ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToTRN_CHALLAN(this);
                    else
                    {
                        context.CreateObjectSet<TRN_CHALLAN>().Attach(this);
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

        public static TRN_CHALLAN GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_CHALLAN.FirstOrDefault(m => m.CHALLAN_ID == ID);
            }
        }

        public static List<TRN_CHALLAN> GetByFormIDandYear(int formid, int year)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_CHALLAN.Where(m => m.BASIC_INFO_ID == formid && m.YEAR == year).ToList();
            }
        }

        public static List<TRN_CHALLAN> GetByFormID(int FormID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_CHALLAN.Where(m => m.BASIC_INFO_ID == FormID).OrderByDescending(m => m.DEPOSIT_DATE).ToList();
            }

        }
        public static List<TRN_CHALLAN> GetByYear(int year)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_CHALLAN.Where(m => m.YEAR == year).OrderByDescending(m => m.YEAR).ThenByDescending(m => m.QTR).ToList();
            }
        }
        public static int ChallanCount(int companyID, int year)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_CHALLAN.Where(m => m.COMPANY_ID == companyID && m.YEAR == year).Count();
            }
        }

        public static int DeducteeCount(int companyID, int year)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                List<TRN_CHALLAN> ch = context.TRN_CHALLAN.Where(m => m.COMPANY_ID == companyID && m.YEAR == year).ToList();
                int count = 0;
                foreach (TRN_CHALLAN c in ch)
                {
                    List<TRN_DEDUCTEE_DETAILS> CD = TRN_DEDUCTEE_DETAILS.GetByChallanID(c.CHALLAN_ID);

                    foreach (TRN_DEDUCTEE_DETAILS cd in CD)
                    {
                        count++;
                    }
                }
                return count;
            }
        }
        public static double gettotalchallanamountforquarter(int formid)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return (double)context.TRN_CHALLAN.Where(m => m.BASIC_INFO_ID == formid).Sum(m => m.TOT_TAX);
            }
        }

        public static TRN_CHALLAN GetFirstChallan(int formid)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_CHALLAN.FirstOrDefault(m => m.BASIC_INFO_ID == formid);
            }
        }
        public static TRN_CHALLAN GetByChallanNo(string challanNo)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_CHALLAN.FirstOrDefault(m => m.CHALLAN_NO == challanNo);
            }
        }

        public static List<TRN_DEDUCTEE_DETAILS> GetByFormTypeFinYrQuarter(string formType, int finYr, string quarter)
        {
            List<TRN_DEDUCTEE_DETAILS> chlnd = new List<TRN_DEDUCTEE_DETAILS>();
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                TRN_BASIC_INFO rg = context.TRN_BASIC_INFO.FirstOrDefault(m => m.FORM_NO == formType && m.QTR == quarter && m.YEAR == finYr);
                if (rg != null)
                {
                    List<TRN_CHALLAN> chlns = context.TRN_CHALLAN.Where(m => m.BASIC_INFO_ID == rg.BASIC_INFO_ID).ToList();
                    foreach(TRN_CHALLAN ch in chlns)
                    {
                        chlnd.AddRange(context.TRN_DEDUCTEE_DETAILS.Where(m => m.CHALLAN_ID == ch.CHALLAN_ID).ToList());
                    }
                }
            }
            return chlnd;
        }

        public static int? GetByFormIdFinYrQuarter(int basicInfoId, int year, string qtr)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_CHALLAN.Where(m => m.BASIC_INFO_ID == basicInfoId && m.YEAR == year && m.QTR == qtr).Max(m=>m.SL_NO);
            }
        }
    }
}