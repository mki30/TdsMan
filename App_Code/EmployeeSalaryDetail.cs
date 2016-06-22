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
    public partial class EmployeeSalaryDetail
    {
        public string Message = "";

        public EmployeeSalaryDetail()
        {
        }

        public EmployeeSalaryDetail Save()
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
                            ID = context.EmployeeSalaryDetails.Max(m => m.ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToEmployeeSalaryDetails(this);
                    else
                    {
                        context.CreateObjectSet<EmployeeSalaryDetail>().Attach(this);
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
        public EmployeeSalaryDetail Delete()
        {
            try
            {
                using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
                {
                    context.CreateObjectSet<EmployeeSalaryDetail>().Attach(this);
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

        public static EmployeeSalaryDetail GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.EmployeeSalaryDetails.FirstOrDefault(m => m.ID == ID);
            }
        }

        public static EmployeeSalaryDetail GetBySalaryIDAmountTypeandValueType(int SalaryID, int AmountType, int ValueType)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.EmployeeSalaryDetails.FirstOrDefault(m => m.SalaryID == SalaryID);
            }
        }

        public static List<EmployeeSalaryDetail> GetBySalaryID(int SalaryID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.EmployeeSalaryDetails.Where(m => m.SalaryID == SalaryID).ToList();
            }
        }
    }
}