using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class UploadFile : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        if (!IsPostBack)
        {
            lblID.Text = QueryString("id");
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            try
            {
                if (!Directory.Exists(Server.MapPath("/Documents/AdminDoc/")))
                    Directory.CreateDirectory(Server.MapPath("/Documents/AdminDoc/"));
                string ext = Path.GetExtension(FileUpload1.FileName);
                FileUpload1.SaveAs(Server.MapPath("/Documents/AdminDoc/" + lblID.Text + ext + ""));
                lblFileUploadMsg.Text = "File uploaded successfully";
                lblFileUploadMsg.ForeColor = System.Drawing.Color.Green;
                DscDetail DT = DscDetail.GetByID(Cmn.ToInt(lblID.Text));
                DT.Made = 1;
                DT.Save();
            }
            catch
            {
                lblFileUploadMsg.Text = "Error! uploading failed!";
                lblFileUploadMsg.ForeColor = System.Drawing.Color.Red;
            }
        }
        else
        {
            lblFileUploadMsg.Text = "Please select file to upload!";
            lblFileUploadMsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}