using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace TDSModel
{
    public partial class TanDetail
    {
        public string Message = "";

        public TanDetail()
        {
        }

        public TanDetail Save()
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
                            ID = context.TanDetails.Max(m => m.ID) + 1;
                        }
                        catch
                        {
                            ID = 1;
                        }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToTanDetails(this);
                    else
                    {
                        context.CreateObjectSet<TanDetail>().Attach(this);
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

        public static TanDetail GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TanDetails.FirstOrDefault(m => m.ID == ID);
            }
        }

        //public static TanDetail GetByName(string FName, string MName, string LName)
        //{
        //    using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
        //    {
        //        return context.TanDetails.FirstOrDefault(m => m.FirstName == FName && m.MiddleName == MName && m.LastName == LName);
        //    }
        //}
        //public static TanDetail GetByFatherName(string FName)
        //{
        //    using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
        //    {
        //        return context.TanDetails.FirstOrDefault(m => m.FatherFirstName == FName);
        //    }
        //}

        public static TanDetail GetByTransactionID(string TransactionID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TanDetails.FirstOrDefault(m => m.TransactionId == TransactionID);
            }
        }

        public static List<TanDetail> GetAll()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TanDetails.ToList();
            }
        }

        


    }
}