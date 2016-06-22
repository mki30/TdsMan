<%@ Page Title="Employee List" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="EmployeeList.aspx.cs" Inherits="EmployeeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Employee Master</h1>
    <%--<table style="width:100%;">
        <tr>
            <td style="width:10%">Company: </td>
            <td style="width:90%">
                <asp:DropDownList ID="ddCompany" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddCompany_SelectedIndexChanged" CssClass="no-print">
                </asp:DropDownList>
                <asp:Label style="display:none;" class="show-print" ID="ltCompanyName" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />--%>
    <asp:Literal ID="lblEmployeeList" runat="server" Text=""></asp:Literal>
    <a href="#" runat="server" id="addEmployeeLink" class="fancybox400 fancybox.iframe btn btn-sm btn-success pull-right no-print"><span class="glyphicon glyphicon-plus">&nbsp;</span>Add New Employee</a>
    <asp:Label ID="lblSalryList" runat="server" Text=""></asp:Label>
</asp:Content>

