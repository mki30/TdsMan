using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class AssignStage : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        if (!IsPostBack)
        {
            //lblID.Text = QueryString("id");
            lblStage.Text = QueryString("stage");
            lblTableID.Text = QueryString("tableid");
            lblKeyID.Text = QueryString("primarykeyid");
            ddAssignStage.SelectedValue = lblStage.Text;
            foreach (TransactionStage stage in Enum.GetValues(typeof(TransactionStage)))
            {
                if (stage == TransactionStage.All)
                    continue;
                ddAssignStage.Items.Add(new ListItem(Global.GetText(stage).ToString(), ((int)stage).ToString()));
            }
        }
    }
    protected void ddAssignStage_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Cmn.ToInt(lblTableID.Text) == (int)TableID.DSC)
        {
            //Stage MaxStage = Stage.GetMaxStage((int)TableID.DSC, Cmn.ToInt(lblKeyID.Text)); //Get maximum stage from stage table 
            //if (MaxStage == null || Cmn.ToInt(ddAssignStage.SelectedValue) != MaxStage.StageID)
            //{
            //    try
            //    {
            //        Stage S = new Stage()
            //        {
            //            TableID = Cmn.ToInt(lblTableID.Text),
            //            PrimaryKeyID = Cmn.ToInt(lblKeyID.Text),
            //            Note = "",
            //            Date = Cmn.GetIndiaTime(),
            //            StageID = Cmn.ToInt(ddAssignStage.SelectedValue),
            //            Minuts = MaxStage == null ? 0 : Cmn.ToDate(DateTime.Now - MaxStage.Date).Minute,
            //        };
            //        S.Save();
            Stage S = Stage.NewStage(Cmn.ToInt(lblTableID.Text), Cmn.ToInt(lblKeyID.Text), Cmn.ToInt(ddAssignStage.SelectedValue));
            if (S != null)
            {
                DscDetail DT = DscDetail.GetByID(Cmn.ToInt(S.PrimaryKeyID));
                if (DT != null)
                {
                    DT.DscStage = Cmn.ToInt(ddAssignStage.SelectedValue);
                    DT.Date = Cmn.GetIndiaTime();
                    DT.Save();
                    lblStageMsg.Text = "Now in " + ddAssignStage.SelectedItem.Text + " stage!";
                    lblStageMsg.ForeColor = System.Drawing.Color.Green;
                }
            }
            //}
            //catch
            //{
            //    lblStageMsg.Text = "Error!";
            //    lblStageMsg.ForeColor = System.Drawing.Color.Red;
            //}
            //}
        }

        //if (Cmn.ToInt(lblTableID.Text) == (int)TableID.DSC)
        //{
        //    DscDetail DT = DscDetail.GetByID(Cmn.ToInt(lblID.Text));
        //    if (DT != null)
        //    {
        //        DT.DscStage = Cmn.ToInt(ddAssignStage.SelectedValue);
        //        try
        //        {
        //            DT.EntryTime = DateTime.Now;
        //            DT.DscStage = Cmn.ToInt(ddAssignStage.SelectedValue);
        //            DT.Save();
        //            Stage MaxStage = Stage.GetbyMaxDate((int)TableID.DSC, DT.ID);
        //            if (Cmn.ToInt(ddAssignStage.SelectedValue) != MaxStage.StageID || MaxStage == null)
        //            {
        //                Stage S = new Stage()
        //                {
        //                    TableID = (int)TableID.DSC,
        //                    PrimaryKeyID = Cmn.ToInt(lblID.Text),
        //                    Note = "",
        //                    Date = Cmn.GetIndiaTime(),
        //                    StageID = Cmn.ToInt(ddAssignStage.SelectedValue),
        //                    Minuts = MaxStage == null ? 0 : Cmn.ToDate(DateTime.Now - MaxStage.Date).Minute,
        //                };
        //                S.Save();
        //            }
        //            lblStageMsg.Text = "Now in " + ddAssignStage.SelectedItem.Text + " stage!";
        //            lblStageMsg.ForeColor = System.Drawing.Color.Green;
        //        }
        //        catch
        //        {
        //            lblStageMsg.Text = "Error!";
        //            lblStageMsg.ForeColor = System.Drawing.Color.Red;
        //        }
        //    }
        //}

        else if (Cmn.ToInt(lblTableID.Text) == (int)TableID.BuyBusiness)
        {
            Stage MaxStage = Stage.GetMaxStage((int)TableID.BuyBusiness, Cmn.ToInt(lblKeyID.Text));
            if (MaxStage == null || Cmn.ToInt(ddAssignStage.SelectedValue) != MaxStage.StageID)
            {
                Stage S = new Stage()
                {
                    TableID = Cmn.ToInt(lblTableID.Text),
                    PrimaryKeyID = Cmn.ToInt(lblKeyID.Text),
                    Note = "",
                    Date = Cmn.GetIndiaTime(),
                    StageID = Cmn.ToInt(ddAssignStage.SelectedValue),
                    Minuts = MaxStage == null ? 0 : Cmn.ToDate(DateTime.Now - MaxStage.Date).Minute,
                };
                S.Save();
            }
        }
    }
}