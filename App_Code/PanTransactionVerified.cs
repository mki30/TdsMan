using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace TDSModel
{
    public partial class PanTransactionVerified
    {
        public string Message = "";

        public PanTransactionVerified()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public PanTransactionVerified Save()
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
                            ID = context.PanTransactionVerifieds.Max(m => m.ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToPanTransactionVerifieds(this);
                    else
                    {
                        context.CreateObjectSet<PanTransactionVerified>().Attach(this);
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

        public static PanTransactionVerified GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.PanTransactionVerifieds.FirstOrDefault(m => m.ID == ID);
            }
        }
        public static PanTransactionVerified GetByPAN(string PAN)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.PanTransactionVerifieds.FirstOrDefault(m => m.PANNumber == PAN);
            }
        }
        public static List<PanTransactionVerified> GetByUserID(int UserId)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.PanTransactionVerifieds.Where(m => m.UserID == UserId).ToList();
            }
        }
        public static List<PanTransactionVerified> GetByUserIDNotVerified(int UserId)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.PanTransactionVerifieds.Where(m => m.UserID == UserId && m.PANVerified==0).ToList();
            }
        }
        public static List<PanTransactionVerified> GetAll()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.PanTransactionVerifieds.ToList();
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