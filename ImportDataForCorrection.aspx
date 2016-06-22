<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ImportDataForCorrection.aspx.cs" Inherits="ImportDataForCorrection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Import TDS/TCS for Correction</h1>
    <table class="table table-bordered">
        <tr>
            <td colspan="2">As per the  new notification released by TRACES it is mandatory to make corrections using consolidated TDS/TCS statement only downloaded from TRACES website</td>
        </tr>
        <tr>
            <td colspan="2">
                <a href="http://contents.tdscpc.gov.in/en/download-nsdl-conso-file-etutorial.html" target="_blank">Click here to view thre  tutorial on how to get the TDS/TCS</a>
            </td>
        </tr>
        <tr>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
            <td>
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                <asp:Button ID="btnImport" runat="server" Text="Import" CssClass="pull-right" OnClick="btnImport_Click"/>
            </td>
        </tr>
    </table>
</asp:Content>

