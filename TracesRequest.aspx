<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="TracesRequest.aspx.cs" Inherits="TdsReqest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 id="heading" runat="server">Default</h1>
    <table class="table table-bordered">
        <tr>
            <td colspan="3" style="font-weight: bold;">Step1: Enter User Details</td>
        </tr>
        <tr>
            <td>TAN:
                <asp:TextBox ID="txtTan" runat="server" ></asp:TextBox></td>
            <td>User Id:
                <asp:TextBox ID="txtUserId" runat="server" ></asp:TextBox></td>
            <td>Password:
                <asp:TextBox ID="txtPass" runat="server" ></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" style="font-weight: bold;">Select Your Return</td>
        </tr>
        <tr>
            <td>Financial Year:
                <asp:DropDownList ID="ddFinancialYear" runat="server"></asp:DropDownList></td>
            <td>Form: 
                <asp:DropDownList ID="ddForm" runat="server" OnSelectedIndexChanged="ddQuarter_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Value="24Q">24Q</asp:ListItem>
                    <asp:ListItem Value="26Q">26Q</asp:ListItem>
                    <asp:ListItem Value="27Q">27Q</asp:ListItem>
                    <asp:ListItem Value="27EQ">27EQ</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>Quarter: 
                <asp:DropDownList ID="ddQuarter" runat="server" OnSelectedIndexChanged="ddQuarter_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Value="Q1">Q1</asp:ListItem>
                    <asp:ListItem Value="Q2">Q2</asp:ListItem>
                    <asp:ListItem Value="Q3">Q3</asp:ListItem>
                    <asp:ListItem Value="Q4">Q4</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Provisional Receipt No</td>
            <td>
                <asp:TextBox ID="txtProvRecNo" runat="server"></asp:TextBox></td>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="CheckBox1" runat="server" Text="NIL Challlan Statement" /></td>
            <td>
                <asp:CheckBox ID="CheckBox2" runat="server" Text="Book Adjustment Payment" /></td>
            <td>
                <asp:CheckBox ID="CheckBox3" runat="server" Text="No Valid Pan" /></td>
        </tr>
        <tr>
            <td>
                <table class="table table-bordered">
                    <tr>
                        <th colspan="3">Provide any one challan information of that return</th>
                    </tr>
                    <tr>
                        <td>Challan No</td>
                        <td>
                            <asp:TextBox ID="txtChallanNo" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>BSR Code</td>
                        <td>
                            <asp:TextBox ID="txtBSRCode" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Date of Deposit</td>
                        <td>
                            <asp:TextBox ID="txtDOD" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Tax Deposit</td>
                        <td>
                            <asp:TextBox ID="txtDeposit" runat="server"></asp:TextBox></td>
                    </tr>
                </table>
            </td>
            <td colspan="2">
                <table class="table table-bordered">
                    <tr>
                        <th colspan="3">Provide any three deductee records PAN and its Tax Deducted</th>
                    </tr>
                    <tr>
                        <th>Sl No</th>
                        <th>Deductee PAN</th>
                        <th>TDS Deducted</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>
                            <asp:TextBox ID="txtPanDeductee1" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="txtTdsDeductee1" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>
                            <asp:TextBox ID="txtPanDeductee2" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="txtTdsDeductee2" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>
                            <asp:TextBox ID="txtPanDeductee3" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="txtTdsDeductee3" runat="server"></asp:TextBox></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Image ID="imgCaptcha" runat="server" />&nbsp;&nbsp;<asp:LinkButton ID="lnkRefreshBurtton" runat="server" OnClick="lnkRefreshBurtton_Click"><span class="glyphicon glyphicon-refresh"></span></asp:LinkButton>
            </td>
            <td></td>
        </tr>
        <tr>
            <td>Enter text as in above image</td>
            <td>
                <asp:TextBox ID="txtCapchaText" runat="server"></asp:TextBox></td>
            <td>
                <asp:Button ID="btnRequest" runat="server" class="btn btn-success pull-right" Text="Request" OnClick="btnRequest_Click" /></td>
        </tr>
    </table>
    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
</asp:Content>

