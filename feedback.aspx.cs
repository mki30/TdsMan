using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string mailbody = "<p>Name: " + txtName.Text + "</p>" +
                        "<p>Email ID: " + txtEmailID.Text + "</p>" +
                        "<p>Feedback: " + txtFeedback.Text + "</p>" +
                        "<br/><br/><p>Thanking You<br/>Team Fin Com India</p>";
        Cmn.SendEmail("Feedback", "contact@fincomindia.in", txtName.Text, Cmn.CreateMailStructure("Feedback", "contact@fincomindia.in", mailbody));

    }
}