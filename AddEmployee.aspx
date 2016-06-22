<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddEmployee.aspx.cs" Inherits="AddEmployee" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-1.9.1.min.js"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="/js/bootstrap-datepicker.js"></script>
    <link href="/css/datepicker.css" rel="stylesheet" />
    <script src="js/bootstrap-typeahead.js"></script>
    <script type="text/javascript">

        $(document).ready(function ()
        {
            $("#txtDate").datepicker({
                startView: 2,
                orientation: "auto",
                format: 'dd-M-yyyy'
            });

            $(".addtext").keyup(function ()
            {
                var add = 0;
                $(".addtext").each(function ()
                {
                    add += Number($(this).val());
                });
                $(".total").text(add);
            });


            $("#txtName").typeahead(
                    {
                        source: function (query, callback)
                        {
                            query.length < 2 ||
                              $.ajax(
                                {
                                    url: "/Data.aspx?Action=SearchEnmployee&term=" + query,
                                    success: function (data)
                                    {
                                        data = JSON.parse(data);
                                        var e = [], k;
                                        $(p).each(function ()
                                        {
                                            e.push(this.name + "-" + this.pan);
                                        });
                                        callback(e);
                                    }
                                })
                        },
                        updater: function (b)
                        {
                            b = b.split("-");
                            alert(b[0]);
                        }
                    });
        });
    </script>

    <style type="text/css">
        .form-group
        {
            margin-bottom: 5px !important;
        }

        .panel-body
        {
            padding: 0px 15px 0px 15px;
        }
    </style>
</head>
<body style="height: 620px; width: 500px;">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title"><span id="lblPanelHead" runat="server">Employee</span></h3>
        </div>
        <div class="panel-body">
            <form id="form1" runat="server">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-horizontal">
                            <div class="form-group" style="background-color: #FFF0D9; padding: 2px;">
                                <label class="control-label col-xs-4"></label>
                                <div class="col-xs-8" style="font-weight: bold; color: gray;">
                                    Challan No: <span runat="server" id="ChallanNo">0</span>&nbsp;&nbsp;
                                    Date :<span runat="server" id="challanDate" style="font-weight: bold;"></span>
                                </div>
                            </div>
                            <div class="form-group" style="display: none">
                                <label class="control-label col-xs-4"></label>
                                <div class="col-xs-8">
                                    ID : <span runat="server" id="spanID"></span>
                                    Challlan ID :<span runat="server" id="ChallanID"></span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-xs-4"></label>
                                <div class="col-xs-8" style="font-weight: bold; color: gray;">
                                    Serial No [313] : <span runat="server" id="spanSrlNo">0</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="ddEmployee" class="control-label col-xs-4" runat="server" id="lblddEmployee">Name</label>
                                <div class="col-xs-8">
                                    <asp:TextBox ID="txtName" class="form-control" placeholder="Name" runat="server"></asp:TextBox>
                                    <asp:DropDownList ID="ddEmployee" runat="server" class="form-control" Style="display: none;"></asp:DropDownList>
                                    <asp:Label ID="lblEmployee" runat="server" Text=""></asp:Label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="ddEmployee" class="control-label col-xs-4" runat="server" id="Label1">Pan</label>
                                <div class="col-xs-8">
                                    <asp:TextBox ID="txtPan" class="form-control" placeholder="Pan" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="ddSection" class="control-label col-xs-4">Section [317]</label>
                                <div class="col-xs-8">
                                    <asp:DropDownList ID="ddSection" runat="server" class="form-control">
                                        <asp:ListItem Value="92A">192A</asp:ListItem>
                                        <asp:ListItem Value="92B">192B</asp:ListItem>
                                        <asp:ListItem Value="92C">192C</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="txtDate" class="control-label col-xs-4">Pay Date [318]</label>
                                <div class="col-xs-8">
                                    <asp:TextBox ID="txtDate" class="form-control" placeholder="Date" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="txtAmountOfPayment" class="control-label col-xs-4">Payment Amt [320]</label>
                                <div class="col-xs-8">
                                    <asp:TextBox ID="txtAmountOfPayment" class="form-control" placeholder="Amount Of Payment" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="txtIncomeTax" class="control-label col-xs-4">Income Tax [321]</label>
                                <div class="col-xs-8">
                                    <asp:TextBox ID="txtIncomeTax" class="form-control  addtext" placeholder="Income Tax" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="txtSurcharge" class="control-label col-xs-4">Surcharge</label>
                                <div class="col-xs-8">
                                    <asp:TextBox ID="txtSurcharge" class="form-control  addtext" placeholder="Surcharge" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="txtCess" class="control-label col-xs-4">Cess [322]</label>
                                <div class="col-xs-8">
                                    <asp:TextBox ID="txtCess" class="form-control  addtext" placeholder="Cess" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="lblTotal" class="control-label col-xs-4">Total [323]</label>
                                <div class="col-xs-8">
                                    <asp:Label ID="lblTotal" runat="server" CssClass="form-control total" Text="0.0" Style="background-color: lightgray;"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="txtTaxDeposited" class="control-label col-xs-4">Tax Deposited [324]</label>
                                <div class="col-xs-8">
                                    <asp:TextBox ID="txtTaxDeposited" class="form-control" placeholder="Tax Deposited" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="ddRemarks" class="control-label col-xs-4">Remarks [326]</label>
                                <div class="col-xs-8">
                                    <asp:DropDownList ID="ddRemarks" runat="server" class="form-control">
                                        <asp:ListItem Value="">Normal</asp:ListItem>
                                        <asp:ListItem Value="A">Lower Deduction u/s 197</asp:ListItem>
                                        <asp:ListItem Value="B">No Deduction u/s 197</asp:ListItem>
                                        <asp:ListItem Value="C">Higher Rate (Valid PAN Not Available)</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="txtCirtificateNo" class="control-label col-xs-4">Certificate No [327]</label>
                                <div class="col-xs-8">
                                    <asp:TextBox ID="txtCirtificateNo" class="form-control" placeholder="Certificate No" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="btnSave" class="control-label col-xs-4"></label>
                                <div class="col-xs-8">
                                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-sm btn-success" OnClick="btnSave_Click" />
                                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
