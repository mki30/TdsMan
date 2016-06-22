using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace TDSModel
{
    public partial class License
    {
        public string Message = "";
        public List<TDSModel.User> UserList = new List<TDSModel.User>();

        public License()
        {
        }
        public License Save()
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
                            ID = context.Licenses.Max(m => m.ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToLicenses(this);
                    else
                    {
                        context.CreateObjectSet<License>().Attach(this);
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

        public static License GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Licenses.FirstOrDefault(m => m.ID == ID);
            }
        }
      
        public static List<License> GetAll(int licenseId = -1)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                if (licenseId == -1)
                    return context.Licenses.ToList();
                else
                    return context.Licenses.Where(m => m.ID == licenseId).ToList();
            }
        }

        public static List<License> GetListByID(int licenseId)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Licenses.Where(m => m.ID == licenseId).ToList();
            }
        }
    }
}