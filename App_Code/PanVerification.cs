using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace TDSModel
{
    public partial class PanVerification
    {
        public string Message = "";

        public PanVerification()
        {
        }

        public PanVerification Save()
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
                            ID = context.PanVerifications.Max(m => m.ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToPanVerifications(this);
                    else
                    {
                        context.CreateObjectSet<PanVerification>().Attach(this);
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

        public static PanVerification GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.PanVerifications.FirstOrDefault(m => m.ID == ID);
            }
        }
        public static PanVerification GetByPan(string PanID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.PanVerifications.FirstOrDefault(m => m.Pan== PanID);
            }
        }
        public static List<PanVerification> GetAll()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.PanVerifications.ToList();
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