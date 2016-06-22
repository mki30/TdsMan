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
    public partial class MST_DEDUCTEE
    {
        public string Message = "";

        public MST_DEDUCTEE()
        {
        }

        public static List<MST_DEDUCTEE> GetList(int CompanyID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.MST_DEDUCTEE.Where(m => m.COMPANY_ID == CompanyID).ToList();
            }
        }
        
        public MST_DEDUCTEE Save()
        {
            try
            {
                using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
                {

                    Boolean IsNew = false;

                    if (DEDUCTEE_ID == 0)
                    {
                        DEDUCTEE_ID = 1;
                        try
                        {
                            DEDUCTEE_ID = context.MST_DEDUCTEE.Max(m => m.DEDUCTEE_ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;
                    
                    if (IsNew)
                        context.AddToMST_DEDUCTEE(this);
                    else
                    {
                        context.CreateObjectSet<MST_DEDUCTEE>().Attach(this);
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
        public MST_DEDUCTEE Delete()
        {
            try
            {
                using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
                {
                    context.CreateObjectSet<MST_DEDUCTEE>().Attach(this);
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


        public static MST_DEDUCTEE GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.MST_DEDUCTEE.FirstOrDefault(m => m.DEDUCTEE_ID ==ID);
            }
        }
        
        public static MST_DEDUCTEE GetByPan(string dedPan)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.MST_DEDUCTEE.FirstOrDefault(m => m.DEDUCTEE_PAN == dedPan);
            }
        }

        public static List<MST_DEDUCTEE> GetByCompanyID(int CompanyID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.MST_DEDUCTEE.Where(m => m.COMPANY_ID == CompanyID).ToList();
            }
        }
    }
}