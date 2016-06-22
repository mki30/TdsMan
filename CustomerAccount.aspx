<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="CustomerAccount.aspx.cs" Inherits="Admin_CustomerAccount" %>

<%@ Register Src="~/Controls/NotesControl.ascx" TagPrefix="uc1" TagName="NotesControl" %>
<%@ Register Src="~/Controls/StageControl.ascx" TagPrefix="uc1" TagName="StageControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>My Account</h1>
    <asp:Label ID="lblCustomerData" runat="server" Text=""></asp:Label>
    <uc1:NotesControl runat="server" ID="NotesControl" />
    <asp:Label ID="lblSaleBusinessReq" runat="server" Text=""></asp:Label>
    <asp:Label ID="lblBuyBusinessList" runat="server" Text=""></asp:Label>
    <asp:Label ID="lblIncorporate" runat="server" Text=""></asp:Label>
    
    <%--<div class="co-md-8 col-md-offset-2">--%>
    <asp:Label ID="lblVerifiedPAN" runat="server" Text=""></asp:Label>
    <asp:Label ID="lblPAN" runat="server" Text=""></asp:Label>
    <%--</div>--%>
</asp:Content>

