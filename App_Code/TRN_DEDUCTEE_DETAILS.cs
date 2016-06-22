using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;
using System.Linq;
using System.Text;
using System.IO;

namespace TDSModel
{
    public partial class TRN_DEDUCTEE_DETAILS
    {
        public string Message = "";

        public TRN_DEDUCTEE_DETAILS()
        {
        }
        
        public static TRN_DEDUCTEE_DETAILS GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_DEDUCTEE_DETAILS.FirstOrDefault(m => m.DEDUCTEE_DETAIL_ID == ID);
            }
        }
        public TRN_DEDUCTEE_DETAILS Save()
        {
            try
            {
                using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
                {

                    TRN_DEDUCTEE_DETAILS tempObj = context.TRN_DEDUCTEE_DETAILS.FirstOrDefault(m => m.DEDUCTEE_DETAIL_ID == DEDUCTEE_DETAIL_ID);
                    Boolean IsNew = tempObj == null;

                    if (IsNew)
                    {
                        DEDUCTEE_DETAIL_ID = 1;
                        try
                        {
                            DEDUCTEE_DETAIL_ID = context.TRN_DEDUCTEE_DETAILS.Max(m => m.DEDUCTEE_DETAIL_ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToTRN_DEDUCTEE_DETAILS(this);
                    else
                    {
                        if (tempObj != null)
                            context.CreateObjectSet<TRN_DEDUCTEE_DETAILS>().Detach(tempObj);
                        context.CreateObjectSet<TRN_DEDUCTEE_DETAILS>().Attach(this);
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
        public TRN_DEDUCTEE_DETAILS Delete()
        {
            try
            {
                using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
                {
                    context.CreateObjectSet<TRN_DEDUCTEE_DETAILS>().Attach(this);
                    context.DeleteObject(this);
                    context.SaveChanges();
                }
            }

            catch (Exception ex)
            {
                Message += ex.Message;
            }
            return this;
        }

        public static List<TRN_DEDUCTEE_DETAILS> GetByChallanID(int ChallanID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_DEDUCTEE_DETAILS.Where(m => m.CHALLAN_ID == ChallanID).ToList();
            }
        }
        public static List<TRN_DEDUCTEE_DETAILS> GetByChallanIDandEmployeeID(int ChallanID, int EmployeeID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_DEDUCTEE_DETAILS.Where(m => m.CHALLAN_ID == ChallanID && m.DEDUCTEE_ID == EmployeeID).ToList();
            }
        }

        // FinancialYear if 2014-2015  2014 should be passed
        public static List<TRN_DEDUCTEE_DETAILS> GetByEmployeeIDandFY(int EmployeeID, int FinancialYear)
        {
            DateTime dtFrom = new DateTime(FinancialYear, 4, 1);
            DateTime dtTo = new DateTime(FinancialYear + 1, 3, 31);

            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_DEDUCTEE_DETAILS.Where(m => m.DEDUCTEE_ID == EmployeeID && m.DEDUCTED_DATE >= dtFrom && m.DEDUCTED_DATE <= dtTo).ToList();
            }
        }

        public static List<TRN_DEDUCTEE_DETAILS> GetByEmployeeIDandYear(int EmployeeID, int FinancialYear)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                DateTime dtFrom = new DateTime(FinancialYear, 4, 1);
                DateTime dtTo = new DateTime(FinancialYear + 1, 3, 31);
                return context.TRN_DEDUCTEE_DETAILS.Where(m => m.DEDUCTEE_ID == EmployeeID && m.DEDUCTED_DATE >= dtFrom && m.DEDUCTED_DATE <= dtTo).OrderBy(m=>m.DEDUCTED_DATE).ToList();
            }
        }
        public static int?  GetMaxSlNo(int ChallanID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_DEDUCTEE_DETAILS.Where(m => m.CHALLAN_ID == ChallanID).Max(m => m.SL_NO);
            }
        }
    }
}