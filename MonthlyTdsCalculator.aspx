<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="MonthlyTdsCalculator.aspx.cs" Inherits="MonthlyTdsClculator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function ()
        {
            $(".change").change(function ()
            {
                Calculate();
            });
        });

        function Calculate()
        {
            var totalTaxIncome=$("#txtTotalEstimatedIncome").val()-$("#txtEligibleDeduction").val()
            $("#lblTotalTaxableIncome").text();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Monthly TDS Calculator (Salary)</h1>
    <table>
        <tr>
            <th>Enter Expected Salary and Deductions</th>
            <th></th>
        </tr>
        <tr>
            <td>Financial Year</td>
            <td>
                <asp:DropDownList CssClass ="change" ID="ddFinancialYear" runat="server">
                    <asp:ListItem>2014-15</asp:ListItem>
                    <asp:ListItem>2013-14</asp:ListItem>
                    <asp:ListItem>2012-13</asp:ListItem>
                    <asp:ListItem>2013-14</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>Category</td>
            <td>
                <asp:DropDownList ID="ddCategory" CssClass="change" runat="server">
                    <asp:ListItem>G-General</asp:ListItem>
                    <asp:ListItem>F-Female</asp:ListItem>
                    <asp:ListItem>S-Senior Citizen</asp:ListItem>
                    <asp:ListItem>O-Very Senior Citizen</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>Total Estimated Income for hole Financial Year</td>
            <td>
                <asp:TextBox ID="txtTotalEstimatedIncome" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Less : Eligible Deduction</td>
            <td>
                <asp:TextBox ID="txtEligibleDeduction" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Totl Taxable Income</td>
            <td>
                <asp:Label ID="lblTotalTaxableIncome" runat="server" Text="0.0"></asp:Label></td>
        </tr>
    </table>
    <br />
    <table>
        <tr>
            <th>Tax Calculation</th>
            <th></th>
        </tr>
        <tr>
            <td>Less Tax Credit</td>
            <td></td>
        </tr>
        <tr>
            <td>Income Taxable Income</td>
            <td></td>
        </tr>
        <tr>
            <td>Surcharge</td>
            <td></td>
        </tr>
        <tr>
            <td>Education Cess</td>
            <td></td>
        </tr>
        <tr>
            <td>Total Tax Laibility For The Year</td>
            <td></td>
        </tr>
        <tr>
            <td>Monthly TDS</td>
            <td></td>
        </tr>
    </table>
</asp:Content>

