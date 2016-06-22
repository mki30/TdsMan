<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="col-md-8 col-md-offset-2">
        <h1>Feedback</h1>
        <div class="row">
            <%--<div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6"></div>
            </div>
            <div class="form-group"></div>
            <div class="form-group"></div>
            <div class="form-group"></div>
            <div class="form-group"></div>
            <div class="form-group"></div>--%>
            <table class="table BorderLess">
                <tr>
                    <td>Name</td>
                    <td><asp:TextBox ID="txtName" runat="server" Placeholder="Name" CssClass="form-control"/></td>
                </tr>
                <tr>
                    <td>Email ID</td>
                    <td><asp:TextBox ID="txtEmailID" runat="server" Placeholder="Email" CssClass="form-control"/></td>
                </tr>
                <tr>
                    <td>Feedback</td>
                    <td><asp:TextBox ID="txtFeedback" runat="server" Placeholder="Feedback" CssClass="form-control" Style="height:100px;"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" CssClass="btn btn-success"/></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

