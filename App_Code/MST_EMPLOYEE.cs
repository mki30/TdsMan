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
    public partial class MST_EMPLOYEE
    {
        public string Message = "";
        
        public MST_EMPLOYEE()
        {
        }
        
        public static List<MST_EMPLOYEE> GetList(int CompanyID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.MST_EMPLOYEE.Where(m => m.COMPANY_ID == CompanyID).ToList();
            }
        }

        public MST_EMPLOYEE Save()
        {
            try
            {
                using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
                {

                    MST_EMPLOYEE tempEmployee = context.MST_EMPLOYEE.FirstOrDefault(m => m.EMPLOYEE_ID == EMPLOYEE_ID);

                    Boolean IsNew = tempEmployee == null;

                    if (IsNew)
                    {
                        EMPLOYEE_ID = 1;
                        try
                        {
                            EMPLOYEE_ID = context.MST_EMPLOYEE.Max(m => m.EMPLOYEE_ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToMST_EMPLOYEE(this);
                    else
                    {
                        if (tempEmployee != null)
                            context.CreateObjectSet<MST_EMPLOYEE>().Detach(tempEmployee);
                        context.CreateObjectSet<MST_EMPLOYEE>().Attach(this);
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
        public MST_EMPLOYEE Delete()
        {
            try
            {
                using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
                {
                    context.CreateObjectSet<MST_EMPLOYEE>().Attach(this);
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


        public static MST_EMPLOYEE GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.MST_EMPLOYEE.FirstOrDefault(m => m.EMPLOYEE_ID == ID);
            }
        }

        public static MST_EMPLOYEE GetByPan(string empPan)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.MST_EMPLOYEE.FirstOrDefault(m =>m.EMPLOYEE_PAN == empPan);
            }
        }

        public static List<MST_EMPLOYEE> GetByCompanyID(int CompanyID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.MST_EMPLOYEE.Where(m => m.COMPANY_ID == CompanyID).ToList();
            }
        }
    }
}