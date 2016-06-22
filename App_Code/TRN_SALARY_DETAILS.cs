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
    public partial class TRN_SALARY_DETAILS
    {
        public string Message = "";

        public TRN_SALARY_DETAILS()
        {
        }

        public static TRN_SALARY_DETAILS GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_SALARY_DETAILS.FirstOrDefault(m => m.SALARY_DETAILS_ID == ID);
            }
        }
        public TRN_SALARY_DETAILS Save()
        {
            try
            {
                using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
                {

                    TRN_SALARY_DETAILS tempObj = context.TRN_SALARY_DETAILS.FirstOrDefault(m => m.SALARY_DETAILS_ID == SALARY_DETAILS_ID);
                    Boolean IsNew = tempObj == null;

                    if (IsNew)
                    {
                        SALARY_DETAILS_ID = 1;
                        try
                        {
                            SALARY_DETAILS_ID = context.TRN_SALARY_DETAILS.Max(m => m.SALARY_DETAILS_ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToTRN_SALARY_DETAILS(this);
                    else
                    {
                        if (tempObj != null)
                            context.CreateObjectSet<TRN_SALARY_DETAILS>().Detach(tempObj);
                        context.CreateObjectSet<TRN_SALARY_DETAILS>().Attach(this);
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
        public TRN_SALARY_DETAILS Delete()
        {
            try
            {
                using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
                {
                    context.CreateObjectSet<TRN_SALARY_DETAILS>().Attach(this);
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

        public static List<TRN_SALARY_DETAILS> GetAll()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_SALARY_DETAILS.ToList();
            }
        }

        public static List<TRN_SALARY_DETAILS> GetByFormID(int formid)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_SALARY_DETAILS.Where(m => m.BASIC_INFO_ID == formid).ToList();
            }
        }

        public static TRN_SALARY_DETAILS GetByFormIDEmployeeID(int formid, int employeeid)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_SALARY_DETAILS.FirstOrDefault(m => m.BASIC_INFO_ID == formid && m.EMPLOYEE_ID == employeeid);
            }
        }
    }
}