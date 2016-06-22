<%@ Page Title="Company List" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="CompanyList.aspx.cs" Inherits="CompanyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Company Master</h1>
    <asp:Label ID="lblCompanyList" runat="server" Text="Label"></asp:Label>
    <a href="/CompanyPage.aspx?id=0" class="fancybox fancybox.iframe btn btn-sm btn-success pull-right no-print">+ Add New Company</a>
</asp:Content>

