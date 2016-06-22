using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class Incorporate : System.Web.UI.Page
{
    string Data1 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        this.PaymentControl.ehClick += new EventHandler(this.btnPay_Click);
        string type = Request.QueryString["type"];
        Data1 = RouteData.Values["Data1"] != null ? RouteData.Values["Data1"].ToString() : "";
        if (!IsPostBack)
        {
            FillStateDropDown();
        }
        switch (Data1)
        {
            case "sole-proprietorship":
                plnProprietorship.Visible = true;
                Title = "Sole Proprietorship";
                lblPrice.InnerText = "6,000";
                lblCompanyType.Text = "1";
                ddRegForm.Attributes.Add("class", "img-pro");
                heading.InnerText = "Sole Proprietorship";
                break;
            case "private-limited-company":
                pnlPrivateLtd.Visible = true;
                Title = "Private Limited Company";
                lblPrice.InnerText = "14,000";
                lblCompanyType.Text = "2";
                ddRegForm.Attributes.Add("class", "img-back");
                heading.InnerText = "Private Limited Company";
                break;
            case "partnership-firm":
                pnlPartnershipFirm.Visible = true;
                Title = "Partnership Firm";
                lblPrice.InnerText = "6000";
                lblCompanyType.Text = "3";
                ddRegForm.Attributes.Add("class", "img-back-patnership");
                heading.InnerText = "Partnership Firm";
                break;
            case "co-operatives":
                pnlCoOperative.Visible = true;
                Title = "Co Operatives";
                lblCompanyType.Text = "4";
                heading.InnerText = "Co-operatives";
                break;
            case "public-limited-company":
                pnlPublicLimitedCompany.Visible = true;
                Title = "Public Limited Company";
                lblPrice.InnerText = "37,500";
                lblCompanyType.Text = "5";
                ddRegForm.Attributes.Add("class", "img-back-public");
                heading.InnerText = "Public Limited Company";
                break;
            case "joint-hindu-family-business":
                pnlJHFBuisiness.Visible = true;
                Title = "Joint Hindu Family Business";
                lblCompanyType.Text = "6";
                heading.InnerText = "Joint Hindu Family Business";
                break;
            case "limited-liability-partnership":
                pnlLLP.Visible = true;
                lblPrice.InnerText = "6,000";
                Title = "Limited Liability Partnership";
                lblCompanyType.Text = "7";
                ddRegForm.Attributes.Add("class", "backlimited");
                heading.InnerText = "Limited Liability Partnership (LLP)";
                ddInitialCapital.Items.Add(new ListItem("1-5 LAC", "500000"));
                ddInitialCapital.Items.Add(new ListItem("5-10 LAC", "1000000"));
                ddInitialCapital.Items.Add(new ListItem("greater than 10 LAC", "1000001"));
                break;
            case "one-person-company":
                pnlOPC.Visible = true;
                Title = "One Person Company";
                lblPrice.InnerText = "13,000";
                lblCompanyType.Text = "8";
                ddRegForm.Attributes.Add("class", "backlimited-one");
                heading.InnerText = "One Person Company (OPC)";
                break;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Contact C = new Contact();
        try
        {
            C.Name = txtName.Text;
            C.ContactNo = txtMobile.Text;
            C.Email = txtEmail.Text;
            C.CompanyType = Cmn.ToInt(lblCompanyType.Text);
            C.State = Cmn.ToInt(ddState.SelectedValue);
            C.DIN = Cmn.ToInt(ddDIN.SelectedValue);
            C.DSC = Cmn.ToInt(ddDSC.SelectedValue);
            C.Capital = Cmn.ToDbl(ddInitialCapital.SelectedValue);
            C.Stage = (int)TransactionStage.Unassigned;
            C.Paid = 0;
            C.Save();
            if (C.OrderNo == null)
            {
                C.OrderNo = DateTime.Now.ToString("ddMMyy") + ((int)TransType.Incorporate).ToString("00") + (C.ID).ToString("0000");
                C.Save();
            }
            lblID.Text = C.ID.ToString();
            lblMsg.Text = "Successfully submitted! We will contact you soon";
            lblMsg.ForeColor = System.Drawing.Color.Green;
            ShoSummary();
        }
        catch
        {
            lblMsg.Text = "Not saved!";
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }

    private void ShoSummary()
    {   
        summaryCompanyType.InnerText = heading.InnerText;
        summaryState.InnerText = ddState.SelectedItem.Text;
        summaryDIN.InnerText = ddDIN.SelectedItem.Text;
        summaryDSC.InnerText = ddDSC.SelectedItem.Text;
        summaryCapital.InnerText = ddInitialCapital.SelectedValue;
        summaryPaybleAmmount.InnerText = lblPrice.InnerText;
        divSummary.Visible = true;
        divIncorporateForm.Visible = false;
        divBasicInfo.Visible = false;
    }     //Summary

    protected void btnProceedToPayment_Click(object sender, EventArgs e)
    {
        divSummary.Visible = false;
        //if (Global.CurrentUserType == UserTypes.UT_Admin || Global.CurrentUserType == UserTypes.UT_AgentAdmin || Global.CurrentUserType == UserTypes.UT_Agent)
        //{
        //    adminPay.Visible = true;
        //    lblBalance.Text = Payment.GetAvlBal(Global.LicenseID).ToString();
        //}
        //else
        //{
        //    divPayment.Visible = true;
        //    PaymentControl.PaybleAmount = Cmn.ToDbl(lblPrice.InnerText).ToString("0.00");
        //}
        Contact C= Contact.GetByID(Cmn.ToInt(lblID.Text));
        PayUMoneycontrol.CreatePostForPayment(null, summaryPaybleAmmount.InnerText, C);
    }

    protected void btnPay_Click(object sender, EventArgs e)   //Payment Click
    {
        Contact C = Contact.GetByID(Cmn.ToInt(lblID.Text));
        if (C != null)
        {
            try
            {
                C.Paid = 1;
                C.Stage = (int)TransactionStage.Unassigned;
                C.Save();
                
                if (C.Email != "")
                {
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
                       "<p><b>Your Order Number is: " + C.OrderNo + "</h4></b>" +
                       "<br/><br/><p>Thanking You<br/>Team Fin Com India</p>";
                    Cmn.SendEmail("Transaction Successfull", C.Email, C.Name, Cmn.CreateMailStructure("Transaction Successfull",C.Email,mailBody_TransactionComplete));

                    string invoiceLink = "http://fincomindia.in/getinvoice/?id=" + C.ID + "&type=" + TransType.Incorporate;
                    string mailBody_Invoice =
                    "<p>Dear <b>" + C.Name + "</b></P><br/>" +
                    "<p>We thank you for choosing our services.</p>" +
                    "<p>Kindly find attached herewith the invoice for your payment towards the company " + Global.GetText((CompanyType)C.CompanyType) + " incorporation.<p><br/>" +
                    "<p><a href='" + invoiceLink + "' target='_blank'>Get your invoice</a><p><br/>" +
                    "<p>In case you have any query kindly call us on <br/><a href='tel:01204322456'>(0120) 432-2456</a><br/><a href='tel:919650606247'>+91 9650606247</a><br/><a href='tel:918826693260'>+91 8826693260</a><br/> or write us at <br/><a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p><br/><br/>" +
                    "<p>Thanking You<br/>Team Fin Com India</p>";
                    Cmn.SendEmail("Invoice", C.Email, C.Name, Cmn.CreateMailStructure("Invoice", C.Email, mailBody_Invoice));

                    lblPaymtMsg.Text = "Payment successfully done! Mail sent!";
                    lblPaymtMsg.ForeColor = System.Drawing.Color.Green;
                    
                    Response.Redirect("/confirmation");
                }
            }
            catch
            {
                lblPaymtMsg.Text = "Error!";
                lblPaymtMsg.ForeColor = System.Drawing.Color.Red;
            }
        }

    }
    
    protected void btnPayFromAccount_Click(object sender, EventArgs e)
    {
        if (Global.LicenseID > 0)
        {
            double ChargableAmount = Cmn.ToDbl(lblPrice.InnerText);
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
                    P.TransactionType = (int)TransType.Incorporate;
                    P.Save();

                    Contact C = Contact.GetByID(Cmn.ToInt(lblID.Text));
                    C.Paid = 1;
                    C.Stage = (int)TransactionStage.Unassigned;
                    C.PaymentRefID = P.ID;
                    C.Save();

                    P.RefID = C.ID;
                    P.Save();
                }
                catch
                {
                }
            }
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
}