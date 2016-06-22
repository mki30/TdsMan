using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class BusinessSell : BasePage
{
    int id = 0;
    protected new void Page_Load(object sender, EventArgs e)
    {
        btnFile1.Attributes.Add("onclick", "$('#" + FileUpload1.ClientID + "').click();return false;");
        btnFile2.Attributes.Add("onclick", "$('#" + FileUpload2.ClientID + "').click();return false;");
        btnFile3.Attributes.Add("onclick", "$('#" + FileUpload3.ClientID + "').click();return false;");
        btnFile4.Attributes.Add("onclick", "$('#" + FileUpload4.ClientID + "').click();return false;");
        //if (Global.CurrentUserType == UserTypes.UT_Admin || Global.CurrentUserType == UserTypes.UT_AgentAdmin)
        if (Global.LogInDone)
        {
            serviceFee.Visible = true;
            approved.Visible = true;
            CINRow.Visible = true;
            //lblModified1.Text = "<span style='color:green'>Please select a file in .jpg/.pdf format</span>";
            //lblModified2.Text = "<span style='color:green'>Please select a file in .jpg/.pdf format</span>";
        }

        id = QueryStringInt("ID");
        if (!IsPostBack)
        {
            lblID.Text = id.ToString();
            FillCompanyTypeDropDown();
            FillStateDropDown();
            FillYearDropDowns();

            ShowData();
        }
        if (lblID.Text == "0")
        {
            //lblDoownloadBS.Text = "<span style='color:green'>Please select a file in .jpg/.pdf format</span>";
            //lblDoownloadPL.Text = "<span style='color:green'>Please select a file in .jpg/.pdf format</span>";
        }
    }
    private void FillStateDropDown()
    {
        ddState.Items.Add(new ListItem("--Select--", ""));
        foreach (KeyValuePair<int, string> kvp in Global.State)
        {
            ddState.Items.Add(new ListItem(kvp.Value, (kvp.Key.ToString())));
        }
    }

    private void FillCompanyTypeDropDown()
    {
        ddCompanyType.Items.Add(new ListItem("--Select--", ""));
        foreach (CompanyType companytype in Enum.GetValues(typeof(CompanyType)))
        {
            if (companytype == CompanyType.Co_operatives || companytype == CompanyType.Joint_Hindu_Family || companytype == CompanyType.Partnership_Firm)
                continue;
            ddCompanyType.Items.Add(new ListItem(Global.GetText(companytype).ToString(), ((int)companytype).ToString()));
        }
    }

    private void FillYearDropDowns()
    {
        for (int i = DateTime.Today.Year; i > 1956; i--)
        {
            ddYearOfIncorp.Items.Add(new ListItem((i - 1) + "-" + i, (i - 1) + "-" + i));

        }
        for (int i = DateTime.Today.Year; i > 1990; i--)
        {
            //ddYearOfIncorp.Items.Add(new ListItem((i - 1) + "-" + i, (i - 1) + "-" + i));
            ddTurnoverYear1.Items.Add(new ListItem((i - 1) + "-" + i, (i - 1) + "-" + i));
            ddTurnoverYear2.Items.Add(new ListItem((i - 1) + "-" + i, (i - 1) + "-" + i));
            ddAssessmentDone.Items.Add(new ListItem((i - 1) + "-" + i, (i - 1) + "-" + i));
        }
    }

    private void ShowData()
    {
        //if (Global.CurrentUserType != UserTypes.UT_Admin)
        if (!Global.LogInDone)
        {
            if (id != 0)
                btnSubmit.Visible = false;
            //lblID.Text = "0";
            //return;
        }
        SellBusiness SB = SellBusiness.GetByID(Cmn.ToInt(lblID.Text));
        if (SB != null)
        {
            txtListinHeadline.Text = SB.HeadLine;
            txtGeneralSummary.Text = SB.GeneralSummary;
            ddCompanyType.SelectedValue = SB.CompanyType.ToString();
            ddState.SelectedValue = SB.RegState.ToString();
            txtCity.Text = SB.City;
            ddYearOfIncorp.SelectedValue = SB.YearOfIncorporation;
            txtCapital.Text = SB.Capital.ToString();
            ddTurnoverYear1.SelectedValue = SB.LastTurnoverYr1;
            ddTurnoverYear2.SelectedValue = SB.LastTurnoverYr2;
            txtTurnoverAmount1.Text = SB.LastTurnoverAmount1.ToString();
            txtTurnoverAmount2.Text = SB.LastTurnoverAmount2.ToString();
            txtNetProfit1.Text = SB.lastNetProfit1.ToString();
            txtNetProfit2.Text = SB.lastNetProfit2.ToString();
            ddAssessmentDone.SelectedValue = SB.AssessmentDoneUpto;
            chkOkToAssesment.Checked = (SB.OkToAssessment == 1 ? true : false);
            txtNetWorth.Text = SB.NetWorth.ToString();
            txtAskingPrice.Text = SB.AskingPrice.ToString();
            //txtServiceFee.Text = SB.ServiceFee.ToString();
            txtEmail.Text = SB.EmailID;
            txtContact.Text = SB.ContactNo;
            txtCin.Text = SB.CIN;
            txtRelatedIndustry.Text = SB.RelatedIndustry;
            string[] dirIdProofMBL = Directory.GetFiles(Server.MapPath("~/Documents/ModifiedBalanceSheet/"), "" + SB.ID + "*");
            if (dirIdProofMBL.Length > 0)
            {
                BLPreview.Visible = true;
                aMBLPreview.HRef = "/preview.aspx?id=" + SB.ID.ToString() + "&sheet=BL";
            }
            string[] dirIdProofMPL = Directory.GetFiles(Server.MapPath("~/Documents/ModifiedProfitLossSheet/"), "" + SB.ID + "*");
            if (dirIdProofMPL.Length > 0)
            {
                PLPreview.Visible = true;
                aMPLPreview.HRef = "/preview.aspx?id=" + SB.ID.ToString() + "&sheet=PL";
            }
            //if (File.Exists(Server.MapPath("~/Documents/ModifiedBalanceSheet/" + SB.ID + ".jpeg")))
            //{
            //    BLPreview.Visible = true;
            //    aMBLPreview.HRef = "/preview.aspx?id=" + SB.ID.ToString() + "&sheet=BL";
            //}
            //if (File.Exists(Server.MapPath("/Documents/ModifiedProfitLossSheet/" + SB.ID + ".jpeg")))
            //{
            //    PLPreview.Visible = true;
            //    aMPLPreview.HRef = "/preview.aspx?id=" + SB.ID.ToString() + "&sheet=PL";
            //}
            ////if (SB.Approved == 0 || SB.Approved == null)
            //    chkApproved.Checked = false;
            //else
            //    chkApproved.Checked = true;
            //txtExpiryDate.Text = (SB.ListingExpiryDate == DateTime.MinValue || Cmn.ToDate(SB.ListingExpiryDate).Year >= 2050) ? "" : Cmn.ToDate(SB.ListingExpiryDate).ToString("dd-MMM-yyyy");
            //if (Global.CurrentUserType == UserTypes.UT_Admin)
            if (Global.LogInDone)
            {
                tdModified1.Visible = true;
                tdModified2.Visible = true;
                string[] dirIdProof = Directory.GetFiles((Server.MapPath("/Documents/BalanceSheet/")), "" + SB.ID + "*");
                if (dirIdProof.Length > 0)
                {
                    string file = "getimage?id=" + SB.ID + "&type=" + "BalanceSheet"; //"/Documents/BalanceSheet/" + dirIdProof[0].Split('\\').Last();
                    lblDoownloadBS.Text = "<a href='" + file + "' target='_blank'>Download BS&nbsp;<i class='glyphicon glyphicon-download-alt'></i></a>";
                }
                string[] dirAddressProof = Directory.GetFiles((Server.MapPath("/Documents/ProfitLossSheet/")), "" + SB.ID + "*");
                if (dirAddressProof.Length > 0)
                {
                    string file = "getimage?id=" + SB.ID + "&type=" + "ProfitLossSheet";//"/Documents/ProfitLossSheet/" + dirAddressProof[0].Split('\\').Last();
                    lblDoownloadPL.Text = "<a href='" + file + "' target='_blank'>&nbsp;Download P/L Account&nbsp;<i class='glyphicon glyphicon-download-alt'></i></a>";
                }
            }
            WriteClientScript("var ID=" + SB.ID + ";");
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        UpdateData();
    }

    private void UpdateData()
    {
        SellBusiness SB = SellBusiness.GetByID(Cmn.ToInt(lblID.Text));

        if (SB == null)
        {

            SB = SellBusiness.GetByHeadLine(txtListinHeadline.Text);
            if (SB != null)
            {
                Msg.Visible = true;
                lblMessage.Text = "Business with same headline already exists";
                return;
            }
            else
                SB = new SellBusiness();
            TDSModel.User uer = TDSModel.User.GetByEmailID(txtEmail.Text);
            if (uer == null)
                TDSModel.User.CreateLogin(txtEmail.Text, txtEmail.Text, txtContact.Text);
            else
                TDSModel.User.LoginAlreadyExists(txtEmail.Text, txtEmail.Text, txtContact.Text);
        }

        try
        {
            SB.HeadLine = txtListinHeadline.Text;
            SB.GeneralSummary = txtGeneralSummary.Text;
            SB.CompanyType = Cmn.ToInt(ddCompanyType.SelectedValue);
            SB.RegState = Cmn.ToInt(ddState.SelectedValue);
            SB.City = txtCity.Text;
            SB.YearOfIncorporation = ddYearOfIncorp.SelectedValue;
            SB.Capital = Cmn.ToDbl(txtCapital.Text);
            SB.LastTurnoverYr1 = ddTurnoverYear1.SelectedValue;
            SB.LastTurnoverYr2 = ddTurnoverYear2.SelectedValue;
            SB.LastTurnoverAmount1 = Cmn.ToDbl(txtTurnoverAmount1.Text);
            SB.LastTurnoverAmount2 = Cmn.ToDbl(txtTurnoverAmount2.Text);
            SB.lastNetProfit1 = Cmn.ToDbl(txtNetProfit1.Text);
            SB.lastNetProfit2 = Cmn.ToDbl(txtNetProfit2.Text);
            SB.AssessmentDoneUpto = ddAssessmentDone.SelectedValue;
            SB.OkToAssessment = chkOkToAssesment.Checked ? 1 : 0;
            SB.NetWorth = Cmn.ToDbl(txtNetWorth.Text);
            SB.AskingPrice = Cmn.ToDbl(txtAskingPrice.Text);
            SB.ServiceFee = Cmn.ToDbl(txtServiceFee.Text);
            SB.RelatedIndustry = txtRelatedIndustry.Text;
            SB.EmailID = txtEmail.Text;
            SB.ContactNo = txtContact.Text;
            SB.CIN = txtCin.Text;
            if (chkApproved.Checked == true)
                SB.Approved = 1;
            else
                SB.Approved = 0;
            SB.ListingExpiryDate = txtExpiryDate.Text == "" ? DateTime.Now.AddMonths(2) : Cmn.ToDate(txtExpiryDate.Text);
            SB.Save();
            if (SB.OrderNo == null)
            {
                SB.OrderNo = DateTime.Now.ToString("ddMMyy") + ((int)TransType.SellBusiness).ToString("00") + (SB.ID).ToString("0000");
                SB.Save();
            }
            lblID.Text = SB.ID.ToString();
            string docpath1 = Server.MapPath("~/import/" + Global.FileNameID);
            if (File.Exists(docpath1))
            {
                string folder = @"\Documents\BalanceSheet";
                string path = Server.MapPath(folder);
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);
                string ext = Global.FileNameID.Contains("jpg") ? ".jpg" : (Global.FileNameID.Contains(".pdf") ? ".pdf" : "");
                string curpath = Server.MapPath("/Documents/BalanceSheet/" + SB.ID + "" + ext);
                System.IO.File.Copy(docpath1, curpath, true);
            }
            string docpath2 = Server.MapPath("~/import/" + Global.FileNameAdd);
            if (File.Exists(docpath2))
            {
                string folder = @"\Documents\ProfitLossSheet";
                string path = Server.MapPath(folder);
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);
                string ext = Global.FileNameID.Contains("jpg") ? ".jpg" : (Global.FileNameID.Contains(".pdf") ? ".pdf" : "");
                string curpath = Server.MapPath("/Documents/ProfitLossSheet/" + SB.ID + "" + ext);
                System.IO.File.Copy(docpath2, curpath, true);
            }
            //if (FileUpload1.HasFile)
            //{
            //    string folder = @"\Documents\BalanceSheet";
            //    string path = Server.MapPath(folder);
            //    if (!Directory.Exists(path))
            //        Directory.CreateDirectory(path);

            //    if (DeleteExistingFile(folder, id.ToString()))
            //    {
            //        String ext = System.IO.Path.GetExtension(FileUpload1.FileName);
            //        if (ext == ".pdf" || ext == ".jpg")
            //            FileUpload1.SaveAs(Server.MapPath("/Documents/BalanceSheet/" + SB.ID + "" + ext));
            //        else
            //        {
            //            lblDoownloadBS.Text = "<span style='color:red'>Selected file is not in .jpg/.pdf format</span>";
            //            return;
            //        }
            //    }
            //}

            //if (FileUpload2.HasFile)
            //{
            //    string folder = @"\Documents\ProfitLossSheet";
            //    string path = Server.MapPath(folder);
            //    if (!Directory.Exists(path))
            //        Directory.CreateDirectory(path);

            //    if (DeleteExistingFile(folder, id.ToString()))
            //    {
            //        String ext = System.IO.Path.GetExtension(FileUpload2.FileName);
            //        if (ext == ".pdf" || ext == ".jpg")
            //            FileUpload2.SaveAs(Server.MapPath("/Documents/ProfitLossSheet/" + SB.ID + "" + ext));
            //        else
            //        {
            //            lblDoownloadPL.Text = "<span style='color:red'>Selected file is not in .jpg/.pdf format</span>"; return;
            //        }
            //    }
            //}


            if (FileUpload3.HasFile)
            {
                string folder = @"\Documents\ModifiedBalanceSheet";
                string path = Server.MapPath(folder);
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                if (DeleteExistingFile(folder, id.ToString()))
                {
                    String ext = System.IO.Path.GetExtension(FileUpload3.FileName);
                    if (ext == ".jpg" || ext == ".pdf")
                    {
                        FileUpload3.SaveAs(Server.MapPath("/Documents/ModifiedBalanceSheet/" + SB.ID + "" + ext));
                        aMBLPreview.HRef = "/preview.aspx?id=" + SB.ID.ToString() + "&sheet=BL";
                    }
                    else
                    {
                        lblModified1.Text = "<span style='color:red'>Selected file is not in .jpeg format</span>"; return;
                    }
                }
            }
            if (FileUpload4.HasFile)
            {
                string folder = @"\Documents\ModifiedProfitLossSheet";
                string path = Server.MapPath(folder);
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                if (DeleteExistingFile(folder, id.ToString()))
                {
                    String ext = System.IO.Path.GetExtension(FileUpload4.FileName);
                    if (ext == ".jpg" || ext == ".pdf")
                        FileUpload4.SaveAs(Server.MapPath("/Documents/ModifiedProfitLossSheet/" + SB.ID + "" + ext));
                    aMPLPreview.HRef = "/preview.aspx?id=" + SB.ID.ToString() + "&sheet=PL";
                }
            }
            if (Global.CurrentUserType != UserTypes.UT_Admin)
            {
                if (SB.EmailID != "")
                {
                    string mailBody = "<p>Dear " + SB.EmailID + ", </P>" +
                   "<p>We thank you for choosing our services.</p>" +
                   "<p>This is to confirm that we have successfully listed your company.<p>" +
                   "<br/><p>In case you have any query, kindly call us on <br/><a href='tel:01204322456'>(0120) 432-2456</a><br/><a href='tel:919650606247'>+91 9650606247</a><br/><a href='tel:918826693260'>+91 8826693260</a><br/><br/> or write us at <br/><a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p>" +
                   "<p>Your Order Number is:<b>" + SB.OrderNo + "</h4></b>" +
                   "<br/><p>Thanking You<br/>Team Fin Com India</p>";
                    Cmn.SendEmail("Business submitted", SB.EmailID, SB.EmailID, Cmn.CreateMailStructure("Business submitted", SB.EmailID, mailBody));
                }
            }

            lblErrorMsg.Text = "Successfully saved!";
            lblErrorMsg.CssClass = "label label-success pull-right";

            if (Global.CurrentUserType == UserTypes.UT_Customer)
            {
                divSummary.Visible = true;
                divMainForm.Visible = false;
            }
        }
        catch
        {
            lblErrorMsg.Text = "Error!";
        }
    }
    protected void btnModifiedBalanceSheetUpload_Click(object sender, EventArgs e)
    {
        SellBusiness sb = SellBusiness.GetByID(Cmn.ToInt(lblID.Text));
        if (FileUpload3.HasFile)
        {
            string folder = @"\Documents\ModifiedBalanceSheet";
            string path = Server.MapPath(folder);
            if (!Directory.Exists(path))
                Directory.CreateDirectory(path);

            if (DeleteExistingFile(folder, id.ToString()))
            {
                String ext = System.IO.Path.GetExtension(FileUpload3.FileName);
                if (ext == ".pdf" || ext == ".jpg")
                    FileUpload3.SaveAs(Server.MapPath("/Documents/ModifiedBalanceSheet/" + sb.ID + "" + ext));
                aMBLPreview.HRef = "/preview.aspx?id=" + sb.ID.ToString() + "&sheet=BL";
            }
        }


    }
    protected void btnModifiedPLUpload_Click(object sender, EventArgs e)
    {
        SellBusiness sb = SellBusiness.GetByID(Cmn.ToInt(lblID.Text));
        if (FileUpload4.HasFile)
        {
            string folder = @"\Documents\ModifiedProfitLossSheet";
            string path = Server.MapPath(folder);
            if (!Directory.Exists(path))
                Directory.CreateDirectory(path);

            if (DeleteExistingFile(folder, id.ToString()))
            {
                String ext = System.IO.Path.GetExtension(FileUpload4.FileName);
                if (ext == ".pdf" || ext == ".jpg")
                    FileUpload4.SaveAs(Server.MapPath("/Documents/ModifiedProfitLossSheet/" + sb.ID + "" + ext));
                aMPLPreview.HRef = "/preview.aspx?id=" + sb.ID.ToString() + "&sheet=PL";
            }
        }
    }
    private bool DeleteExistingFile(string folder, string id)
    {
        string[] files = Directory.GetFiles(Server.MapPath(folder), "" + id + "*");
        if (files.Length > 0)
        {
            foreach (string s in files)
            {
                try
                {
                    string fileame = s.Split('\\').Last();
                    FileInfo fi = new FileInfo(Server.MapPath(folder + "\\" + fileame + ""));
                    if (fi != null)
                        fi.Delete();
                }
                catch { return false; }
            }
        }
        return true;
    }
}