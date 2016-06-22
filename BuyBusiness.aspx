<%@ Page Title="Buy Business" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="BuyBusiness.aspx.cs" Inherits="BuyBusiness" %>

<%@ Register Src="~/Controls/BuyBusinessFilter.ascx" TagPrefix="uc1" TagName="BuyBusinessFilter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".forcenumeric").keypress(isNumberKey);
            $("#txtEmail").blur(function () {
                if ($(this).val() != "") {
                    if (!IsEmail($(this).val())) {
                        $(this).focus();
                        alert("Invalid email");
                    }
                }
            });
        });

        function Validate() {
            if ($("#txtName").val() == "") {
                $("#txtName").focus();
                alert("Name is mandatory!");
                return false;
            }
            if ($("#txtEmail").val() == "") {
                if ($("#txtEmail").is(":visible")) {
                    alert("Email is mandatory!");
                    $("#txtEmail").focus();
                    return false;
                }
            }
            if ($("#txtContact").val() == "") {
                if ($("#txtContact").is(":visible")) {
                    alert("Contact no is mandatory!");
                    $("#txtContact").focus();
                    return false;
                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="col-md-8 col-md-offset-2">&nbsp;&nbsp;&nbsp;&nbsp;Buy Business</h1>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <div id="divFindBusines" runat="server" class="col-lg-12" style="padding: 2px; margin-left: 65px; background-repeat: repeat-y; background-size: 100%;">
        <uc1:BuyBusinessFilter runat="server" ID="BuyBusinessFilter" />
    </div>
    <%--background-image: url('/Images/SellBusiness.jpg'); --%>
    <asp:Literal ID="ltHeader" runat="server"></asp:Literal>
    <div id="divBusinesRequest" runat="server" class="col-md-6 col-md-offset-3" visible="false">
        <div class="panel panel-primary">
            <div class="panel-heading">
                Business Request
                <label runat="server" id="lblID" style="display: none;">0</label>
                <asp:Label ID="lblErrorMsg" runat="server" Text="" CssClass="label label-danger"></asp:Label>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table class="table BorderLess RightAlign">
                        <tbody>
                            <tr id="userTypeRow" runat="server">
                                <td>Name<span class="mandatory">*</span></td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr id="certfTypeRow" runat="server">
                                <td>Email<span class="mandatory">*</span></td>
                                <td>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Contact<span class="mandatory">*</span></td>
                                <td>
                                    <asp:TextBox ID="txtContact" runat="server" CssClass="form-control forcenumeric" MaxLength="15"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="BtnSubmit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="BtnSubmit_Click" OnClientClick="return Validate();" />
                                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

