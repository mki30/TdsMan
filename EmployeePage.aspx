<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmployeePage.aspx.cs" Inherits="EmployeePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/datepicker.css" rel="stylesheet" />
    
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
<body style="width: 400px;height:470px;">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">Employee</h3>
        </div>
        <div class="panel-body">
            <form id="form1" runat="server">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-horizontal">
                            <div class="form-group" style="display: none;">
                                <label for="lblID" class="control-label col-xs-2"></label>
                                <div class="col-xs-10">
                                    ID:
                            <asp:Label ID="lblID" runat="server" Text="0"></asp:Label>
                                    Company ID :
                            <asp:Label ID="lblCompanyID" runat="server" Text="0"></asp:Label>
                                    Company:
                            <b>
                                <asp:Label ID="lblCompany" runat="server" Text=""></asp:Label>
                            </b>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="txtEmployeePan" class="control-label col-xs-2">PAN</label>
                                <div class="col-xs-10">
                                    <asp:TextBox ID="txtEmployeePan" class="form-control" placeholder="Pan" runat="server" MaxLength="10" onblur="fnValidatePAN(this);"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="txtEmployeeName" class="control-label col-xs-2">Name</label>
                                <div class="col-xs-10">
                                    <asp:TextBox ID="txtEmployeeName" class="form-control" placeholder="Employee Name" runat="server" MaxLength="40"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmployeeName" ErrorMessage="Name is mandatory!" SetFocusOnError="true" EnableClientScript="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ControlToValidate="txtEmployeeName" ErrorMessage="Invalid name!" SetFocusOnError="true" ValidationExpression="[a-zA-Z ]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="ddEmployeeCatagory" class="control-label col-xs-2">Category</label>
                                <div class="col-xs-10">
                                    <asp:DropDownList ID="ddEmployeeCatagory" runat="server" class="form-control">
                                        <asp:ListItem Value="G">G-General</asp:ListItem>
                                        <asp:ListItem Value="W">W-Female</asp:ListItem>
                                        <asp:ListItem Value="S">S-Senior Citizen</asp:ListItem>
                                        <asp:ListItem Value="O">O-Very Senior Citizen</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="ddState" class="control-label col-xs-2">RefNo</label>
                                <div class="col-xs-10">
                                    <asp:TextBox ID="txtEmployeReferenceNo" class="form-control" placeholder="Employee Ref No" runat="server" MaxLength="10"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="txtDesignation" class="control-label col-xs-2">Desig</label>
                                <div class="col-xs-10">
                                    <asp:TextBox ID="txtDesignation" class="form-control" placeholder="Designation" runat="server" MaxLength="30"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="txtDesignation" class="control-label col-xs-2">DOB</label>
                                <div class="col-xs-10">
                                    <asp:TextBox ID="txtDOB" class="form-control datePicker" placeholder="DOB" runat="server" MaxLength="30"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="txtDOJ" class="control-label col-xs-2">DOJ</label>
                                <div class="col-xs-10">
                                    <asp:TextBox ID="txtDOJ" class="form-control datePicker" placeholder="DOJ" runat="server" MaxLength="30"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="txtAddress" class="control-label col-xs-2">Address</label>
                                <div class="col-xs-10">
                                    <asp:TextBox ID="txtAddress" class="form-control" placeholder="Address" runat="server" MaxLength="200" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="btnSubmit" class="control-label col-xs-2"></label>
                                <div class="col-xs-10">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Save" class="btn btn-sm btn-success" OnClick="btnSubmit_Click" />
                                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                                </div>
                                <%--<asp:ValidationSummary ID="ValidationSummary1" HeaderText="Please Check:" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" runat="server" />--%>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
