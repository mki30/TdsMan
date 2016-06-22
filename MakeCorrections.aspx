<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="MakeCorrections.aspx.cs" Inherits="MakeCorrections"  ClientIDMode="Static"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblCorrectionList" runat="server" Text=""></asp:Label>
    <%--<asp:Button ID="btnShowSummary" runat="server" Text="button" OnClick="btnShowSummary_Click" />--%>
    
    <asp:Panel ID="panelSummary" Visible="false" runat="server">
    <%--<asp:Label ID="lblImportSummary" runat="server" Text=""></asp:Label>
    <asp:Label ID="lblCorrectionSummary" runat="server" Text=""></asp:Label>--%>
    <%--<asp:HiddenField ID="HiddenField1" runat="server" />--%>
    </asp:Panel>
</asp:Content>

