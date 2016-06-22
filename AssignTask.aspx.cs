using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class AssignTask : BasePage
{
    int transtype = 0;
    protected new void Page_Load(object sender, EventArgs e)
    {
        string taskid = QueryString("taskid", "");
        string agentid = QueryString("agentid", "");
        transtype = QueryStringInt("transtype", 0);

        if (taskid != "")
        {
            lblTaskId.Text = taskid;
        }

        if (!IsPostBack)
        {
            ddAgents.Items.Add(new ListItem("--Select--", ""));
            if (Global.CurrentUserType == UserTypes.UT_Admin)
            {
                foreach (License l in Global.LicenseList.Where(m=>m.LicenseType==1))
                {
                    ddAgents.Items.Add(new ListItem(l.Name, l.ID.ToString()));
                }
            }
            else if (Global.CurrentUserType == UserTypes.UT_AgentAdmin)
            {
                License license=Global.LicenseList.FirstOrDefault(m=>m.ID==Global.LicenseID);
                foreach (User AL in license.UserList)
                {
                    ddAgents.Items.Add(new ListItem(AL.Name, AL.ID.ToString()));
                }
            }
        }

    }
    protected void ddAgents_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddAgents.SelectedIndex == 0)
        {
            lblMsg.Text = "Please select valid agent!";
            lblMsg.ForeColor = System.Drawing.Color.Red;
            return;
        }
        if (transtype == (int)TransType.Incorporate)
        {
            Contact C = Contact.GetByID(Cmn.ToInt(lblTaskId.Text));
            if (C != null)
            {
                try
                {
                    C.AgentId = Cmn.ToInt(ddAgents.SelectedValue);
                    C.Save();
                    lblMsg.Text = "Assigned To: " + ddAgents.SelectedItem.Text;
                    lblMsg.ForeColor = System.Drawing.Color.Green;
                }
                catch
                {
                    lblMsg.Text = "Something goer wrong! Not assigned!";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        else if (transtype == (int)TransType.Dsc)
        {
            DscDetail DT = DscDetail.GetByID(Cmn.ToInt(lblTaskId.Text));
            if (DT != null)
            {
                try
                {
                    User firstAgentAdmin;
                    if (Global.CurrentUserType == UserTypes.UT_Admin)
                    {
                        //Get first agent admin by licence and assign task to it
                        firstAgentAdmin = TDSModel.User.GetAgentAdmin(Cmn.ToInt(ddAgents.SelectedValue));
                        if (firstAgentAdmin != null)
                            DT.AgentId = firstAgentAdmin.ID;
                    }
                    else
                    {
                        DT.AgentId = Cmn.ToInt(ddAgents.SelectedValue);
                    }
                    Stage S=Stage.NewStage((int)TableID.DSC, DT.ID, (int)TransactionStage.Assigned);
                    if (S != null)
                    {
                        DT.DscStage = (int)TransactionStage.Assigned;
                        //DT.Sta = S.ID;
                        DT.Save();
                    }
                    lblMsg.Text = "Assigned To: " + ddAgents.SelectedItem.Text;
                    lblMsg.ForeColor = System.Drawing.Color.Green;
                }
                catch
                {
                    lblMsg.Text = "Error! Not assigned!";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

    }
}