<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ServiceFee.aspx.cs" Inherits="ServiceFee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body style="height:300px;">
    <form id="form1" runat="server">
        <div class="row-fluid">
            <div class="col-md-12" style="font-weight:bold;">
                ID: <asp:Label ID="lblId" runat="server" Text="0"></asp:Label> | 
                Type: <asp:Label ID="lblType" runat="server" Text="0"></asp:Label>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-md-12">
                Chargable Ammount:
                <asp:Label ID="lblChargableAmmount" runat="server" Text="0"></asp:Label>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-md-12">
                Avl Bal:
                <asp:Label ID="lblAvlBal" runat="server" Text="0"></asp:Label>
            </div>
        </div>
        
        <div class="row-fluid">
            <div class="col-md-12">
                Remaining Bal:
                <asp:Label ID="lblBalance" runat="server" Text="0"></asp:Label>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-md-12">
                <asp:Button ID="btnSubmit" runat="server" Text="OK" OnClick="btnSubmit_Click" CssClass="btn btn-success" />
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-md-12">
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
