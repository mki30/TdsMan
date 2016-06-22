<%@ Page Title="Log in" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1">
    <style>
        .content * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .content {
            width: 100%;
            padding-top: 20px;
        }

        .optional h3 {
            font: 18px 'HelveticaNeue-Bold';
            text-align: center;
            color: #4f575e;
            text-shadow: 0 1px 0 rgba(255,255,255,1);
            margin: 0 15px;
        }

        .ml10 {
            margin-left: 10px;
        }

        .dn {
            display: none !important;
        }

        .db {
            display: block !important;
        }

        .txt-c {
            text-align: center;
        }

        .mb10 {
            margin-bottom: 10px !important;
        }


        .inputBar {
            position: relative;
            background: #fff;
            height: 45px;
            margin: 0 15px;
            font-size: 0;
            border: 1px solid #999;
            border-bottom: none;
            display: block;
        }


        .contInputBar {
            margin-bottom: 20px;
        }

            .contInputBar .inputBar:first-child {
                -webkit-box-shadow: inset 0 2px 2px rgba(0,0,0,.1);
                -moz-box-shadow: inset 0 2px 2px rgba(0,0,0,.1);
                box-shadow: inset 0 2px 2px rgba(0,0,0,.1);
                -webkit-border-top-left-radius: 7px;
                -webkit-border-top-right-radius: 7px;
                -moz-border-radius-topleft: 7px;
                -moz-border-radius-topright: 7px;
                border-top-left-radius: 7px;
                border-top-right-radius: 7px;
            }

            .contInputBar .inputBar:last-child {
                border-bottom: 1px solid #999;
                -webkit-box-shadow: 0 1px 0 rgba(255,255,255,1);
                -moz-box-shadow: 0 1px 0 rgba(255,255,255,1);
                box-shadow: 0 1px 0 rgba(255,255,255,1);
                -webkit-border-bottom-right-radius: 7px;
                -webkit-border-bottom-left-radius: 7px;
                -moz-border-radius-bottomright: 7px;
                -moz-border-radius-bottomleft: 7px;
                border-bottom-right-radius: 7px;
                border-bottom-left-radius: 7px;
            }

        .inputBar .mark {
            display: inline-block;
            font: 17px/50px 'HelveticaNeue-Bold';
            color: #000;
            padding-left: 10px;
            vertical-align: top;
            width: 30%;
        }

        .inputBar input {
            display: inline-block;
            font: 17px 'HelveticaNeue-Roman';
            color: #999;
            vertical-align: top;
            background: transparent;
            font-size: 18px;
            width: 70%;
            border: none;
            height: 42px;
            padding-left: 5px;
        }

            .inputBar input:focus {
                box-shadow: none;
                -webkit-box-shadow: none;
            }

        .btn.log {
            float: left;
            margin-left: 15px;
        }

        .or {
            border-top: 2px dashed #ccc;
            border-bottom: 2px dashed #eee;
            line-height: 0;
            position: relative;
            margin-bottom: 25px;
        }

            .or span {
                position: absolute;
                top: -10px;
                left: 36%;
                text-align: center;
                width: 90px;
                font: italic 18px 'HelveticaNeue-Bold';
                color: #999;
                text-shadow: 0 1px 0 #eee;
                background: #fff;
            }


        .fbConnect {
            font-size: 0;
            display: block;
            background: #cbd8ed;
            margin: 0 10px 20px 0px;
            width: 98%;
            background: none;
            border: none;
            padding: 0;
        }

            .fbConnect i {
                color: #fff;
                border: 1px solid #223871;
                font: 26px/20px "icons";
                text-shadow: 0 -1px 0 rgba(0,0,0,.3);
                text-align: center;
                display: inline-block;
                vertical-align: top;
                height: 45px;
                width: 20%;
                -webkit-border-top-left-radius: 7px;
                -webkit-border-bottom-left-radius: 7px;
                -moz-border-radius-topleft: 7px;
                -moz-border-radius-bottomleft: 7px;
                border-top-left-radius: 7px;
                border-bottom-left-radius: 7px;
                background: url("/images/f128.png") no-repeat center center;
                background-size: 61px 45px;
                filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cbd8ed', endColorstr='#2b4077',GradientType=0 );
            }

            .fbConnect span {
                color: #fff;
                border: 1px solid #223871;
                border-left: 1px solid #5679b5;
                font: 19px/45px 'HelveticaNeue-Bold';
                text-align: center;
                text-shadow: 0 -1px 0 rgba(0,0,0,.6);
                display: inline-block;
                vertical-align: top;
                height: 45px;
                width: 80%;
                -webkit-border-top-right-radius: 7px;
                -webkit-border-bottom-right-radius: 7px;
                -moz-border-radius-topright: 7px;
                -moz-border-radius-bottomright: 7px;
                border-top-right-radius: 7px;
                border-bottom-right-radius: 7px;
                background: #cbd8ed;
                background: -moz-linear-gradient(top, #cbd8ed 0%, #4b71b1 2%, #324a87 100%);
                background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#cbd8ed), color-stop(2%,#4b71b1), color-stop(100%,#324a87));
                background: -webkit-linear-gradient(top, #cbd8ed 0%,#4b71b1 2%,#324a87 100%);
                background: -o-linear-gradient(top, #cbd8ed 0%,#4b71b1 2%,#324a87 100%);
                background: -ms-linear-gradient(top, #cbd8ed 0%,#4b71b1 2%,#324a87 100%);
                background: linear-gradient(to bottom, #cbd8ed 0%,#4b71b1 2%,#324a87 100%);
                filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cbd8ed', endColorstr='#324a87',GradientType=0 );
            }

        .goConnect {
            font-size: 0;
            padding: 0;
            margin: 0 10px 20px 0px;
            display: block;
            background: #dc4935;
            background: url();
            background: -moz-linear-gradient(top, #dc4935 0%, #d03b29 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#dc4935), color-stop(100%,#d03b29));
            background: -webkit-linear-gradient(top, #dc4935 0%,#d03b29 100%);
            background: -o-linear-gradient(top, #dc4935 0%,#d03b29 100%);
            background: -ms-linear-gradient(top, #dc4935 0%,#d03b29 100%);
            background: linear-gradient(to bottom, #dc4935 0%,#d03b29 100%);
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#dc4935', endColorstr='#d03b29',GradientType=0 );
            -webkit-border-radius: 7px;
            -moz-border-radius: 7px;
            border-radius: 7px;
            width: 98%;
            border: none;
        }

            .goConnect i {
                color: #fff;
                border: 1px solid #8d2d1d;
                font: 26px/20px "icons";
                text-shadow: 0 -1px 0 rgba(0,0,0,.3);
                text-align: center;
                display: inline-block;
                vertical-align: top;
                height: 45px;
                width: 20%;
                -webkit-border-top-left-radius: 7px;
                -webkit-border-bottom-left-radius: 7px;
                -moz-border-radius-topleft: 7px;
                -moz-border-radius-bottomleft: 7px;
                border-top-left-radius: 7px;
                border-bottom-left-radius: 7px;
                background: transparent url("/images/g128.png") no-repeat center center;
                background-size: 48px 48px;
            }

            .goConnect span {
                color: #fff;
                border: 1px solid #8d2d1d;
                border-left: 1px solid #dd4b37;
                font: 19px/45px 'HelveticaNeue-Bold';
                text-align: center;
                text-shadow: 0 -1px 0 rgba(0,0,0,.6);
                display: inline-block;
                vertical-align: top;
                height: 45px;
                width: 80%;
                -webkit-border-top-right-radius: 7px;
                -webkit-border-bottom-right-radius: 7px;
                -moz-border-radius-topright: 7px;
                -moz-border-radius-bottomright: 7px;
                border-top-right-radius: 7px;
                border-bottom-right-radius: 7px;
                background: #d03f2d;
            }

        .contLink {
            text-align: center;
            margin: 0 15px 25px;
        }

            .contLink a {
                font: 16px 'HelveticaNeue-Roman';
                padding: 5px 0;
                color: #777;
                text-shadow: 0 1px 0 rgba(255,255,255,1);
                text-decoration: none;
            }

        @media (min-width: 481px) {

            .content {
                width: 700px;
                margin: 50px auto;
                -webkit-border-radius: 10px;
                -moz-border-radius: 10px;
                border-radius: 10px;
                padding: 0px;
                overflow: hidden;
            }

            .sxcol {
                width: 350px;
                float: left;
                border-right: 1px dashed #CCC;
                margin-bottom: 10px;
                padding-right: 28px;
            }

            .dxcol {
                width: 350px;
                float: left;
                padding-left: 28px;
            }

            .contInputBar .inputBar:last-child {
                -webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, 1);
                -moz-box-shadow: 0 1px 0 rgba(255,255,255,1);
                box-shadow: 0 1px 0 rgba(255, 255, 255, 1);
                -webkit-border-radius: 7px;
                -moz-border-radius: 7px;
                border-radius: 7px;
            }

            .contInputBar .inputBar:first-child {
                border-bottom: 1px solid #cccccc;
                -webkit-box-shadow: inset 0 2px 2px rgba(0, 0, 0, .1);
                -moz-box-shadow: inset 0 2px 2px rgba(0,0,0,.1);
                box-shadow: inset 0 2px 2px rgba(0, 0, 0, .1);
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                border-radius: 5px;
            }

            .contLink {
                margin: 20px 15px 25px;
            }

            .inputBar {
                margin: 0 10px;
                font-size: 0;
                border: 1px solid #cccccc;
                display: block;
            }

                .inputBar .mark {
                    font: 17px/35px 'HelveticaNeue-Bold';
                }

            .firsttime {
                padding-top: 2px;
                margin-left: -10px;
                font-weight: bold;
            }


            .bottom {
                position: relative;
                width: 100%;
                height: 60px;
                margin: 0 auto 10px auto;
                text-align: center;
                border-top: 1px dashed #dddddd;
            }

            .or {
                position: relative;
                margin-bottom: 30px;
                border: none;
            }

                .or span {
                    position: absolute;
                    top: 75px;
                    left: -60px;
                    text-align: center;
                    width: 60px;
                    font: italic 20px 'HelveticaNeue-Bold';
                    color: #999;
                    text-shadow: 0 1px 0 #EEE;
                }

            .fbConnect span, .goConnect span {
                font: 18px/45px 'HelveticaNeue-Bold';
            }

            .errorBox {
                background: #ffcfcf;
                border: 1px solid #e5a3a3;
                color: #801b1b;
                font-size: 12px;
                padding: 10px;
                font-weight: bold;
                text-align: center;
                margin: 10px auto;
                width: 250px;
            }
        }

        #editLinkBtn {
            display: none !important;
        }
    </style>
    <div class="content">
        <div style="overflow: hidden">
            <div class="sxcol">
                <div class="optional">
                    <h3 class="mb10">Sign in finCom.in</h3>
                </div>
                <div class="contInputBar">
                    <label for="txtUsername" id="lblUsername" class="inputBar">
                        <span class="mark">User</span>
                        <asp:TextBox runat="server" ID="txtUser" MaxLength="100" />
                    </label>
                </div>
                <div class="contInputBar">
                    <label for="txtPassword" id="lblPassword" class="inputBar">
                        <span class="mark">Password</span>
                        <asp:TextBox runat="server" ID="txtPWD" MaxLength="100" TextMode="Password" CssClass="form-control" />
                    </label>
                </div>
                <div class="txt-c">
                    <asp:Button ID="Button1" runat="server" OnClick="LogIn" Text="Log in" CssClass="btn log" />
                </div>
                <div class="contLink">
                    <a href="/account/passwordrecover.aspx" id="lostPasswordButton">Forgot your password?</a>
                </div>
                <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                    <p class="text-error">
                        <asp:Literal runat="server" ID="FailureText" />
                    </p>
                </asp:PlaceHolder>
            </div>
            <%--<div class="dxcol">
                <div class="or">
                    <span>or</span>
                </div>
                <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
            </div>--%>
        </div>
        <div class="bottom">
            <div class="footico"></div>
            <div class="contLink firsttime" style="border: 3px">
                <asp:HyperLink runat="server" ID="registerOnEdilportaleButton" ViewStateMode="Disabled">New users? Register here</asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Content>

