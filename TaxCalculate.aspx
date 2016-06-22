<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TaxCalculate.aspx.cs" Inherits="TaxCalculate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-1.9.1.min.js"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <style type="text/css">
        table
        {
            margin-bottom:0px !important;
        }
        #tableTaxSunmmary th:last-child,td:last-child
        {
           text-align:right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="table table-condensed">
                <tr>
                    <th>Employee Name: <asp:Label ID="lblName" runat="server" Text=""></asp:Label></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <th>PAN: <asp:Label ID="lblPan" runat="server" Text=""></asp:Label></th>
                    <th>Catagory: <asp:Label ID="lblCatogory" runat="server" Text=""></asp:Label></th>
                    <th>Financial Year: <asp:Label ID="lblFinancialYear" runat="server" Text=""></asp:Label></th>
                </tr>
            </table>
            <hr style="border:2px solid orange;margin:0px;"/>
            <table class="table table-condensed">
                <tr>
                    <th>Tax Calculation Summary</th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <th></th>
                    <th>Total Taxable Income</th>
                    <th></th>
                    <th style="text-align:right;"><asp:Label ID="lblTotalTaxableIncome" runat="server" Text=""></asp:Label></th>
                </tr>
            </table>
            <asp:Label ID="lblTaxTable" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblTaxSummary" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
