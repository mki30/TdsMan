using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace TDSModel
{
    public partial class Payment
    {
        public string Message = "";

        public Payment()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public Payment Save()
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
                            ID = context.Payments.Max(m => m.ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToPayments(this);
                    else
                    {
                        context.CreateObjectSet<Payment>().Attach(this);
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

        public static Payment GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Payments.FirstOrDefault(m => m.ID == ID);
            }
        }
        public static Payment GetByTransactionID(string TransactionID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Payments.FirstOrDefault(m => m.TransactionID == TransactionID);
            }
        }
        public static List<Payment> GetAll()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Payments.ToList();
            }
        }

        public static List<Payment> GetByLicenseID(int licenceID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Payments.Where(m => m.LicenseID == licenceID).ToList();
            }
        }

        public static Payment GetByLicenseIDandTransationType(int licenceID, int TransacType)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Payments.FirstOrDefault(m => m.LicenseID == licenceID && m.TransactionType == TransacType);
            }
        }

        public static double GetAvlBal(int licenceID)
        {
            
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return (double)context.Payments.Where(m => m.LicenseID == licenceID).Select(l => l.Amount).DefaultIfEmpty(0).Sum(); 
            }
        }

        public static Payment GetByTransactionTypeAndRefID(int TransactionType, int RefID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Payments.FirstOrDefault(m => m.TransactionType == TransactionType && m.RefID == RefID);
            }
        }
    }
}