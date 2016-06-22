<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="TanVerification.aspx.cs" Inherits="TanVerification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/common.js"></script>
    <script type="text/javascript">
        $(document).ready(function ()
        {
            $('#txtPan').keyup(function ()
            {
                $(this).val($(this).val().toUpperCase());
            });
        });

        function Validate()
        {
            if ($("#ddTanCategory").val() == "-1")
            {
                $("#ddTanCategory").focus();
                alert("Please Select Category Of Deductor!");
                return false;
            }
            if ($("#ddState").val() == "")
            {
                $("#ddState").focus();
                alert("Please Select State!");
                return false;
            }
            if ($("#txtTan").val() == "")
            {
                $("#txtTan").focus();
                alert("Please enter a TAN!");
                return false;
            }
            if ($("#txtCapchaText").val() == "")
            {
                alert("Plese fill capcha!");
                $("#txtCapchaText").focus();
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 50%; margin: 0 auto;">
        <div class="row">
            <div class="col-md-12">
                <h1>TAN Verification</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">Know Your TAN</div>
                    <div class="panel-body">
                        <table class="table BorderLess" style="width: 100%">
                            <tr>
                                <td style="width: 150px;">Category of Deductor</td>
                                <td>
                                    <asp:DropDownList runat="server" name="ddTanCategory" ID="ddTanCategory" CssClass="form-control">
                                        <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                        <asp:ListItem Value="3">Company</asp:ListItem>
                                        <asp:ListItem Value="2">Statutory/ Autonomous Bodies/Local Authorities</asp:ListItem>
                                        <asp:ListItem Value="1">Central/State Government</asp:ListItem>
                                        <asp:ListItem Value="7">Firms/AOP/AOP(Trust)/BOI/Artificial Juridiacal Person</asp:ListItem>
                                        <asp:ListItem Value="6">Branch of Individual Business(sole proprietorship concern)/HUF(Karta)</asp:ListItem>
                                        <asp:ListItem Value="5">Individual/Hindu Undivided Family(Karta)</asp:ListItem>
                                        <asp:ListItem Value="4">Branch of Company</asp:ListItem>
                                        <asp:ListItem Value="8">Branch of Firms /AOP/AOP(Trust)/BOI/Artifical Juridical person</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>State</td>
                                <td>
                                    <asp:DropDownList runat="server" ID="ddState" CssClass="form-control">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>TAN</td>
                                <td>
                                    <asp:TextBox ID="txtTan" runat="server" CssClass="form-control"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Image ID="imgCaptcha" runat="server" />&nbsp;&nbsp;<asp:LinkButton ID="lnkRefreshBurtton" runat="server" OnClick="lnkRefreshBurtton_Click"><span class="glyphicon glyphicon-refresh"></span></asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td>Enter the no as above</td>
                                <td>
                                    <asp:TextBox ID="txtCapchaText" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="btnGetData" runat="server" Text="Get Data" OnClick="btnGetData_Click" CssClass="btn btn-success" OnClientClick="return Validate()" />
                                    <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>


                </div>

            </div>
        </div>

        <div class="row">
            <%--<div class="panel panel-primary">
                <div class="panel-heading">Know Your TAN</div>--%>
            <div class="panel-body">
                <div id="divData" runat="server">
                </div>
            </div>
            <%--</div>--%>
            <%--  </div>--%>
        </div>
    </div>
</asp:Content>
