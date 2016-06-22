<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="~/ResponseHandling.aspx.cs" Inherits="ResponseHandling" %>

<%@ Register Src="~/Controls/EmailControl.ascx" TagPrefix="uc1" TagName="EmailControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Payment Details</title>
    <%-- <script>
        $(document).ready(function ()
        {

        });
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row"></div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <div class="row">
        <div class="col-md-12">
            <asp:Literal ID="ltText" runat="server"></asp:Literal>
        </div>
    </div>
    <div runat="server" visible="false">
        <uc1:EmailControl runat="server" ID="EmailControl" />
    </div>
</asp:Content>

