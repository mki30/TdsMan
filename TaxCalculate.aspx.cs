using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class TaxCalculate : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        int EmployeeID = QueryStringInt("employeeid");
        string TotalTaxableIncome = QueryString("totaltaxableincome");
        int FinancialYear =Global.FinancialYear;

        if (!IsPostBack)
        {
            MST_EMPLOYEE E = MST_EMPLOYEE.GetByID(EmployeeID);
            if (E != null)
            {
                lblName.Text = E.EMPLOYEE_NAME_;
                lblPan.Text = E.EMPLOYEE_PAN;
                lblCatogory.Text = E.CATEGORY;
                lblFinancialYear.Text = (FinancialYear.ToString() + "-" + (FinancialYear + 1).ToString());
                lblTotalTaxableIncome.Text = Cmn.ToDbl(TotalTaxableIncome).ToString("##,##0");
            }
            CreateTaxTable(Cmn.ToDbl(lblTotalTaxableIncome.Text));
        }
    }

    protected void CreateTaxTable(double Amount)
    {
        double slab1 = 250000.00, slab1TaxRate = 10.00;
        double slab2 = 500000.00, slab2TaxRate = 20.00;
        double slab3 = 1000000.00, slab3TaxRate = 30.00;

        StringBuilder str = new StringBuilder("<table id='tableTaxSunmmary' class='table table-condensed'><tr><th>Income Grater Than<th>Income To<th>Tax Rate<th>Tax Amount");
        str.Append("<tr><td>0.0<td>" + slab1 + "<td>@0.0 %<td>0.0" );

        double _Amount = Amount - slab1;
        str.Append("<tr><td>" + slab1 + "<td>" + slab2 + "<td>@" + slab1TaxRate + " %<td>" + (_Amount > 0 ? Amount < slab2 ? (_Amount * .1).ToString("0") : "25000" : ""));

        _Amount = Amount - slab2;
        str.Append("<tr><td>" + slab2 + "<td>" + slab3 + "<td>@" + slab2TaxRate + " %<td>" + (_Amount>0? Amount<slab3 ? (_Amount*.2).ToString("0"):"125000":""));

        _Amount = Amount - slab3;
        str.Append("<tr><td>" + slab3 + "<td>&ABOVE<td>@" + slab3TaxRate + " %<td>" + (_Amount > 0 ? (_Amount * .3).ToString("0") : ""));

        double TotalTaxAmount = Cmn.CalculateTax(Amount);
        double TaxCredit = 0.0;
        double taxOnTotalIncome = TotalTaxAmount - TaxCredit;
        double surcharge = 0.0;
        if (taxOnTotalIncome > 10000000)
            surcharge = taxOnTotalIncome * 0.01;
        double cess = 0.0;
        cess = taxOnTotalIncome * 0.03;

        double taxPayble=taxOnTotalIncome+surcharge+cess;

        str.Append("<tr><td><td><td>Sum of Tax Amount:<td>" + TotalTaxAmount.ToString("0.00"));
        str.Append("<tr><td><td><td>Less:Tax Credit:<td>" + TaxCredit.ToString("0.00") +
            "<tr><td><td><td>12. Tax On Total Income:<td>" + taxOnTotalIncome.ToString("0.00") + "" +
            "<tr><td><td><td>13. Add:Surcharge<td>" + surcharge.ToString("0.00") +
            "<tr><td><td><td>14. Add:Educ Cess @ 3% On<td>" + cess.ToString("0.00") +
            "<tr><td><td><td>15. Tax Payble(12+13+14)<td style='font-weight:bold;'>" + taxPayble.ToString("0.00"));

        lblTaxTable.Text = str.ToString();
    }
}

