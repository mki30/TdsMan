using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace TDSModel
{
    public partial class KnowledgePortal
    {
        public string Message = "";

        public KnowledgePortal()
        {
        }

        public KnowledgePortal Save()
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
                            ID = context.KnowledgePortals.Max(m => m.ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToKnowledgePortals(this);
                    else
                    {
                        context.CreateObjectSet<KnowledgePortal>().Attach(this);
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
        public static KnowledgePortal GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.KnowledgePortals.FirstOrDefault(m => m.ID == ID);
            }
        }
        public static KnowledgePortal GetByName(string Name)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.KnowledgePortals.FirstOrDefault(m => m.Name == Name);
            }
        }
        public static List<KnowledgePortal> GetByParentId()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.KnowledgePortals.Where(m => m.ParentID != 0 && m.ParentID != null).ToList();
            }
        }

        public static List<KnowledgePortal> GetAll()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.KnowledgePortals.ToList();
            }
        }

        
    }
}