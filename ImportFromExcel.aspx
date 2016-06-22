<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ImportFromExcel.aspx.cs" Inherits="ImportFromExcell" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Download Important Forms</h1>
    <table class="table">
        <tr><td colspan="5" class="boldFont">For financial year 2013-14 onwoards</td></tr>
        <tr>
            <td>
                <asp:Button ID="btn24QDownload1314" CssClass="btn btn-info" runat="server" Text="Download Blank Excel Sheet for 24Q" OnClick="btn24QDownload1314_Click" />
            </td>
            <td>
                <asp:Button ID="btn26QDownload1314" CssClass="btn btn-info" runat="server" Text="Download Blank Excel Sheet for 26Q" OnClick="btn26QDownload1314_Click" />
            </td>
            <td>
                <asp:Button ID="btn27QDownload1314" CssClass="btn btn-info" runat="server" Text="Download Blank Excel Sheet for 27Q" OnClick="btn27QDownload1314_Click" />
            </td>
            <td>
                <asp:Button ID="btn27EQDownload1314" CssClass="btn btn-info" runat="server" Text="Download Blank Excel Sheet for 27EQ" OnClick="btn27EQDownload1314_Click" />
            </td>
        </tr>
        <tr><td colspan="5" class="boldFont">Upto financial year 2013-14</td></tr>
        <tr>
            <td>
                <asp:Button ID="btn24QDownload1213" CssClass="btn btn-info" runat="server" Text="Download Blank Excel Sheet for 24Q" />
            </td>
            <td>
                <asp:Button ID="btn26QDownload1213" CssClass="btn btn-info" runat="server" Text="Download Blank Excel Sheet for 26Q" />
            </td>
            <td>
                <asp:Button ID="btn27QDownload1213" CssClass="btn btn-info" runat="server" Text="Download Blank Excel Sheet for 27Q" />
            </td>
            <td>
                <asp:Button ID="btn27EQDownload1213" CssClass="btn btn-info" runat="server" Text="Download Blank Excel Sheet for 27EQ" />
            </td>
        </tr>
    </table>

</asp:Content>

