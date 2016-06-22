<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditUser.aspx.cs" Inherits="Admin_EditUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../js/jquery-1.9.1.min.js"></script>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <link href="/css/main.css" rel="stylesheet" />
    <script src="../js/common.js"></script>
    <script type="text/javascript">
        $(document).ready(function ()
        {
            $("#txtEmail").blur(function ()
            {
                if ($(this).val() != "") {
                    if (!IsEmail($(this).val())) {
                        $(this).focus();
                        alert("Invalid email");
                    }
                }
            });
        });
        function Validate()
        {
            if ($("#ddUserType").val() == "-1")
            {
                $("#ddUserType").focus();
                alert("Please select a user type!");
                return false;
            }
            if ($("#txtName").val() == "")
            {
                alert("Name is mandatory!");
                $("#txtName").focus();
                return false;
            }
            if ($("#txtEmail").val() == "")
            {
                alert("Email Id is mandatory!");
                $("#txtEmail").focus();
                return false;
            }
            if ($("#txtPassword").val() == "")
            {
                alert("Password is mandatory!");
                $("#txtPassword").focus();
                return false;
            }
        }
    </script>
</head>
<body style="margin-bottom: 0px;">
    <form id="form1" runat="server">
        <table class="table table-condensed EditRRTable" style="margin-bottom: 0px; width: 400px;">
            <tr style="display:none;">
                <td>ID:
                    <asp:Label ID="lblID" runat="server" Text="0"></asp:Label></td>
                <td>Licence ID:
                    <asp:Label ID="lblLicenceID" runat="server" Text="0"></asp:Label></td>
            </tr>
            <tr>
                <td>User Type<span class="mandatory">*</span></td>
                <td>
                    <asp:DropDownList ID="ddUserType" runat="server" CssClass="form-control">
                        <asp:ListItem Value="-1">-Select-</asp:ListItem>
                        <asp:ListItem Value="2">Agent Admin</asp:ListItem>
                        <asp:ListItem Value="1">Agent</asp:ListItem>
                        <asp:ListItem Value="0">Customer</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Name<span class="mandatory">*</span></td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" MaxLength="40"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td>Email<span class="mandatory">*</span></td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Password<span class="mandatory">*</span></td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnSave" CssClass="btn btn-sm btn-success" runat="server" Text="Save" OnClick="btnSave_Click" OnClientClick="return Validate()" />
                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
