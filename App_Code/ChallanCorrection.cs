using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace TDSModel
{
    public partial class ChallanCorrection
    {
        public string Message = "";

        public ChallanCorrection()
        {

        }

        public ChallanCorrection Save()
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
                            ID = context.ChallanCorrections.Max(m => m.ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToChallanCorrections(this);
                    else
                    {
                        context.CreateObjectSet<ChallanCorrection>().Attach(this);
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

        public static ChallanCorrection GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.ChallanCorrections.FirstOrDefault(m => m.ID == ID);
            }
        }
    }
}