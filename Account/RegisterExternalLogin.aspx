<%@ Page Language="C#" Title="Registering with External Account" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="RegisterExternalLogin.aspx.cs" Inherits="Account_RegisterExternalLogin" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1">
    <style>
        .no_margin {
            margin: 0;
        }

        .form-horizontal .controls input[type='text'] {
            padding: 4px 6px;
        }
    </style>
    <script>
        function setFunctionBind()
        {
            $("#txtCompany").autocomplete({
                source: "../Data.aspx?ACTION=SEARCH_COMPANY&Data1=2&Data2=noid", select: function (event, ui)
                {
                    $("#txtCompanyID").val(ui.item.id);
                    $("#msg").html("An approval request will send to selected \"Company\".");
                }
            });
        }
    </script>
    <div class="container">
        <h4>Register with your <%: ProviderName %> account</h4>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server">
            <div class="form-horizontal">
                <hr class="no_margin" />
                <p class="text-error">
                    <asp:Label ID="ltErrors" runat="server" />
                </p>
                <p class="text-info">
                    You've authenticated with <strong><%: ProviderName %></strong>. Please enter a user name below for the site and click the Log in button.
                </p>
                <%--s<div class="control-group">
                    <label class="control-label" for="userName">User name</label>
                    <div class="controls">
                        <asp:TextBox runat="server" ID="userName" />
                    </div>
                </div>--%>
                <div class="control-group">
                    <label class="control-label" for="txtEmail">Email</label>
                    <div class="controls">
                        <asp:TextBox runat="server" ID="txtEmail" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="txtFirst">Name</label>
                    <div class="controls">
                        <asp:TextBox runat="server" ID="txtFirst" /><asp:TextBox runat="server" ID="txtLast" />
                        <input type="hidden" runat="server" id="txtProfilePic" />
                    </div>
                </div>
                <%--<div class="control-group">
                    <label class="control-label" for="txtCompany">Company</label>
                    <div class="controls">
                        <input type="text" id="txtCompany" />
                        <input type="hidden" runat="server" id="txtCompanyID" />
                        <span class="text-error" id="msg"></span>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <label class="checkbox">
                            <input type="hidden" runat="server" id="txtProfilePic" />
                            <asp:CheckBox ID="chkProfile" runat="server" />
                            Save Profile Picture From <%:ProviderName %>.
                        </label>
                    </div>
                </div>--%>
                <input type="hidden" id="txtProfile" runat="server" />
                <div class="control-group">
                    <div class="controls">
                        <asp:Button ID="Button1" runat="server" Text="Log in" CssClass="btn btn-default" OnClick="LogIn_Click" />
                    </div>
                </div>
                <asp:Label ID="lblMsg" runat="server" ForeColor="Green"/>
            </div>
        </asp:PlaceHolder>
    </div>
</asp:Content>
