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
    public partial class MST_COMPANY
    {
        public string Message = "";

        public MST_COMPANY()
        {
        }

        public MST_COMPANY Save()
        {
            try
            {
                using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
                {

                    MST_COMPANY tempSociety = context.MST_COMPANY.FirstOrDefault(m => m.COMPANY_ID ==COMPANY_ID);

                    Boolean IsNew = tempSociety == null;

                    if (IsNew)
                    {
                        COMPANY_ID = 1;
                        try
                        {
                            COMPANY_ID = context.MST_COMPANY.Max(m => m.COMPANY_ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToMST_COMPANY(this);
                    else
                    {
                        if (tempSociety != null)
                            context.CreateObjectSet<MST_COMPANY>().Detach(tempSociety);
                        context.CreateObjectSet<MST_COMPANY>().Attach(this);
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
        public MST_COMPANY Delete()
        {
            try
            {
                using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
                {
                    context.CreateObjectSet<MST_COMPANY>().Attach(this);
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

         public static MST_COMPANY GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.MST_COMPANY.FirstOrDefault(m => m.COMPANY_ID == ID);
            }
        }

        public static List<MST_COMPANY> GetAll()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                if (Global.IsAdmin == true)
                    return context.MST_COMPANY.ToList();
                return context.MST_COMPANY.Where(m=>m.LICENSE_ID==Global.LicenseID).ToList();
            }
        }

        public static List<MST_COMPANY> GetAllCompanies()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                 return context.MST_COMPANY.ToList();
            }
        }

        public static void FillMST_COMPANYList(DropDownList ddCompany)
        {
            ddCompany.Items.Clear();
            List<MST_COMPANY> CL = MST_COMPANY.GetAll();
            foreach (MST_COMPANY c in CL)
            {
                ddCompany.Items.Add(new ListItem(c.COMPANY_NAME, c.COMPANY_ID.ToString()));
            }
        }
        
        public static MST_COMPANY GetByLicenceID(int LicenceID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.MST_COMPANY.FirstOrDefault(m => m.LICENSE_ID == LicenceID);
            }
        }

        public static MST_COMPANY GetByTanNo(string tanNo)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.MST_COMPANY.FirstOrDefault(m => m.TAN_NO == tanNo);
            }
        }
    }
}