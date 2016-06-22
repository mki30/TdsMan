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
    public partial class EmployeeSalary
    {
        public string Message = "";

        public EmployeeSalary()
        {
        }
        public EmployeeSalary Save()
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
                            ID = context.EmployeeSalaries.Max(m => m.ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToEmployeeSalaries(this);
                    else
                    {
                        context.CreateObjectSet<EmployeeSalary>().Attach(this);
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
        public EmployeeSalary Delete()
        {
            try
            {
                using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
                {
                    context.CreateObjectSet<EmployeeSalary>().Attach(this);
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


        public static EmployeeSalary GetByEnmpIDAndFinYear(int EmpID, int FinancialYear)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.EmployeeSalaries.FirstOrDefault(m => m.EmployeeID == EmpID && m.FinancialYear == FinancialYear);
            }
        }
        public static EmployeeSalary GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.EmployeeSalaries.FirstOrDefault(m => m.ID == ID);
            }
        }

        public static List<EmployeeSalary> GetByEnmpIDAndFY(int EmpID, int FinancialYear)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.EmployeeSalaries.Where(m => m.EmployeeID == EmpID && m.FinancialYear == FinancialYear).ToList();
            }
        }



        public static EmployeeSalary GetByEnmpIDAndFYAndMonth(int EmpID, int FinancialYear, int Month)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.EmployeeSalaries.FirstOrDefault(m => m.EmployeeID == EmpID && m.FinancialYear == FinancialYear);
            }
        }


        public static List<EmployeeSalary> GetAll()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.EmployeeSalaries.ToList();
            }
        }

        public static List<EmployeeSalary> GetByEmployeeID(int EmployeeID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.EmployeeSalaries.Where(m => m.EmployeeID == EmployeeID).ToList();
            }
        }

        public static EmployeeSalary GetByIDandFY(int EmployeeID, int FinYr)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.EmployeeSalaries.FirstOrDefault(m => m.EmployeeID == EmployeeID && m.FinancialYear == FinYr);
            }
        }

        public static List<EmployeeSalary> GetByFinYear(int FinYr)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.EmployeeSalaries.Where(m => m.FinancialYear == FinYr).ToList();
            }
        }
    }
}