<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditLicense.aspx.cs" Inherits="Admin_EditLicense" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../js/jquery-1.9.1.min.js"></script>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <link href="/css/main.css" rel="stylesheet" />
    <script src="../js/common.js"></script>
    <script src="../js/bootstrap-datepicker.js"></script>
    <link href="../css/datepicker.css" rel="stylesheet" />
    
    <script>
        $(document).ready(function ()
        {
            $(".forcenumeric").keypress(isNumberKey);
            $("#txtEmail").blur(function ()
            {
                if ($(this).val() != "")
                {
                    if (!IsEmail($(this).val()))
                    {
                        $(this).focus();
                        alert("Invalid email");
                    }
                }
            });

            $("#txtValidUpto").datepicker({
                startView: 2,
                orientation: "auto",
                format: 'dd-M-yyyy'
            });
            $('#txtValidUpto').datepicker().on('changeDate', function (ev)
            {
                $('.datepicker').hide();
            });
        });

        function Validate()
        {
            if ($("#txtName").val() == "")
            {
                alert("Name is mandatory!");
                $("#txtName").focus();
                return false;
            }
            if ($("#txtAddress").val() == "")
            {
                alert("Address is mandatory!");
                $("#txtAddress").focus();
                return false;
            }
            if ($("#txtEmail").val() == "")
            {
                alert("Email Id is mandatory!");
                $("#txtEmail").focus();
                return false;
            }
            if ($("#txtPhone").val() == "")
            {
                alert("Phone no is mandatory!");
                $("#txtPhone").focus();
                return false;
            }
        }
    </script>
</head>
<body style="margin-bottom: 0px;">
    <form id="form1" runat="server">
        <table class="table table-condensed EditRRTable" style="margin-bottom: 0px; width: 400px;">
            <tr style="display: none;">
                <td>ID:</td>
                <td>
                    <asp:Label ID="lblID" runat="server" Text="0"></asp:Label></td>
            </tr>
            <tr>
                <td>Name<span class="mandatory">*</span></td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" MaxLength="30"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Address<span class="mandatory">*</span></td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="form-control" MaxLength="80"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Email<span class="mandatory">*</span></td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" MaxLength="40"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Phone<span class="mandatory">*</span></td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control forcenumeric" MaxLength="15"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Type</td>
                <td>
                    <asp:DropDownList ID="ddLicenseType" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">Client</asp:ListItem>
                        <asp:ListItem Value="1">Agent</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Valid Upto</td>
                <td>
                    <asp:TextBox ID="txtValidUpto" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnSave" CssClass="btn btn-sm btn-success" runat="server" Text="Save" OnClick="btnSave_Click" OnClientClick="return Validate();" />
                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
