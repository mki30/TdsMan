using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class IncExp : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        Title = "Income/Expense";
        if (Global.CompanyID == -1)
            Response.Redirect("/Login.aspx");
        string str = "var year='" + Global.FinancialYear + "', " + Environment.NewLine;
        str += "compID='"+Global.CompanyID+"';";
        WriteClientScript(str);
   }
}