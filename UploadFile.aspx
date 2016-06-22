<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UploadFile.aspx.cs" Inherits="UploadFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upload File</title>
    <script src="../js/jquery-1.9.1.min.js"></script>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <link href="/css/main.css" rel="stylesheet" />
    <script src="../js/common.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="h3">Upload File</h1>
            <table class="table bordrless" style="margin-bottom: 0px;height:100px;">
                <tr style="display: none;">
                    <td>ID:</td>
                    <td>
                        <asp:Label ID="lblID" runat="server" Text="0"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                </tr>
                <tr>

                    <td colspan="2">
                        <asp:Button ID="btnSubmit" runat="server" Text="Upload" OnClick="btnSubmit_Click" CssClass="btn btn-success" />
                        <asp:Label ID="lblFileUploadMsg" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
