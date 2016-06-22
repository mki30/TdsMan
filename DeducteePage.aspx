<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeducteePage.aspx.cs" Inherits="DeducteePage1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="/js/bootstrap-datepicker.js"></script>
    <script src="js/common.js"></script>

    <style type="text/css">
        .form-group
        {
            margin-bottom: 5px !important;
        }
    </style>
</head>

<body style="width:450px;height: 600px;">
        <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">Deductee</h3>
        </div>
        <div class="panel-body">
            <form id="form1" runat="server">

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-horizontal">
                            <div class="form-group" style="display: none;">
                                <label for="ddCompany" class="control-label col-xs-4"></label>
                                <div class="col-xs-8">
                                    ID :
                                <asp:Label ID="lblID" runat="server" Text="0"></asp:Label>
                                    Company ID :<asp:Label ID="lblCompanyID" runat="server" Text="0"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="ddDeducteeType" class="control-label col-xs-4">Deductee Type</label>
                                <div class="col-xs-8">
                                    <asp:DropDownList ID="ddDeducteeType" runat="server" class="form-control">
                                        <asp:ListItem Value="01">01-Company</asp:ListItem>
                                        <asp:ListItem Value="02">02-Non Company</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="txtPan" class="control-label col-xs-4">Pan</label>
                                <div class="col-xs-8">
                                    <asp:TextBox ID="txtPan" class="form-control" placeholder="Pan" runat="server" MaxLength="10" onblur="fnValidatePAN(this);"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="txtDeducteeName" class="control-label col-xs-4">Deductee Name</label>
                                <div class="col-xs-8">
                                    <asp:TextBox ID="txtDeducteeName" class="form-control" placeholder="Deductee Name" runat="server" MaxLength="50"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is mandatory!" ControlToValidate="txtDeducteeName" Text="*" EnableClientScript="true" SetFocusOnError="true" Style="display: none;" ValidateRequestMode="Inherit"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="txtDeducteeAddress1" class="control-label col-xs-4">Address</label>
                                <div class="col-xs-8">
                                    <asp:TextBox ID="txtDeducteeAddress1" class="form-control" placeholder="Deductee Address" runat="server" MaxLength="180"></asp:TextBox>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="txtDeducteeAddress2" class="control-label col-xs-4"></label>
                                <div class="col-xs-8">
                                    <asp:TextBox ID="txtDeducteeAddress2" class="form-control" placeholder="Deductee Address" runat="server" MaxLength="180"></asp:TextBox>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="txtDeducteeAddress3" class="control-label col-xs-4"></label>
                                <div class="col-xs-8">
                                    <asp:TextBox ID="txtDeducteeAddress3" class="form-control" placeholder="Deductee Address" runat="server" MaxLength="180"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="txtDeducteeAddress4" class="control-label col-xs-4"></label>
                                <div class="col-xs-8">
                                    <asp:TextBox ID="txtDeducteeAddress4" class="form-control" placeholder="Deductee Address" runat="server" MaxLength="180"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="txtDeducteeAddress5" class="control-label col-xs-4"></label>
                                <div class="col-xs-8">
                                    <asp:TextBox ID="txtDeducteeAddress5" class="form-control" placeholder="Deductee Address" runat="server" MaxLength="180"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-horizontal">
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
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="txtPin" class="control-label col-xs-4">Pin</label>
                                <div class="col-xs-8">
                                    <asp:TextBox ID="txtPin" class="form-control" placeholder="Pin" runat="server" MaxLength="6"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPin" ErrorMessage="Invalid pin no" Style="display: none;" SetFocusOnError="true" ValidateRequestMode="Enabled" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="txtMobile" class="control-label col-xs-4">Mobile</label>
                                <div class="col-xs-8">
                                    <asp:TextBox ID="txtMobile" class="form-control" placeholder="Mobile" runat="server" MaxLength="10"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMobile" ErrorMessage="Invalid mobile no" Style="display: none;" SetFocusOnError="true" ValidateRequestMode="Enabled" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="txtEmail" class="control-label col-xs-4">Email</label>
                                <div class="col-xs-8">
                                    <asp:TextBox ID="txtEmail" class="form-control" placeholder="Email" runat="server" MaxLength="80"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email" Style="display: none;" SetFocusOnError="true" ValidateRequestMode="Enabled" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="btnSubmit" class="control-label col-xs-4"></label>
                                <div class="col-xs-8">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Save" class="btn btn-sm btn-success" OnClick="btnSubmit_Click" />
                                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Not Saved! Please check :" ShowMessageBox="true" ShowSummary="false" />
                        </div>
                    </div>
                </div>

            </form>

        </div>
    </div>

</body>
</html>
