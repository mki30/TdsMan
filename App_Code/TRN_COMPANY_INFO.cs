using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace TDSModel
{
    public partial class TRN_COMPANY_INFO
    {
        public string Message = "";

        public TRN_COMPANY_INFO()
        {
        }

        public TRN_COMPANY_INFO Save()
        {
            try
            {
                using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
                {
                    Boolean IsNew = false;

                    if (COMPANY_INFO_ID == 0)
                    {
                        COMPANY_INFO_ID = 1;
                        try
                        {
                            COMPANY_INFO_ID = context.TRN_COMPANY_INFO.Max(m => m.COMPANY_INFO_ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToTRN_COMPANY_INFO(this);
                    else
                    {
                        context.CreateObjectSet<TRN_COMPANY_INFO>().Attach(this);
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

        public static TRN_COMPANY_INFO GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_COMPANY_INFO.FirstOrDefault(m => m.COMPANY_INFO_ID == ID);
            }
        }

        public static TRN_COMPANY_INFO GetByBasicInfoID(int basicInfoID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.TRN_COMPANY_INFO.FirstOrDefault(m => m.BASIC_INFO_ID == basicInfoID);
            }
        }
    }
}