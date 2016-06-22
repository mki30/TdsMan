using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace TDSModel
{
    public partial class PanDetail
    {
        public string Message = "";

        public PanDetail()
        {
        }

        public PanDetail Save()
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
                            ID = context.PanDetails.Max(m => m.ID) + 1;
                        }
                        catch 
                        {
                            ID = 1;
                        }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToPanDetails(this);
                    else
                    {
                        context.CreateObjectSet<PanDetail>().Attach(this);
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

        public static PanDetail GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.PanDetails.FirstOrDefault(m => m.ID == ID);
            }
        }
        public static List<PanDetail> GetByMailID(string emailID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.PanDetails.Where(m => m.EmailId == emailID).ToList();
            }
        }
        
        public static PanDetail GetByName(string FName, string MName, string LName)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.PanDetails.FirstOrDefault(m => m.FirstName == FName && m.MiddleName == MName && m.LastName == LName);
            }
        }
        public static PanDetail GetByFatherName(string FName)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.PanDetails.FirstOrDefault(m => m.FatherFirstName== FName);
            }
        }

        public static PanDetail GetByTransactionID(string TransactionID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.PanDetails.FirstOrDefault(m => m.TransactioId == TransactionID);
            }
        }
 
        public static List<PanDetail> GetAll()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.PanDetails.ToList();
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