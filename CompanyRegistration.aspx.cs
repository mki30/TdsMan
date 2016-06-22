using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;
public partial class CompanyRegistration : System.Web.UI.Page
{
    string Data1 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string type = Request.QueryString["type"];
        Data1 = RouteData.Values["Data1"] != null ? RouteData.Values["Data1"].ToString() : "";

        switch (Data1)
        {
            case "company-registration":
                pnlCompanyReg.Visible = true;
                break;
            case "requirements-for-private-company-registration":
                pnlRequiremenForPrivateCompanyReg.Visible = true;
                Title = "Requirements For Private Company Registration";
                break;
            case "requirements-of-one-person-company-registration":
                PnlReqForOPCReg.Visible = true;
                Title = "Requirements Of One Person Company Registration";
                break;
            case "requirements-of-public-company-registration":
                pnlReqPublicCompanyReg.Visible = true;
                Title = "Requirements Of Public Company Registration";
                break;
            case "company-registration-process":
                pnlCompanyRegProcess.Visible = true;
                Title = "Company Registration Process";
                break;
            case "company-name-availability-guidelines":
                pnlCompanyNameAvlGuidlines.Visible = true;
                Title = "Company Name Availability Guidelines";
                break;
            case "commencement-of-business-by-a-company":
                pnlCommencementOfBusenessByCompany.Visible = true;
                Title = "Commencement Of Business By A Company";
                break;
            case "documents-required-for-company-registration":
                pnlDocumentsCompanyReg.Visible = true;
                Title = "Documents Required For Company Registration";
                break;
            case "company-registration-FAQ":
                pnlCompanyRegFAQ.Visible = true;
                Title = "Company Registration FAQ";
                break;

             case "company-llp-name-availability":
                pnlLlpNameAvl.Visible = true;
                Title = "Company LLP Name Availability";
                break;
            case "company-name":
                pnlCompanyName.Visible = true;
                Title = "Company Name";
                break;
            case "company-name-availability":
                pnlCompanyNameAvl.Visible = true;
                Title = "Company Name Availability";
                break;
            case "company-name-undesirable-names":
                pnlUndesirableNames.Visible = true;
                Title = "Company Name Undesirable Names";
                break;

            case "companyname-businessname-trademark-brandname-logo-and-domain-name":
                pnlCompanyNameBusinessNameEtc.Visible = true;
                Title = "Companyname Businessname Trademark Brandname Logo And Domain Name";
                break;

            case "company-names-facts-to-be-disregarded":
                pnlCompanyNameFaq.Visible = true;
                Title = "Company Names Facts To Be Disregarded";
                break;

            case "limited-liability-partnership-name":
                pnlLlpName.Visible = true;
                Title = "Limited Liability Partnership Name";
                break;

            case "llp-name-guidelines":
                pnlLlpNameGuidlines.Visible = true;
                Title = "LLP  Name Guidelines";
                break;

            case "trade-mark-and-company-llp-name":
                pnlTrademarkAndCompany.Visible = true;
                Title = "Trade Mark And Company LLP Name";
                break;

            case "company-name-availability-faq":
                PanelCompanyNameAvlFaq.Visible = true;
                Title = "Company Name Availability FAQ";
                break;
            default:
                //pnlRegForm.Visible = true;
                //ddRegForm.Attributes.Add("class", "img-back");
                break;
        }
    }

    //protected void btnSubmit_Click(object sender, EventArgs e)
    //{
    //    Contact C = new Contact();
    //    try
    //    {
    //        C.Name = txtName.Text;
    //        C.ContactNo = txtMobile.Text;
    //        //C.CompanyName = txtCompanyName.Text;
    //        C.Email = txtEmail.Text;
    //        C.CompanyType = Cmn.ToInt(lblCompanyType.Text);
    //        C.Save();
    //        lblMsg.Text = "Successfully submited! We will contact you soon";
    //        lblMsg.ForeColor = System.Drawing.Color.Green;
    //    }
    //    catch
    //    {
    //        lblMsg.Text = "Not saved there is some trouble!";
    //        lblMsg.ForeColor = System.Drawing.Color.Red;
    //    }
    //}
}