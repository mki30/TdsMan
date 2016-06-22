using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace TDSModel
{
    public partial class PanTransaction
    {
        public string Message = "";

        public PanTransaction()
        {
        }

        public PanTransaction Save()
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
                            ID = context.PanTransactions.Max(m => m.ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToPanTransactions(this);
                    else
                    {
                        context.CreateObjectSet<PanTransaction>().Attach(this);
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

        public static PanTransaction GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.PanTransactions.FirstOrDefault(m => m.ID == ID);
            }
        }
        public static PanTransaction GetByTransactionID(string TransactionId)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.PanTransactions.FirstOrDefault(m => m.TransactionID == TransactionId);
            }
        }
        public static List<PanTransaction> GetAll()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.PanTransactions.ToList();
            }
        }

        //public static List<PanTransactionVerified> GetAllVerified()
        //{
        //    using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
        //    {
        //        return context.PanTransactionVerifieds.Where(m => != (int)TransactionStage.Complete).ToList();
        //    }
        //}

        //public static List<DscDetail> GetAllComplete(int DaysOld = 60)
        //{
        //    DateTime date = DateTime.Today.AddDays(-DaysOld);
        //    using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
        //    {
        //        return context.DscDetails.Where(m => m.Complete == 1 && m.CompletionDate > date).ToList();
        //    }
        //}


    }
}