using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;
//using iTextSharp.text;
//using iTextSharp.text.pdf;

public partial class DscApplicationForm : BasePage
{
    //public string Data1 = "";
    public ClassType classType = ClassType.Class2;
    protected void Page_Init(object sender, EventArgs e)
    {
        var master = (MasterPage2)Page.Master;
        master.OnSomethingSelected += MasterSelected;
        
    }
    private void MasterSelected(object sender, string selectedValue)
    {
        ShowData();
    }
    protected new void Page_Load(object sender, EventArgs e)
    {

        btnFile1.Attributes.Add("onclick", "$('#" + FileUpload1.ClientID + "').click();return false;");
        btnFile2.Attributes.Add("onclick", "$('#" + FileUpload2.ClientID + "').click();return false;");
        btnFile3.Attributes.Add("onclick", "$('#" + FileUpload5.ClientID + "').click();return false;");
        btnFile4.Attributes.Add("onclick", "$('#" + FileUpload3.ClientID + "').click();return false;");
        btnFile5.Attributes.Add("onclick", "$('#" + FileUpload4.ClientID + "').click();return false;");
        //Register an event handler which will be invoked from the user control
        this.PaymentControl.ehClick += new EventHandler(this.btnPageButton_Click);
        Data1 = RouteData.Values["Data1"] != null ? RouteData.Values["Data1"].ToString() : "";
        if (Data1 == "class3")
            classType = ClassType.Class3;
        else if (Data1 == "dgft")
            classType = ClassType.DGFT;

        if (!IsPostBack)
        {
            //Data1 = RouteData.Values["Data1"] != null ? RouteData.Values["Data1"].ToString() : "";

            if (Data1 == "class2")
            {
                Title = "DSC-Registration-Class2";
                heading.InnerText = "DSC Application Class 2";
                //formDownload.HRef = "/Forms/class2ind.pdf";
                lblClassType.InnerText = "2";
            }
            else if (Data1 == "class3")
            {
                classType = ClassType.Class3;
                Title = "DSC-Registration-Class3";
                heading.InnerText = "DSC Application Class 3";
                //formDownload.HRef = "/Forms/STPL_RA_C3_Individual.pdf";
                lblClassType.InnerText = "3";
            }
            if (Data1 == "dgft")
            {
                classType = ClassType.DGFT;
                ddUserType.SelectedValue = "2";
                ddCertificateType.SelectedValue = "0";
                certfTypeRow.Attributes.Add("style", "display:none");
                userTypeRow.Attributes.Add("style", "display:none");
                Title = "DSC-Registration-DGFT";
                heading.InnerText = "DSC Application DGFT";
                lblClassType.InnerText = "4";
            }
            string Id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
            if (Id != "")
            {
                base.Page_Load(sender, e);
                clearButton.Visible = false;
                btnSubmit.Text = "Save";
                lblID.InnerText = Id.ToString();
                if (Global.CurrentUserType != UserTypes.UT_Customer)
                {
                    //divNotes.Visible = true;
                    //divStage.Visible = true;
                    //divDocument.Visible = true;
                    divForAdmin.Visible = true;
                    NotesControl.ShowNotes(TableID.DSC, Cmn.ToInt(lblID.InnerText));
                    StageControl.ShowStages(TableID.DSC, Cmn.ToInt(lblID.InnerText));
                }
                ShowData();
            }
            else
                ShowData();
        }

    }

    protected void btnPageButton_Click(object sender, EventArgs e)   //Payment Button Click
    {
        DscDetail DT = DscDetail.GetByID(Cmn.ToInt(lblID.InnerText));
        if (DT != null)
        {
            try
            {
                DT.Paid = 1;
                DT.DscStage = (int)TransactionStage.Unassigned;
                DT.Save();
                ChangeStage((int)TableID.DSC, DT.ID);

                if (DT.Email != "")
                {
                    EmailControl.EmailInit("dsc", "tc", DT.ID, true);
                    EmailControl.EmailInit("dsc", "invoice", DT.ID, true);
                    EmailControl.EmailInit("dsc", "documents", DT.ID, true);
                    //string addressPart = "<br/><p>As chosen by you, our representative will contact you within one working day to pick the documents from you.</p>";
                    //if (DT.PickupAtDoor == 1)
                    //{
                    //    addressPart = "<p><br/>As chosen by you, kindly courier the documents to our address below:</p>" +
                    //        "<p>Garg Shekhar & Company,</p>" +
                    //        "<p>T - 5, Third Floor,</p>" +
                    //        "<p>Above Croma Showroom,</p>" +
                    //        "<p>Aditya City Centre,</p>" +
                    //        "<p>Indirapuram,</p>" +
                    //        "<p>Ghaziabad – 201014</p>";
                    //}
                    //string mailBody_TransactionComplete =
                    //         "<p>Dear <b>" + DT.ApplicantName + "</b></P><br/>" +
                    //         "<p>We thank you for choosing our services.</p>" +
                    //         "<p>This is to confirm that we have successfully received your order for Digital Signature Certificate.<p>" +
                    //         "<p><br/>The summary of your order is as below:</p>" +
                    //         "<p>Name: " + DT.ApplicantName + "</p>" +
                    //         "<p>Signature Type: " + ((CertificateType)DT.CirtificateType).ToString() + "</p>" +
                    //         "<p>Validity: " + ((CertificateValidity)DT.CirtificateType).ToString() + " year</p>" +
                    //         "<p>Address: " + DT.Address + "<br/></p>" +
                    //         "<br/><p>Your order will be completed in 2 Working days. In case you have any query, kindly call us on <br/><a href='tel:01204322456'>(0120) 432-2456</a><br/><a href='tel:919650606247'>+91 9650606247</a><br/><a href='tel:918826693260'>+91 8826693260</a><br/><br/> or write us at <br/><a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p>" +
                    //         "<p>Your Order Number is:<b>" + DT.OrderNo + "</h4></b>" + addressPart +
                    //         "<br/><p>Thanking You<br/>Team Fin Com India</p>";
                    //Cmn.SendEmail("Transaction Successful:FinComIndia", DT.Email, DT.ApplicantName, Cmn.CreateMailStructure("Transaction Successful", DT.Email, mailBody_TransactionComplete));

                    //string invoiceLink = "http://fincomindia.in/getinvoice/?id=" + DT.ID + "&type=" + TransType.Dsc;
                    //string mailBody_Invoice =
                    //"<p>Dear <b>" + DT.ApplicantName + "</b></P><br/>" +
                    //"<p>We thank you for choosing our services.</p>" +
                    //"<p>Kindly find attached herewith the Invoice for your payment towards the Digital Signature Certificate.<p><br/>" +
                    //"<p><a href='" + invoiceLink + "' target='_blank'>Get your invoice</a><p><br/>" +
                    //"<p>In case you have any query kindly call us on <br/><a href='tel:01204322456'>(0120) 432-2456</a><br/><a href='tel:919650606247'>+91 9650606247</a><br/><a href='tel:918826693260'>+91 8826693260</a><br/> or write us at <br/><a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p><br/><br/>" +
                    //"<p>Thanking You<br/>Team Fin Com India</p>";
                    //Cmn.SendEmail("Invoice:FinComIndia", DT.Email, DT.ApplicantName, Cmn.CreateMailStructure("Invoice", DT.Email, mailBody_Invoice));//Invoice Mail

                    //string mailBody_DocumentSubmition =
                    //         "<p>Dear <b>" + DT.ApplicantName + "</b></P><br/>" +
                    //         "<p>We thank you for choosing our services.</p>" +
                    //         "<p>Our representative will call you shortly for collecting the documents .<p><br/>" +
                    //         "<p>You can reach us on this no <a href='tel:01204322456'>(0120) 432-2456</a><br/><br/> or write us at <br/><a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p><br/><br/>" +
                    //         "<p>Thanking You<br/>Team Fin Com India</p>";
                    //Cmn.SendEmail("Document submission:FinComIndia", DT.Email, DT.ApplicantName, Cmn.CreateMailStructure("Document submission", DT.Email, mailBody_DocumentSubmition)); //Document Submition Mail

                    PaymentControl.ShowMsg("Payment successfully done! For further detail please check your email!");
                    Response.Redirect("/confirmation");

                    //lblPaymtMsg.Text = "Payment successfully done! For further detail please check your email!";
                    //lblPaymtMsg.ForeColor = System.Drawing.Color.Green;
                }
            }
            catch
            {
                PaymentControl.ShowMsg("Error!");
                //lblPaymtMsg.Text = "Error!";
                //lblPaymtMsg.ForeColor = System.Drawing.Color.Red;
            }
        }

    }

    private void ShowData()
    {
        nationality.SelectedValue = "1";
        string linkIdProof = "";
        string linkAddressProof = "";
        DscDetail DT = DscDetail.GetByID(Cmn.ToInt(lblID.InnerText));
        if (lblID.InnerText != "0")
        {
            tdDownload1.Visible = true;
            tdDownload2.Visible = true;
        }
        if (DT != null)
        {
            lblID.InnerText = DT.ID.ToString();
            classType = (ClassType)DT.ClassType;
            ddUserType.SelectedValue = DT.UserType.ToString();
            ddCertificateType.SelectedValue = DT.CirtificateType.ToString();
            ddCertificateValidity.SelectedValue = DT.CertificateValidity.ToString();
            ddUsbToken.SelectedValue = DT.NeedUsbToken.ToString();
            givenname.Text = DT.ApplicantName;
            surname.Text = DT.Surname;
            initial.Text = DT.Initial;
            orgnames.Text = DT.OrganizationName;
            dptmt.Text = DT.Department;
            ddGender.SelectedValue = DT.Gender.ToString();
            txtDOB.Text = Cmn.ToDate(DT.DOB).ToString("dd-MMM-yy");
            address.Text = DT.Address;
            postalcodes.Text = DT.PostalCode.ToString();
            district.Text = DT.District;
            state.SelectedValue = DT.State;
            pannos.Text = DT.Pan;
            nationality.SelectedValue = DT.Nationality.ToString();
            mobilenumber.Text = DT.MobileNo;
            emailid.Text = DT.Email;
            identificationdocs.SelectedValue = DT.IdentificationDocument.ToString();
            iddocnumber.Text = DT.IdentificationDocumentNo;
            if (DT.UserType == 0)
            {
                addrsproofdocs.SelectedValue = DT.AddressProofDocument.ToString();
            }
            if (DT.UserType == 1)
            {
                certitruecopyorg.SelectedValue = DT.AddressProofDocument.ToString();
            }

            physicalverification.SelectedItem.Value = DT.PickupAtDoor.ToString();
            aPinCheck.InnerHtml = DT.PickupAtDoor == 1 ? "<i class='fa fa-check'></i>" : "";
            if (DT.PickupAtDoor.ToString() == "1")
                pickNote.Attributes.Remove("style");// .Style.Add("display", "block");
            if (DT.PickupAtDoor.ToString() == "2")
            {
                pickPin.Attributes.Remove("style");
                pickAddress.Attributes.Remove("style");
            }
            if (DT.PickupAtDoor.ToString() == "3")
            {
                CourierNote.Attributes.Remove("style");
            }
            if (DT.PickupAtDoor == 3)//in case of courier documents
                WriteClientScript("courierDocuments=true;" + "var phyver=" + DT.PickupAtDoor + ";" + "var ID=" + DT.ID + ";");
            else
                WriteClientScript("courierDocuments=false;" + "var phyver=" + DT.PickupAtDoor + ";" + "var ID=" + DT.ID + ";");
            pickupaddress.Text = DT.PickupAddress;
            pickuppostal.Text = DT.PickupAddressPostal.ToString();
            chkDownloaded.Checked = (DT.Downloaded == 1 ? true : false);
            chkComplete.Checked = (DT.Complete == 1 ? true : false);
            chkDocReceived.Checked = (DT.DocReceived == 1 ? true : false);
            chkDelete.Checked = (DT.Delete == 1 ? true : false);
            txtBillNo.Text = DT.BillNo;
            txtCompany.Text = DT.Company;

            //Documents
            string idProofDwnloadText = "Download";
            string AddressProofDwnloadText = "Download";
            string CertifiationOrganisation = "Download";
            string linkcertificate = "";
            if (DT != null)
            {
                idProofDwnloadText = Global.GetText((IdentificDocType)DT.IdentificationDocument);
                AddressProofDwnloadText = Global.GetText((AdressProofDocType)DT.AddressProofDocument);
                CertifiationOrganisation = Global.GetText((CertificateOrganisation)DT.AddressProofDocument);
            }
            string[] dirIdProof = Directory.GetFiles((Server.MapPath("/Documents/IdProof/")), "" + DT.ID + "*");
            if (dirIdProof.Length > 0)
            {
                string file = "/Documents/IdProof/" + dirIdProof[0].Split('\\').Last();
                linkIdProof = "<a href='" + "/getimage?id=" + DT.ID + "&type=IdProof" + "' target='_blank'>" + idProofDwnloadText + "&nbsp;<i class='glyphicon  glyphicon-download'></i></a>";
            }
            string[] dirAddressProof = Directory.GetFiles((Server.MapPath("/Documents/AddressProof/")), "" + DT.ID + "*");
            if (dirAddressProof.Length > 0)
            {
                string file = "/Documents/AddressProof/" + dirAddressProof[0].Split('\\').Last();
                linkAddressProof = "<a href='" + "/getimage?id=" + DT.ID + "&type=AddressProof" + "' target='_blank'>" + AddressProofDwnloadText + "&nbsp;<i class='glyphicon  glyphicon-download'></i></a>";
            }
            string[] dirCerOrg = Directory.GetFiles((Server.MapPath("/Documents/AddressProof/")), "" + DT.ID + "*");
            if (dirCerOrg.Length > 0)
            {
                string file = "/Documents/AddressProof/" + dirCerOrg[0].Split('\\').Last();
                linkcertificate = "<a href='" + "/getimage?id=" + DT.ID + "&type=AddressProof" + "' target='_blank'>" + CertifiationOrganisation + "&nbsp;<i class='glyphicon  glyphicon-download'></i></a>";
            }
            string[] dirApplicatonForm = Directory.GetFiles((Server.MapPath("/Documents/Form/")), "" + DT.ID + "*");
            if (dirApplicatonForm.Length > 0)
            {
                string file = "/Documents/Form/" + dirApplicatonForm[0].Split('\\').Last();
                lblDownloadApplicationForm.Text = "<a href='" + file + "' target='_blank'>Download&nbsp;<i class='glyphicon  glyphicon-download'></i></a>";
            }
            lblOrderNo.Text = DT.OrderNo;
            lblTransactionId.Text = DT.TransactionID == null || DT.TransactionID == "" ? "Not available" : DT.TransactionID;
            lblPayment.Text = DT.Paid == 1 ? "<span style='color:green'><i class='fa fa-check'></i></span>" : "<span style='color:red'><i class='fa fa-times'></i></span>";
            lblIdProof.Text = linkIdProof;
            lblView1.Text = linkIdProof;
            lblAddressProof.Text = linkAddressProof;
            lblView2.Text = linkAddressProof;
            lblView3.Text = linkcertificate;
            string[] dirAdminDoc = Directory.GetFiles((Server.MapPath("/Documents/AdminDoc/")), "" + DT.ID + "*");
            string cirtificateDownloadLink = "<a class='fancybox350 fancybox.iframe' href='/UploadFile.aspx?id=" + DT.ID + "'>Upload&nbsp;<i class='glyphicon glyphicon-upload'></i></a>";
            if (dirAdminDoc.Length > 0)
            {
                string file = "/Documents/AdminDoc/" + dirAdminDoc[0].Split('\\').Last();
                cirtificateDownloadLink = "<a href='" + file + "' target='_blank'>Download&nbsp;<i class='glyphicon  glyphicon-download'></i></a>";
            }
            lblCertificate.Text = cirtificateDownloadLink;

            lblStage.Text = "<a href='/Assignstage.aspx?id=" + DT.ID + "&stage=" + DT.DscStage + "&tableid=" + (int)TableID.DSC + "&primarykeyid=" + DT.ID + "' class='fancybox350 fancybox.iframe'>" + (DT.DscStage != null ? Global.GetText((TransactionStage)DT.DscStage) : "stage") + "</a>";
            TDSModel.User u = null;
            if (DT.AgentId != null)
                Global.UserList.TryGetValue((int)DT.AgentId, out u);
            lblAssignTask.Text = "<a class='fancybox350 fancybox.iframe' href='/AssignTask.aspx?taskid=" + DT.ID + "&transtype=" + (int)(TransType.Dsc) + "&agentid=" + (DT.AgentId != null ? DT.AgentId : 0) + "' target='blank'>" + (u != null ? u.Name : "Assign") + "</a>";

            ltDocCouriered.Text = "<a href='/sendmail?type=dsc&mailtype=courier&id=" + DT.ID + "' target='_blank'>Send mail courier done</a>";
            ltDocNotRecievd.Text = "<a href='/sendmail?type=dsc&mailtype=nodocrecieved&id=" + DT.ID + "' target='_blank'>Send mail doc not received</a>";

        }
        else
        {
            WriteClientScript("courierDocuments=false;showFromLocal=true;");
        }
    }

    //public void WriteClientScript(string Client_Script)
    //{
    //    ClientScriptManager cs = ClientScript;
    //    string csname1 = "S1";
    //    if (!cs.IsClientScriptBlockRegistered(GetType(), csname1))
    //    {
    //        StringBuilder cstext2 = new StringBuilder();
    //        cstext2.Append("<script language='javascript' type=text/javascript> \n");
    //        cstext2.Append(Client_Script);
    //        cstext2.Append("</script>");
    //        cs.RegisterClientScriptBlock(GetType(), csname1, cstext2.ToString(), false);
    //    }
    //}

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Update();

    }

    private bool Update()
    {
        if (ValidateForm() == false)
            return false;
        DscDetail DT = DscDetail.GetByID(Cmn.ToInt(lblID.InnerText));
        if (DT == null)
        {
            DT = new DscDetail();
            TDSModel.User user = TDSModel.User.GetByEmailID(emailid.Text);
            if (user == null)
                TDSModel.User.CreateLogin(givenname.Text, emailid.Text, mobilenumber.Text);
            else
                TDSModel.User.LoginAlreadyExists(givenname.Text, emailid.Text, mobilenumber.Text);
        }
        try
        {
            DT.ClassType = (int)((ClassType)classType);
            DT.UserType = Cmn.ToInt(ddUserType.SelectedValue);
            DT.CirtificateType = Cmn.ToInt(ddCertificateType.SelectedValue);
            DT.CertificateValidity = Cmn.ToInt(ddCertificateValidity.SelectedValue);
            DT.NeedUsbToken = Cmn.ToInt(ddUsbToken.SelectedValue);
            DT.ApplicantName = givenname.Text;
            DT.Surname = surname.Text;
            DT.Initial = initial.Text;
            DT.OrganizationName = orgnames.Text;
            DT.Department = dptmt.Text;
            DT.Gender = Cmn.ToInt(ddGender.SelectedValue);
            DT.DOB = Cmn.ToDate(txtDOB.Text);
            DT.Address = address.Text;
            DT.PostalCode = Cmn.ToInt(postalcodes.Text);
            DT.District = district.Text;
            DT.State = state.SelectedValue;
            DT.Pan = pannos.Text;
            DT.Nationality = Cmn.ToInt(nationality.SelectedValue);
            DT.MobileNo = mobilenumber.Text;
            DT.Email = emailid.Text;
            DT.IdentificationDocument = Cmn.ToInt(identificationdocs.SelectedValue);
            DT.IdentificationDocumentNo = iddocnumber.Text;
            DT.AddressProofDocument = ddUserType.SelectedValue == "0" ? Cmn.ToInt(addrsproofdocs.SelectedValue) : Cmn.ToInt(certitruecopyorg.SelectedValue);
            DT.PickupAtDoor = Cmn.ToInt(GetFormString("ctl00$ContentPlaceHolder1$physicalverification"));// physicalverification.SelectedValue
            DT.PickupAddressPostal = Cmn.ToInt(GetFormString("ctl00$ContentPlaceHolder1$physicalverification") == "1" ? postalcodes.Text : GetFormString("ctl00$ContentPlaceHolder1$physicalverification") == "2" ? pickuppostal.Text : "");
            DT.PickupAddress = GetFormString("ctl00$ContentPlaceHolder1$physicalverification") == "1" ? address.Text : GetFormString("ctl00$ContentPlaceHolder1$physicalverification") == "2" ? pickupaddress.Text : "";
            DT.BillNo = txtBillNo.Text;
            DT.Company = txtCompany.Text;

            if (DT.ID == 0)
            {
                DT.Date = Cmn.GetIndiaTime();
                DT.EntryTime = Cmn.GetIndiaTime();
                DT.DscStage = (int)TransactionStage.Unassigned;
            }

            DT.Downloaded = chkDownloaded.Checked ? 1 : 0;
            DT.DocReceived = chkDocReceived.Checked ? 1 : 0;

            int LastCompleteStatus = DT.Complete == null ? 0 : (int)DT.Complete;
            DT.Complete = chkComplete.Checked ? 1 : 0;
            DT.Delete = chkDelete.Checked ? 1 : 0;
            if (chkComplete.Checked && LastCompleteStatus != DT.Complete)
            {
                DT.CompletionDate = DateTime.Now;
            }

            DT.Save();

            if (DT.OrderNo == null) //Create Order No
            {
                DT.OrderNo = DateTime.Now.ToString("ddMMyy") + ((int)TransType.Dsc).ToString("00") + (DT.ID).ToString("0000");
                DT.Save();
            }
            lblID.InnerText = DT.ID.ToString();
            FillForms();
            if (DT.Email != "")
            {
                string mailBody = "<p>Dear " + DT.Email + ", </P>" +
               "<p>We thank you for choosing our services.</p>" +
               "<p>This is to confirm that you have successfully applied for dsc.<p>" +
               "<br/><p>In case you have any query, kindly call us on <br/><a href='tel:01204322456'>(0120) 432-2456</a><br/><a href='tel:919650606247'>+91 9650606247</a><br/><a href='tel:918826693260'>+91 8826693260</a><br/><br/> or write us at <br/><a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p>" +
               "<p>Your Order Number is:<b>" + DT.OrderNo + "</h4></b>" +
               "<br/><p>Thanking You<br/>Team Fin Com India</p>";
                string[] files = { Server.MapPath("~/Documents/Form/" + DT.ID + "_Page1.jpg"), Server.MapPath("~/Documents/Form/" + DT.ID + "_Page2.jpg") };
                Cmn.SendEmail("DSC Application Submitted", DT.Email, DT.Email, Cmn.CreateMailStructure("DSC Application Submitted", DT.Email, mailBody), files);
            }

            string docpath1 = Server.MapPath("~/import/" + Global.FileNameID);
            if (File.Exists(docpath1))
            {
                string ext = Global.FileNameID.Contains("jpg") ? ".jpg" : (Global.FileNameID.Contains(".pdf") ? ".pdf" : "");
                string curpath = Server.MapPath("~/Documents/IdProof/" + DT.ID + "" + ext);
                System.IO.File.Move(docpath1, curpath);
            }
            string docpath2 = Server.MapPath("~/import/" + Global.FileNameAdd);
            if (File.Exists(docpath2))
            {
                string ext = Global.FileNameAdd.Contains("jpg") ? ".jpg" : (Global.FileNameAdd.Contains(".pdf") ? ".pdf" : "");
                string curpath = Server.MapPath("~/Documents/AddressProof/" + DT.ID + "" + ext);
                System.IO.File.Move(docpath2, curpath);
            }

            tdCertCost.InnerText = hidCertificateCost.Value;
            tdTokenCost.InnerText = hidTokenPrice.Value;
            tdServiceTax.InnerText = hidServiceTax.Value + "%";
            lblTotalCost.Text = Math.Round((Cmn.ToDbl(hidCertificateCost.Value) + Cmn.ToDbl(hidTokenPrice.Value) + ((Cmn.ToDbl(hidCertificateCost.Value) * (Cmn.ToDbl(hidServiceTax.Value) / 100)))), 2).ToString(); //hidTotalCost.Value;
            WriteClientScript("$(document).ready(function() {ClearForm(); alert('Successfully Saved!'); });");
            if (DT.Paid != 1)
            {
                divSummary.Visible = true;
                divMainForm.Visible = false;
                divMainForm.Visible = false;
                lblID.InnerText = DT.ID.ToString();
                if (Global.CurrentUserType == UserTypes.UT_Admin)
                    DeductBalance.Visible = true;
                if (Global.CurrentUserType == UserTypes.UT_Admin)
                    divAutoPay.Visible = true;
            }

        }
        catch
        {
            //lblMsg.Text = "Error! Not Saved!";
            //lblMsg.ForeColor = System.Drawing.Color.Red;
            //ShowMessage("Error! Not Saved!", 1);
            WriteClientScript("$(document).ready(function() { alert('Error! Not Saved!'); });");
        }
        return true;
    }
    public void FillForms()
    {
        DscDetail DT = DscDetail.GetByID(Cmn.ToInt(lblID.InnerText));
        if (DT != null)
        {
            if (ddUserType.SelectedValue == "0")
            {
                FillFormFields(DT);
                FillFormFields2(DT);
            }
            else
            {
                FillFormFieldsorg(DT);
                FillFormFields2org(DT);
            }
        }
    }
    private void ChangeStage(int tableID, int primarykeyID)
    {
        Stage MaxStage = Stage.GetMaxStage(tableID, primarykeyID);
        if (MaxStage == null)
        {
            try
            {
                Stage S = new Stage()
                {
                    TableID = tableID,
                    PrimaryKeyID = primarykeyID,
                    Note = "",
                    Date = Cmn.GetIndiaTime(),
                    StageID = (int)TransactionStage.Unassigned,
                    Minuts = MaxStage == null ? 0 : Cmn.ToDate(DateTime.Now - MaxStage.Date).Minute,
                };
                S.Save();
                DscDetail DT = DscDetail.GetByID(Cmn.ToInt(S.PrimaryKeyID));
                if (DT != null)
                {
                    DT.DscStage = S.StageID;
                    DT.Date = Cmn.GetIndiaTime();
                    DT.Save();
                }
            }
            catch
            {
            }
        }
    }
    private void FillFormFields2org(DscDetail DT)
    {
        string sourceFile = Request.RawUrl.Contains("/dscregistration-class3") ? Server.MapPath("/Forms/class3org_page2.jpg") : Server.MapPath("/Forms/class2org_page2.jpg");
        string destFile = Server.MapPath("/Documents/Form/" + DT.ID + "_Page2.jpg");
        Bitmap bmp = new Bitmap(sourceFile);
        System.Drawing.Font fnt = new System.Drawing.Font("Arial", 14);
        SolidBrush brush = new SolidBrush(Color.Black);
        using (Graphics Gr = Graphics.FromImage((System.Drawing.Image)bmp))
        {
            switch (DT.AddressProofDocument.ToString())
            {
                case "39": Gr.DrawString("X", fnt, brush, 80, 307); break;
                case "37": Gr.DrawString("X", fnt, brush, 267, 307); break;
                case "38": Gr.DrawString("X", fnt, brush, 486, 307); break;
                case "36": Gr.DrawString("X", fnt, brush, 677, 307); break;
                case "40": Gr.DrawString("X", fnt, brush, 267, 359); break;
                case "41": Gr.DrawString("X", fnt, brush, 486, 359); break;
                case "43": Gr.DrawString("X", fnt, brush, 680, 359); break;
            }
            Gr.DrawString("X", fnt, brush, 81, 455);
            Gr.DrawString("X", fnt, brush, 268, 455);
        }
        bmp.Save(destFile, ImageFormat.Jpeg);
        fnt.Dispose();
        brush.Dispose();
        CreatePDF2(DT.ID);
    }
    private void FillFormFields2(DscDetail DT)
    {
        string sourceFile = Request.RawUrl.Contains("/dscregistration-class3") ? Server.MapPath("/Forms/class3ind_page2.jpg") : Server.MapPath("/Forms/class2ind_page2.jpg");
        string destFile = Server.MapPath("/Documents/Form/" + DT.ID + "_Page2.jpg");
        Bitmap bmp = new Bitmap(sourceFile);
        System.Drawing.Font fnt = new System.Drawing.Font("Arial", 14);
        SolidBrush brush = new SolidBrush(Color.Black);
        using (Graphics Gr = Graphics.FromImage((System.Drawing.Image)bmp))
        {
            switch (DT.AddressProofDocument.ToString())
            {
                case "9": Gr.DrawString("X", fnt, brush, 81, 484); break;
                case "95": Gr.DrawString("X", fnt, brush, 246, 484); break;
                case "92": Gr.DrawString("X", fnt, brush, 396, 484); break;
                case "160": Gr.DrawString("X", fnt, brush, 556, 484); break;
                case "10": Gr.DrawString("X", fnt, brush, 83, 543); break;
                case "159": Gr.DrawString("X", fnt, brush, 248, 543); break;
                case "93": Gr.DrawString("X", fnt, brush, 393, 543); break;
                case "163": Gr.DrawString("X", fnt, brush, 555, 543); break;
                case "161": Gr.DrawString("X", fnt, brush, 247, 599); break;
                case "162": Gr.DrawString("X", fnt, brush, 554, 599); break;

            }
            switch (DT.IdentificationDocument.ToString())
            {
                case "5": Gr.DrawString("X", fnt, brush, 81, 311); break;
                case "409": Gr.DrawString("X", fnt, brush, 215, 311); break;
                case "2": Gr.DrawString("X", fnt, brush, 366, 311); break;
                case "157": Gr.DrawString("X", fnt, brush, 525, 311); break;
                case "158": Gr.DrawString("X", fnt, brush, 696, 311); break;
                case "91": Gr.DrawString("X", fnt, brush, 219, 355); break;
            }

        }
        bmp.Save(destFile, ImageFormat.Jpeg);
        fnt.Dispose();
        brush.Dispose();
        //CreatePDF2(DT.ID);
    }
    private void FillFormFieldsorg(DscDetail DT)
    {
        string sourceFile = Request.RawUrl.Contains("/dscregistration-class3") ? Server.MapPath("/Forms/class3org_page1.jpg") : Server.MapPath("/Forms/class2org_page1.jpg");
        string destFile = Server.MapPath("/Documents/Form/" + DT.ID + "_Page1.jpg");
        Bitmap bmp = new Bitmap(sourceFile);
        System.Drawing.Font fnt = new System.Drawing.Font("Arial", 14);
        SolidBrush brush = new SolidBrush(Color.Black);
        using (Graphics Gr = Graphics.FromImage((System.Drawing.Image)bmp))
        {
            Gr.DrawString((DT.CertificateValidity == 0 ? "X" : ""), fnt, brush, 179, 191);
            Gr.DrawString((DT.CertificateValidity == 1 ? "X" : ""), fnt, brush, 260, 191);
            Gr.DrawString((DT.CirtificateType == 1 ? "X" : ""), fnt, brush, 445, 191);
            Gr.DrawString((DT.CirtificateType == 2 ? "X" : ""), fnt, brush, 569, 191);
            Gr.DrawString(DT.ApplicantName, fnt, brush, 255, 273);
            Gr.DrawString(DT.Surname, fnt, brush, 64, 273);
            Gr.DrawString(DT.Initial, fnt, brush, 454, 273);
            Gr.DrawString(DT.Email, fnt, brush, 64, 327);
            Gr.DrawString(DT.Address, fnt, brush, 243, 414);
            Gr.DrawString(DT.District, fnt, brush, 243, 471);
            Gr.DrawString(DT.State, fnt, brush, 657, 471);
            Gr.DrawString(DT.OrganizationName, fnt, brush, 244, 379);
            Gr.DrawString(DT.Department, fnt, brush, 672, 646);
            Gr.DrawString(DT.PostalCode.ToString(), fnt, brush, 244, 510);
            Gr.DrawString(DT.MobileNo, fnt, brush, 689, 510);
            Gr.DrawString(DT.Pan.Substring(0, 1), fnt, brush, 248, 644);
            Gr.DrawString(DT.Pan.Substring(1, 1), fnt, brush, 277, 644);
            Gr.DrawString(DT.Pan.ToString().Substring(2, 1), fnt, brush, 303, 644);
            Gr.DrawString(DT.Pan.ToString().Substring(3, 1), fnt, brush, 333, 644);
            Gr.DrawString(DT.Pan.ToString().Substring(3, 1), fnt, brush, 367, 644);
            Gr.DrawString(DT.Pan.ToString().Substring(4, 1), fnt, brush, 399, 644);
            Gr.DrawString(DT.Pan.ToString().Substring(5, 1), fnt, brush, 429, 644);
            Gr.DrawString(DT.Pan.ToString().Substring(6, 1), fnt, brush, 459, 644);
            Gr.DrawString(DT.Pan.ToString().Substring(7, 1), fnt, brush, 491, 644);
            Gr.DrawString(DT.Pan.ToString().Substring(8, 1), fnt, brush, 520, 644);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Day.ToString().Length == 1 ? "0" : Cmn.ToDate(DT.DOB).Day.ToString().Substring(0, 1), fnt, brush, 466, 329);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Day.ToString().Length > 1 ? Cmn.ToDate(DT.DOB).Day.ToString().Substring(1, 1) : Cmn.ToDate(DT.DOB).Day.ToString().Substring(0, 1), fnt, brush, 496, 329);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Month.ToString().Length == 1 ? "0" : Cmn.ToDate(DT.DOB).Month.ToString().Substring(0, 1), fnt, brush, 522, 329);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Month.ToString().Length > 1 ? Cmn.ToDate(DT.DOB).Month.ToString().Substring(1, 1) : Cmn.ToDate(DT.DOB).Month.ToString().Substring(0, 1), fnt, brush, 552, 329);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Year.ToString().Substring(0, 1), fnt, brush, 582, 330);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Year.ToString().Substring(1, 1), fnt, brush, 600, 330);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Year.ToString().Substring(2, 1), fnt, brush, 628, 330);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Year.ToString().Substring(3, 1), fnt, brush, 654, 330);
            switch (DT.IdentificationDocument.ToString())
            {
                case "5": Gr.DrawString("X", fnt, brush, 69, 583); break;
                case "409": Gr.DrawString("X", fnt, brush, 131, 583); break;
                case "2": Gr.DrawString("X", fnt, brush, 228, 583); break;
                case "157": Gr.DrawString("X", fnt, brush, 312, 583); break;
                case "158": Gr.DrawString("X", fnt, brush, 395, 583); break;
                case "91": Gr.DrawString("X", fnt, brush, 475, 583); break;

            }
            Gr.DrawString(Cmn.ToDate(DT.DOB).Date.ToString("00").Substring(1, 1), fnt, brush, 2080, 1396);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Year.ToString().Substring(0, 1), fnt, brush, 2400, 1396);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Year.ToString().Substring(1, 1), fnt, brush, 2500, 1396);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Year.ToString().Substring(2, 1), fnt, brush, 2600, 1396);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Year.ToString().Substring(3, 1), fnt, brush, 2700, 1396);
            Gr.DrawString(DT.Address, fnt, brush, 1032, 1591);
            Gr.DrawString(DT.District, fnt, brush, 1036, 1902);
            string state = "";
            Global.State.TryGetValue(Cmn.ToInt(DT.State), out state);
            Gr.DrawString(state, fnt, brush, 2764, 1902);
            Gr.DrawString(DT.PostalCode.ToString(), fnt, brush, 1036, 2054);
            Gr.DrawString(DT.MobileNo, fnt, brush, 2115, 2054);
        }
        bmp.Save(destFile, ImageFormat.Jpeg);
        fnt.Dispose();
        brush.Dispose();
        CreatePDF(DT.ID);
    }
    private void FillFormFields(DscDetail DT)
    {
        string sourceFile = Request.RawUrl.Contains("/dscregistration-class3") ? Server.MapPath("/Forms/class3ind_page1.jpg") : Server.MapPath("/Forms/class2ind_page1.jpg");
        string destFile = Server.MapPath("/Documents/Form/" + DT.ID + "_Page1.jpg");
        Bitmap bmp = new Bitmap(sourceFile);
        System.Drawing.Font fnt = new System.Drawing.Font("Arial", 14);
        SolidBrush brush = new SolidBrush(Color.Black);
        using (Graphics Gr = Graphics.FromImage((System.Drawing.Image)bmp))
        {
            Gr.DrawString((DT.CertificateValidity == 0 ? "X" : ""), fnt, brush, 179, 191);
            Gr.DrawString((DT.CertificateValidity == 1 ? "X" : ""), fnt, brush, 260, 191);
            Gr.DrawString((DT.CirtificateType == 0 ? "X" : ""), fnt, brush, 445, 191);
            Gr.DrawString((DT.CirtificateType == 2 ? "X" : ""), fnt, brush, 569, 191);
            Gr.DrawString(DT.ApplicantName, fnt, brush, 255, 273);
            Gr.DrawString(DT.Surname, fnt, brush, 64, 273);
            Gr.DrawString(DT.Initial, fnt, brush, 454, 273);
            Gr.DrawString(DT.Email, fnt, brush, 64, 327);
            //Gr.DrawString((DT.Gender == 2 ? "Female" : "Male"), fnt, brush, 66, 328);
            //Gr.DrawString(DT.Address, fnt, brush, 244, 379);
            Gr.DrawString(DT.District, fnt, brush, 245, 453);
            Gr.DrawString(DT.State, fnt, brush, 661, 453);
            Gr.DrawString(DT.PostalCode.ToString(), fnt, brush, 243, 488);
            Gr.DrawString(DT.MobileNo, fnt, brush, 689, 490);
            //Gr.DrawString(DT.Nationality.ToString(), fnt, brush, 552, 696);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Day.ToString().Length == 1 ? "0" : Cmn.ToDate(DT.DOB).Day.ToString().Substring(0, 1), fnt, brush, 466, 329);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Day.ToString().Length > 1 ? Cmn.ToDate(DT.DOB).Day.ToString().Substring(1, 1) : Cmn.ToDate(DT.DOB).Day.ToString().Substring(0, 1), fnt, brush, 496, 329);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Month.ToString().Length == 1 ? "0" : Cmn.ToDate(DT.DOB).Month.ToString().Substring(0, 1), fnt, brush, 522, 329);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Month.ToString().Length > 1 ? Cmn.ToDate(DT.DOB).Month.ToString().Substring(1, 1) : Cmn.ToDate(DT.DOB).Month.ToString().Substring(0, 1), fnt, brush, 552, 329);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Year.ToString().Substring(0, 1), fnt, brush, 582, 330);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Year.ToString().Substring(1, 1), fnt, brush, 600, 330);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Year.ToString().Substring(2, 1), fnt, brush, 628, 330);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Year.ToString().Substring(3, 1), fnt, brush, 654, 330);
            switch (DT.IdentificationDocument.ToString())
            {
                case "5": Gr.DrawString("X", fnt, brush, 69, 563); break;
                case "409": Gr.DrawString("X", fnt, brush, 131, 563); break;
                case "2": Gr.DrawString("X", fnt, brush, 228, 563); break;
                case "157": Gr.DrawString("X", fnt, brush, 312, 563); break;
                case "158": Gr.DrawString("X", fnt, brush, 395, 563); break;
                case "91": Gr.DrawString("X", fnt, brush, 475, 563); break;

            }
            Gr.DrawRectangle(new Pen(Color.White), 243, 381, 593, 60);
            StringFormat drawFormat = new StringFormat();
            drawFormat.Alignment = StringAlignment.Near;
            //StringFormat drawformat = new StringFormat
            //{
            //    FormatFlags = StringFormatFlags.NoWrap,
            //    Trimming = StringTrimming.None
            //};
            Gr.DrawString(DT.Address, new Font("Arial", 16), new SolidBrush(Color.Black), new RectangleF(243, 381, 593, 60), drawFormat);
            //string text1 = DT.Address;
            //using (Font font1 = new Font("Arial", 12, FontStyle.Bold, GraphicsUnit.Point))
            //{
            //    RectangleF rectF1 = new RectangleF(244, 385, 593, 60);
            //    Gr.DrawString(text1, font1, Brushes.Blue, rectF1);
            //    Gr.DrawRectangle(Pens.Black, Rectangle.Round(rectF1));
            //}
            Gr.DrawString(Cmn.ToDate(DT.DOB).Date.ToString("00").Substring(1, 1), fnt, brush, 2080, 1396);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Year.ToString().Substring(0, 1), fnt, brush, 2400, 1396);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Year.ToString().Substring(1, 1), fnt, brush, 2500, 1396);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Year.ToString().Substring(2, 1), fnt, brush, 2600, 1396);
            Gr.DrawString(Cmn.ToDate(DT.DOB).Year.ToString().Substring(3, 1), fnt, brush, 2700, 1396);
            Gr.DrawString(DT.Address, fnt, brush, 1032, 1591);
            Gr.DrawString(DT.District, fnt, brush, 1036, 1902);
            string state = "";
            Global.State.TryGetValue(Cmn.ToInt(DT.State), out state);
            Gr.DrawString(state, fnt, brush, 2764, 1902);
            Gr.DrawString(DT.PostalCode.ToString(), fnt, brush, 1036, 2054);
            Gr.DrawString(DT.MobileNo, fnt, brush, 2115, 2054);
        }
        bmp.Save(destFile, ImageFormat.Jpeg);
        fnt.Dispose();
        brush.Dispose();
        //CreatePDF(DT.ID);
    }

    void CreatePDF(int ID)
    {
        CreatePDF CP = new CreatePDF(this.Page, 1, "", "");
        //string url = ddUserType.SelectedValue == "0" ? @"~/Documents/Form/" + ID + "_Page1.jpg" : @"~/Documents/Form/" + ID + "_Page2.jpg";
        CP.AddImage(new string[] { Server.MapPath(@"~/Documents/Form/" + ID + "_Page1.jpg") });
        List<string> LogoImgs = new List<string>();
        //string url = Request.RawUrl.Contains("/dsc-class3") ? ddUserType.SelectedValue == "0" ? @"~/Documents/Form/" + ID + "_Page1.jpg" : "" : ddUserType.SelectedValue == "0" ? "" : "";

        if (File.Exists(Server.MapPath(@"~/Documents/Form/" + ID + "_Page1.jpg")))
        {
            float[] tablewidths = new float[] { 150f, 500f, 300f };
            iTextSharp.text.Image img = iTextSharp.text.Image.GetInstance(Server.MapPath(@"~/Documents/Form/" + ID + "_Page1.jpg"));
            img.ScaleAbsolute(80, 40);
            PdfPTable Tbl = new PdfPTable(tablewidths);
            Tbl.WidthPercentage = 100;
        }
        //CP.SetPageInfo(project.URLName, MetaKeywords, "", project.URLName, "");
        CP.PrintInvoice(1);
    }
    void CreatePDF2(int ID)
    {
        CreatePDF CP = new CreatePDF(this.Page, 1, "", "");
        //string url = ddUserType.SelectedValue == "0" ? @"~/Documents/Form/" + ID + "_Page1.jpg" : @"~/Documents/Form/" + ID + "_Page2.jpg";
        CP.AddImage(new string[] { Server.MapPath(@"~/Documents/Form/" + ID + "_Page2.jpg") });
        List<string> LogoImgs = new List<string>();
        //string url = Request.RawUrl.Contains("/dsc-class3") ? ddUserType.SelectedValue == "0" ? @"~/Documents/Form/" + ID + "_Page1.jpg" : "" : ddUserType.SelectedValue == "0" ? "" : "";

        if (File.Exists(Server.MapPath(@"~/Documents/Form/" + ID + "_Page2.jpg")))
        {
            float[] tablewidths = new float[] { 150f, 500f, 300f };
            iTextSharp.text.Image img = iTextSharp.text.Image.GetInstance(Server.MapPath(@"~/Documents/Form/" + ID + "_Page2.jpg"));
            img.ScaleAbsolute(80, 40);
            PdfPTable Tbl = new PdfPTable(tablewidths);
            Tbl.WidthPercentage = 100;
        }
        //CP.SetPageInfo(project.URLName, MetaKeywords, "", project.URLName, "");
        CP.PrintInvoice(1);
    }
    private void CreateLogin(string name, string email, string contactno)
    {
        if (Global.LogInDone == true || TDSModel.User.GetByEmailID(email) != null)
            return;
        User U = new User();
        try
        {
            U.Name = name;
            U.EmailID = email;
            string password = CreateRandomPassword(6);
            U.Password = password;
            U.ContactNo = contactno;
            U.UserType = (int)UserTypes.UT_Customer;
            U.Save();
            string mailBody = "<html><head>FinComIndia</head><body>" +
            "<p>Dear " + U.Name + ", thank you for registering with us.</p>" +
            "<p>Your login details are-<p>" +
            "<p><b>User Id: " + U.EmailID + "</b></p>" +
            "<p><b>Password: " + U.Password + "</b></p>" +
            "</body></html>";
            Cmn.SendEmail("Login Information", U.EmailID, U.Name, mailBody);
        }
        catch
        {
        }
    }
    private string CreateRandomPassword(int pasLenth)
    {
        string allowedChars = "";
        allowedChars = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,";
        allowedChars += "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,";
        allowedChars += "1,2,3,4,5,6,7,8,9,0,!,@,#,$,%,&,?";
        char[] sep = { ',' };
        string[] arr = allowedChars.Split(sep);
        string passwordString = "";
        string temp = "";
        Random rand = new Random();
        for (int i = 0; i < pasLenth; i++)
        {
            temp = arr[rand.Next(0, arr.Length)];
            passwordString += temp;
        }
        return passwordString;
    }

    private bool ValidateForm()
    {
        lblErrorMsg.Text = "";

        if (givenname.Text == "")
        {
            lblErrorMsg.Text = "Name Required!";
            givenname.Focus();
            return false;
        }
        else if (orgnames.Text == "")
        {
            if (ddUserType.SelectedValue != "0")
            {
                lblErrorMsg.Text = "Organization Required!";
                orgnames.Focus();
                return false;
            }
        }
        else if (dptmt.Text == "")
        {
            if (ddUserType.SelectedValue != "0")
            {
                lblErrorMsg.Text = "Department Required!";
                dptmt.Focus();
                return false;
            }
        }
        else if (txtDOB.Text == "")
        {
            lblErrorMsg.Text = "Date of birth Required!";
            txtDOB.Focus();
            return false;
        }
        else if (address.Text == "")
        {
            lblErrorMsg.Text = "Address Required!";
            address.Focus();
            return false;
        }
        else if (postalcodes.Text == "")
        {
            lblErrorMsg.Text = "Postal code Required!";
            postalcodes.Focus();
            return false;
        }

        else if (district.Text == "")
        {
            lblErrorMsg.Text = "District Required!";
            district.Focus();
            return false;
        }
        else if (state.SelectedValue == "")
        {
            lblErrorMsg.Text = "Please select a state !";
            state.Focus();
            return false;
        }
        else if (mobilenumber.Text == "")
        {
            lblErrorMsg.Text = "Mobile No required !";
            mobilenumber.Focus();
            return false;
        }
        else if (emailid.Text == "")
        {
            lblErrorMsg.Text = "email id required !";
            emailid.Focus();
            return false;
        }
        else if (identificationdocs.SelectedValue == "")
        {
            lblErrorMsg.Text = "Please select identification document";
            return false;
        }
        else if (iddocnumber.Text == "")
        {
            lblErrorMsg.Text = "Id document no is missing";
            iddocnumber.Focus();
            return false;
        }
        else if (addrsproofdocs.SelectedValue == "" && ddUserType.SelectedValue == "0")
        {
            lblErrorMsg.Text = "Please select address proof document";
            return false;
        }

        //if (lblID.InnerText == "0")
        //{
        //    if (!((FileUpload1.HasFile && FileUpload2.HasFile) || (FileUpload1.HasFile && ddUserType.SelectedValue == "1")))
        //    {
        //        lblErrorMsg.Text = "Please browse all files to upload first";
        //        return false;
        //    }
        //}
        return true;
    }
    protected void btnProceedToPayment_Click(object sender, EventArgs e)
    {
        //divSummary.Visible = false;
        //if (Global.CurrentUserType == UserTypes.UT_Admin || Global.CurrentUserType == UserTypes.UT_AgentAdmin || Global.CurrentUserType == UserTypes.UT_Agent)
        //{
        //    adminPay.Visible = true;
        //    lblBalance.Text = Payment.GetAvlBal(Global.LicenseID).ToString();
        //}
        //else
        //{
        //    divPayment.Visible = true;
        //    PaymentControl.PaybleAmount = Cmn.ToDbl(lblTotalCost.Text).ToString("0.00");
        //}
        divSummary.Visible = false;
        //  divPayUMoney.Visible = true;
        DscDetail DT = DscDetail.GetByID(Cmn.ToInt(lblID.InnerText));
        if (chkAdmin.Checked == true)
        {
            DT.Paid = 1;
            DT.Save();
            lblMessage.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your Order Number is " + DT.OrderNo + "<br/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Payment done sucessfully by admin.<br/>You will shortly recieve an email with login details and further instructions regarding your order.";
            EmailControl.EmailInit("dsc", "tc", DT.ID, true);
            return;
        }
        PayUMoneyControl.CreatePostForPayment(DT, lblTotalCost.Text);

    }
    protected void btnDeductFromBalance_Click(object sender, EventArgs e)
    {
        List<Payment> plist = Payment.GetByLicenseID(Global.LicenseID);
        double amount = 0;
        foreach (Payment p in plist)
        {
            if (p.Amount != null)
            {
                amount += (double)p.Amount;
            }
        }
        DscDetail DT = DscDetail.GetByID(Cmn.ToInt(lblID.InnerText));
        Payment p1 = new Payment();
        if (amount > Cmn.ToInt(lblTotalCost.Text))
        {
            p1.Amount = -Cmn.ToDbl(lblTotalCost.Text);
            p1.TransactionType = 2;
            p1.Save();
            DT.TransactionID = p1.LicenseID.ToString();
            DT.Paid = 2;
            DT.Save();
            WriteClientScript("$(document).ready(function() { alert('Payment Sucessfully Done!'); });");
            divSummary.Visible = false;
            lblMessage.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;THANK YOU<br/>&nbsp;Payment done sucessfully.<br/><br/>Your Order Number is " + DT.OrderNo + "";
            string mailBody = "<p>Dear " + DT.Email + ", </p>" +
                "<p>We thank you for choosing our services.</p>" +
                "<p>This is to confirm that you have successfully applied for DSC.<p>" +
                "<br/><p>In case you have any query, kindly call us on <br/><a href='tel:01204322456'>(0120) 432-2456</a><br/><a href='tel:919650606247'>+91 9650606247</a><br/><a href='tel:918826693260'>+91 8826693260</a><br/><br/> or write us at <br/><a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p>" +
                "<p>Your Order Number is:<b>" + DT.OrderNo + "</h4></b>" +
                "<br/><p>Thanking You<br/>Team Fin Com India</p>";
            Cmn.SendEmail("DSC Payment ", DT.Email, DT.Email, Cmn.CreateMailStructure("DSC Payment", DT.Email, mailBody));
        }
        else
            WriteClientScript("$(document).ready(function() { alert('Error! Please select a valid license first'); });");
    }
    protected void btnPayFromAccount_Click(object sender, EventArgs e)
    {
        if (Global.LicenseID > 0)
        {
            double ChargableAmount = Cmn.ToDbl(lblTotalCost.Text);
            double AvlBalance = Payment.GetAvlBal(Global.LicenseID);
            double RemaBal = AvlBalance - ChargableAmount;

            if (RemaBal < 0)
            {
                lblPaymtMsg.Text = "insufficient Balance";
                lblPaymtMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            else
            {
                try
                {
                    Payment P = new Payment();
                    P.LicenseID = Global.LicenseID;
                    P.Date = DateTime.Now;
                    P.Amount = 0 - ChargableAmount;
                    P.TransactionType = (int)TransType.Dsc;
                    P.Save();
                    Update();
                    DscDetail DT = DscDetail.GetByID(Cmn.ToInt(lblID.InnerText));
                    DT.Paid = 1;
                    DT.DscStage = (int)TransactionStage.Unassigned;
                    DT.PaymentRefID = P.ID;
                    DT.Save();
                    P.RefID = DT.ID;
                    P.Save();
                }
                catch
                {
                }
            }
        }
    }
    protected void btnCloseMessage_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    void ShowMessage(string message, int type) //type=0(success), 1 (Error)
    {
        switch (type)
        {
            case 0: h_success.InnerText = "Success";
                divSuccessMessage.InnerHtml = "<span class='text-success'>" + message + "</span>";
                break;
            case 1: h_success.InnerText = "Error";
                divSuccessMessage.InnerHtml = "<span class='text-danger'>" + message + "</span>";
                break;
        }
        divPopMsg.Visible = true;
    }

    //protected void btnDocNotReceived_Click(object sender, EventArgs e)
    //{
    //    DscDetail DT = DscDetail.GetByID(Cmn.ToInt(lblID.InnerText));
    //    if (DT != null)
    //    {
    //        if (DT.Email == null) return;
    //        string mailBody_noDocReceived =
    //                           "<p>Dear <b>" + DT.ApplicantName + "</b></P><br/>" +
    //                           "<br/><p>We thank you for choosing our services</P>" +
    //                           "<p style='text-align:justify;'>As chosen by yourself, you are required to send the documents regarding the DSC for ________________. We havent received the required documents yet. This is to put to your kind knowledge that the DSC may get inactivated in case we don’t get the required documents in time.</p>" +
    //                           "<p>kindly courier the documents to our address below:</p>" +
    //                           "<p>Garg Shekhar & Company,</p>" +
    //                           "<p>T - 5, Third Floor,</p>" +
    //                           "<p>Above Croma Showroom,</p>" +
    //                           "<p>Aditya City Centre,</p>" +
    //                           "<p>Indirapuram,</p>" +
    //                           "<p>Ghaziabad – 201014</p>" +
    //                           "<P>In case you have any query, you can reach us on this no.<br/><a href='tel:01204322456'>(0120) 432-2456</a><br/><a href='tel:919650606247'>+91 9650606247</a><br/><a href='tel:918826693260'>+91 8826693260</a><br/> or mail us at <br/><a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</P>" +
    //                           "<p>Thanking You<br/>Team Fin Com India</p>";
    //        Cmn.SendEmail("Document not received:FinComIndia", DT.Email, DT.ApplicantName, Cmn.CreateMailStructure("Documents not received", DT.Email, mailBody_noDocReceived)); //Document not recieved Mail
    //    }
    //}
    //protected void btnDocCouriered_Click(object sender, EventArgs e)
    //{

    //    DscDetail DT = DscDetail.GetByID(Cmn.ToInt(lblID.InnerText));
    //    if (DT != null)
    //    {
    //        if (DT.Email == null) return;
    //        string mailBody_DSCCouriered =
    //                "<p>Dear <b>" + DT.ApplicantName + "</b></P><br/>" +
    //                "<p>Great News!</p>" +
    //                "<p>Your package with tracking no. ___________ on ________________ Courier Service is dispatched.As per your requirement, we are sending you Digital Signature certificate <p><br/><br/>" +
    //                "<p>Also you can <a href='#'>Track your order here</a></p><br/><br/>" +
    //                "<p><b>What now?</b></p>" +
    //                "<p><b>1) Keep an eye on your package using the tracking details below:</b></p>" +
    //                "<p>Courier Partner: BlueDart </p>" +
    //                "<p>Tracking Website: <a href='http://www.bluedart.com' target='_blank'>www.bluedart.com</a></p>" +
    //                "<p>Tracking Number*:_______________</p>" +
    //                "<p><i>* Tracking number may take up to 24 hours for activation. In case of any delays over expected dispatch or delivery date, we will inform you on your email & mobile phone.</i></p><br/>" +
    //                "<p><b>2) Delivery attempt :</b> ON or BEFORE the delivery date. In case, you happen to miss our delivery, do not worry! Another attempt will be made in the next 24 hours</p>" +
    //                "<p><b>3) We will <b>deliver</b> your order in the <b>shortest possible time.</b> However, if you want the package at a later date, you can convey the same to our delivery executive once he gets in touch with you.</b></p>" +
    //                "<p>Also you can reach us on  <a href='tel:01204322456'>(0120) 432-2456</a> or write us at <a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p><br/><br/>" +
    //                "<p>Thanks for choosing fincomindia </p><br/><br/>" +
    //                "<p>Thanking You<br/>Team Fin Com India</p>";
    //        Cmn.SendEmail("DSC couriered:FinComIndia", DT.Email, DT.ApplicantName, Cmn.CreateMailStructure("DSC couriered", DT.Email, mailBody_DSCCouriered)); //DSC Couriered Mail

    //    }
    //}
    protected void btnAutoFillForm_Click(object sender, EventArgs e)
    {
        //Update();
        DscDetail DT = DscDetail.GetByID(Cmn.ToInt(lblID.InnerText));
        if (DT != null)
        {
            if (ddUserType.SelectedValue == "0")
                FillFormFields(DT);
            else
                FillFormFieldsorg(DT);
        }
    }
    protected void btnAutoFillForm0_Click(object sender, EventArgs e)
    {
        //Update();
        DscDetail DT = DscDetail.GetByID(Cmn.ToInt(lblID.InnerText));
        if (DT != null)
        {
            if (ddUserType.SelectedValue == "0")
                FillFormFields2(DT);
            else
                FillFormFields2org(DT);
        }
    }
}
//if (FileUpload1.HasFile)
//{
//    string path = Server.MapPath(@"\Documents\IdProof");
//    if (!Directory.Exists(path))
//    {
//        Directory.CreateDirectory(path);
//    }
//    String ext = System.IO.Path.GetExtension(FileUpload1.FileName);
//    if (ext == ".pdf" || ext == ".jpg")
//        FileUpload1.SaveAs(Server.MapPath("~/Documents/IdProof/" + DT.ID + "" + ext));
//    else
//    {
//        lblView1.Text = "Please select file in .jpg/.pdf format";
//        return false;
//    }

//}
//if (ddUserType.SelectedValue == "0")
//{
//    if (FileUpload2.HasFile)
//    {
//        string path = Server.MapPath(@"\Documents\AddressProof");
//        if (!Directory.Exists(path))
//        {
//            Directory.CreateDirectory(path);
//        }
//        String ext = System.IO.Path.GetExtension(FileUpload2.FileName);
//        if (ext == ".pdf" || ext == ".jpg")
//            FileUpload2.SaveAs(Server.MapPath("~/Documents/AddressProof/" + DT.ID + "" + ext));
//        else
//        {
//            lblView2.Text = "Please select file in .jpg/.pdf format";
//            return false;
//        }
//    }
//}
//else
//{
//    if (FileUpload5.HasFile)
//    {
//        string path = Server.MapPath(@"\Documents\AddressProof");
//        if (!Directory.Exists(path))
//        {
//            Directory.CreateDirectory(path);
//        }
//        String ext = System.IO.Path.GetExtension(FileUpload5.FileName);
//        if (ext == ".pdf" || ext == ".jpg")
//            FileUpload5.SaveAs(Server.MapPath("~/Documents/AddressProof/" + DT.ID + "" + ext));
//        else
//            lblView3.Text = "Please select file in .jpg/.pdf format";
//    }
//}
//if (FileUpload3.HasFile)
//{
//    string path = Server.MapPath(@"\Documents\Form");
//    if (!Directory.Exists(path))
//    {
//        Directory.CreateDirectory(path);
//    }
//    String ext = System.IO.Path.GetExtension(FileUpload3.FileName);
//    FileUpload3.SaveAs(Server.MapPath("~/Documents/Form/" + DT.ID + "page1" + ext));
//}
//if (FileUpload4.HasFile)
//{
//    string path = Server.MapPath(@"\Documents\Form");
//    if (!Directory.Exists(path))
//    {
//        Directory.CreateDirectory(path);
//    }
//    String ext = System.IO.Path.GetExtension(FileUpload4.FileName);
//    FileUpload4.SaveAs(Server.MapPath("~/Documents/Form/" + DT.ID + "page2" + ext));
//}