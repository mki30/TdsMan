using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class Controls_EmailControl : System.Web.UI.UserControl
{
    public DscDetail DT = null;
    public PanDetail pd = null;
    public TanDetail td = null;
    public string Subject = "";
    public string EmailTo = "";
    public string invoiceLink = "";
    public int tableID = 0;
    public int primaryKeyID = 0;

    public void EmailInit(string type, string mailType, int id, bool autoSend = false)
    {
        divDSCTransComplete.Visible = false;
        divDSCInvoice.Visible = false;
        divDSCDocuments.Visible = false;
        divDSCnoDocReceived.Visible = false;
        divDSCCourier.Visible = false;
        divDSCCourier.Visible = false;
        divDSCIncomplete.Visible = false;
        if (type == "dsc")
        {
            DT = DscDetail.GetByID(id);
            tableID = (int)TableID.DSC;
            primaryKeyID = DT.ID;

            if (DT != null)
            {
                if (DT.Email != "")
                {
                    hidEmail.Value = DT.Email;
                    hidName.Value = DT.ApplicantName;
                    EmailTo = DT.Email;
                    switch (mailType)
                    {
                        case "tc":
                            Subject = "DSC Payment Successful - [#" + DT.OrderNo + "#], Fin Com India";
                            divDSCTransComplete.Visible = true;
                            if (DT.PickupAtDoor == 1)
                                divAddress.Visible = true;
                            break;
                        case "invoice":
                            divDSCInvoice.Visible = true;
                            invoiceLink = "http://fincomindia.in/getinvoice?id=" + DT.ID + "&type=" + TransType.Dsc;
                            Subject = "DSC Order Invoice - [#" + DT.OrderNo + "#], Fin Com India";
                            //PushInNotes((int)TableID.DSC, DT.ID, Subject);
                            break;
                        case "documents":
                            divDSCDocuments.Visible = true;
                            Subject = "DSC Document Request - [#" + DT.OrderNo + "#], Fin Com India";
                            //PushInNotes((int)TableID.DSC, DT.ID, Subject);
                            break;
                        case "nodocrecieved":
                            divDSCnoDocReceived.Visible = true;
                            Subject = "DSC Document Not Received - [#" + DT.OrderNo + "#], Fin Com India";
                            //PushInNotes((int)TableID.DSC, DT.ID, Subject);
                            break;
                        case "courier":
                            divDSCCourier.Visible = true;
                            Subject = "DSC Document Couriered - [#" + DT.OrderNo + "#], Fin Com India";
                            //PushInNotes((int)TableID.DSC, DT.ID, Subject);
                            break;
                        case "incomlete":
                            divDSCIncomplete.Visible = true;
                            Subject = "DSC Tansaction Incomplete - [#" + DT.OrderNo + "#], Fin Com India";
                            break;
                    }
                }
            }
        }
        if (type == "pan")
        {
            pd = PanDetail.GetByID(id);
            if (pd != null)
            {
                if (pd.EmailId != "")
                {
                    hidEmail.Value = pd.EmailId;
                    hidName.Value = pd.FirstName;
                    EmailTo = pd.EmailId;
                    switch (mailType)
                    {
                        case "tc":
                            Subject = "PAN Payment Successful - [#" + pd.OrderNumber+ "#], Fin Com India";
                            divPANTransaction.Visible = true;
                            divAddress.Visible = true;
                            break;
                    }
                }
            }
        }
        if (type == "tan")
        {
            td = TanDetail.GetByID(id);
            if (td!= null)
            {
                if (td.EmailId != "")
                {
                    hidEmail.Value = td.EmailId;
                    hidName.Value = td.Name1;
                    EmailTo = td.EmailId;
                    switch (mailType)
                    {
                        case "tc":
                            Subject = "PAN Payment Successful - [#" + pd.OrderNumber + "#], Fin Com India";
                            divTANTransaction.Visible = true;
                            divAddress.Visible = true;
                            break;
                    }
                }
            }
        }
        if (type == "incorporate")
        {
            Contact C = Contact.GetByID(id);
            if (!string.IsNullOrEmpty(C.Email))
            {
                hidEmail.Value = C.Email;
                hidName.Value = C.Name;
                EmailTo = C.Email;
                switch (mailType)
                {
                    case "tc":
                        string mailBody_TransactionComplete =
                        "<p>Dear <b>" + C.Name + "</b></P>" +
                        "<p>We thank you for choosing our services.</p>" +
                        "<p>This is to confirm that we have successfully received your order for company incorporation.<p>" +
                        "<p><br/>The summary of your order is as below:</p>" +
                        "<p>Name: " + C.Name + "</p>" +
                        "<p>Company Type: " + Global.GetText((CompanyType)C.CompanyType) + "</p>" +
                        "<p>Address:</p>" +
                        "<p>Our reprensatative will call you shortly for further communication:</p>" +
                        "<br/><p>In case you have any query, kindly call us on <br/><a href='tel:01204322456'>(0120) 432-2456</a><br/><a href='tel:919650606247'>+91 9650606247</a><br/><a href='tel:918826693260'>+91 8826693260</a><br/><br/> or write us at <br/><a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p>" +
                        "<p><b>Your Order Number is: " + C.OrderNo + "</h4></b>" + "<br/><br/><p>Thanking You<br/>Team Fin Com India</p>";
                        //Cmn.SendEmail("Transaction Successful:FinComIndia", "psu.singh@gmail.com", C.ApplicantName, Cmn.CreateMailStructure("Transaction Successful", C.Email, mailBody_TransactionComplete);
                        ltMailContent.Text = Cmn.CreateMailStructure("Transaction Successfull", C.Email, mailBody_TransactionComplete);
                        break;
                    case "invoice":
                        string invoiceLink = "http://fincomindia.in/getinvoice/?id=" + C.ID + "&type=" + TransType.Incorporate;
                        string mailBody_Invoice =
                        "<p>Dear <b>" + C.Name + "</b></P><br/>" +
                        "<p>We thank you for choosing our services.</p>" +
                        "<p>Kindly find attached herewith the Invoice for your payment towards the company " + Global.GetText((CompanyType)C.CompanyType) + " incorporation.<p><br/>" +
                        "<p><a href='" + invoiceLink + "' target='_blank'>Get your invoice</a><p><br/>" +
                        "<p>In case you have any query kindly call us on <br/><a href='tel:01204322456'>(0120) 432-2456</a><br/><a href='tel:919650606247'>+91 9650606247</a><br/><a href='tel:918826693260'>+91 8826693260</a><br/> or write us at <br/><a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p><br/><br/>" +
                        "<p>Thanking You<br/>Team Fin Com India</p>";
                        ltMailContent.Text = Cmn.CreateMailStructure("Transaction Successfull", C.Email, mailBody_Invoice);
                        break;
                    case "incomlete":
                        string mailBody_Incomplete = "<p>Dear <b>" + C.Name + "</b></P>" +
                                "<p>Thank you for considering us!</p><br/>" +
                                "<p>We found that you have could not successfully complete your transaction at <href='http://fincomindia.in'>www.fincomindia.in</a><p><br/>" +
                                "<p>Kindly let us know the problem that you encountered. We would be happy to assist you in this matter. For any assistance you can call us on <a href='tel:01204322456'>(0120) 432-2456</a>, <a href='tel:919650606247'>+91 9650606247</a>, <a href='tel:918826693260'>+91 8826693260</a> or write us at <a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p><br/><br/>" +
                                "<p>Thanking You<br/>Team Fin Com India</p>";
                        ltMailContent.Text = Cmn.CreateMailStructure("Incomplete Transaction", C.Email, mailBody_Incomplete); //Incomplete
                        break;

                    case "documents":
                        string mailBody_DocumentSubmition =
                        "<p>Dear <b>" + C.Name + "</b></P><br/>" +
                        "<p>We thank you for choosing our services.</p>" +
                        "<p>Our representative will call you shortly for collecting the documents or you can send these by courier also to our address below:<p><br/>" +
                        "<p>Garg Shekhar & Company,</p>" +
                        "<p>T - 5, Third Floor,</p>" +
                        "<p>Above Croma Showroom,</p>" +
                        "<p>Aditya City Centre,</p>" +
                        "<p>Indirapuram,</p>" +
                        "<p>Ghaziabad – 201014</p>" +
                        "<p>Kindly, mention your order no. <b>" + C.OrderNo + "</b> on your courier.</p><br/>" +
                         "<p>You can reach us on this no <a href='tel:01204322456'>(0120) 432-2456</a><br/><br/> or write us at <a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p><br/><br/>" +
                        "<p>Thanking You<br/>Team Fin Com India</p>";
                        ltMailContent.Text = Cmn.CreateMailStructure("Document submission", C.Email, mailBody_DocumentSubmition);
                        break;

                    case "courier":
                        string mailBody_DSCCouriered =
                        "<p>Dear <b>" + C.Name + "</b></P><br/>" +
                        "<p>Great News!</p>" +
                        "<p>Your package with tracking no. ___________ on ______________ Courier Service is dispatched.As per your requirement, we are sending you Digital Signature certificate <p><br/><br/>" +
                        "<p>Also you can <a href='#'>Track your order here</a></p><br/><br/>" +
                        "<p><b>What now?</b></p>" +
                        "<p><b>1) Keep an eye on your package using the tracking details below:</b></p>" +
                        "<p>Courier Partner: BlueDart </p>" +
                        "<p>Tracking Website: <a href='http://www.bluedart.com' target='_blank'>www.bluedart.com</a></p>" +
                        "<p>Tracking Number*:______________</p>" +
                        "<p><i>* Tracking number may take up to 24 hours for activation. In case of any delays over expected dispatch or delivery date, we will inform you on your email & mobile phone.</i></p><br/>" +
                        "<p><b>2) Delivery attempt :</b> ON or BEFORE the delivery date. In case, you happen to miss our delivery, do not worry! Another attempt will be made in the next 24 hours</p>" +
                        "<p><b>3) We will <b>deliver</b> your order in the <b>shortest possible time.</b> However, if you want the package at a later date, you can convey the same to our delivery executive once he gets in touch with you.</b></p>" +
                        "<p>Also you can reach us on  <a href='tel:01204322456'>(0120) 432-2456</a> or write us at <a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p><br/><br/>" +
                        "<p>Thanks for choosing fincomindia </p>" +
                        "<p>Team Fin Com India</p>";
                        ltMailContent.Text = Cmn.CreateMailStructure("DSC Couriered", C.Email, mailBody_DSCCouriered);
                        break;
                }
            }
        }

        if (type == "SB")
        {
            SellBusiness SB = SellBusiness.GetByID(id);
            if (!string.IsNullOrEmpty(SB.EmailID))
            {
                hidEmail.Value = SB.EmailID;
                hidName.Value = SB.HeadLine;
                EmailTo = SB.EmailID;
                switch (mailType)
                {
                    case "listing":
                        string mailBody_listing = "<p>Dear " + SB.EmailID + ", </P>" +
                        "<p>We thank you for choosing our services.</p>" +
                        "<p>This is to confirm that we have successfully listed your company.<p>" +
                        "<br/><p>In case you have any query, kindly call us on <br/><a href='tel:01204322456'>(0120) 432-2456</a><br/><a href='tel:919650606247'>+91 9650606247</a><br/><a href='tel:918826693260'>+91 8826693260</a><br/><br/> or write us at <br/><a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p>" +
                        "<p>Your Order Number is:<b>" + SB.OrderNo + "</h4></b>" +
                        "<br/><p>Thanking You<br/>Team Fin Com India</p>";
                        ltMailContent.Text = Cmn.CreateMailStructure("Business submitted", SB.EmailID, mailBody_listing);
                        break;

                    case "live":
                        string mailBody_live = "<p>Dear " + SB.EmailID + ", </P>" +
                        "<p>We thank you for choosing our services.</p>" +
                        "<p>Your listing has been made live on our site, for any further progress you can check on our site.</p>" +
                        "<p>In case you have any query kindly call us on <br/><a href='tel:01204322456'>(0120) 432-2456</a><br/><a href='tel:919650606247'>+91 9650606247</a><br/><a href='tel:918826693260'>+91 8826693260</a><br/> or write us at <br/><a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p><br/><br/>" +
                        "<br/><p>Thanking You<br/>Team Fin Com India</p>";
                        ltMailContent.Text = Cmn.CreateMailStructure("Business lived", SB.EmailID, mailBody_live);
                        break;

                    case "incomlete":
                        string mailBody_Incomplete = "<p>Dear <b>" + SB.EmailID + "</b></P>" +
                                "<p>Thank you for considering us!</p><br/>" +
                                "<p>We found that you have could not successfully complete your transaction at <href='http://fincomindia.in'>www.fincomindia.in</a><p><br/>" +
                                "<p>Kindly let us know the problem that you encountered. We would be happy to assist you in this matter. For any assistance you can call us on <a href='tel:01204322456'>(0120) 432-2456</a>, <a href='tel:919650606247'>+91 9650606247</a>, <a href='tel:918826693260'>+91 8826693260</a> or write us at <a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p><br/><br/>" +
                                "<p>Thanking You<br/>Team Fin Com India</p>";
                        ltMailContent.Text = Cmn.CreateMailStructure("Incomplete Transaction", SB.EmailID, mailBody_Incomplete);
                        break;
                    case "edit":
                        string mailBody_listingEdit = "<p>Dear <b>" + SB.EmailID + "</b></P>" +
                                "<p>Thank you for considering us!</p><br/>" +
                                "<p>You have successfully editing listing of your company.<p>" +
                                "<p>For any further progress you can check on our site.<p>" +
                                "<p>You can reach us on this no <a href='tel:01204322456'>(0120) 432-2456</a><br/><br/> or write us at <a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p><br/><br/>" +
                                "<p>Thanking You<br/>Team Fin Com India</p>";
                        ltMailContent.Text = Cmn.CreateMailStructure("Incomplete Transaction", SB.EmailID, mailBody_listingEdit);
                        break;
                }
            }
        }

        if (autoSend)
            SendMail();
    }

    protected void btnSendMail_Click(object sender, EventArgs e)
    {
        SendMail();
    }

    private void SendMail()
    {
        if (hidEmail.Value != "")
        {
            StringBuilder t = new StringBuilder("");
            divContent.RenderControl(new HtmlTextWriter(new System.IO.StringWriter(t)));
            Cmn.SendEmail(Subject, hidEmail.Value, hidName.Value, t.ToString());
            PushInNotes(Subject);
        }
    }

    private void PushInNotes(string content)
    {
        Note N = new Note();
        N.TableID = tableID;
        N.PrimaryKeyID = primaryKeyID;
        N.Note1 = content;
        N.Date = DateTime.Now;
        N.Save();
    }
}