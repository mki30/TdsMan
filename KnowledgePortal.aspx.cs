using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;
using System.Text;

public partial class KnowledgePortal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string KNew = Request.QueryString["kp"];
        List<TDSModel.KnowledgePortal> kplist = TDSModel.KnowledgePortal.GetAll();
        if (!IsPostBack)
        {
            if (kplist.Count > 0)
            {
                ddParent.Items.Clear();
                ddParent.Items.Add(new ListItem("Select Parent", "0"));
                foreach (TDSModel.KnowledgePortal kp in kplist.Where(m => m.ParentID == 0))
                {
                    ddParent.Items.Add(new ListItem(kp.Name.ToString(), kp.ID.ToString()));
                }
                ShowList();
                if (KNew != "")
                    ShowData(Cmn.ToInt(KNew));
            }
        }

    }
    void ShowData(int ID)
    {
        edit.Visible = true;
        TDSModel.KnowledgePortal knew = TDSModel.KnowledgePortal.GetByID(ID);
        if (knew != null)
        {
            txtName.Value = knew.Name;
            txtContent.Value = Cmn.GetUnCompressed(knew.Content, (int)knew.ContentSize);
            ddParent.SelectedValue = knew.ParentID.ToString();
            ltText.Text = "<h3>" + knew.Name + "</h3>" + "<br/>" + "<p>" + Cmn.GetUnCompressed(knew.Content, (int)knew.ContentSize) + "</p>";
        }
        
    }
    void ShowList()
    {
        List<TDSModel.KnowledgePortal> list = TDSModel.KnowledgePortal.GetAll();
        StringBuilder str = new StringBuilder();
        GetChild(list, 0, str);
        ltList.Text = str.ToString();
    }

    void GetChild(List<TDSModel.KnowledgePortal> list, int ParentID, StringBuilder str)
    {
        str.Append("<ul>");
        foreach (TDSModel.KnowledgePortal kp in list.Where(m => m.ParentID == ParentID))
        {
            str.Append("<li><a href='?kp=" + kp.ID + "'>" + kp.Name + "</a></li>");
            GetChild(list, kp.ID, str);
        }
        str.Append("</ul>");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        TDSModel.KnowledgePortal knew = TDSModel.KnowledgePortal.GetByName(txtName.Value);
        if (knew == null)
        {
            knew = new TDSModel.KnowledgePortal();
            knew.ID = 0;
            knew.Name = txtName.Value;
            knew.ParentID = Cmn.ToInt(ddParent.SelectedValue);
            knew.Content = Cmn.GetCompressed(txtContent.Value);
            knew.ContentSize = Cmn.ToInt(txtContent.Value.Length);
            knew.Save();
        }
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        edit.Visible = true;
        txtName.Value = "";
        txtContent.Value = "";
        ddParent.SelectedValue = "0";
        ltText.Text = "";
    }
}