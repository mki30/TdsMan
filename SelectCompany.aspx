<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="SelectCompany.aspx.cs" Inherits="SelectCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="table table-bordered" style="width:50%;margin:0 auto;">
        <tr>
            <td>Company</td>
            <td><asp:DropDownList ID="ddCompany" runat="server" OnSelectedIndexChanged="ddCompany_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control"></asp:DropDownList></td>
        </tr>
     </table>
</asp:Content>

