<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ViewBinInformationOnline.aspx.cs" Inherits="ViewBinInformationOnline" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        $(document).redy(function ()
        {
            $("#frmLink")[0].src = "https://onlineservices.tin.egov-nsdl.com/TIN/JSP/etbaf/ViewBIN.jsp";
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <iframe id="frmLink" src="https://onlineservices.tin.egov-nsdl.com/TIN/JSP/etbaf/ViewBIN.jsp" style="border:solid #dbdbdb 1px; width:100%; height:800PX;" runat="server"></iframe>
</asp:Content>

