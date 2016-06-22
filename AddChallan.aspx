<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddChallan.aspx.cs" Inherits="AddChallan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Challan</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/css/datepicker.css" rel="stylesheet" />

    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/common.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="/js/bootstrap-datepicker.js"></script>
    
    <style type="text/css">
        .form-group
        {
            margin-bottom: 5px !important;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function ()
        {
            $(".addtext").keyup(function ()
            {
                var add = 0;
                $(".addtext").each(function ()
                {
                    add += Number($(this).val());
                });
                $(".total").text(add.toFixed(2));
            });
        });
    </script>
</head>
<body style="height:710px; width:450px; margin-bottom: 0px !important;">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">Challan</h3>
        </div>
        <div class="panel-body">
    <form id="form1" runat="server" style="margin-bottom: 0px !important;">
        <div class="form-horizontal">
            <div class="form-group" style="font-weight:bold; color:darkgray;">
                <label class="control-label col-xs-4"></label>
                <div class="col-xs-8">
                    Serial No [301] : <span runat="server" id="spanSrlNo">0</span>
                </div>
            </div>

            <div class="form-group" style="display:none;">
                <label class="control-label col-xs-4"></label>
                <div class="col-xs-8">
                    Challan ID : <span runat="server" id="spanChallanID">0</span>
                    Form ID : <span runat="server" id="spanFormID">0</span>
                </div>
            </div>

            <div class="form-group">
                <label for="txtDate" class="control-label col-xs-4">Date [311]</label>
                <div class="col-xs-8">
                    <asp:TextBox ID="txtDate" class="form-control datePicker" placeholder="Date" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <label for="txtBSRCode" class="control-label col-xs-4">BSR Code [311]</label>
                <div class="col-xs-8">
                    <asp:TextBox ID="txtBSRCode" class="form-control" placeholder="BSR Code" runat="server" MaxLength="7"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <label for="txtChalllnNo" class="control-label col-xs-4">Challan No [310]</label>
                <div class="col-xs-8">
                    <asp:TextBox ID="txtChalllnNo" class="form-control" placeholder="Challan No" runat="server" MaxLength="5"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="txtTDS" class="control-label col-xs-4">TDS [302]</label>
                <div class="col-xs-8">
                    <asp:TextBox ID="txtTDS" class="form-control addtext" placeholder="TDS" runat="server" MaxLength="20"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="txtSurcharge" class="control-label col-xs-4">Surcharge</label>
                <div class="col-xs-8">
                    <asp:TextBox ID="txtSurcharge" class="form-control addtext" placeholder="Surcharge" runat="server" MaxLength="20"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="txtEducationCess" class="control-label col-xs-4">Education Cess</label>
                <div class="col-xs-8">
                    <asp:TextBox ID="txtEducationCess" class="form-control addtext" placeholder="Education Cess" runat="server" MaxLength="20"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="txtInterest" class="control-label col-xs-4">Interest [304]</label>
                <div class="col-xs-8">
                    <asp:TextBox ID="txtInterest" class="form-control addtext" placeholder="Interest" runat="server" MaxLength="20"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="txtFee" class="control-label col-xs-4">Fee [305]</label>
                <div class="col-xs-8">
                    <asp:TextBox ID="txtFee" class="form-control addtext" placeholder="Fee" runat="server" MaxLength="20"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="txtOthers" class="control-label col-xs-4">Others [306]</label>
                <div class="col-xs-8">
                    <asp:TextBox ID="txtOthers" class="form-control addtext" placeholder="Others" runat="server" MaxLength="20"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="txtTotal" class="control-label col-xs-4">Total [307]</label>
                <div class="col-xs-8">
                    <%--<asp:TextBox ID="txtTotal" class="form-control" placeholder="Total" runat="server"></asp:TextBox>--%>
                    <asp:Label ID="lblTotal" runat="server" Text="0.00" CssClass="total"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <label for="ddMinorHead" class="control-label col-xs-4">Minor Head [312]</label>
                <div class="col-xs-8">
                    <asp:DropDownList ID="ddMinorHead" runat="server" class="form-control">
                        <asp:ListItem Value="200">200-TDS payble by taxpayer</asp:ListItem>
                        <asp:ListItem Value="400">400-TDS regular assessment</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="form-group">
                <label for="txtRemark" class="control-label col-xs-4">Remark</label>
                <div class="col-xs-8">
                    <asp:TextBox ID="txtRemark" class="form-control" placeholder="Remark" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="txtIntrestAllocated" class="control-label col-xs-4">Interest (Allocated)</label>
                <div class="col-xs-8">
                    <asp:TextBox ID="txtIntrestAllocated" class="form-control" placeholder="Intrest (Allocated)" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="txtOthersAllocated" class="control-label col-xs-4">Others (Allocated)</label>
                <div class="col-xs-8">
                    <asp:TextBox ID="txtOthersAllocated" class="form-control" placeholder="Others (Allocated)" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="btnSubmit" class="control-label col-xs-4"></label>
                <div class="col-xs-8">
                    <asp:Button ID="btnSubmit" runat="server" Text="Save" class="btn btn-sm btn-success" OnClick="btnSubmit_Click" />
                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </form>
        </div>
     </div>
</body>
</html>
