using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace TDSModel
{
    public partial class Stage
    {
        public string Message = "";

        public Stage()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public Stage Save()
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
                            ID = context.Stages.Max(m => m.ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToStages(this);
                    else
                    {
                        context.CreateObjectSet<Stage>().Attach(this);
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

        public static Stage GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Stages.FirstOrDefault(m => m.ID == ID);
            }
        }

        public static List<Stage> GetByTableIDandPKId(TableID TableID, int PrimaryKeyID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Stages.Where(m => m.TableID == (int)TableID && m.PrimaryKeyID == PrimaryKeyID).OrderByDescending(m => m.Date).ToList();
            }
        }

        public static Stage GetByTableIDPKIdandStageID(int TableID, int PKID, int StageID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Stages.FirstOrDefault(m => m.TableID == TableID && m.PrimaryKeyID == PKID && m.StageID == StageID);
            }
        }

        //public static Stage GetbyMaxDate(int TableID, int PKID)
        //{
        //    using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
        //    {
        //        return context.Stages.Where(m => m.TableID == TableID && m.PrimaryKeyID == PKID).OrderByDescending(m => m.Date).FirstOrDefault();
        //    }
        //}
        public static Stage GetMaxStage(int tableID, int primarykeyID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Stages.Where(m => m.TableID == tableID && m.PrimaryKeyID == primarykeyID).OrderByDescending(m => m.Date).FirstOrDefault();
            }
        }

        public static Stage NewStage(int tableID, int primaryKeyID, int SelectedStageID)
        {
            Stage MaxStage = Stage.GetMaxStage(tableID, primaryKeyID);
            if (MaxStage == null || SelectedStageID != MaxStage.StageID)
            {
                Stage S = new Stage()
                {
                    TableID = tableID,
                    PrimaryKeyID = primaryKeyID,
                    Note = "",
                    Date = Cmn.GetIndiaTime(),
                    StageID = SelectedStageID,
                    Minuts = MaxStage == null ? 0 : Cmn.ToDate(DateTime.Now - MaxStage.Date).Minute,
                };
                S.Save();
                return S;
            }
            return null;
        }
    }
}