using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace TDSModel
{
    public partial class Company
    {
        public string Message = "";

        public Company()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        
        public Company Save()
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
                            ID = context.Companies.Max(m => m.ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToCompanies(this);
                    else
                    {
                        context.CreateObjectSet<Company>().Attach(this);
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

        public static Company GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Companies.FirstOrDefault(m => m.ID == ID);
            }
        }

        public static List<Company> GetAll()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Companies.ToList();
            }
        }
    }
}