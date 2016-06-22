using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class Controls_StageControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public void ShowStages(TableID tableID, int PrimaryKey)
    {
        lblID.Text = PrimaryKey.ToString();
        linkAddStage.HRef = "/AssignStage.aspx?id=0&tableid=" + (int)tableID + "&primarykeyid=" + PrimaryKey;
        
        StringBuilder sb = new StringBuilder();
        List<Stage> SL = Stage.GetByTableIDandPKId(tableID, PrimaryKey);
        if (SL.Count>0)
        {
            int ctr = 0;
            foreach (Stage S in SL)
            {
                ctr++;
                DateTime dt=Cmn.ToDate(S.Date);
                sb.Append("<button class='btn input-sm btn-default' title='" + dt.ToString("dd-MMM-yy hh:mm tt") + "'>" + Global.GetText((TransactionStage)S.StageID) + " <span class='badge'>");
                if (ctr ==SL.Count)
                    sb.Append( (DateTime.Now-dt).TotalMinutes.ToString("0"));
                else
                    sb.Append(S.Minuts != null ? S.Minuts : 0);
                sb.Append("</span></button>");
            }
            
            lblStages.Text =sb.ToString();
        }
        
    }
}