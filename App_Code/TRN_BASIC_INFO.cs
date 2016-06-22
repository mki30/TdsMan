using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace TDSModel
{
    public partial class TRN_BASIC_INFO
    {
        public string Message = "";

        public TRN_BASIC_INFO()
        {
        }

        public TRN_BASIC_INFO Save()
        {
            try
            {
                using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
                {
                    Boolean IsNew = false;

                    if (BASIC_INFO_ID == 0)
                    {
                        BASIC_INFO_ID = 1;
                        try
                        {
                            BASIC_INFO_ID = context.TRN_BASIC_INFO.Max(m => m.BASIC_INFO_ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToTRN_BASIC_INFO(this);
                    else
                    {
                        context.CreateObjectSet<TRN_BASIC_INFO>().Attach(this);
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

        public static List<TRN_BASIC_INFO> GetByFormYearQuarterCompany(string formtype, int year, string qurter, int companyID)
        {
            try
            {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                //return context.TRN_BASIC_INFO.Where(m => (m.FORM_NO == formtype || formtype == "-1") && m.ASST_ID == year && (m.QTR == qurter || qurter == "-1") && m.COMPANY_ID == companyID).ToList();
                return context.TRN_BASIC_INFO.Where(m => (m.FORM_NO == formtype) && m.YEAR == year && (m.QTR == qurter || qurter == "-1") && m.COMPANY_ID == companyID).OrderByDescending(m => m.YEAR).ThenByDescending(m => m.QTR).ToList();
            }
            }
            catch 
            {
                return null;
            }
        }

        public static TRN_BASIC_INFO GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_BASIC_INFO.FirstOrDefault(m => m.BASIC_INFO_ID == ID);
            }
        }

        public static List<TRN_BASIC_INFO> GetByFinYear(int FinYr)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_BASIC_INFO.Where(m => m.ASST_ID == FinYr).ToList();
            }
        }

        public static List<TRN_BASIC_INFO> GetByYearFormQuarterCompany(int year, string formType, string quarter, int company)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_BASIC_INFO.Where(m => m.ASST_ID == year && (m.FORM_NO == formType || formType == "-1") && (m.QTR == quarter || quarter == "-1") && (m.COMPANY_ID == company || company == -1)).ToList();
            }
        }

        public static TRN_BASIC_INFO GetByTokenNo(string tokenNo)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_BASIC_INFO.FirstOrDefault(m => m.PRN_NO == tokenNo);
            }
        }
        
        //public static List<RegularReturn> GetByFinYearandCorrrectionType(int finYr, int correctionType)
        //{
        //    using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
        //    {
        //        return context.RegularReturns.Where(m => m.FinancialYear == finYr && m.IsCorrection == correctionType).ToList();
        //    }
        //}
    }
}