<%@ Page Title="Deductee List" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="DeducteeList.aspx.cs" Inherits="DeducteeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Deductee Master</h1>
    <%--<table style="width:100%;">
        <tr>
            <td style="width:10%">Company: </td>
            <td style="width:90%">
                <asp:DropDownList ID="ddCompany" class="no-print" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddCompany_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:Label style="display:none;" class="show-print" ID="ltCompanyName" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />--%>
    <asp:Label ID="lblDeducteeList" runat="server" Text=""></asp:Label>
    <a href="#" id="lnkAddDeductee" runat="server" class="fancybox450 fancybox.iframe btn btn-sm btn-success pull-right no-print"><span class="glyphicon glyphicon-plus">&nbsp;</span>Add New Deductee</a>
</asp:Content>

