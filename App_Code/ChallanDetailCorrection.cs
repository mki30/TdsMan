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
    public partial class ChallanDetailCorrection
    {
        public string Message = "";

        public ChallanDetailCorrection()
        {
        }

        public static ChallanDetailCorrection GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.ChallanDetailCorrections.FirstOrDefault(m => m.ID == ID);
            }
        }

        public ChallanDetailCorrection Save()
        {
            try
            {
                using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
                {

                    ChallanDetailCorrection tempObj = context.ChallanDetailCorrections.FirstOrDefault(m => m.ID == ID);
                    Boolean IsNew = tempObj == null;

                    if (IsNew)
                    {
                        ID = 1;
                        try
                        {
                            ID = context.TRN_DEDUCTEE_DETAILS.Max(m => m.DEDUCTEE_DETAIL_ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToChallanDetailCorrections(this);
                    else
                    {
                        if (tempObj != null)
                            context.CreateObjectSet<ChallanDetailCorrection>().Detach(tempObj);
                        context.CreateObjectSet<ChallanDetailCorrection>().Attach(this);
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
    }
}