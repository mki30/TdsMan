using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class MakeCorrections : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        Title = "Make corrections";
        if (!IsPostBack)
        {
            //StringBuilder sb = new StringBuilder();
            //List<RegularReturn> RR = RegularReturn.GetByFinYearandCorrrectionType(Global.FinancialYear,1);
            
            //sb.Append("<table class='table table-bordered'><th>Fin Yr<th>Form No<th>Quarter<th>Company Name<th>Tan No<th>Imported Date and Time<th>Total Corrections");
            //foreach(RegularReturn rr in RR)
            //    sb.Append("<tr><td>" + rr.FinancialYear + "<td>" + ((RegularReturnType)rr.FormType).ToString().Replace("_", "") + "<td><a href='/regularreturns.aspx?formtype="+rr.FormType+"&returnid="+rr.ID+"' tarhet='_blank'>" + (Quarter)(rr.Quarter) + "</a><td>" + rr.CompanyName + "<td>" + rr.TanNo + "<td>" + Cmn.ToDate(rr.LUDate).ToString("dd-MMM-yy") + "<td>");
            //sb.Append("</table>");
            //lblCorrectionList.Text = sb.ToString();
        }
    }
    
}