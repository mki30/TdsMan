<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CompanyPage.aspx.cs" Inherits="CompanyPage1" MasterPageFile="~/MasterPage2.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title></title>
    <script src="/js/bootstrap-datepicker.js"></script>
    <script src="js/common.js"></script>
    <style>
        .form-control
        {
            padding: 2px !important;
            height: auto;
        }

        .form-group
        {
            margin: 2px;
        }

        .control-label
        {
            padding: 0px !important;
            font-size: 12px;
            font-weight: normal;
            margin-top: 5px;
        }

        .panel-heading
        {
            padding: 5px 15px;
            border-bottom: 1px solid transparent;
            border-top-left-radius: 3px;
            border-top-right-radius: 3px;
        }
        
        @media print
        {
            .control-label
            {
                text-align: right;
            }
            input[type="text"]
            {
                border: 1px solid #ff0000;
                background-color: #ffeeee;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Company Master</h1>
    <div class="row">
        <div class="col-md-6">
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            <asp:ValidationSummary ID="ValidationSummary1" HeaderText="Please Check:" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" runat="server" />
            <div class="panel panel-info">
                <div class="panel-heading"><strong>Basic Information</strong></div>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="txtCompanyName" class="control-label col-xs-4">Company</label>
                        <div class="col-xs-8">
                            <asp:TextBox ID="txtCompanyName" CssClass="form-control" placeholder="Company Name" runat="server" MaxLength="100"></asp:TextBox>
                            <asp:Label ID="lblID" runat="server" Text="0" Style="display: none;"></asp:Label>
                            <%--Hidden id Label--%>
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
                <%--<table class="table table-condensed">
                     <tr>
                        <td>Company</td>
                        <td>
                            <asp:TextBox ID="txtCompanyName" CssClass="form-control" placeholder="Company Name" runat="server" MaxLength="100"></asp:TextBox>
                            <asp:Label ID="lblID" runat="server" Text="0" Style="display: none;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Tan No</td>
                        <td>
                            <asp:TextBox ID="txtTanNo" class="form-control" placeholder="Tan No" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Pan No</td>
                        <td>
                            <asp:TextBox ID="txtPanNo" class="form-control" placeholder="Pan No" runat="server" MaxLength="10"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Branch/Devision</td>
                        <td>
                            <asp:TextBox ID="txtBranch" class="form-control" placeholder="Branch/Devision" runat="server" MaxLength="100"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Deductur Type</td>
                        <td>
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
                        </td>
                    </tr>
                    <tr>
                        <td>Tan Reg No</td>
                        <td>
                            <asp:TextBox ID="txtTanRegNo" class="form-control" placeholder="Tan Teg No" runat="server" MaxLength="12"></asp:TextBox>
                        </td>
                    </tr>
                </table>--%>
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
                        <label for="txtPhone" class="control-label col-xs-4">Alt Std</label>
                        <div class="col-xs-8">
                            <asp:TextBox ID="txtAltStd" class="form-control" placeholder="Std" runat="server" MaxLength="4"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtPhoneAlt" class="control-label col-xs-4">Alt. Phone</label>
                        <div class="col-xs-8">
                            <asp:TextBox ID="txtPhoneAlt" class="form-control" placeholder="Alt. Phone" runat="server" MaxLength="13"></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ControlToValidate="txtPhoneAlt" runat="server" ErrorMessage="Only Numbers allowed!" ValidationExpression="\d+" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtEmail" class="control-label col-xs-4">Email</label>
                        <div class="col-xs-8">
                            <asp:TextBox ID="txtEmail" class="form-control" placeholder="Email" runat="server" MaxLength="80"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtEmail" runat="server" ErrorMessage="Invalid email address!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtAltEmail" class="control-label col-xs-4">Alt. Email</label>
                        <div class="col-xs-8">
                            <asp:TextBox ID="txtEmailAlt" class="form-control" placeholder="Alt Email" runat="server" MaxLength="80"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtEmailAlt" runat="server" ErrorMessage="Invalid email address!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
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
                        <label for="txtFathersName" class="control-label col-xs-4">Father's Name</label>
                        <div class="col-xs-8">
                            <asp:TextBox ID="txtFathersName" class="form-control" placeholder="Father's Name" runat="server" MaxLength="80"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtRPMobileNo" class="control-label col-xs-4">Mobile No</label>
                        <div class="col-xs-8">
                            <asp:TextBox ID="txtRPMobileNo" class="form-control" placeholder="Mobile No" runat="server" MaxLength="10"></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="txtRPMobileNo" runat="server" ErrorMessage="Only Numbers allowed!" ValidationExpression="\d+" Display="Dynamic"></asp:RegularExpressionValidator>
                            
                        </div>
                    </div>
                    <div class="col-md-12 bg-info">Responsible Person Detail</div>
                    <div class="form-group">
                        <label for="" class="control-label col-xs-4"></label>
                        <div class="col-xs-8">
                            <asp:RadioButtonList ID="radioAddressSame" runat="server" OnSelectedIndexChanged="radioAddressSame_SelectedIndexChanged" AutoPostBack="true" RepeatDirection="Horizontal">
                                <asp:ListItem Value="Y">Same as company</asp:ListItem>
                                <asp:ListItem Value="N">Different</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
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
                        <label for="txtPhone" class="control-label col-xs-4">Std</label>
                        <div class="col-xs-8">
                            <asp:TextBox ID="txtStdAltRP" class="form-control" placeholder="Std" runat="server" MaxLength="4"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtRPAltPhone" class="control-label col-xs-4">Alt. Phone</label>
                        <div class="col-xs-8">
                            <asp:TextBox ID="txtRPPhoneAlt" class="form-control" placeholder="Alt. Phone" runat="server" MaxLength="13" TextMode="Number"></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator12" ControlToValidate="txtRPPhoneAlt" runat="server" ErrorMessage="Only Numbers allowed!" ValidationExpression="\d+" Display="Dynamic"></asp:RegularExpressionValidator>
                            
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtRPEmail" class="control-label col-xs-4">Email</label>
                        <div class="col-xs-8">
                            <asp:TextBox ID="txtRPEmail" class="form-control" placeholder="Email" runat="server" MaxLength="80"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="txtRPEmail" runat="server" ErrorMessage="Invalid email address!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtRPEmailAlt" class="control-label col-xs-4">Alt. Email</label>
                        <div class="col-xs-8">
                            <asp:TextBox ID="txtRPEmailAlt" class="form-control" placeholder="Alt Email" runat="server" MaxLength="80"></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="txtRPEmailAlt" runat="server" ErrorMessage="Invalid email address!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
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
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-info">
                <div class="panel-heading"><strong>CIT Details</strong></div>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="txtCITAddress" class="control-label col-xs-4">Address</label>
                        <div class="col-xs-8">
                            <asp:TextBox ID="txtCITAddress" class="form-control" placeholder="Address" runat="server" TextMode="MultiLine" MaxLenth="80"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtCITCity" class="control-label col-xs-4">City</label>
                        <div class="col-xs-8">
                            <asp:TextBox ID="txtCITCity" class="form-control" placeholder="City" runat="server" MaxLength="50"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtCITPin" class="control-label col-xs-4">Pin</label>
                        <div class="col-xs-8">
                            <asp:TextBox ID="txtCITPin" class="form-control" placeholder="pin" runat="server" MaxLength="6"></asp:TextBox>
                            <a href="http://www.tdsman.com/Downloads/CIT-DETAILS.pdf" target="_blank">Click here to know your cit details</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <asp:Button ID="btnSubmit" runat="server" Text="Save" CssClass="btn btn-sm btn-success pull-right no-print" OnClick="btnSubmit_Click" />
        </div>
    </div>
</asp:Content>


