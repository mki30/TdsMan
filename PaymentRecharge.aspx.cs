using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;


public partial class PaymentRecharge : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        //base.Page_Load(sender, e);
      //  PaymentControl.Recharge();
        if (!IsPostBack)
            ShowData();
    }

    private void ShowData()
    {
        //lblLicenceID.Text = Global.LicenseID.ToString();
        lblCurrentBal.Text = Payment.GetAvlBal(Cmn.ToInt(Global.LicenseID)).ToString("0.00");
        
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        PayUMoneycontrol.CreatePostForPayment(null, txtAmount.Text, null,null,null, Cmn.ToInt(Global.LicenseID));
    }
    //protected void btnSubmit_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        Payment P = Payment.GetByID(Cmn.ToInt(lblID.Text));
    //        if (P == null)
    //        {
    //            P = new Payment()
    //            {
    //                LicenseID = Cmn.ToInt(lblLicenceID.Text),
    //                Amount = Cmn.ToInt(txtAmount.Text),
    //                Date = DateTime.Now,
    //                TransactionType = (int)TransType.Recharge,
    //            }.Save();

    //            lblID.Text = P.ID.ToString();

    //            ltStatus.Text = "Recharged";

    //            lblCurrentBal.Text = Payment.GetAvlBal(Cmn.ToInt(Global.LicenseID)).ToString("0.00");
    //            panelOnlinePaymet.Visible = false;
    //            panelRecharge.Visible = false;

    //        }
    //    }
    //    catch
    //    {
    //        lblMsg.Text = "There is some error not saved!";
    //        lblMsg.ForeColor = System.Drawing.Color.Red;
    //    }
    //}

}