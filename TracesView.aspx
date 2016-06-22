<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="TracesView.aspx.cs" Inherits="TracesView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function ()
        {
            $(".dwn").bind('click', function ()
            {
                var refid = $(this).data("id");
                $("#txtRefID").val(refid);
                $("#btnDownload").click();
            });

            $(".dwnloadCusumptionDetail").bind('click', function ()
            {
                var refid = $(this).data("id");
                $("#txtDOD").val($($("#tr" + refid)).find($("td #DOD" + refid)).text());
                $("#txtChalNo").val($($("#tr" + refid)).find($("td #ChlSNo" + refid)).text());
                $("#txtChalAmount").val($($("#tr" + refid)).find($("td #ChlAmount" + refid)).text());
                $("#txtReceiptNo").val($($("#tr" + refid)).find($("td #ReceiptNo" + refid)).text());

                $("#btnDownloadCunsuption").click();
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 id="heading" runat="server"></h1>
    <asp:TextBox ID="txtRefID" Style="display: none" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtDOD" Style="display: none" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtChalNo" Style="display: none" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtChalAmount" Style="display: none" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtReceiptNo" Style="display: none" runat="server"></asp:TextBox>

    <asp:Button ID="btnDownload" runat="server" OnClick="btnDownload_Click" Style="display: none" />
    <asp:Button ID="btnDownloadCunsuption" runat="server" OnClick="btnDownloadCunsuption_Click" Style="display: none" />

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
            <td></td>
            <td>
                <asp:Image ID="imgCaptcha" runat="server" />&nbsp;&nbsp;<asp:LinkButton ID="lnkRefreshBurtton" runat="server" OnClick="lnkRefreshBurtton_Click"><span class="glyphicon glyphicon-refresh"></span></asp:LinkButton></td>
            <td></td>
        </tr>
        <tr>
            <td>Enter text as in above image</td>
            <td>
                <asp:TextBox ID="txtCapchaText" runat="server"></asp:TextBox></td>
            <td>
                <asp:Button ID="btnRequest" runat="server" Text="Request" OnClick="btnRequest_Click" class="btn btn-success pull-right" /></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label></td>
            <td></td>
        </tr>
        <tr>
            <asp:Label ID="lblRequestList" runat="server" Text=""></asp:Label>
            <asp:Button ID="btnDownloadReq" runat="server" Text="Button" Style="display: none;" />
        </tr>
    </table>
    <div runat="server" id="divStatementStatus" visible="false">
        <table class="table table-bordered">
            <tr>
                <td colspan="4" style="font-weight: bold;">Step2: Request For Status Of Statement Filed</td>
            </tr>
            <tr>
                <td>FA:
                    <asp:DropDownList ID="ddFinancialYear" runat="server"></asp:DropDownList></td>
                <td>Form: 
                <asp:DropDownList ID="ddForm" runat="server" AutoPostBack="true">
                    <asp:ListItem Value="1">24Q</asp:ListItem>
                    <asp:ListItem Value="2">26Q</asp:ListItem>
                    <asp:ListItem Value="3">27Q</asp:ListItem>
                    <asp:ListItem Value="4">27EQ</asp:ListItem>
                </asp:DropDownList>
                </td>
                <td>Quarter: 
                <asp:DropDownList ID="ddQuarter" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="1">Q1</asp:ListItem>
                    <asp:ListItem Value="2">Q2</asp:ListItem>
                    <asp:ListItem Value="3">Q3</asp:ListItem>
                    <asp:ListItem Value="4">Q4</asp:ListItem>
                </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="btnStatementStatus" runat="server" Text="GO" OnClick="btnStatementStatus_Click" class="btn btn-success pull-right" /></td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:Label ID="lblStatementStatus" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div runat="server" id="divChallanStatus" visible="false">
        <table class="table table-bordered">
            <tr>
                <td colspan="4" style="font-weight: bold;">Step2: Request For Challan Status</td>
            </tr>
            <tr>
                <td>Form: 
                <asp:TextBox ID="txtDepositFromDate" runat="server"></asp:TextBox>
                </td>
                <td>To: 
                <asp:TextBox ID="txtDepositToDate" runat="server"></asp:TextBox>
                </td>
                <td>Challan Status:
                <asp:DropDownList ID="ddChallanStatus" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="A">All</asp:ListItem>
                    <asp:ListItem Value="C">Claimed</asp:ListItem>
                    <asp:ListItem Value="U">Unclaimed</asp:ListItem>
                </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="btnGoOption1" runat="server" Text="Go" OnClick="btnGo_Click" class="btn btn-success btn-sm pull-right"/>
                </td>
            </tr>
            <tr>
                <td>BSR Code 
                <asp:TextBox ID="txtBSR" runat="server"></asp:TextBox>
                </td>
                <td>Date Of Deposit: 
                <asp:TextBox ID="txtDateOfDeposit" runat="server"></asp:TextBox>
                </td>
                <td>Challan No:
                <asp:TextBox ID="txtChallanNo" runat="server"></asp:TextBox>
                </td>
                <td>Challan Amount:
                     <asp:TextBox ID="txtChallanAmmount" runat="server"></asp:TextBox>
                    <asp:Button ID="btnGoOption2" runat="server" Text="Go" OnClick="btnGo_Click" class="btn btn-success btn-sm pull-right"/>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:Label ID="lblChallanDetail" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:Label ID="lblConsumptionDetail" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div runat="server" id="divTdsTcs" visible="false">
         <table class="table table-bordered">
            <tr>
                <td colspan="4" style="font-weight: bold;">Step2: View Deduction Detail for Deductee</td>
            </tr>
             <tr>
                <td>PAN: 
                <asp:TextBox ID="txtPanTdsTcs" runat="server"></asp:TextBox>
                </td>
                <td>FY: 
                <asp:DropDownList runat="server" ID="ddFYTdsTcs"></asp:DropDownList>
                </td>
                <td>Form No:
                    <asp:DropDownList ID="ddFormTdsTcs" runat="server" AutoPostBack="true">
                    <asp:ListItem Value="1">24Q</asp:ListItem>
                    <asp:ListItem Value="2">26Q</asp:ListItem>
                    <asp:ListItem Value="3">27Q</asp:ListItem>
                    <asp:ListItem Value="4">27EQ</asp:ListItem>
                </asp:DropDownList>
                </td>
                <td>Quarter:
                    <asp:DropDownList ID="ddQuarterTdsTcs" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="1">Q1</asp:ListItem>
                    <asp:ListItem Value="2">Q2</asp:ListItem>
                    <asp:ListItem Value="3">Q3</asp:ListItem>
                    <asp:ListItem Value="4">Q4</asp:ListItem>
                </asp:DropDownList>
                    <asp:Button ID="btnTdsTcsGO" runat="server" Text="Go" OnClick="btnGo_Click" class="btn btn-success btn-sm pull-right"/>
                </td>
            </tr>
        </table>
        <asp:Label ID="lblStatementDetail" runat="server" Text=""></asp:Label>
    </div>
    <div runat="server" id="div197Cirtificate" visible="false">
         <table class="table table-bordered">
            <tr>
                <td colspan="4" style="font-weight: bold;">Step2: Validate 197 Cirtifiacte</td>
            </tr>
             <tr>
                <td>Certificate No 
                <asp:TextBox ID="txtertificateNo" runat="server"></asp:TextBox>
                </td>
                <td>PAN 
                <asp:TextBox ID="txtPan" runat="server"></asp:TextBox>
                </td>
                <td>FY
                   <asp:DropDownList runat="server" ID="ddFY197"></asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="btn197Go" runat="server" Text="Go" OnClick="btnGo_Click" class="btn btn-success btn-sm pull-right"/>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

