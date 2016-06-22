<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="DownloadUsefulForms.aspx.cs" Inherits="DownloadUsefulForms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
       .table>tbody>tr>td, .table>tfoot>tr>td {
padding: 4px;
line-height: 1;
vertical-align: top;
border-top: 0px solid #ddd;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h1>Download Useful Forms</h1>
    <table class="table">
        <tr><td colspan="5" class="boldFont"></td></tr>
        <tr>
            <td>
                
            </td>
            <td>
                <asp:Button ID="btnChallan281" CssClass="btn btn-info" runat="server" Text="Challan ITNS 281" OnClick="btnChallan281_Click" />
            </td>
            <td>
                <asp:Button ID="btnForm16A" CssClass="btn btn-info" runat="server" Text="Form 16 A" OnClick="btnForm16A_Click" />
            </td>
            <td>
                
            </td>
        </tr>
        <tr><td colspan="5" class="boldFont"></td></tr>
        <tr>
            <td>
                
            </td>
            <td>
                <asp:Button ID="btnForm24Q" CssClass="btn btn-info" runat="server" Text="Form 24Q" OnClick="btnForm24Q_Click" />
            </td>
            <td>
                <asp:Button ID="btnForm26Q" CssClass="btn btn-info" runat="server" Text="Form 26Q" OnClick="btnForm26Q_Click" />
            </td>
            <td>
            </td>
        </tr>
        <tr><td colspan="5" class="boldFont"></td></tr>
        <tr>
            <td>
                
            </td>
            <td>
                <asp:Button ID="btnForm27Q" CssClass="btn btn-info" runat="server" Text="Form 27Q" OnClick="btnForm27Q_Click" />
            </td>
            <td>
                <asp:Button ID="btnForm27EQ" CssClass="btn btn-info" runat="server" Text="Form 27EQ" OnClick="btnForm27EQ_Click" />
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

