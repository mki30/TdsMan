using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class Controls_NotesControl : System.Web.UI.UserControl
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Global.CurrentUserType == UserTypes.UT_Customer)
            linkAddNotes.Visible = false;
    }
    
    public void ShowNotes(TableID tableID, int PrimaryKey)
    {
        lblID.Text = PrimaryKey.ToString();
        linkAddNotes.HRef = "/AddNotes.aspx?id=0&tableid=" + (int)tableID + "&primarykeyid=" + PrimaryKey;

        StringBuilder sb = new StringBuilder();
        List<Note> NL = Note.GetByTableIDandPKId(tableID, PrimaryKey);
        int ctr = 0;
        if (NL.Count > 0)
        {

            sb.Append("<table class='table table-bordered' style='width:100%; text-align:left !important;'>");
            foreach (Note N in NL)
            {
                User U = TDSModel.User.GetByID(Cmn.ToInt(N.User));

                sb.Append("<tr><tr><td>" + (++ctr)
                    + "<td style='text-align:left;'>");
                if (Global.CurrentUserType == UserTypes.UT_Admin)
                    sb.Append("<a class='fancybox350 fancybox.iframe' href='/AddNotes.aspx?id=" + N.ID + "&tableid=" + (int)TableID.DSC + "&primarykeyid=" + lblID.Text + "'>" + N.Note1 + "");
                else
                    sb.Append(N.Note1);
                sb.Append("<td style='width:100px;'>" + Cmn.ToDate(N.Date).ToString("dd-MMM-yy hh:mm tt") + "</a>");
                if (Global.CurrentUserType != UserTypes.UT_Customer)
                    sb.Append("<td>" + U.Name);
            }
            sb.Append("</table>");
            lblNoteList.Text = sb.ToString();
        }
    }
}