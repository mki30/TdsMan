using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace TDSModel
{
    public partial class BusinessRequest
    {
        public string Message = "";

        public BusinessRequest()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public BusinessRequest Save()
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
                            ID = context.BusinessRequests.Max(m => m.ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToBusinessRequests(this);
                    else
                    {
                        context.CreateObjectSet<BusinessRequest>().Attach(this);
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

        public static BusinessRequest GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.BusinessRequests.FirstOrDefault(m => m.ID == ID);
            }
        }

        public static List<BusinessRequest> GetAllUser()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                User U = User.GetByEmailID(Global.UserName);
                if (U == null) return new List<BusinessRequest>();
                
                if (U.UserType == (int)UserTypes.UT_Admin)
                    return context.BusinessRequests.GroupBy(m => m.UserID).Select(g => g.OrderByDescending(x => x.UserID).FirstOrDefault()).ToList();
                else
                    return context.BusinessRequests.Where(m => m.UserID == U.ID).GroupBy(m => m.UserID).Select(g => g.OrderByDescending(x => x.UserID).FirstOrDefault()).ToList();
            }
        }

        public static List<BusinessRequest> GetCompamnies(int UserID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.BusinessRequests.Where(m => m.UserID == UserID).ToList();
            }
        }

        public static List<BusinessRequest> GetAllBusinessRequst(int UserID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.BusinessRequests.Where(m => m.UserID == UserID).ToList();
            }
        }

        public static List<BusinessRequest> GetAll()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.BusinessRequests.ToList();
            }
        }

        public static List<CounterIntKey> GetStageCount()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.BusinessRequests.GroupBy(m => m.Stage).Select(g => new CounterIntKey() { Key = g.Key, Count = g.Count() }).ToList();
            }
        }
    }
}