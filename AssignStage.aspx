<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AssignStage.aspx.cs" Inherits="AssignStage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Assign DSC Stage</title>
    <script src="../js/jquery-1.9.1.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/css/main.css" rel="stylesheet" />
    <script src="../js/common.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="h3">DSC Stage</h1>
            <table class="table bordrless" style="margin-bottom: 0px; height: 90px;">
                <tr style="display: none;">
                    <td>ID:<asp:Label ID="lblID" runat="server" Text="0"></asp:Label></td>
                    <td>Stage<asp:Label ID="lblStage" runat="server" Text="0"></asp:Label>
                        TableID:<asp:Label ID="lblTableID" runat="server" Text="0"></asp:Label>&nbsp;|&nbsp;
                        PrimaryKeyID:<asp:Label ID="lblKeyID" runat="server" Text="0"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:DropDownList ID="ddAssignStage" runat="server" OnSelectedIndexChanged="ddAssignStage_SelectedIndexChanged" CssClass="form-control" AutoPostBack="true">
                            <%--<asp:ListItem Value="0">Unassigned</asp:ListItem>
                            <asp:ListItem Value="1">Paid</asp:ListItem>
                            <asp:ListItem Value="2">Assigned</asp:ListItem>
                            <asp:ListItem Value="3">Made</asp:ListItem>
                            <asp:ListItem Value="4">Downloaded</asp:ListItem>
                            <asp:ListItem Value="5">Courier</asp:ListItem>
                            <asp:ListItem Value="6">Original Doc Recieved</asp:ListItem>--%>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>

                    <td colspan="2">
                        <asp:Label ID="lblStageMsg" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
