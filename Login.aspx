<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc1" TagName="OpenAuthProviders" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/ecmascript">
        if (window.top.location.href != location.href)
            window.top.location.href = location.href;

        function Validate() {
            if ($("#txtEmail").val() == "") {
                $("#txtEmail").focus();
                alert("Please enter username!");
                return false;
            }
            if ($("#txtPass").val() == "") {

                alert("Please enter password!");
                $("#txtPass").focus();
                return false;
            }
        }
    </script>
    <style>
        .dxcol {
            width: 350px;
            float: left;
            padding-left: 28px;
        }

        .or {
            position: relative;
            margin-bottom: 30px;
            border: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-4">
            <div class="panel panel-primary">
                <div class="panel-heading">Existing Users Login</div>
                <div class="panel-body">
                    <div>
                        <p>
                            <label for="txtEmail">Email</label>
                            <span class="redstar">*</span>
                            <asp:TextBox ID="txtEmail" runat="server" class="form-control">
                            </asp:TextBox>
                        </p>
                        <p>
                            <label for="txtPass">Password</label>
                            <span class="redstar">*</span>
                            <asp:TextBox ID="txtPass" runat="server" class="form-control" TextMode="Password" MaxLength="12"></asp:TextBox>
                        </p>
                        <p>
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-info" OnClick="btnSave_Click" OnClientClick="return Validate()" />
                        </p>
                        <p>
                            <asp:Label ID="lblMsg" runat="server" Style="color: red"></asp:Label>
                        </p>

                    </div>
                    <%-- <br />
                    <br />
                    <br />
                    <br />
                    <p>
                        <label>Login Using</label>
                        <a data-original-title="" href="#" target="_blank"><i class="fa fa-facebook fa-2x"></i></a>&nbsp;&nbsp;<a data-original-title="" href="#" target="_blank"><i class="fa fa-linkedin fa-2x"></i></a>&nbsp;&nbsp;<a data-original-title="" href="#" target="_blank"><i class="fa fa-google-plus fa-2x"></i></a>
                    </p>--%>
                </div>
                <%--<table>
                    <tr>
                        <td>&nbsp;</td><td>&nbsp;</td>
                        <td>
                            <label>Login Using</label></td>
                        <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                        <td colspan="2"><a data-original-title="" href="#" target="_blank"><i class="fa fa-facebook fa-2x"></i></a>&nbsp;&nbsp;<a data-original-title="" href="#" target="_blank"><i class="fa fa-linkedin fa-2x"></i></a>&nbsp;&nbsp;<a data-original-title="" href="#" target="_blank"><i class="fa fa-google-plus fa-2x"></i></a>
                        </td>
                    </tr>
                </table>--%>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">Login/Sign Up Using</div>
                <div class="panel-body">
                    <div class="dxcol">
                        <uc1:OpenAuthProviders runat="server" ID="OpenAuthProviders" />
                    </div>

                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-primary">
                <div class="panel-heading">New Users SignUp</div>
                <div class="panel-body">
                    <div>
                        <p>
                            <label for="txtEmail">Name</label>
                            <span class="redstar">*</span>
                            <asp:TextBox ID="txtName" runat="server" class="form-control">
                            </asp:TextBox>
                        </p>
                        <p>
                            <label for="txtEmail">Email</label>
                            <span class="redstar">*</span>
                            <asp:TextBox ID="txtEmail2" runat="server" class="form-control">
                            </asp:TextBox>
                        </p>
                        <p>
                            <label for="txtPass">Password</label>
                            <span class="redstar">*</span>
                            <asp:TextBox ID="txtPassword1" runat="server" class="form-control" TextMode="Password" MaxLength="12"></asp:TextBox>
                        </p>
                        <p>
                            <label for="txtPass">Reenter Password</label>
                            <span class="redstar">*</span>
                            <asp:TextBox ID="txtReenterPassword" runat="server" class="form-control" TextMode="Password" MaxLength="12"></asp:TextBox>
                        </p>

                        <p>
                            <label for="txtPass">Captcha</label>
                            <span class="redstar">*</span>
                            <asp:TextBox ID="txtCaptcha" runat="server" class="form-control"></asp:TextBox>
                            <iframe src="/CaptchaImage.aspx" style="width: 27px; height: 50px; border: 0px; padding-top: 18px; padding-left: 5px; margin-right: 21px;"></iframe>
                        </p>
                        <p>
                            <asp:Button ID="btnSubmit1" runat="server" Text="Submit" class="btn btn-info" OnClick="btnSubmit_Click" />
                        </p>
                        <p>
                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                        </p>
                    </div>
                    <%-- <br />
                    <br />
                    <br />
                    <br />
                    <p>
                        <label>Sign Up Using</label>
                        <a data-original-title="" href="#" target="_blank"><i class="fa fa-facebook fa-2x"></i></a>&nbsp;&nbsp;<a data-original-title="" href="#" target="_blank"><i class="fa fa-linkedin fa-2x"></i></a>&nbsp;&nbsp;<a data-original-title="" href="#" target="_blank"><i class="fa fa-google-plus fa-2x"></i></a>
                    </p>--%>
                </div>
            </div>
        </div>
        <div class="col-md-2">
        </div>
    </div>
</asp:Content>

