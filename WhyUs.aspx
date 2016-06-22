<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="WhyUs.aspx.cs" Inherits="WhyUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        //$(document).ready(function()
        //{
        //    $("#divMain1").css('min-height', $(window).height() - 250 - $(".header-panel").height() + $(".back-top").height() + $(".footer-panel").height());
        //});
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row-fluid text-justify" id="divMain1" >
        <div class="col-md-8 col-md-offset-2">
            <h1>Why Us?</h1>
            <p>
                We specialise in providing growing business accountancy services. 
    We help our clients achieve their ambitions and grow their successful businesses by providing them with professional advice based upon real firm experience. 
    We recognize that <strong>our success is directly related to the success of our clients</strong>, and with this in mind we have set our core business values:
            </p>
            <div class="row">
                <div class="col-xs-6 col-md-3">
                    <a href="#" class="thumbnail">
                        <img src="/images/customer_satisfaction1.jpg" style="height: 100px;" />
                    </a>
                </div>
                <div class="col-xs-6 col-md-3">
                    <a href="#" class="thumbnail">
                        <img src="/images/honesty.jpg" style="height: 100px;" /></a>
                </div>
                <div class="col-xs-6 col-md-3">
                    <a href="#" class="thumbnail">
                        <img src="/images/quality.jpg" style="height: 100px;" /></a>
                </div>
                <div class="col-xs-6 col-md-3">
                    <a href="#" class="thumbnail">
                        <img src="/images/standards.jpg" style="height: 100px;" /></a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

