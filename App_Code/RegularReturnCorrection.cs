using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace TDSModel
{
    public partial class RegularReturnCorrection
    {
        public string Message = "";

        public RegularReturnCorrection()
        {
        }

        public RegularReturnCorrection Save()
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
                            ID = context.RegularReturnCorrections.Max(m => m.ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToRegularReturnCorrections(this);
                    else
                    {
                        context.CreateObjectSet<RegularReturnCorrection>().Attach(this);
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
        public static RegularReturnCorrection GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.RegularReturnCorrections.FirstOrDefault(m => m.ID == ID);
            }
        }
    }
}