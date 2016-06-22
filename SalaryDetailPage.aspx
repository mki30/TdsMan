<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="SalaryDetailPage.aspx.cs" Inherits="SalaryDetailPage" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function ()
        {
            $(".fancybox").fancybox(
            {
            });
        });
    </script>
    <style type="text/css">
        input[type=text], select
        {
            height: 25px !important;
            padding: 0px !important;
            padding-left: 5px !important;
            font-size: 0.9em !important;
        }

        table
        {
            width: 100%;
            margin-bottom: 0px !important;
        }

        .bluetext
        {
            color: blue;
        }

        .boldtext
        {
            font-weight: bold;
        }

        .table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td
        {
            border: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server" ClientIDMode="Static">
    <div class="col-sm-6">
        <table class="table">
            <tr>
                <td>
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-sm btn-success pull-right" OnClick="btnSubmit_Click" /></td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td class="boldtext">ID :
                                <asp:Label ID="lblID" runat="server" Text="0"></asp:Label>
                            </td>
                            <td class="boldtext">Name :
                                <asp:Label ID="lblEmployeeName" runat="server" Text="0"></asp:Label>
                            </td>
                            <td class="boldtext">PAN :
                                <asp:Label ID="lblEmployeePan" runat="server" Text="0"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td class="boldtext">EmpId:
                                <asp:Label ID="lblEmployeeId" runat="server" Text="0"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" placeholder="from date"></asp:TextBox></td>
                            <td>
                                <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" placeholder="to date"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:RadioButtonList ID="radioMandatory" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="radioMandatory_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="1" Selected="True">Enter Mandatory Fields Only</asp:ListItem>
                                    <asp:ListItem Value="2">Enter Form 16 Details</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Panel ID="PanelTotalSalary" runat="server">
                        <div class="panel panel-warning">
                            <div class="panel-heading">Total Salary</div>

                            <table class="table table-bordered table-condensed" runat="server">
                                <tr>
                                    <td class="boldtext" colspan="2">1.Gross Salary</td>
                                </tr>
                                <tr>
                                    <td title="Salary">(a) Sec 17(1) </td>
                                    <td style="width: 150px;">
                                        <asp:TextBox ID="txtSec17_1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td title="Perquisite">(b) Sec 17(2)</td>
                                    <td>
                                        <asp:TextBox ID="txtSec17_2" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td title="Profits in lieu of salary">(b) Sec 17(3)</td>
                                    <td>
                                        <asp:TextBox ID="txtSec17_3" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="boldtext pull-right">Total</td>
                                    <td class="boldtext">
                                        <asp:Label ID="lblTotal" runat="server" Text="0" CssClass="pull-right"></asp:Label>
                                    </td>
                                </tr>
                            </table>

                            <table class="table table-bordered table-condensed">
                                <tr>
                                    <td class="boldtext">2.Less Allowance under section 10</td>
                                </tr>
                                <tr>
                                    <td>Description</td>
                                    <td style="width: 150px;">Amount</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtAllowanceDesc1" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <td>
                                        <asp:TextBox ID="txtAllowance1Amount" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtAllowanceDesc2" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <td>
                                        <asp:TextBox ID="txtAllowance2Amount" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtAllowanceDesc3" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <td>
                                        <asp:TextBox ID="txtAllowance3Amount" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtAllowanceDesc4" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <td>
                                        <asp:TextBox ID="txtAllowance4Amount" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtAllowanceDesc5" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <td>
                                        <asp:TextBox ID="txtAllowance5Amount" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="boldtext pull-right">Total : </td>
                                    <td class="boldtext">
                                        <asp:Label class="boldtext pull-right" ID="lblAlllowanceTotal" runat="server" Text="0" CssClass="pull-right"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                </td>
            </tr>


            <tr>
                <td>
                    <table class="table table-bordered table-condensed">

                        <tr>
                            <td class="boldtext">3.Balance</td>
                            <td style="width: 150px;">
                                <asp:TextBox ID="txtBalance" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2">Breakup of 3.Balance</td>
                        </tr>
                        <tr>
                            <td>Current Employer</td>
                            <td>
                                <asp:TextBox ID="txtBrkupCurrentEmployerBal" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                        <tr class="bluetext">
                            <td>Amount as entered in software</td>
                            <td>
                                <asp:Label class="boldtext pull-right" ID="lblBrkupAmountInSoftware" runat="server" Text="0.00" CssClass="pull-right"></asp:Label>
                            </td>

                        </tr>
                        <tr>
                            <td>Previous Employer</td>
                            <td>
                                <asp:TextBox ID="txtBrkupPrevEmployer" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="table table-bordered table-condensed">
                        <tr>
                            <td colspan="2" class="boldtext">4.Deduction Under Section 16</td>
                        </tr>
                        <tr>
                            <td class="boldtext">(a) Entertainment Allowance (16ii)</td>
                            <td style="width: 150px;">
                                <asp:TextBox ID="txtEntertainmentAllowance" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="boldtext">(b) Tax on Employment (16iii)</td>
                            <td>
                                <asp:TextBox ID="txtTaxOnEmployement" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>

                        <tr>
                            <td class="boldtext">5.Aggregate of 4(a) & 4(b)</td>
                            <td class="boldtext pull-right bluetext">
                                <asp:Label ID="lblAggregateOf4a4b" runat="server" Text="0.00" CssClass="pull-right"></asp:Label></td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td>
                    <table class="table table-bordered table-condensed">
                        <tr>
                            <td class="boldtext">6.Income Chargeable Under the head Salaries (3-5)</td>
                            <td class="boldtext pull-right">
                                <asp:Literal ID="lblIncomeChargableUnderHeadSal" runat="server" Text="0.00"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="PanelOtherIncome" runat="server">
                        <table class="table table-bordered table-condensed">
                            <tr>
                                <td colspan="2" class="boldtext">7.Add: Any other income other than salary</td>
                            </tr>
                            <tr>
                                <td>Description</td>
                                <td style="width: 150px">Amount</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtOtheIncomeDesc1" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:TextBox ID="txtOtheIncomeAmount1" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtOtheIncomeDesc2" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:TextBox ID="txtOtheIncomeAmount2" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtOtheIncomeDesc3" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:TextBox ID="txtOtheIncomeAmount3" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtOtheIncomeDesc4" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:TextBox ID="txtOtheIncomeAmount4" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="pull-right boldtext">Total : </td>
                                <td>
                                    <%--<asp:TextBox ID="txtTotalOtherIncome" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                    <asp:Literal ID="lblTotalOtherIncome" runat="server" Text="0.00"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="table table-bordered table-condensed">
                        <tr>
                            <td class="boldtext">8.Gross Total Income (6+7)</td>
                            <td class="boldtext pull-right">
                                <asp:Literal ID="lblGrossTotalIncome" runat="server" Text="0.0"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="PanelDedUnderVIA" runat="server">
                        <table class="table table-bordered table-condensed">
                            <tr>
                                <td colspan="2" class="boldtext">9.Deduction under chapter VI-A</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="boldtext">(A)Section 80C,80CCC and 80CCD</td>
                            </tr>
                            <tr>
                                <td>(a) Section 80C</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Description</td>
                                <td style="width: 150px">Amount</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt80CDesc1" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:TextBox ID="txt80CAmount1" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt80CDesc2" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:TextBox ID="txt80CAmount2" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt80CDesc3" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:TextBox ID="txt80CAmount3" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt80CDesc4" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:TextBox ID="txt80CAmount4" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt80CDesc5" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:TextBox ID="txt80CAmount5" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt80CDesc6" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:TextBox ID="txt80CAmount6" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="pull-right boldtext">Gross Total (80C): </td>
                                <td>
                                    <asp:Literal ID="lblGrossTotal80C" runat="server" Text="0.00"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td class="pull-right boldtext">Deductible total (80C) </td>
                                <td>
                                    <asp:TextBox ID="txtDeductibleTotal80C" runat="server" CssClass="form-control boldtext"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="Panel9Ext" runat="server">
                        <table class="table table-bordered table-condensed">
                            <tr>
                                <td></td>
                                <td style="width: 100px">Gross Amount</td>
                                <td style="width: 140px">Deductible Amount</td>
                            </tr>
                            <tr>
                                <td>(b) Section 80CCC</td>
                                <td>
                                    <asp:TextBox ID="txtGrossAmount80CCC" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:TextBox ID="txtDeducAmount80CCC" runat="server" CssClass="form-control"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>(c) Section 80CCD</td>
                                <td>
                                    <asp:TextBox ID="txtGrossAmount80CCD" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:TextBox ID="txtDeducAmount80CCD" runat="server" CssClass="form-control"></asp:TextBox></td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="table table-bordered table-condensed">
                        <tr>
                            <td class="boldtext">Total Deductible Amount 80CCE</td>
                            <td class="boldtext">
                                <%--<asp:TextBox ID="TotalDedAmount80CCE" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                <asp:Label ID="lblTotalDedAmount80CCE" runat="server" Text="0.00"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td></td>
                            <td style="width: 100px">Gross Amount</td>
                            <td style="width: 140px">Deductible Amount</td>
                        </tr>
                        <tr>

                            <td class="boldtext">(B) Section 80CCG</td>
                            <td>
                                <asp:TextBox ID="txtGrossAmount80CCG" runat="server" CssClass="form-control"></asp:TextBox></td>
                            <td>
                                <asp:TextBox ID="txtDeducAmount80CCG" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Panel ID="PanelOtherSections" runat="server">
                        <table class="table table-bordered table-condensed">
                            <tr>
                                <td colspan='5' class="boldtext">(C) Other sections(e.g 80E,80G etc.)</td>
                            </tr>
                            <tr>
                                <td style="width: 5px;"></td>
                                <td>Section</td>
                                <td>Gross Amount</td>
                                <td>Qualifying Amount</td>
                                <td>Deductible Amount</td>
                            </tr>
                            <tr>
                                <td>(i) </td>
                                <td>
                                    <asp:TextBox ID="txtOtherSec1" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:TextBox ID="txtOtherSec1GrossAmmount" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOtherSec1QualifyingAmount" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:TextBox ID="txtOtherSec1DeductibleAmount" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>(ii) </td>
                                <td>
                                    <asp:TextBox ID="txtOtherSec2" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:TextBox ID="txtOtherSec2GrossAmmount" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOtherSec2QualifyingAmount" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOtherSec2DeductibleAmount" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>(iii) </td>
                                <td>
                                    <asp:TextBox ID="txtOtherSec3" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:TextBox ID="txtOtherSec3GrossAmmount" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOtherSec3QualifyingAmount" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOtherSec3DeductibleAmount" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>(iv) </td>
                                <td>
                                    <asp:TextBox ID="txtOtherSec4" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:TextBox ID="txtOtherSec4GrossAmmount" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOtherSec4QualifyingAmount" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOtherSec4DeductibleAmount" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>(v) </td>
                                <td>
                                    <asp:TextBox ID="txtOtherSec5" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:TextBox ID="txtOtherSec5GrossAmmount" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOtherSec5QualifyingAmount" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOtherSec5DeductibleAmount" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <table class="table table-bordered table-condensed">
                                        <tr>
                                            <td class="boldtext">Total Deductible Amount Other Sections</td>
                                            <td style="width: 120px">
                                                <%--<asp:TextBox ID="txtTotalDedAmountOtherSec" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                                <asp:Label ID="lblTotalDedAmountOtherSec" runat="server" Text="0.00"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="table table-bordered table-condensed">
                        <tr>
                            <td class="boldtext" colspan="4">10.Aggregate of deductible amount under chapter VI-A</td>
                            <td style="width: 150px">
                                <asp:Literal ID="lblTotalDedAmountVIA" runat="server" Text="0.00"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="table table-bordered table-condensed">
                        <tr>
                            <td class="boldtext">11.Total Taxable Income (8-10)</td>
                            <td style="width: 150px">
                                <asp:Label ID="lblTotalTaxableIncome" runat="server" Text="0.00" CssClass="boldtext pull-right"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="table table-bordered table-condensed">
                        <tr>
                            <td class="boldtext">12.Tax on total income</td>
                            <td style="width: 150px">
                                <asp:TextBox ID="txtTaxOnTotalIncome" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="table table-bordered table-condensed">
                        <tr class="bluetext">
                            <td class="boldtext">Calculation as per slab</td>
                            <td style="width: 180px" class="boldtext pull-right">
                                <a runat="server" id="lnkTotalTaxSlab" class="fancybox fancybox.iframe" href="#">view calculation</a><asp:Label ID="lblTaxOnTotalIncomeAsPerSlab" runat="server" Text="0.00" CssClass="boldtext pull-right bluetext"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="table table-bordered table-condensed">
                        <tr>
                            <td class="boldtext">13.Surcharge (on tax computed at Srl No 12)</td>
                            <td style="width: 150px">
                                <asp:TextBox ID="txtSurcharge" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="table table-bordered table-condensed">
                        <tr class="bluetext">
                            <td class="boldtext">Calculation as per slab</td>
                            <td style="width: 180px" class="boldtext pull-right">
                                <a runat="server" id="lnkSurchargeAsPerSlab" class="fancybox fancybox.iframe" href="#">view calculation</a><asp:Label ID="lblSurchargeAsPerSlab" runat="server" Text="0.00" CssClass="boldtext pull-right bluetext"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="table table-bordered table-condensed">
                        <tr>
                            <td class="boldtext">14.Education cess @ 3% (on tax computed at Srl No. 12)</td>
                            <td style="width: 150px">
                                <asp:TextBox ID="txtCess" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="table table-bordered table-condensed">
                        <tr class="bluetext">
                            <td class="boldtext">Calculation as per slab</td>
                            <td style="width: 180px" class="boldtext pull-right">
                                <a runat="server" id="lnkCessAsPerSlab" class="fancybox fancybox.iframe" href="#">view calculation</a><asp:Label ID="lblCessAsPerSlab" runat="server" Text="0.00" CssClass="boldtext pull-right bluetext"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="table table-bordered table-condensed">
                        <tr>
                            <td class="boldtext">15.Tax Payble (12+13+14)</td>
                            <td style="width: 150px">
                                <asp:Label ID="lblTaxPayble" runat="server" Text="0.00" CssClass="boldtext pull-right bluetext"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="table table-bordered table-condensed">
                        <tr>
                            <td class="boldtext">16.Less Relief Under Section 89</td>
                            <td style="width: 150px">
                                <asp:TextBox ID="txtRelief" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="table table-bordered table-condensed">
                        <tr>
                            <td class="boldtext">17.Net Tax Payble</td>
                            <td style="width: 150px" class="boldtext pull-right">
                                <asp:Label ID="lblNetTaxPayble" runat="server" Text="0.00" CssClass="boldtext pull-right bluetext"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="table table-bordered table-condensed">
                        <tr>
                            <td class="boldtext">Total TDS Deducted</td>
                            <td style="width: 150px">
                                <asp:TextBox ID="txtTotalTaxDeducted" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="table table-bordered table-condensed">
                        <tr>
                            <td class="boldtext">Current Employer</td>
                            <td style="width: 150px">
                                <asp:TextBox ID="txtTDSCurentEmployer" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>
                        <tr class="bluetext">
                            <td class="boldtext">Amount as entered in the software</td>
                            <td>
                                <asp:Label ID="lblTDSInSW" runat="server" Text="0.00" CssClass="boldtext pull-right"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="boldtext">Previous Employer</td>
                            <td>
                                <asp:TextBox ID="txtTDSPreviousEmployer" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="table table-bordered table-condensed">
                        <tr>
                            <td class="boldtext">Shortfall Excess/Deduction of Tax </td>
                            <td style="width: 150px" class="boldtext pull-right bluetext">
                                <asp:Label ID="lblShortfallExcessDedofTax" runat="server" Text="0.00" CssClass="boldtext pull-right bluetext"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="table table-bordered table-condensed">
                        <tr>
                            <td class="boldtext">Whether tax deduction at higher rate due to non furnishing of PAN by deductee</td>
                            <td>
                                <asp:DropDownList ID="DDNoPan" runat="server" CssClass="form-control" Style="width: 50px;">
                                    <asp:ListItem Value="0">No</asp:ListItem>
                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

        </table>
    </div>
</asp:Content>

