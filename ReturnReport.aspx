<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ReturnReport.aspx.cs" Inherits="ReturnReport" %>
<%@ Register Src="~/Controls/ReturnFormFilterl.ascx" TagPrefix="uc1" TagName="ReturnFormFilterl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Return Report</h1>
    <uc1:ReturnFormFilterl runat="server" ID="ReturnFormFilterl" />
    <asp:Label ID="lblReport" runat="server"></asp:Label>
</asp:Content>

