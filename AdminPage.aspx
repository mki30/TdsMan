<%@ Page Title="Admin" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="AdminPage.aspx.cs" Inherits="AdminPage" %>

<%@ Reference Control="~/Controls/StageControl.ascx" %>
<%@ Reference Control="~/Controls/NotesControl.ascx" %>
<%@ Register Src="~/Controls/NotesControl.ascx" TagPrefix="uc1" TagName="NotesControl" %>
<%@ Register Src="~/Controls/BuyBusinessFilter.ascx" TagPrefix="uc1" TagName="BuyBusinessFilter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        var time = new Date().getTime();
        $(document).bind("mousemove keypress", function (e) {
            time = new Date().getTime();
        });

        function ShowSearchResult() {
        }
        //function refresh()
        //{
        //    if (new Date().getTime() - time >= 60000)
        //        window.location.reload(true);
        //    else
        //        setTimeout(refresh, 60000);
        //}
        //setTimeout(refresh, 60000);
    </script>
    <style>
        .btn-sm {
            padding: 2px 5px;
            margin: 0px 5px;
        }

        .btn-default {
            float: none !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-5">
            <asp:Literal ID="ltAdminTabs" runat="server"></asp:Literal>
        </div>
        <div class="col-md-2" runat="server" id="divLicenceSelection">
        </div>
        <div class="pull-right">
            <div class="col-md-4">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-1">
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" class="btn btn-default" OnClientClick="ShowSearchResult()" Style="margin-top: 0px;" />
            </div>
        </div>

    </div>

    <div class="row">
        <div class="col-md-12">
            <asp:Label ID="lblSearchResult" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="row" id="divStatusFilter" runat="server">
        <div class="col-md-12" runat="server" id="divStageFilter">
            <asp:Literal ID="ltStatusFilter" runat="server"></asp:Literal>
        </div>
    </div>
    <br />
    <div class="row-fluid" id="divAdminPanels" runat="server">
        <asp:Panel ID="pnlDSC" runat="server" Visible="false">
            <div class="row-fluid">
                <div>
                </div>
                <div>
                    <asp:Label ID="lblDscList" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlPayment" runat="server" Visible="false">
            <div>
                <asp:Label ID="lblRechargeLink" runat="server" Text="" Visible="false">
                    <a class="btn btn-warning input-sm pull-right" target="_blank" href="/recharge">Recharge</a>
                </asp:Label>
            </div>
            <div>
                <asp:Label ID="lblPaymentTable" runat="server" Text=""></asp:Label>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlIncorporate" runat="server" Visible="false">
            <div class="row">
                <div class="col-md-12">
                    <asp:Label ID="lblIncorporateList" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlBuyBusiness" runat="server" Visible="false">
            <div class="row">
                <div class="col-md-12">
                    <asp:Label ID="lblBuyBusinessList" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlSellBusiness" runat="server" Visible="false">
            <asp:Label ID="lblSellBusiness" runat="server" Text="" />

        </asp:Panel>
        <asp:Panel ID="Panel1" runat="server" Visible="false">
            <uc1:BuyBusinessFilter runat="server" ID="BuyBusinessFilter" />
        </asp:Panel>
        <asp:Panel ID="pnlLicence" runat="server" Visible="false">
            <div class="row">
                <div class="col-md-8">
                </div>
                <div class="col-md-2">
                </div>
                <div class="col-md-2">
                    <a href="/Admin/EditLicense.aspx?id=0" class="fancybox400 fancybox.iframe btn btn-sm btn-info pull-right">+ Add License</a>
                </div>
            </div>
            <br />
            <asp:Label ID="lblLicense" runat="server" Text=""></asp:Label>
        </asp:Panel>

        <asp:Panel ID="panelDashBoard" runat="server" Visible="false">
            <br />
            <div class="row">
                <div >
                    <asp:Literal ID="ltDashBoard" runat="server"></asp:Literal>
                </div>
            </div>
        </asp:Panel>

    </div>
</asp:Content>

