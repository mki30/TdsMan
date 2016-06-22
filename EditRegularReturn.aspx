<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditRegularReturn.aspx.cs" Inherits="EditRegularReturn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/datepicker.css" rel="stylesheet" />
    <link href="css/site.css" rel="stylesheet" />

    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="/js/bootstrap-datepicker.js"></script>
    <script src="js/common.js"></script>

    <%--<style type="text/css">
        .EditRRTable
        {
            width: 500px;
        }

            .EditRRTable tr td
            {
                padding: 3px !important;
                border-top: 0px solid #ddd !important;
                vertical-align: middle !important;
            }

                .EditRRTable tr td:first-child
                {
                    font-weight: bold !important;
                }
    </style>--%>
</head>
<body style="margin-bottom: 0px; height:470px;">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title"><span id="lblPanelHead" runat="server">Regular Return</span></h3>
        </div>
        <div class="panel-body">
            <form id="form1" runat="server" style="width:450px;">
                <div>
                    <table class="table EditRRTable" style="margin-bottom: 0px; width: 500px;">
                        <tr style="display: none;">
                            <td>ID:</td>
                            <td>
                                <asp:Label ID="lblID" runat="server" Text="0"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Financial year</td>
                            <td>
                                <asp:Label ID="lblFinancialYexr" runat="server" Text="0"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Quarter</td>
                            <td>
                                <asp:Label ID="lblQuarter" runat="server" Text=""></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td>Company</td>
                            <td>
                                <asp:Label ID="lblCompany" runat="server" Text=""></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td>Form No</td>
                            <td>
                                <asp:Label ID="lblFormNo" runat="server" Text=""></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td>Has regular return filed for form 24Q</td>
                            <td>
                                <asp:DropDownList ID="ddReturnFiledPrev" runat="server" OnSelectedIndexChanged="dd26QReturnFiledPrev_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control">
                                    <asp:ListItem Value="1">YES</asp:ListItem>
                                    <asp:ListItem Value="0">NO</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Token no of previous regular return</td>
                            <td>
                                <asp:TextBox ID="txtTokenOfPrev26QReturn" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Address change since last return
                            </td>
                            <td>
                                <asp:CheckBox ID="chkCompany" runat="server" Text="Company" />
                                <asp:CheckBox ID="chkResponsiblePerson" runat="server" Text="Responsible Person" />
                            </td>
                        </tr>
                        <tr>
                            <td>Receipt No</td>
                            <td>
                                <asp:TextBox ID="txtReciptNo" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Date of filling</td>
                            <td>
                                <asp:TextBox ID="txtDateOfFiling" runat="server" CssClass="form-control datePicker2"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Token No</td>
                            <td>
                                <asp:TextBox ID="txtTokenNo" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="btnSave" CssClass="btn btn-sm btn-success" runat="server" Text="Save" OnClick="btnSave_Click" />
                                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>

                </div>
            </form>
        </div>
    </div>
</body>
</html>
