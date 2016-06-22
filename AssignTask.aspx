<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AssignTask.aspx.cs" Inherits="AssignTask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Assign Task</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row-fluid">
            <div class="col-md-12">
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-md-12">
                <h1 class="h3">Assign Task To</h1>
            </div>
            <asp:Label ID="lblTaskId" runat="server" Text="0" Style="display: none;"></asp:Label>
            <div class="col-md-12">
                <asp:DropDownList ID="ddAgents" runat="server" OnSelectedIndexChanged="ddAgents_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                <br />
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
