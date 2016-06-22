<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="RegularReturns.aspx.cs" Inherits="RegularReturns" ClientIDMode="Static" MaintainScrollPositionOnPostback="True" %>

<%@ Register Src="~/Controls/ReturnFormFilterl.ascx" TagPrefix="uc1" TagName="ReturnFormFilterl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">

        $(document).ready(function ()
        {
            var lastlink = window.localStorage.getItem("lastlink");
            if (lastlink != null)
            {
                $("#a_" + lastlink).click();
            }
            $('.tognav').bind('click', function ()
            {
                window.localStorage.setItem("lastlink", $(this).attr("aria-controls"));
            });

            var showMoreDetail = window.localStorage.getItem("showMoreDetail");
            if (showMoreDetail != null)
            {
                if (showMoreDetail == 1)
                    $("#showMoreDetail").click();
            }
        });


        function ShowHideDiv()
        {
            $("#divRegReturnEdit").toggle(function ()
            {
                var showMoreDetail = window.localStorage.getItem("showMoreDetail");

                //if (showMoreDetail == null) showMoreDetail = 0;
                //if (showMoreDetail == 1)
                //{
                //    //alert('1');
                //    $("#showMoreDetail").html("<span class='glyphicon glyphicon-plus'></span>Show");
                //    window.localStorage.setItem("showMoreDetail", 0);
                //}
                //{
                //    //alert('0');
                //    $("#showMoreDetail").html("<span class='glyphicon glyphicon-minus'></span>Hide");
                //    window.localStorage.setItem("showMoreDetail", 1);
                //}

                if ($("#showMoreDetail").text() == "Show")
                {
                    $("#showMoreDetail").html("<span class='glyphicon glyphicon-minus'></span>Hide");
                    window.localStorage.setItem("showMoreDetail", 1);
                }
                else
                {
                    $("#showMoreDetail").html("<span class='glyphicon glyphicon-plus'></span>Show");
                    window.localStorage.setItem("showMoreDetail", 0);
                };
            })
        }

        function ShowHideCorrectionSummary()
        {
            $("#divCorrectionSummary").toggle(function ()
            {
                if ($("#showCorrectionSummary").text() == "Show Correction Summary")
                {
                    $("#showCorrectionSummary").html("<span class='glyphicon glyphicon-minus'></span>Hide Correction Summary");
                }
                else
                {
                    $("#showCorrectionSummary").html("<span class='glyphicon glyphicon-plus'></span>Show Correction Summary");
                };
            })
        }

        function RefreshPage()
        {
            window.top.location.reload();
        };

        function ShowData()
        {
            $.post("/Data.aspx?Action=GetPageDetail&Data1=https://onlineservices.tin.egov-nsdl.com/TIN/UnAuthorizedView.do?ID=1068688145&Data2=" + $('#lblTan').text() + "&Data3=" + $('#lblTokenNo').text(), function (data)
            {
                data = data.toString();
                data = data.substr(data.indexOf("<table"), data.length);
                if (data.indexOf("Provisional receipt number is not  valid") > 0)
                {
                    $("#divDedDetail").html("<h2>Provisional receipt number is not  valid! Please Check..<h2>");
                    openFancyBox();
                    return;
                }
                $("td table", data).each(function (indx)
                {
                    if (indx == 0)
                    {
                        $("#divDedDetail").html($(this).html());
                    }
                    if (indx == 1)
                    {
                        $("#divStatementDetail").html($(this).html());
                    }
                    if (indx == 2)
                    {
                        $("#divFile").html($(this).html());
                    }
                });
                openFancyBox();

                if (data.indexOf("Accepted by TIN") > 0)
                {
                    var link = "/Data.aspx?Action=SaveAcceptFlag&Data1=" + $('#lblTokenNo').text();
                    $.ajax({
                        url: link, cache: false, success: function (data)
                        {
                            if (data.replace('~', '') == "")
                            {
                                $("#lblTokenNo").css('background-color', 'LightGreen');
                                $('#lblTokenNo').prop('title', 'Verified');
                            };
                        },
                        error: function (e)
                        {
                        }
                    })
                }
            });
        }
        function openFancyBox()
        {
            $("#aBox").fancybox({
            });
            $("#aBox").click();
        }
    </script>
    <style type="text/css">
        .challandetail td:nth-child(n+3), .challandetail th:nth-child(n+3)
        {
            text-align: right !important;
        }
        /*.panel-heading
        {
            padding: 2px 2px;
        }*/
        .form-group
        {
            margin-bottom: 2px;
        }

        .form-control
        {
            height: 30px;
            padding: 2px 12px;
            font-size: 12px;
        }

        .panel-heading
        {
            padding: 0px 0px;
            border-bottom: 0px solid transparent;
        }

        .challan
        {
            font-size: 13px;
            margin-bottom: 0px !important;
        }
        /*.challan td
            {
                padding:2px !important;
            }*/
        .challandetail
        {
            font-size: 13px;
            margin-bottom: 0px !important;
        }

        .pnlchallandetail
        {
            padding: 0px !important;
        }

        #divCorrectionSummary table
        {
            font-size: 12px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 runat="server" id="headingText">Form 24Q</h1>
    <div class="row-fluid">
        <table style="width: 100%">
            <tr>
                <td style="width: 84%">
                    <uc1:ReturnFormFilterl runat="server" ID="ReturnFormFilterl" OnSelectionChange="ReturnFormFilterl_SelectionChange" />
                </td>
                <td>
                    <table class="table" style="margin-bottom: 0px;">
                        <tr>
                            <td style="border-top: 0px;">
                                <%--<a href="#" class="no-print btn btn-sm btn-primary fancybox500 fancybox.iframe pull-left" id="linkRegularReturnEdit" runat="server"><span class="glyphicon glyphicon-edit"></span>Edit</a>--%>
                                <a href="#" target="_blank" class="no-print btn btn-sm btn-primary fancybox450 fancybox.iframe pull-right" runat="server" id="lnkAddChallan"><span class="glyphicon glyphicon-plus"></span>Add Challan</a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>

    <asp:Panel ID="panelMain" runat="server" Visible="false">
        <div class="row">
            <div class="col-md-12">
                <table class="table table-condensed table-bordered">
                    <tr>
                        <td style="white-space: nowrap;"><span class="boldFont">TAN: </span>
                            <asp:Label ID="lblTan" runat="server" Text=""></asp:Label></td>
                        <td style="white-space: nowrap;"><span class="boldFont">PAN: </span>
                            <asp:Label ID="lblPan" runat="server" Text=""></asp:Label></td>
                        <td style="white-space: nowrap;"><span class="boldFont">Deductor Type: </span>
                            <asp:Label ID="lblDeductorType" runat="server" Text=""></asp:Label></td>
                        <td colspan="2"><span class="boldFont">Responsibility: </span>
                            <asp:Label ID="lblResponsiblePerson" runat="server" Text=""></asp:Label></td>
                        <td>
                            <asp:Label ID="lblID" runat="server" Text="0" Style="display: "></asp:Label></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><span class="boldFont">Filing Date: </span>
                            <asp:Label ID="lblFillingDate" runat="server" Text=""></asp:Label></td>
                        <td><span class="boldFont">Receipt No: </span>
                            <asp:Label ID="lblReciptNo" runat="server" Text=""></asp:Label></td>
                        <td><span class="boldFont">Token No: </span>
                            <asp:Label ID="lblTokenNo" Style="cursor: pointer;" runat="server" Text="" onclick="ShowData()" Title="Verify"></asp:Label></td>
                        <td><span class="boldFont">Prev Token No: </span>
                            <asp:Label ID="lblPrevTokenNo" runat="server" Text=""></asp:Label></td>
                        <td><span class="boldFont">Address Changed: </span>
                            <asp:Label ID="lblAddresChanged" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td><span class="boldFont">Challan: </span>
                            <asp:Label ID="lblChallanRecords" runat="server" Text=""></asp:Label></td>
                        <td><span class="boldFont">Deductee: </span>
                            <asp:Label ID="lblDeducteeRecords" runat="server" Text=""></asp:Label></td>
                        <td><span class="boldFont">Amount Paid: </span>
                            <asp:Label ID="lblAmountPaid" runat="server" Text=""></asp:Label></td>
                        <td><span class="boldFont">Total TDS: </span>
                            <asp:Label ID="lblTotalTDSDeducted" runat="server" Text=""></asp:Label></td>
                        <td><span class="boldFont">Challan Amount: </span>
                            <asp:Label ID="lblChalllanAmount" runat="server" Text=""></asp:Label></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <a id="showCorrectionSummary" href="javascript:void(0);" runat="server" onclick="ShowHideCorrectionSummary();" class="btn btn-xs btn-info pull-left"><span class='glyphicon glyphicon-plus'></span>Show Correction Summary</a>
                            <a id="showMoreDetail" href="javascript:void(0);" onclick="ShowHideDiv();" class="btn btn-xs btn-info pull-right"><span class='glyphicon glyphicon-plus'></span>Show</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="row" id="divCorrectionSummary" style="display: none;">
            <div class="col-md-12">
                <div class="panel panel-info">
                    <div class="panel-heading"><strong>Correction Summary</strong></div>
                    <div class="panel-body">
                        <table class="table table-condensed table-bordered">
                            <tr>
                                <th colspan="4">Import Summary</th>
                            </tr>
                            <tr>
                                <td><span class="boldFont">TAN NO: </span>
                                </td>
                                <td>
                                    <asp:Label ID="lblTanCorr" runat="server" Text=""></asp:Label></td>
                                <td><span class="boldFont">Deductor Type: </span>
                                </td>
                                <td>
                                    <asp:Label ID="lblDeductorTypeCorr" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td><span class="boldFont">File Downloaded On: </span>
                                </td>
                                <td>
                                    <asp:Label ID="lblFileDownloadedOnCorr" runat="server" Text=""></asp:Label></td>
                                <td><span class="boldFont">File Imported On: </span>
                                </td>
                                <td>
                                    <asp:Label ID="lblFileImportedOnCorr" runat="server" Text=""></asp:Label></td>

                            </tr>
                            <tr>
                                <td><span class="boldFont">Total No Of Challans: </span>
                                </td>
                                <td>
                                    <asp:Label ID="lblTotalNoOfChallansCorr" runat="server" Text=""></asp:Label></td>
                                <td><span class="boldFont">Total No Of Deductions: </span>
                                </td>
                                <td>
                                    <asp:Label ID="lblTotalNoOfDeductionsCorr" runat="server" Text=""></asp:Label></td>

                            </tr>
                            <tr>
                                <td><span class="boldFont">Total Challan Amount: </span>
                                </td>
                                <td>
                                    <asp:Label ID="lblTotalChallanAmountCorr" runat="server" Text=""></asp:Label></td>
                                <td><span class="boldFont">Total TDS Deducted: </span>
                                </td>
                                <td>
                                    <asp:Label ID="lblTotlTdsDeductrdCorr" runat="server" Text=""></asp:Label></td>
                            </tr>
                        </table>

                        <table class="table table-condensed table-bordered">
                            <tr>
                                <th colspan="2">Correction Summary</th>
                            </tr>
                            <tr>
                                <td><span class="boldFont">Changes In Company Detail: </span>
                                </td>
                                <td>
                                    <asp:Label ID="lblChangesInCompany" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td><span class="boldFont">Total Changes In Existing Challan</span>
                                </td>
                                <td>
                                    <asp:Label ID="lblTotalChanges_ExistingChallan" runat="server" Text=""></asp:Label></td>

                            </tr>
                            <tr>
                                <td><span class="boldFont">Total Changes In Deductee Of Existing Challan: </span>
                                </td>
                                <td>
                                    <asp:Label ID="lblChangesInDeductee_ExistingChallan" runat="server" Text=""></asp:Label></td>

                            </tr>
                            <tr>
                                <td><span class="boldFont">Total No of Pan Updates Of Deductees: </span>
                                </td>
                                <td>
                                    <asp:Label ID="lblNoOfPanUpdatedDeductee" runat="server" Text=""></asp:Label></td>

                            </tr>
                            <tr>
                                <td><span class="boldFont">Total No of New Challan Added</span>
                                </td>
                                <td>
                                    <asp:Label ID="lblTotalNewChallanAdded" runat="server" Text=""></asp:Label></td>

                            </tr>
                            <tr>
                                <td><span class="boldFont">Total No of Deductees Added in New Challan</span>
                                </td>
                                <td>
                                    <asp:Label ID="lblTotalDeducteeAddedNewChallan" runat="server" Text=""></asp:Label></td>

                            </tr>
                            <tr>
                                <td><span class="boldFont">Total Corrections</span>
                                </td>
                                <td>
                                    <asp:Label ID="lblTotalCorrections" runat="server" Text=""></asp:Label></td>

                            </tr>

                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-info" id="divRegReturnEdit" style="display: none">
            <div class="panel-heading"><strong>Return Detail</strong></div>
            <div class="panel-body">
                <div class="row">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-condensed table-bordered">
                                <tr>
                                    <td style="white-space: nowrap;"><span class="boldFont">Financial year: </span>
                                        <asp:Label ID="lblFinancialYexr" runat="server" Text=""></asp:Label></td>
                                    <td style="white-space: nowrap;"><span class="boldFont">Form No: </span>
                                        <asp:Label ID="lblFormNo" runat="server" Text=""></asp:Label></td>
                                    <td style="white-space: nowrap;"><span class="boldFont">Quarter: </span>
                                        <asp:Label ID="lblQuarter" runat="server" Text=""></asp:Label></td>
                                    <td colspan="2"><span class="boldFont">Company: </span>
                                        <asp:Label ID="lblCompany" runat="server" Text=""></asp:Label></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-6">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label col-xs-6">Has regular return filed for form 24Q</label>
                                        <div class="col-xs-6">
                                            <asp:DropDownList ID="ddReturnFiledPrev" runat="server" OnSelectedIndexChanged="dd26QReturnFiledPrev_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control">
                                                <asp:ListItem Value="1">YES</asp:ListItem>
                                                <asp:ListItem Value="0">NO</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-xs-6">Address change since last return</label>
                                        <div class="col-xs-6">
                                            <asp:CheckBox ID="chkCompany" runat="server" Text="Company" />
                                            <asp:CheckBox ID="chkResponsiblePerson" runat="server" Text="Responsible Person" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-xs-6">Date of filling</label>
                                        <div class="col-xs-6">
                                            <asp:TextBox ID="txtDateOfFiling" runat="server" CssClass="form-control datePicker2"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label col-xs-6">Token no of previous regular return</label>
                                        <div class="col-xs-6">
                                            <asp:TextBox ID="txtTokenOfPrev26QReturn" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-xs-6">Receipt No</label>
                                        <div class="col-xs-6">
                                            <asp:TextBox ID="txtReciptNo" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-xs-6">Token No</label>
                                        <div class="col-xs-6">
                                            <asp:TextBox ID="txtTokenNo" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-8">
                                <div class="panel panel-info">
                                    <div class="panel-heading"><strong>Basic Information</strong></div>
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label for="txtCompanyName" class="control-label col-xs-4">Company</label>
                                            <div class="col-xs-8">
                                                <asp:TextBox ID="txtCompanyName" CssClass="form-control" placeholder="Company Name" runat="server" MaxLength="100"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCompanyName" ErrorMessage="Company name is mandatory!" SetFocusOnError="true" EnableClientScript="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtTanNo" class="control-label col-xs-4">Tan No</label>
                                            <div class="col-xs-8">
                                                <asp:TextBox ID="txtTanNo" class="form-control" placeholder="Tan No" runat="server" MaxLength="10"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTanNo" ErrorMessage="TAN No is mandatory!" SetFocusOnError="true" EnableClientScript="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtPanNo" class="control-label col-xs-4">Pan No</label>
                                            <div class="col-xs-8">
                                                <asp:TextBox ID="txtPanNo" class="form-control" placeholder="Pan No" runat="server" MaxLength="10" onblur="fnValidatePAN(this);"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPanNo" ErrorMessage="PAN No is mandatory!" SetFocusOnError="true" EnableClientScript="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtPanNo" class="control-label col-xs-4">Branch/Division</label>
                                            <div class="col-xs-8">
                                                <asp:TextBox ID="txtBranch" class="form-control" placeholder="Branch/Devision" runat="server" MaxLength="100"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtBranch" ErrorMessage="Branch is mandatory!" SetFocusOnError="true" EnableClientScript="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="ddDeductorType" class="control-label col-xs-4">Deductor Type</label>
                                            <div class="col-xs-8">
                                                <asp:DropDownList ID="ddDeductorType" runat="server" class="form-control">
                                                    <asp:ListItem Value="A">Central Government</asp:ListItem>
                                                    <asp:ListItem Value="S">State Government</asp:ListItem>
                                                    <asp:ListItem Value="D">Statutory body (Central Govt.)</asp:ListItem>
                                                    <asp:ListItem Value="E">Statutory body (State Govt.)</asp:ListItem>
                                                    <asp:ListItem Value="G">Autonomous body (Central Govt.)</asp:ListItem>
                                                    <asp:ListItem Value="H">Autonomous body (State Govt.)</asp:ListItem>
                                                    <asp:ListItem Value="L">Local Authority (Central Govt.)</asp:ListItem>
                                                    <asp:ListItem Value="N">Local Authority (State Govt.)</asp:ListItem>
                                                    <asp:ListItem Value="K">Company</asp:ListItem>
                                                    <asp:ListItem Value="M">Branch / Division of Company</asp:ListItem>
                                                    <asp:ListItem Value="P">Association of Person (AOP)</asp:ListItem>
                                                    <asp:ListItem Value="T">Association of Person (Trust)</asp:ListItem>
                                                    <asp:ListItem Value="J">Artificial Juridical Person</asp:ListItem>
                                                    <asp:ListItem Value="B">Body of Individuals</asp:ListItem>
                                                    <asp:ListItem Value="Q">Individual/HUF</asp:ListItem>
                                                    <asp:ListItem Value="F">Firm</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="txtTanRegNo" class="control-label col-xs-4">Tan Reg No</label>
                                            <div class="col-xs-8">
                                                <asp:TextBox ID="txtTanRegNo" class="form-control" placeholder="Tan Teg No" runat="server" MaxLength="12"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="panel panel-info">
                                            <div class="panel-heading"><strong>Company Details</strong></div>
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label for="txtFlatNo" class="control-label col-xs-4">Flt/Dr/Blk No</label>
                                                    <div class="col-xs-8">
                                                        <asp:TextBox ID="txtFlatNo" class="form-control" placeholder="Flt/Dr/Blk No" runat="server" MaxLength="40"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtBuildingName" class="control-label col-xs-4">Building</label>
                                                    <div class="col-xs-8">
                                                        <asp:TextBox ID="txtBuildingName" class="form-control" placeholder="Building" runat="server" MaxLength="50"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtStreet" class="control-label col-xs-4">Rd/Strt/Lane</label>
                                                    <div class="col-xs-8">
                                                        <asp:TextBox ID="txtStreet" class="form-control" placeholder="Rd/Strt/Lane" runat="server" MaxLength="50"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtArea" class="control-label col-xs-4">Area/Locality</label>
                                                    <div class="col-xs-8">
                                                        <asp:TextBox ID="txtArea" class="form-control" placeholder="Area/Locality" runat="server" MaxLength="40"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtTown" class="control-label col-xs-4">Town/District</label>
                                                    <div class="col-xs-8">
                                                        <asp:TextBox ID="txtTown" class="form-control" placeholder="Town/District" runat="server" MaxLength="40"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtTown" runat="server" ErrorMessage="Invalid only charecters are allowed!" ValidationExpression="[a-zA-Z ]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtPin" class="control-label col-xs-4">Pin</label>
                                                    <div class="col-xs-8">
                                                        <asp:TextBox ID="txtPin" class="form-control" placeholder="Pin" runat="server" MaxLength="6"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="ddState" class="control-label col-xs-4">State</label>
                                                    <div class="col-xs-8">
                                                        <asp:DropDownList ID="ddState" runat="server" class="form-control">

                                                            <asp:ListItem Value="1">ANDAMAN AND NICOBAR ISLANDS	</asp:ListItem>
                                                            <asp:ListItem Value="2">ANDHRA PRADESH</asp:ListItem>
                                                            <asp:ListItem Value="3">ARUNACHAL PRADESH</asp:ListItem>
                                                            <asp:ListItem Value="4">ASSAM</asp:ListItem>
                                                            <asp:ListItem Value="5">BIHAR</asp:ListItem>
                                                            <asp:ListItem Value="6">CHANDIGARH</asp:ListItem>
                                                            <asp:ListItem Value="7">DADRA & NAGAR HAVELI</asp:ListItem>
                                                            <asp:ListItem Value="8">DAMAN & DIU</asp:ListItem>
                                                            <asp:ListItem Value="9">DELHI</asp:ListItem>
                                                            <asp:ListItem Value="10">GOA</asp:ListItem>
                                                            <asp:ListItem Value="11">GUJARAT</asp:ListItem>
                                                            <asp:ListItem Value="12">HARYANA</asp:ListItem>
                                                            <asp:ListItem Value="13">HIMACHAL PRADESH</asp:ListItem>
                                                            <asp:ListItem Value="14">JAMMU & KASHMIR</asp:ListItem>
                                                            <asp:ListItem Value="15">KARNATAKA</asp:ListItem>
                                                            <asp:ListItem Value="16">KERALA</asp:ListItem>
                                                            <asp:ListItem Value="17">LAKSHWADEEP</asp:ListItem>
                                                            <asp:ListItem Value="18">MADHYA PRADESH</asp:ListItem>
                                                            <asp:ListItem Value="19">MAHARASHTRA</asp:ListItem>
                                                            <asp:ListItem Value="20">MANIPUR</asp:ListItem>
                                                            <asp:ListItem Value="21">MEGHALAYA</asp:ListItem>
                                                            <asp:ListItem Value="22">MIZORAM</asp:ListItem>
                                                            <asp:ListItem Value="23">NAGALAND</asp:ListItem>
                                                            <asp:ListItem Value="24">ORISSA</asp:ListItem>
                                                            <asp:ListItem Value="25">PONDICHERRY</asp:ListItem>
                                                            <asp:ListItem Value="26">PUNJAB</asp:ListItem>
                                                            <asp:ListItem Value="27">RAJASTHAN</asp:ListItem>
                                                            <asp:ListItem Value="28">SIKKIM</asp:ListItem>
                                                            <asp:ListItem Value="29">TAMILNADU</asp:ListItem>
                                                            <asp:ListItem Value="30">TRIPURA</asp:ListItem>
                                                            <asp:ListItem Value="31">UTTAR PRADESH</asp:ListItem>
                                                            <asp:ListItem Value="32">WEST BENGAL</asp:ListItem>
                                                            <asp:ListItem Value="33">CHHATISHGARH</asp:ListItem>
                                                            <asp:ListItem Value="34">UTTARANCHAL</asp:ListItem>
                                                            <asp:ListItem Value="35">JHARKHAND</asp:ListItem>
                                                            <asp:ListItem Value="36">TELANGANA</asp:ListItem>
                                                            <asp:ListItem Value="99">	OTHERS	</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtPhone" class="control-label col-xs-4">Std</label>
                                                    <div class="col-xs-8">
                                                        <asp:TextBox ID="txtStd" class="form-control" placeholder="Std" runat="server" MaxLength="4"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtPhone" class="control-label col-xs-4">Phone</label>
                                                    <div class="col-xs-8">
                                                        <asp:TextBox ID="txtPhone" class="form-control" placeholder="Phone" runat="server" MaxLength="13"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ControlToValidate="txtPhone" runat="server" ErrorMessage="Only Numbers allowed!" ValidationExpression="\d+" Display="Dynamic"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtEmail" class="control-label col-xs-4">Email</label>
                                                    <div class="col-xs-8">
                                                        <asp:TextBox ID="txtEmail" class="form-control" placeholder="Email" runat="server" MaxLength="80"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtEmail" runat="server" ErrorMessage="Invalid email address!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-info">
                                            <div class="panel-heading"><strong>Responsible Person</strong></div>
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label for="txtResponsiblePersonName" class="control-label col-xs-4">Name</label>
                                                    <div class="col-xs-8">
                                                        <asp:TextBox ID="txtResponsiblePersonName" class="form-control" placeholder="Responsible Person Name" runat="server" MaxLength="80"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtDesignation" class="control-label col-xs-4">Designation</label>
                                                    <div class="col-xs-8">
                                                        <asp:TextBox ID="txtDesignation" class="form-control" placeholder="Designation" runat="server" MaxLength="80"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtRPMobileNo" class="control-label col-xs-4">Mobile No</label>
                                                    <div class="col-xs-8">
                                                        <asp:TextBox ID="txtRPMobileNo" class="form-control" placeholder="Mobile No" runat="server" MaxLength="10"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator13" ControlToValidate="txtRPMobileNo" runat="server" ErrorMessage="Only Numbers allowed!" ValidationExpression="\d+" Display="Dynamic"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="panel panel-info">
                                            <div class="panel-heading"><strong>Responsible Person Detail</strong></div>
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label for="txtRPFlatNo" class="control-label col-xs-4">Flt/Dr/Blk No</label>
                                                    <div class="col-xs-8">
                                                        <asp:TextBox ID="txtRPFlatNo" class="form-control" placeholder="Flt/Dr/Blk No" runat="server" MaxLength="40"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtRPBuildingName" class="control-label col-xs-4">Building</label>
                                                    <div class="col-xs-8">
                                                        <asp:TextBox ID="txtRPBuildingName" class="form-control" placeholder="Building" runat="server" MaxLength="40"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtRPStreet" class="control-label col-xs-4">Rd/Strt/Lane</label>
                                                    <div class="col-xs-8">
                                                        <asp:TextBox ID="txtRPStreet" class="form-control" placeholder="Rd/Strt/Lane" runat="server" MaxLength="40"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtRPArea" class="control-label col-xs-4">Area/Locality</label>
                                                    <div class="col-xs-8">
                                                        <asp:TextBox ID="txtRPArea" class="form-control" placeholder="Area/Locality" runat="server" MaxLength="40"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtRPTown" class="control-label col-xs-4">Town/District</label>
                                                    <div class="col-xs-8">
                                                        <asp:TextBox ID="txtRPTown" class="form-control" placeholder="Town/District" runat="server" MaxLength="40"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="txtRPTown" runat="server" ErrorMessage="Invalid only charecters are allowed!" ValidationExpression="[a-zA-Z ]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtRPPin" class="control-label col-xs-4">Pin</label>
                                                    <div class="col-xs-8">
                                                        <asp:TextBox ID="txtRPPin" class="form-control" placeholder="Pin" runat="server" MaxLength="6"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" ControlToValidate="txtRPPin" runat="server" ErrorMessage="Only Numbers allowed!" ValidationExpression="\d+" Display="Dynamic"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="ddRPState" class="control-label col-xs-4">State</label>
                                                    <div class="col-xs-8">
                                                        <asp:DropDownList ID="ddRPState" runat="server" class="form-control">
                                                            <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                                            <asp:ListItem Value="1">ANDAMAN AND NICOBAR ISLANDS	</asp:ListItem>
                                                            <asp:ListItem Value="2">ANDHRA PRADESH</asp:ListItem>
                                                            <asp:ListItem Value="3">ARUNACHAL PRADESH</asp:ListItem>
                                                            <asp:ListItem Value="4">ASSAM</asp:ListItem>
                                                            <asp:ListItem Value="5">BIHAR</asp:ListItem>
                                                            <asp:ListItem Value="6">CHANDIGARH</asp:ListItem>
                                                            <asp:ListItem Value="7">DADRA & NAGAR HAVELI</asp:ListItem>
                                                            <asp:ListItem Value="8">DAMAN & DIU</asp:ListItem>
                                                            <asp:ListItem Value="9">DELHI</asp:ListItem>
                                                            <asp:ListItem Value="10">GOA</asp:ListItem>
                                                            <asp:ListItem Value="11">GUJARAT</asp:ListItem>
                                                            <asp:ListItem Value="12">HARYANA</asp:ListItem>
                                                            <asp:ListItem Value="13">HIMACHAL PRADESH</asp:ListItem>
                                                            <asp:ListItem Value="14">JAMMU & KASHMIR</asp:ListItem>
                                                            <asp:ListItem Value="15">KARNATAKA</asp:ListItem>
                                                            <asp:ListItem Value="16">KERALA</asp:ListItem>
                                                            <asp:ListItem Value="17">LAKSHWADEEP</asp:ListItem>
                                                            <asp:ListItem Value="18">MADHYA PRADESH</asp:ListItem>
                                                            <asp:ListItem Value="19">MAHARASHTRA</asp:ListItem>
                                                            <asp:ListItem Value="20">MANIPUR</asp:ListItem>
                                                            <asp:ListItem Value="21">MEGHALAYA</asp:ListItem>
                                                            <asp:ListItem Value="22">MIZORAM</asp:ListItem>
                                                            <asp:ListItem Value="23">NAGALAND</asp:ListItem>
                                                            <asp:ListItem Value="24">ORISSA</asp:ListItem>
                                                            <asp:ListItem Value="25">PONDICHERRY</asp:ListItem>
                                                            <asp:ListItem Value="26">PUNJAB</asp:ListItem>
                                                            <asp:ListItem Value="27">RAJASTHAN</asp:ListItem>
                                                            <asp:ListItem Value="28">SIKKIM</asp:ListItem>
                                                            <asp:ListItem Value="29">TAMILNADU</asp:ListItem>
                                                            <asp:ListItem Value="30">TRIPURA</asp:ListItem>
                                                            <asp:ListItem Value="31">UTTAR PRADESH</asp:ListItem>
                                                            <asp:ListItem Value="32">WEST BENGAL</asp:ListItem>
                                                            <asp:ListItem Value="33">CHHATISHGARH</asp:ListItem>
                                                            <asp:ListItem Value="34">UTTARANCHAL</asp:ListItem>
                                                            <asp:ListItem Value="35">JHARKHAND</asp:ListItem>
                                                            <asp:ListItem Value="36">TELANGANA</asp:ListItem>
                                                            <asp:ListItem Value="99">	OTHERS	</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtPhone" class="control-label col-xs-4">Std</label>
                                                    <div class="col-xs-8">
                                                        <asp:TextBox ID="txtStdRP" class="form-control" placeholder="Std" runat="server" MaxLength="4"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtRPPhone" class="control-label col-xs-4">Phone</label>
                                                    <div class="col-xs-8">
                                                        <asp:TextBox ID="txtRPPhone" class="form-control" placeholder="Phone" runat="server" MaxLength="13"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator11" ControlToValidate="txtRPPhone" runat="server" ErrorMessage="Only Numbers allowed!" ValidationExpression="\d+" Display="Dynamic"></asp:RegularExpressionValidator>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtRPEmail" class="control-label col-xs-4">Email</label>
                                                    <div class="col-xs-8">
                                                        <asp:TextBox ID="txtRPEmail" class="form-control" placeholder="Email" runat="server" MaxLength="80"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="txtRPEmail" runat="server" ErrorMessage="Invalid email address!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="panel panel-info">
                                    <div class="panel-heading"><strong>For Govt Deductors</strong></div>
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label for="txtPAOCode" class="control-label col-xs-4">PAO Code</label>
                                            <div class="col-xs-8">
                                                <asp:TextBox ID="txtPAOCode" class="form-control" placeholder="PAO Code" runat="server" MaxLength="20"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtPAORegNo" class="control-label col-xs-4">PAO Reg No</label>
                                            <div class="col-xs-8">
                                                <asp:TextBox ID="txtPAORegNo" class="form-control" placeholder="PAO Reg No" runat="server" MaxLength="7"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtDDOCode" class="control-label col-xs-4">DDO Code</label>
                                            <div class="col-xs-8">
                                                <asp:TextBox ID="txtDDOCode" class="form-control" placeholder="DDO Code" runat="server" MaxLength="20"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtDDORegNo" class="control-label col-xs-4">DDO Reg No</label>
                                            <div class="col-xs-8">
                                                <asp:TextBox ID="txtDDORegNo" class="form-control" placeholder="DDO Reg No" runat="server" MaxLength="10"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="ddGovDeductorState" class="control-label col-xs-4">State</label>
                                            <div class="col-xs-8">
                                                <asp:DropDownList ID="ddGovDeductorState" runat="server" class="form-control">
                                                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                                    <asp:ListItem Value="1">ANDAMAN AND NICOBAR ISLANDS	</asp:ListItem>
                                                    <asp:ListItem Value="2">ANDHRA PRADESH</asp:ListItem>
                                                    <asp:ListItem Value="3">ARUNACHAL PRADESH</asp:ListItem>
                                                    <asp:ListItem Value="4">ASSAM</asp:ListItem>
                                                    <asp:ListItem Value="5">BIHAR</asp:ListItem>
                                                    <asp:ListItem Value="6">CHANDIGARH</asp:ListItem>
                                                    <asp:ListItem Value="7">DADRA & NAGAR HAVELI</asp:ListItem>
                                                    <asp:ListItem Value="8">DAMAN & DIU</asp:ListItem>
                                                    <asp:ListItem Value="9">DELHI</asp:ListItem>
                                                    <asp:ListItem Value="10">GOA</asp:ListItem>
                                                    <asp:ListItem Value="11">GUJARAT</asp:ListItem>
                                                    <asp:ListItem Value="12">HARYANA</asp:ListItem>
                                                    <asp:ListItem Value="13">HIMACHAL PRADESH</asp:ListItem>
                                                    <asp:ListItem Value="14">JAMMU & KASHMIR</asp:ListItem>
                                                    <asp:ListItem Value="15">KARNATAKA</asp:ListItem>
                                                    <asp:ListItem Value="16">KERALA</asp:ListItem>
                                                    <asp:ListItem Value="17">LAKSHWADEEP</asp:ListItem>
                                                    <asp:ListItem Value="18">MADHYA PRADESH</asp:ListItem>
                                                    <asp:ListItem Value="19">MAHARASHTRA</asp:ListItem>
                                                    <asp:ListItem Value="20">MANIPUR</asp:ListItem>
                                                    <asp:ListItem Value="21">MEGHALAYA</asp:ListItem>
                                                    <asp:ListItem Value="22">MIZORAM</asp:ListItem>
                                                    <asp:ListItem Value="23">NAGALAND</asp:ListItem>
                                                    <asp:ListItem Value="24">ORISSA</asp:ListItem>
                                                    <asp:ListItem Value="25">PONDICHERRY</asp:ListItem>
                                                    <asp:ListItem Value="26">PUNJAB</asp:ListItem>
                                                    <asp:ListItem Value="27">RAJASTHAN</asp:ListItem>
                                                    <asp:ListItem Value="28">SIKKIM</asp:ListItem>
                                                    <asp:ListItem Value="29">TAMILNADU</asp:ListItem>
                                                    <asp:ListItem Value="30">TRIPURA</asp:ListItem>
                                                    <asp:ListItem Value="31">UTTAR PRADESH</asp:ListItem>
                                                    <asp:ListItem Value="32">WEST BENGAL</asp:ListItem>
                                                    <asp:ListItem Value="33">CHHATISHGARH</asp:ListItem>
                                                    <asp:ListItem Value="34">UTTARANCHAL</asp:ListItem>
                                                    <asp:ListItem Value="35">JHARKHAND</asp:ListItem>
                                                    <asp:ListItem Value="36">TELANGANA</asp:ListItem>
                                                    <asp:ListItem Value="99">	OTHERS	</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="ddMinistry" class="control-label col-xs-4">Ministry</label>
                                            <div class="col-xs-8">
                                                <asp:DropDownList ID="ddMinistry" runat="server" class="form-control">
                                                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                                    <asp:ListItem Value="01">Agriculture</asp:ListItem>
                                                    <asp:ListItem Value="02">Atomic Energy</asp:ListItem>
                                                    <asp:ListItem Value="03">Fertilizers</asp:ListItem>
                                                    <asp:ListItem Value="04">Chemicals and Petrochemicals</asp:ListItem>
                                                    <asp:ListItem Value="05">Civil Aviation and Tourism</asp:ListItem>
                                                    <asp:ListItem Value="06">Coal</asp:ListItem>
                                                    <asp:ListItem Value="07">Consumer Affairs, Food and Public Distribution</asp:ListItem>
                                                    <asp:ListItem Value="08">Commerce and Textiles</asp:ListItem>
                                                    <asp:ListItem Value="09">Environment and Forests and Ministry of Earth Science</asp:ListItem>
                                                    <asp:ListItem Value="10">External Affairs and Overseas Indian Affairs</asp:ListItem>
                                                    <asp:ListItem Value="11">Finance</asp:ListItem>
                                                    <asp:ListItem Value="12">Central Board of Direct Taxes</asp:ListItem>
                                                    <asp:ListItem Value="13">Central Board of Excise and Customs</asp:ListItem>
                                                    <asp:ListItem Value="14">Contoller of Aid Accounts and Audit</asp:ListItem>
                                                    <asp:ListItem Value="15">Central Pension Accounting Office</asp:ListItem>
                                                    <asp:ListItem Value="16">Food Processing Industries</asp:ListItem>
                                                    <asp:ListItem Value="17">Health and Family Welfare</asp:ListItem>
                                                    <asp:ListItem Value="18">Home Affairs and Development of North Eastern Region</asp:ListItem>
                                                    <asp:ListItem Value="19">Human Resource Development</asp:ListItem>
                                                    <asp:ListItem Value="20">Industry</asp:ListItem>
                                                    <asp:ListItem Value="21">Information and Broadcasting</asp:ListItem>
                                                    <asp:ListItem Value="22">Telecommunication and Information Technology</asp:ListItem>
                                                    <asp:ListItem Value="23">Labour</asp:ListItem>
                                                    <asp:ListItem Value="24">Law and Justice and Company Affairs</asp:ListItem>
                                                    <asp:ListItem Value="25">Personnel, Public Grievances and Pensions</asp:ListItem>
                                                    <asp:ListItem Value="26">Petroleum and Natural Gas</asp:ListItem>
                                                    <asp:ListItem Value="27">Plannning, Statistics and Programme Implementation</asp:ListItem>
                                                    <asp:ListItem Value="28">Power</asp:ListItem>
                                                    <asp:ListItem Value="29">New and Renewable Energy</asp:ListItem>
                                                    <asp:ListItem Value="30">Rural Development and Panchayati Raj</asp:ListItem>
                                                    <asp:ListItem Value="31">Science And Technology</asp:ListItem>
                                                    <asp:ListItem Value="32">Space</asp:ListItem>
                                                    <asp:ListItem Value="33">Steel</asp:ListItem>
                                                    <asp:ListItem Value="34">Mines</asp:ListItem>
                                                    <asp:ListItem Value="35">Social Justice and Empowerment</asp:ListItem>
                                                    <asp:ListItem Value="36">Tribal Affairs</asp:ListItem>
                                                    <asp:ListItem Value="37">D/o Commerce (Supply Division)</asp:ListItem>
                                                    <asp:ListItem Value="38">Shipping and Road Transport and Highways</asp:ListItem>
                                                    <asp:ListItem Value="39">Urban Development, Urban Employment and Poverty Alleviation</asp:ListItem>
                                                    <asp:ListItem Value="40">Water Resources</asp:ListItem>
                                                    <asp:ListItem Value="41">President's Secretariat</asp:ListItem>
                                                    <asp:ListItem Value="42">Lok Sabha Secretariat</asp:ListItem>
                                                    <asp:ListItem Value="43">Rajya Sabha secretariat</asp:ListItem>
                                                    <asp:ListItem Value="44">Election Commission</asp:ListItem>
                                                    <asp:ListItem Value="45">Ministry of Defence (Controller General of Defence Accounts)</asp:ListItem>
                                                    <asp:ListItem Value="46">Ministry of Railways</asp:ListItem>
                                                    <asp:ListItem Value="47">Department of Posts</asp:ListItem>
                                                    <asp:ListItem Value="48">Department of Telecommunications</asp:ListItem>
                                                    <asp:ListItem Value="49">Andaman and Nicobar Islands Administration   </asp:ListItem>
                                                    <asp:ListItem Value="50">Chandigarh Administration</asp:ListItem>
                                                    <asp:ListItem Value="51">Dadra and Nagar Haveli</asp:ListItem>
                                                    <asp:ListItem Value="52">Goa, Daman and Diu</asp:ListItem>
                                                    <asp:ListItem Value="53">Lakshadweep</asp:ListItem>
                                                    <asp:ListItem Value="54">Pondicherry Administration</asp:ListItem>
                                                    <asp:ListItem Value="55">Pay and Accounts Officers (Audit)</asp:ListItem>
                                                    <asp:ListItem Value="56">Ministry of Non-conventional energy sources </asp:ListItem>
                                                    <asp:ListItem Value="57">Government Of NCT of Delhi </asp:ListItem>
                                                    <asp:ListItem Value="99">Others</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtOtherMinistry" class="control-label col-xs-4">Other Ministry</label>
                                            <div class="col-xs-8">
                                                <asp:TextBox ID="txtOtherMinistry" class="form-control" placeholder="Other Ministry" runat="server" MaxLength="80"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtAccountOfficerIDNo" class="control-label col-xs-4">Account Officer ID No</label>
                                            <div class="col-xs-8">
                                                <asp:TextBox ID="txtAccountOfficerIDNo" class="form-control" placeholder="Account Officer ID No" runat="server" MaxLength="7"></asp:TextBox>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="row-fluid">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSave" CssClass="btn btn-sm btn-success pull-right" runat="server" Text="Save" OnClick="btnSave_Click" />
                                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <asp:Literal ID="ltDataTable" runat="server"></asp:Literal>

        <div class="row-fluid">
            <div class="col-md-4">
                <asp:DropDownList ID="ddEmployee" runat="server" CssClass="form-control" Visible="false" OnSelectedIndexChanged="ddEmployee_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            </div>
            <div class="col-md-4">
                <a href="#" id="linkSalaryDetail" runat="server" target="_blank" class="btn btn-primary" visible="false"><span class="glyphicon glyphicon-add"></span>Add Salary Detail</a>
            </div>

        </div>
        <div class="row-fluid">
            <br />
            <div class="col-md-12">
                <asp:Literal ID="ltrSalDetailList" runat="server"></asp:Literal>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-md-12">
                <a runat="server" id="lnkGenerateReturn" target="_blank" class="no-print pull-right btn btn-warning fancybox fancybox.iframe"><span class="glyphicon glyphicon-book"></span>&nbsp;Generate Return</a>
            </div>
        </div>

        <a href="#PopupDiv" style="display: none" id="aBox"></a>
        <div style="width: 900px;" id="PopupDiv">
            <div class="col-md-12">
                <div id="divDedDetail"></div>
            </div>
            <div class="col-md-12">
                <br />
                <div id="divStatementDetail"></div>
            </div>
            <div class="col-md-12">
                <br />
                <div id="divFile"></div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>

