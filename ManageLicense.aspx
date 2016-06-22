<%@ Page Title="Manage Licenses" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ManageLicense.aspx.cs" Inherits="ManageLicense" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript">
         $(document).ready(function ()
         {
             $(".fancybox").fancybox(
             {
             });
         });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Licenses</h1>
    <%--<asp:Button ID="btnLogout" runat="server" Text="logout"  CssClass="btn btn-sm btn-danger pull-right" OnClick="btnLogout_Click"/>--%>
    <div class="row">
        <div class="col-md-8">
        </div>
        <div class="col-md-2">
            <asp:DropDownList ID="ddLicense" runat="server" CssClass="pull-right form-control input-sm" OnSelectedIndexChanged="ddLicense_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
        </div>
        <div class="col-md-2">
            <a href="/Admin/EditLicense.aspx?id=0" class="fancybox400 fancybox.iframe btn btn-sm btn-info pull-right"> + Add License</a>
        </div>
    </div>
    <br />
    <asp:Label ID="lblLicense" runat="server" Text=""></asp:Label>
</asp:Content>

