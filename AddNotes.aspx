<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddNotes.aspx.cs" Inherits="AddNotes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Notes</title>
    <script src="../js/jquery-1.9.1.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/css/main.css" rel="stylesheet" />
    <script src="../js/common.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="h3">Add Notes</h1>
            <table class="table bordrless" style="margin-bottom: 0px; height: 90px;">
                <tr style="display:none;">
                    <td colspan="2">ID:<asp:Label ID="lblID" runat="server" Text="0"></asp:Label>&nbsp;|&nbsp;
                        TableID:<asp:Label ID="lblTableID" runat="server" Text="0"></asp:Label>&nbsp;|&nbsp;
                    KeyID:<asp:Label ID="lblKeyID" runat="server" Text="0"></asp:Label>
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="Admin Only" ToolTip="Visible only to the admin" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" style="height:100px;width:100%;" MaxLength="300"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSubmit" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnSubmit_Click"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
