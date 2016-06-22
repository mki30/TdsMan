<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="PaymentRecharge.aspx.cs" Inherits="PaymentRecharge" %>

<%@ Register Src="~/Controls/PayUMoneycontrol.ascx" TagPrefix="uc1" TagName="PayUMoneycontrol" %>


<%--<%@ Register Src="~/Controls/PaymentControl.ascx" TagPrefix="uc1" TagName="PaymentControl" %>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-8 col-md-offset-2">

        <table class="table">
            <tr>
                <td>Current Balance:
                </td>
                <td><asp:Label ID="lblCurrentBal" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>Amount:</td>
                <td>
                    <asp:TextBox ID="txtAmount" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Literal ID="ltStatus" runat="server"></asp:Literal>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Recharge" class="btn btn-success" OnClick="btnSubmit_Click" /></td>
                <td></td>
            </tr>
        </table>


        <asp:Panel ID="panelRecharge" runat="server">

            <%-- <div class="panel panel-primary">
                <div class="panel-heading">
                    Balance Recharge
                </div>
                <asp:Label ID="lblID" runat="server" Text="0" Visible="false"></asp:Label>
                <asp:Label ID="lblLicenceID" runat="server" Text="0" Visible="false"></asp:Label>

                <table class="table DataTable">
                    <tr>
                        <td>Amount</td>
                        <td>
                            <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:Button ID="btnSubmit" runat="server" Text="Recharge" class="btn btn-success" OnClick="btnSubmit_Click" /></td>
                        <td>
                            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label></td>
                    </tr>
                </table>
            </div>--%>
        </asp:Panel>
        <asp:Panel ID="panelOnlinePaymet" runat="server" Visible="false">
            <uc1:PayUMoneycontrol runat="server" ID="PayUMoneycontrol" />
            <%-- <uc1:PaymentControl runat="server" ID="PaymentControl" />--%>
        </asp:Panel>

    </div>

</asp:Content>

