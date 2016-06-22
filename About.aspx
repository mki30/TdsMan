<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        //$(document).ready(function()
        //{
        //    $("#divMain1").css('min-height', $(window).height() - 250 - $(".header-panel").height() + $(".back-top").height() + $(".footer-panel").height());
        //});
    </script>
    <style>
        p {
            margin: 35px 118px 35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row-fluid" id="divMain1">
        <div class="col-md-8 col-md-offset-2 highlight" style="text-align: justify;">
            <%--  <h1>About Us</h1>
            <p>
                Garg Shekhar & Co. is a Chartered Accountant firm (herein after called GSC) in India based in Ghaziabad. We are young & dynamic Chartered Accountants 
                actively involved in this profession for the last 5 years. Strength of firm lies 
                in its delivering capacity through its own Colleague & panel of professionals. The firm consists of permanent staff 
                & other professionals capable of executing any task in advanced computerized environment. We have wide network of Chartered Accountants,
                Company Secretaries, MBA’s, CMA and other professionals so that all services can be provided from single platform
            </p>--%>
            <h1>ABOUT US</h1>

            <p>
                Garg Shekhar & Co. is a Chartered Accountant firm (herein after called GSC) in India based in Delhi NCR. We are a team of young & dynamic Chartered Accountants actively involved in this profession for the last 14 years. Our strength lies in its delivering capacity through its own Colleague & panel of professionals. The team firm consists of qualified permanent staff & other professionals capable of executing any task in advanced computerized environment. We have wide network of Chartered Accountants, Company Secretaries, MBA’s, CMA and other professionals so that all services can be provided from single platform.

We at GSC have developed www.fincomindia.in with a vision of simplifying how we deal with financial services. We are committed to provide an International level user experience and customer service. We believe in change and are committed to improve us with the changing times now and forever.
            </p>
        </div>
    </div>
</asp:Content>

