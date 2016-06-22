using System;

public partial class WebUserControl : System.Web.UI.UserControl
{
    public event EventHandler ehClick;
    public string PaybleAmount
    {
        get
        {
            return txtPaymentAmount.Text;
        }
        set
        {
            txtPaymentAmount.Text = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PaybleAmount != null)
        {
            txtPaymentAmount.Text = PaybleAmount;
            txtPaymentAmount.Enabled = false;
        }
    }
    protected void btnPay_Click(object sender, EventArgs e)
    {
        ehClick.Invoke(this, new EventArgs());
    }
    public void Recharge()
    {
       lblPaymentHeadText.Text = "Recharge";
       btnPay.Text = "Recharge";
       txtPaymentAmount.Enabled = true;
    }
    public void ShowMsg(string msg)
    {
        lblMsg.Text = msg;
    }
}