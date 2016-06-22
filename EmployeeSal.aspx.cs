using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class EmployeeSal : BasePage
{
    Dictionary<string, double> Totals = new Dictionary<string, double>();

    protected new void Page_Load(object sender, EventArgs e)
    {
        //base.Page_Load(sender, e);
        Title = "Salary";
        if (!IsPostBack)
        {
            lblEmpoyeeID.Text = QueryString("empid");
            if (lblEmpoyeeID.Text == "")
                btnSave.Visible = false;
            lblFY.Text = Cmn.ToInt(QueryString("fy")).ToString();
            if(lblFY.Text.Length>=2)
            lblFY2.Text = lblFY.Text + "-" + (Cmn.ToInt(lblFY.Text) + 1).ToString().Substring(2);
            
            MST_EMPLOYEE E = MST_EMPLOYEE.GetByID(Cmn.ToInt(lblEmpoyeeID.Text));
            if (E != null)
            {
                Title = "Salary-" + E.EMPLOYEE_NAME_;
                lblEmployeeName.Text = E.EMPLOYEE_NAME_;
                lblCompany.Text = MST_COMPANY.GetByID((int)E.COMPANY_ID).COMPANY_NAME;
            }

            DateTime dt = new DateTime(2014, 4, 1);

            ddMonthsForCopy.Items.Add(new ListItem("", ""));
            for (int i = 0; i < 12; i++)
            {
                ddMonthsForCopy.Items.Add(new ListItem(dt.AddMonths(i).ToString("MMM"), (i + 1).ToString()));
            }
            CreateIncomeSection();
            //ShowData();
        }
    }

    void CreateTextControls(string Name,string PrefixLiteral=null)
    {
        if(PrefixLiteral!=null)
            lblIncome.Controls.Add(new Literal() { Text = PrefixLiteral });

        Totals.Add(Name, 0);

        for (int i = 1; i <= 12; i++)
        {
            lblIncome.Controls.Add(new Literal() { Text = "<td class='number'>" });
            lblIncome.Controls.Add(new TextBox() { ID = "txt" + Name + i, MaxLength = 6, Width = 55 });
        }
         
        if (Name != "PaidOn" && Name!="Challan")
        {
            lblIncome.Controls.Add(new Literal() { Text = "<th class='number'>" });
            //lblIncome.Controls.Add(new Label() { ID = "lblTotal" + Name});
            lblIncome.Controls.Add(new TextBox() { ID = "txt" + Name + "Total", MaxLength = 6, Width = 65, ReadOnly = true, BackColor = System.Drawing.Color.LightGray });
        }
    }

    void CreateLBLControls(string Name, string PrefixLiteral = null)
    {
        if (PrefixLiteral != null)
            lblIncome.Controls.Add(new Literal() { Text = PrefixLiteral });

        Totals.Add(Name, 0);

        for (int i = 1; i <= 12; i++)
        {
            lblIncome.Controls.Add(new Literal() { Text = "<td class='number'>" });
            lblIncome.Controls.Add(new Label() { ID = "lbl" + Name + i});
        }

        lblIncome.Controls.Add(new Literal() { Text = "<th class='number'>" });
        lblIncome.Controls.Add(new Label() { ID = "lblTotal" + Name, Text = "0" });
    }

    void CreateDropDownControls(string Name, ListItem[] list, string PrefixLiteral = null)
    {
        if (PrefixLiteral != null)
            lblIncome.Controls.Add(new Literal() { Text = PrefixLiteral });

        for (int i = 1; i <= 12; i++)
        {
            lblIncome.Controls.Add(new Literal() { Text = "<td class='number'>" });
            DropDownList dd = new DropDownList() { ID = Name + i, Width = 55 };
            dd.Items.AddRange(list);
            lblIncome.Controls.Add(dd);
        }
    }

    protected void CreateIncomeSection()
    {
        lblIncome.Controls.Add(new Literal() { Text = "<table id='tableSalary' class='table table-condensed hover-style'><tr><th>#<th>Pay Components" });

        DateTime dt = new DateTime(2014, 4, 1);
        for (int i = 0; i < 12; i++)
            lblIncome.Controls.Add(new Literal() { Text = "<td class='number' style='font-weight:bold;'>" + dt.AddMonths(i).ToString("MMM-yy") });


        lblIncome.Controls.Add(new Literal() { Text = "<td class='number' style='font-weight:bold;'>Total<tr><th><th colspan='14' style='background-color:#D4E7D6;'>Income" }); ;
        int ctr = 1;
        foreach (var srv in Enum.GetValues(typeof(Income)))
        {
            CreateTextControls(srv.ToString(),"<tr><td>" + ctr + "<td>" + srv);
            ctr++;
        }
        
        CreateTextControls("TotalIncome", "<tr><td><td>Total");

        //Deductions
        lblIncome.Controls.Add(new Literal() { Text = "<tr><td><th colspan='14' style='background-color:#D4E7D6;'>Deductions" });

        foreach (var srv in Enum.GetValues(typeof(Deduction)))
        {
            CreateTextControls(srv.ToString(),"<tr><td>" + ctr + "<td>" + srv);
            ctr++;
            if (srv.ToString() == "TDS")   //created tdsDue labels
            {
                CreateLBLControls("TDSDue", "<tr><td><td>");
            }
        }
        
        //CreateLBLControls("TotalDeduction", "<tr><td><td>Total");
        CreateTextControls("TotalDeduction", "<tr><td><td>Total");

        CreateLBLControls("Net","<tr><th><th>Net");
        
        CreateTextControls("RentPaid","<tr><td><th>Rent Paid");
        

        ListItem[] listItems=new ListItem[2];
        listItems[0] = new ListItem("No", "N");
        listItems[1]=new ListItem("Yes","M");
        

        CreateDropDownControls("ddMetro", listItems,"<tr><td><th>Metro/Non Metro");
        CreateDropDownControls("ddCarProvided", listItems,"<tr><td><th>Company Car Provided");

        CreateTextControls("Paid", "<tr><th><th>Paid");
        CreateTextControls("PaidOn", "<tr><th><th>Paid On");
        CreateTextControls("Challan", "<tr><td><th>Challan No");

        lblIncome.Controls.Add(new Literal() { Text = "</table>" });
    }
}