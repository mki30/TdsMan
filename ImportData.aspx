<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImportData.aspx.cs" Inherits="ImportData" MasterPageFile="~/MasterPage2.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row-fluid">
        <div class="col-md-6">
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </div>
        <div class="col-md-6">
            <asp:Button ID="btnImport" runat="server" Text="Import"  OnClick="btnImport_Click"/>
        </div>
    </div>
    <div class="row-fluid">
        <div class="col-md-6">
            
        </div>
        <div class="col-md-6">
            <asp:label ID="lblMsg" runat="server"></asp:label>
        </div>
    </div>
</asp:Content>

