<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ReportQuarterWise.aspx.cs" Inherits="ReportQuarterVise" %>

<%@ Register Src="~/Controls/ReturnFormFilterl.ascx" TagPrefix="uc1" TagName="ReturnFormFilterl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .salarydetail tr td:nth-child(4)
        {
            text-indent:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 id="pageHeading" runat="server" class="no-print"></h1>
    <div class="row no-print">
        <div class="col-md-8">
            <uc1:ReturnFormFilterl runat="server" ID="ReturnFormFilterl" />
        </div>
        <div class="col-md-4">
            <%--<table class="table">
                <tr>
                    <td style="border-top:0px;">
                        <asp:DropDownList ID="ddrReportType" runat="server" AutoPostBack="true" CssClass="form-control">
                            <asp:ListItem Value="-1">--Select Report--</asp:ListItem>
                            <asp:ListItem Value="1">Company Report</asp:ListItem>
                            <asp:ListItem Value="2">Challan Report</asp:ListItem>
                            <asp:ListItem Value="3">Employee Report</asp:ListItem>
                            <asp:ListItem Value="4">Salary Detail Report</asp:ListItem>
                            <asp:ListItem Value="5">Salary Yearly Report</asp:ListItem>
                            <asp:ListItem Value="6">Return Report</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>--%>
        </div>
        <%--<div class="col-md-2">
        </div>--%>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12">
            <asp:Label ID="lblReport" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>

