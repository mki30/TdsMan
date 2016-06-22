using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace TDSModel
{
    public partial class Note
    {
        public string Message = "";

        public Note()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public Note Save()
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
                            ID = context.Notes.Max(m => m.ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToNotes(this);
                    else
                    {
                        context.CreateObjectSet<Note>().Attach(this);
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

        public static Note GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Notes.FirstOrDefault(m => m.ID == ID);
            }
        }

        public static List<Note> GetByTableIDandPKId(TableID tableID, int PrimaryKeyID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Notes.Where(m => m.TableID == (int)tableID && m.PrimaryKeyID == PrimaryKeyID).OrderByDescending(m => m.Date).ToList();
            }
        }
    }
}