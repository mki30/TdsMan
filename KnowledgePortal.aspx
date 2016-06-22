<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="KnowledgePortal.aspx.cs" Inherits="KnowledgePortal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="/js/jquery.cleditor.min.js"></script>
    <link href="css/jquery.cleditor.css" rel="stylesheet" />
    <style>
        table td {
            vertical-align: auto;
        }
    </style>
    <script>
        $(document).ready(function () {
            var HTMLEDITCONT = "bold italic underline strikethrough subscript superscript | font size style | color highlight removeformat | undo redo | link unlink | cut copy paste pastetext | print source";
            $("#txtContent").cleditor({ width: '100%', height: 150, useCSS: true });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <table>
        <tr>
            <td style="vertical-align: top">
                <div style="overflow: auto; width: 400px; height: 800px;">
                    <asp:Literal ID="ltList" runat="server"></asp:Literal>
                </div>
            </td>
            <td style="vertical-align: top;" visible="false" runat="server" id="edit">

                <table class="table BorderLess">


                    <tr>
                        <td class="auto-style1">ParentId</td>
                        <td>
                            <asp:DropDownList ID="ddParent" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style1">Name</td>
                        <td>
                            <input type="text" class="form-control" id="txtName" runat="server" /></td>
                    </tr>

                    <tr>
                        <td class="auto-style1">Content</td>
                        <td>
                            <textarea id="txtContent" runat="server" class="form-control" />
                        </td>
                        <%--<input type="text" class="form-control" id="txtContent" runat="server" /></td>--%>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" class="btn btn-success" /></td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td>
                            <asp:Literal ID="ltText" runat="server" /></td>
                    </tr>


                </table>
            </td>
            <td colspan="2" style="vertical-align: top;"></td>
            <td colspan="2" style="vertical-align: top;">
                <asp:Button ID="btnNew" runat="server" OnClick="btnNew_Click" Text="Add New" class="btn btn-info" />
            </td>

        </tr>

    </table>



</asp:Content>

