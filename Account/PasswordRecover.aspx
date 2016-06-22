<%@ Page Language="C#" Title="Password Recover" AutoEventWireup="true" MasterPageFile="~/MasterPage2.master" EnableViewState="false" CodeFile="PasswordRecover.aspx.cs" Inherits="Account_PasswordRecover" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #passReset .container {
            max-width: 900px;
            padding-top: 20px;
        }

        #passReset .paddingBox {
            padding: 25px;
            background: #ebebeb;
            opacity: .85;
            border-radius: 4px;
            margin-bottom: 20px;
        }

            #passReset .paddingBox h1 {
                font-size: 28px;
                margin-bottom: 10px;
                margin-top: 0;
            }

            #passReset .paddingBox .boxAnagraphic {
                margin-bottom: 20px;
                font-size: 13px;
                position: relative;
                padding-top: 30px;
            }

                #passReset .paddingBox .boxAnagraphic .inputBox {
                    margin: 0 0 7px 0;
                }

                    #passReset .paddingBox .boxAnagraphic .inputBox .input {
                        display: block;
                        border-color: #bcbcbc #ccc #ccc #bcbcbc;
                        width: 300px;
                        height: 30px;
                        float: left;
                        padding: 0 20px 0 5px;
                        font-size: 15px;
                        color: #333;
                        line-height: 30px;
                        -webkit-border-radius: 3px;
                        -moz-border-radius: 3px;
                        border-radius: 3px;
                    }

                    #passReset .paddingBox .boxAnagraphic .inputBox label {
                        height: 25px;
                        padding: 5px 15px 5px 5px;
                        margin-bottom: 0 !important;
                    }

        #pnlCreate label {
            width: 135px;
        }

        /*#pnlCreate #btnResetPassword {
            position: absolute;
            left: 155px;
        }*/

        #passReset .paddingBox .boxAnagraphic #btnSendMail {
            margin-left: 15px;
        }

        #passReset .paddingBox .errorBox {
            background: #ffcfcf;
            border: 1px solid #e5a3a3;
            color: #801b1b;
            font-size: 13px;
            padding: 15px;
            font-weight: bold;
            text-align: center;
            margin: 20px 0 0 0;
        }

        #passReset .paddingBox .warning {
            background: #ede7a0;
            border: 1px solid #f2ea91;
            color: #000000;
        }
    </style>
    <div id="passReset">
        <div class="container">
            <div class="paddingBox">
                <asp:Panel ID="pnlForgot" runat="server">
                    <h1>Forgot your password?</h1>
                    <div class="subTitle">
                        In order to reset your password, you need to enter the information below to help us identify your account:
                    </div>
                    <asp:Panel ID="pnlerror" runat="server" Visible="false">
                        <div id="errormsg" runat="server" class="errorBox"></div>
                    </asp:Panel>
                    <asp:Panel ID="pnlDetails" runat="server">
                        <div class="boxAnagraphic">
                            <div class="inputBox">
                                <label class="pull-left" for="txtEmail">E-mail:</label><asp:TextBox ID="txtEmail" runat="server" CssClass="input"></asp:TextBox>
                                <asp:Button ID="btnSendMail" runat="server" OnClientClick="DisableButton()" OnClick="btnSendMail_Click" CssClass="btn" Text="Send" />
                                <input type="hidden" runat="server" id="txtValue" />
                            </div>
                        </div>
                    </asp:Panel>
                </asp:Panel>
                <asp:Panel ID="pnlCreate" runat="server" Visible="false">
                    <input id="txtUserID" runat="server" type="hidden" />
                    <input id="txtToken" runat="server" type="hidden" />
                    <h1>
                        <asp:Label ID="lblCreateText" runat="server" Text="Create new  password?"></asp:Label></h1>
                    <div class="subTitle" id="subtitle1" runat="server">
                        Dear <b>
                            <asp:Label ID="lblUser" runat="server" Text="User"></asp:Label></b>, Plese Enter New Password:
                    </div>
                    <asp:Panel ID="pnlerr1" runat="server" Visible="false">
                        <div id="errortxt" runat="server" class="errorBox"></div>
                    </asp:Panel>
                    <asp:Panel ID="pnlDetail1" runat="server">
                        <div class="boxAnagraphic">
                            <div class="inputBox">
                                <p class="clearfix">
                                    <label class="pull-left" for="txtPassword">Password:</label><asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="input"></asp:TextBox>
                                </p>
                                <p class="clearfix">
                                    <label class="pull-left" for="txtPassword1">Re-Enter Password:</label><asp:TextBox ID="txtPassword1" TextMode="Password" runat="server" CssClass="input"></asp:TextBox>
                                </p>
                                <p class="clearfix">
                                    <label class="pull-left">&nbsp;</label>
                                    <asp:Button ID="btnResetPassword" runat="server" CssClass="btn" OnClick="btnResetPassword_Click" Text="Reset Password" />
                                </p>
                            </div>
                        </div>
                    </asp:Panel>
                </asp:Panel>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function DisableButton(type)
        {
            $("#btnSendMail").hide();
        }
    </script>
</asp:Content>
