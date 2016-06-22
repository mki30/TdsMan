<%@ Page Title="Register" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1">
    <style>
        .form-horizontal {
            margin-bottom: 20px;
        }

            .form-horizontal .control-group {
                margin-bottom: 5px;
            }

            .form-horizontal input[type='text'], .form-horizontal input[type='password'] {
                padding: 4px 6px;
                width: 100%;
            }

            .form-horizontal [class*="span"] {
                margin-left: 0;
                margin-right: 2.5%;
            }

        .boxAnagraphic {
            padding: 10px 50px;
            margin-bottom: 20px;
            font-size: 13px;
            border: 1px solid #CEE5E9;
            background: #F7FAFC;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            position: relative;
            padding-top: 30px;
        }

        #company {
            position: relative;
        }

        .optionalBox {
            position: absolute;
            margin-bottom: 20px;
            color: #676767;
            background: #fff;
            display: block;
            font-weight: normal;
            left: 15px;
            top: 4px;
            letter-spacing: 1px;
            font-size: 17px;
            z-index: 1;
        }

        .errorBox {
            background: #ffcfcf;
            border: 1px solid #e5a3a3;
            color: #801b1b;
            font-size: 13px;
            padding: 15px;
            font-weight: bold;
            text-align: center;
            margin: 20px 0 0 0;
        }
    </style>
    <script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
    <script src="/js/lib/jquery.geocomplete.js"></script>
    <script>
        $(document).ready(function ()
        {
            $("#txtLocation").geocomplete({ details: "form" });
        });
    </script>
    <style>
        .pac-container::after {
            content: none !important;
        }
    </style>
    <div class="container" aria-autocomplete="none">
        <div class="form-horizontal clearfix">
            <h3 runat="server" id="createText">Create a new account.</h3>
            <hr />
            <p class="text-error">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>
            <asp:Panel ID="pnldetail" runat="server">
                <asp:Panel ID="pnlUser" runat="server">
                    <div class="control-group  span5">
                        NAME:<br />
                        <asp:TextBox runat="server" ID="txtName" />
                    </div>
                    <div class="control-group  span5">
                        SURNAME:<br />
                        <asp:TextBox runat="server" ID="txtSurname" />
                    </div>
                    <%--<div class="control-group span10">
                        LOCALITY:<br />
                        <asp:TextBox runat="server" ID="txtLocation" />
                    </div>--%>
                    <div class="control-group span10">
                        E-MAIL:<br />
                        <asp:TextBox runat="server" ID="txtEmail" />
                    </div>
                    <div class="control-group span5">
                        CAPTCHA:
                        <asp:TextBox runat="server" ID="txtCAPTCHA" />
                        </div>
                        <div class="control-group span5">
                        <iframe src="/CaptchaImage.aspx" style="width: 27px; height: 50px; border: 0px; padding-top: 18px; padding-left: 5px; margin-right: 21px;"></iframe>
                    </div>
                    <div class="control-group span5">
                        PASSWORD:<br />
                        <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" />
                    </div>
                    <div class="control-group span5">
                        CONFIRM PASSWORD:<br />
                        <asp:TextBox runat="server" ID="txtConfirmPassword" TextMode="Password" />
                    </div>
                    <div class="control-group span10">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Green" Font-Italic="true"/>
                    </div>
                </asp:Panel>
                
               <%-- <asp:Panel ID="pnlregisterCompany" runat="server" Visible="false">
                    <div id="company" class="control-group span10 no_margin">
                        <hr />
                        <div class="optionalBox">
                            Sign up your company (Optional)
                        </div>
                    </div>
                    <div class="control-group span5">
                        COMPANY NAME:<br />
                        <asp:TextBox runat="server" ID="txtCompanyName" />
                    </div>
                    <div class="control-group span5">
                        COMPANY TYPE:<br />
                        <asp:DropDownList ID="drpCompanyType" runat="server">
                            <asp:ListItem Value="0">---Select Type---</asp:ListItem>
                            <asp:ListItem Value="1">Brand</asp:ListItem>
                            <asp:ListItem Value="2">Professional</asp:ListItem>
                            <asp:ListItem Value="9">Magazine</asp:ListItem>
                            <asp:ListItem Value="6">Retailer</asp:ListItem>
                            <asp:ListItem Value="10">Organizer</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="control-group span5">
                        COMPANY LOCATION:<br />
                        <asp:TextBox runat="server" ID="txtCompanyLocation" />
                    </div>
                    <div class="control-group span5">
                        COMPANY ADDRESS:<br />
                        <asp:TextBox runat="server" ID="txtCompanyAddress" />
                    </div>
                    <div class="control-group span5">
                        CONTACT NO.:<br />
                        <asp:TextBox runat="server" ID="txtCompanyMobile" ToolTip="Company Contact Mobile" />
                    </div>
                    <div class="control-group span5">
                        CONTACT EMAIL:<br />
                        <asp:TextBox runat="server" ID="txtCompanyEmail" ToolTip="Company Contact Email" />
                    </div>
                    <div class="control-group span5">
                        CONTACT WEBSITE:<br />
                        <asp:TextBox runat="server" ID="txtCompanyWebsite" ToolTip="Company Website" />
                    </div>
                    <div class="control-group span10">
                        <hr />
                    </div>
                </asp:Panel>--%>
                <div class="control-group span5">
                    <asp:Button ID="Button1" runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-primary" />
                    <%--<asp:Button ID="btnRegisterCompany" Visible="false" runat="server" OnClick="btnRegisterCompany_Click" Text="Register Company" CssClass="btn btn-primary" />--%>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
