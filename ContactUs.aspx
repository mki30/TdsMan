<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        //$(document).ready(function ()
        //{
        //    $('.li_contact').addClass('active');
        //    $("#divMain1").css('min-height', $(window).height() - 250 - $(".header-panel").height() + $(".back-top").height() + $(".footer-panel").height());
        //});
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row-fluid">
        <div class="col-md-8 col-md-offset-2">
            <h1 style="display: none">&nbsp;Contact Us</h1>
            <div class="col-md-8">
                <address style="font-size: 120%">
                    <strong>Garg Shekhar & Co., Chartered Accountants</strong><br />
                    <br />
                    T - 5, Aditya City Centre,<br />
                    Vaibhav Khand, Indirapuram,<br />
                    Ghaziabad - 201014,<br />
                    UP, India<br />
                    <br />
                    
                    Phone: <a href="tel:+91-1204322456">+91-1204322456</a><br />
                    Mobile:<a href="tel:+91-8826693260">+91-8826693260</a>, <a href="tel:+91-9650606247">+91-9650606247</a><br />
                    Email: <a href="mailto:contact@fincomindia.in">contact@fincomindia.in</a><br />
                    <br />
                    <a href="https://www.google.co.in/maps/dir//28.6386582,77.3608781/@28.63861,77.3609747,19z" target="_blank"><img src="Images/map.jpg" alt="Map" /></a>
                </address>
            </div>
            <div class="col-md-4">
                <img src="Images/contactus.jpg" style="width: 100%;" />
            </div>
        </div>
        
    </div>
</asp:Content>
