using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class AddNotes : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e); if (!IsPostBack)
        {
            lblID.Text = QueryString("id");
            lblTableID.Text = QueryString("tableid");
            lblKeyID.Text = QueryString("primarykeyid");
            ShowData();
        }
    }

    private void ShowData()
    {
        if (lblID.Text != "0")
        {
            Note N = Note.GetByID(Cmn.ToInt(lblID.Text));
            if(N!=null)
            {
                lblTableID.Text = N.TableID.ToString();
                lblKeyID.Text = N.PrimaryKeyID.ToString();
                txtNotes.Text = N.Note1;
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Update();
    }

    private void Update()
    {
        Note N = Note.GetByID(Cmn.ToInt(lblID.Text));
        if (N == null)
            N = new Note();
        try
        {
            N.TableID = Cmn.ToInt(lblTableID.Text);
            N.PrimaryKeyID = Cmn.ToInt(lblKeyID.Text);
            N.Note1 = txtNotes.Text;
            if (lblID.Text == "0")
                N.Date = Cmn.GetIndiaTime();
            N.User = Global.UserID;
            N.Save();
            lblMsg.Text = "Saved!";
            lblMsg.ForeColor = System.Drawing.Color.Green;
        }
        catch 
        {
            lblMsg.Text = "There is some trouble data not saved!";
            lblMsg.ForeColor = System.Drawing.Color.Green;
        }
    }
}