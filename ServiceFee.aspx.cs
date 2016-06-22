using System;
using TDSModel;

public partial class ServiceFee : BasePage
{
    string serviceType = "";
    protected new void Page_Load(object sender, EventArgs e)
    {
        lblId.Text = QueryString("id", "");
        string serviceClass = QueryString("serviceclass", "");
        serviceType = QueryString("servicetype", "");
        lblType.Text = serviceClass.Replace("_", " ");

        if (serviceType == TransType.Dsc.ToString())
        {
            if (serviceClass == ClassType.Class1.ToString())
                lblChargableAmmount.Text = ((int)DscFeeType.Class1).ToString();
            if (serviceClass == ClassType.Class2.ToString())
                lblChargableAmmount.Text = ((int)DscFeeType.Class2).ToString();
            if (serviceClass == ClassType.Class3.ToString())
                lblChargableAmmount.Text = ((int)DscFeeType.Class3).ToString();
        }
        
        if (serviceType == TransType.Incorporate.ToString())
        {
            //if (serviceClass == CompanyType.Sole_Proprietorship.ToString())
            //    lblChargableAmmount.Text = ((int)IncorporateFeeType.Sole_Proprietorship).ToString();
            if (serviceClass == CompanyType.Private_Limited.ToString())
                lblChargableAmmount.Text = ((int)IncorporateFeeType.Private_Limited_Company).ToString();
            if (serviceClass == CompanyType.Partnership_Firm.ToString())
                lblChargableAmmount.Text = ((int)IncorporateFeeType.Partnership_Firm).ToString();
            if (serviceClass == CompanyType.Co_operatives.ToString())
                lblChargableAmmount.Text = ((int)IncorporateFeeType.Co_operatives).ToString();
            if (serviceClass == CompanyType.Co_operatives.ToString())
                lblChargableAmmount.Text = ((int)IncorporateFeeType.Co_operatives).ToString();
            if (serviceClass == CompanyType.Public_Limited.ToString())
                lblChargableAmmount.Text = ((int)IncorporateFeeType.Public_Limited_Company).ToString();
            if (serviceClass == CompanyType.Joint_Hindu_Family.ToString())
                lblChargableAmmount.Text = ((int)IncorporateFeeType.Joint_Hindu_Family_Business).ToString();
            if (serviceClass == CompanyType.Limited_Liability_Partnership.ToString())
                lblChargableAmmount.Text = ((int)IncorporateFeeType.Limited_Liability_Partnership).ToString();
            if (serviceClass == CompanyType.OPC.ToString())
                lblChargableAmmount.Text = ((int)IncorporateFeeType.OPC).ToString();
        }
        if (!IsPostBack)
            ShowData();
    }

    private void ShowData()
    {
        double AvlBalance = Payment.GetAvlBal(Global.LicenseID);
        lblAvlBal.Text = AvlBalance.ToString("0.00");
        lblBalance.Text = Cmn.ToDbl(AvlBalance - Cmn.ToDbl(lblChargableAmmount.Text)).ToString("0.00");
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        double a = Cmn.ToDbl(lblBalance.Text);
        if (Cmn.ToDbl(lblBalance.Text) < 0)
        {
            lblMsg.Text = "Not sufficient balance!";
            lblMsg.ForeColor = System.Drawing.Color.Red;
            return;
        }
        
        Payment P = new Payment();
        try
        {
            if (Global.LicenseID > 0)
            {
                P.LicenseID = Global.LicenseID;
                P.Date = DateTime.Now;
                P.Amount = 0 - (Cmn.ToDbl(lblChargableAmmount.Text));
                if (serviceType == TransType.Dsc.ToString())
                    P.TransactionType = (int)TransType.Dsc;
                else if (serviceType == TransType.Incorporate.ToString())
                    P.TransactionType = (int)TransType.Incorporate;
                P.RefID = Cmn.ToInt(lblId.Text);
                P.Save();
                if (serviceType == TransType.Dsc.ToString())
                {
                    DscDetail DT = DscDetail.GetByID(Cmn.ToInt(lblId.Text));
                    DT.Paid = 1;
                    DT.PaymentRefID = P.ID;
                    DT.Save();
                }
                else if (serviceType == TransType.Incorporate.ToString())
                {
                    Contact C = Contact.GetByID(Cmn.ToInt(lblId.Text));
                    C.Paid = 1;
                    C.PaymentRefID = P.ID;
                    C.Save();
                }
                lblMsg.Text = "Saved!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
            }
        }
        catch
        {
            lblMsg.Text = "There is some error not saved!";
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}