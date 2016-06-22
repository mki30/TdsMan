using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace TDSModel
{
    public partial class MST_ASSESSMENT
    {
        public string Message = "";
        public MST_ASSESSMENT()
        {
        }
        public MST_ASSESSMENT Save()
        {
            try
            {
                using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
                {
                    Boolean IsNew = false;

                    if (ASST_ID == 0)
                    {
                        ASST_ID= 1;
                        try
                        {
                            ASST_ID = context.MST_ASSESSMENT.Max(m => m.ASST_ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToMST_ASSESSMENT(this);
                    else
                    {
                        context.CreateObjectSet<MST_ASSESSMENT>().Attach(this);
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
        
        public static MST_ASSESSMENT GetByID(int ASSID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.MST_ASSESSMENT.FirstOrDefault(m => m.ASST_ID == ASSID);
            }
        }

        public static List<MST_ASSESSMENT> GetAll()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.MST_ASSESSMENT.ToList();
            }
        }
    }
}