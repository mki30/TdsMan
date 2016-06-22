<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ReturnFormFilterl.ascx.cs" Inherits="Controls_ReturnFormFilterl" %>
<style type="text/css">
    #Table1 > tbody > tr > td
    {
        padding: 8px;
        line-height: 1.42857143;
        vertical-align: middle;
        border-top: 0px;
    }
</style>
<div class="row">
    <div class="col-md-4">
        <div class="input-group input-group-sm" id="form" runat="server">
            <span class="input-group-addon" id="tdFormLabel" runat="server">Form</span>
            <asp:DropDownList ID="ddFormNo" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddFilter_SelectedIndexChanged">
                <asp:ListItem Value="-1">-Select-</asp:ListItem>
                <asp:ListItem Value="24Q">24Q</asp:ListItem>
                <asp:ListItem Value="26Q">26Q</asp:ListItem>
                <asp:ListItem Value="27Q">27Q</asp:ListItem>
                <asp:ListItem Value="27EQ">27EQ</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <div class="col-md-4">
        <div class="input-group input-group-sm" id="qtr" runat="server">
            <span class="input-group-addon" id="tdQuarter" runat="server">Qtr</span>
            <asp:DropDownList ID="ddQuarter" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddFilter_SelectedIndexChanged" CssClass="form-control">
                <asp:ListItem Value="-1">-All-</asp:ListItem>
                <asp:ListItem Value="Q1">Q1</asp:ListItem>
                <asp:ListItem Value="Q2">Q2</asp:ListItem>
                <asp:ListItem Value="Q3">Q3</asp:ListItem>
                <asp:ListItem Value="Q4">Q4</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <div class="col-md-4">
        <div class="input-group input-group-sm" id="chln" runat="server">
            <span class="input-group-addon" id="tdChallanLabel" runat="server">Challan</span>
            <asp:DropDownList ID="ddChallans" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddChallans_SelectedIndexChanged" CssClass="form-control">
            </asp:DropDownList>
        </div>
    </div>
</div>
<%--<asp:Table ID="Table1" runat="server" CssClass="table no-print">
    <asp:TableRow runat="server">
        <asp:TableCell ID="tdFormLabel" runat="server" Style="text-align: right">Form</asp:TableCell>
        <asp:TableCell ID="tdFormData" runat="server">
            <asp:DropDownList ID="ddFormNo" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddFilter_SelectedIndexChanged">
                <asp:ListItem Value="-1">-Select-</asp:ListItem>
                <asp:ListItem Value="1">24Q</asp:ListItem>
                <asp:ListItem Value="2">26Q</asp:ListItem>
                <asp:ListItem Value="3">27Q</asp:ListItem>
                <asp:ListItem Value="4">27EQ</asp:ListItem>
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell runat="server" Style="text-align: right" ID="tdQuarter">Qtr</asp:TableCell>
        <asp:TableCell runat="server" ID="tdQuarterData">
            <asp:DropDownList ID="ddQuarter" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddFilter_SelectedIndexChanged" CssClass="form-control">
                <asp:ListItem Value="-1">-All-</asp:ListItem>
                <asp:ListItem Value="1">Q1</asp:ListItem>
                <asp:ListItem Value="2">Q2</asp:ListItem>
                <asp:ListItem Value="3">Q3</asp:ListItem>
                <asp:ListItem Value="4">Q4</asp:ListItem>
            </asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell ID="tdChallanLabel" runat="server" Style="text-align: right">Challan</asp:TableCell>
        <asp:TableCell ID="tdChallanData" runat="server">
            <asp:DropDownList ID="ddChallans" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddChallans_SelectedIndexChanged" CssClass="form-control">
            </asp:DropDownList>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>--%>
