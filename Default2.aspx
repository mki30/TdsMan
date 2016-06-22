<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <style type="text/css">


        #data1,#data2,#data3,
        #sub-heading-1,#sub-heading-2,#sub-heading-3
        
         { display:inline-table;}
        /*.parallax-slider .controlBtn .innerBtn {
            font-size: 0px;
            line-height: 0px;
            color: #414141;
            background: url(/images1/prevnext.png) 0 0 no-repeat #373d43;
        }*/
        p {
            font-style: oblique;
            /*color:grey;*/
        }
        h6 {
           color:#0B1E6C ;/*#2F428C*/
        }
        /*h6:hover {
           color: white;
        }*/
        .service-box:hover {
           color: white;
        }
        
        .parallaxPrevBtn {
            left: 10%!important;
        }

        .parallaxNextBtn {
            right: 10%!important;
        }
        .cs {
            color: white;
             text-shadow: 2px 2px black;
        }
    </style>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            if (!device.mobile() && !device.tablet()) {
                liteModeSwitcher = false;
            } else {
                liteModeSwitcher = true;
            }
            if ($.browser.msie && parseInt($.browser.version) < 9) {
                liteModeSwitcher = true;
            }

            jQuery('#parallax-slider-550a348141dfd').parallaxSlider({
                parallaxEffect: "parallax_effect_normal"
            , parallaxInvert: false, animateLayout: "simple-fade-eff"
            , duration: 1500, autoSwitcher: true, autoSwitcherDelay: 10000, scrolling_description: true, slider_navs: true, slider_pagination: "none_pagination"
            , liteMode: liteModeSwitcher
            });

        });
    </script>
    <div id="parallax-slider-550a348141dfd" class="parallax-slider">
        <ul class="baseList">
            <%--"images1/slide-1.jpg"--%>
            <li data-preview="images2/A%20Whole%20New%20World%20of%20Possibilities%20-%20Home%201%20-%20Option%201.jpg" data-thumb-url="images1/slide-1-100x50.jpg" data-ulr-link="blog/">
                <div class="slider_caption">
                    <h3 class="cs"><%--Services with best user interface designed for your comfort with international level of customer support.--%>A whole new world of possibilites</h3>
                </div>
            </li>
            <%--"images1/slide-2.jpg"--%>
            <li data-preview="images2/Home2.jpg" data-thumb-url="images2/Home2.jpg" data-ulr-link="portfolio/">
                <div class="slider_caption">
                    <h3 class="cs">Essential Financial Services at your doorstep.</h3>
                </div>
            </li>
            <%--"images1/slide-3.jpg"--%>
            <li data-preview="images2/Home%203.jpg" data-thumb-url="images2/Home%203.jpg" data-ulr-link="contacts/">
                <div class="slider_caption">
                    <h3 class="cs">Save your effort and time in managing business and <br/> spend it on doing business that will yield you more.</h3>
                </div>
            </li>
        </ul>
    </div>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <div class="motopress-wrapper content-holder clearfix">
        <div class="container">
            <div class="row">
                <div class="col-md-12" data-motopress-wrapper-file="page-home.php" data-motopress-wrapper-type="content">
                    <div class="row">
                        <div class="col-md-12" data-motopress-type="loop" data-motopress-loop-file="loop/loop-page.php">
                            <div id="post-203" class="post-203 page type-page status-publish hentry">
                                <div class="row ">
                                    <div class="col-md-3 ">
                                        <div class="service-box serv-1">
                                            <div class="service-box_body">
                                                <div id="heading-1">
                                                    <h3 class="title">DSC</h3>
                                                </div>
                                                <div id="sub-heading-1">
                                                    <h6 class="sub-title">Class 2 - Individual &amp; <span class="visible-lg">Starting at Rs.810</span></h6>
                                                    <h6 class="sub-title">Class 3 - Individual / Organization &amp; <span class="visible-lg">Starting at Rs.1800</span></h6>
                                                    <h6 class="sub-title">D G F T &amp; <span class="visible-lg">Starting at Rs.2250</span></h6>
                                                </div>
                                                <div id="data1">
                                                    <p>Most Economical and Fastest Services</p>
                                                    <p>We serve almost all major cities of India</p>
                                                    <p>Door to Door Pick up and delivery</p>
                                                    <p>World class customer support services</p>
                                                </div>
                                                <div class="btn-align"><a href="/dsc" title="more" class="btn btn-inverse btn-normal btn-primary " target="_self">more</a></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 ">
                                        <div class="service-box serv-2">
                                            <div class="service-box_body">
                                                <div id="heading-2">
                                                    <h3 class="title">PAN/TAN</h3>
                                                </div>
                                                <div id="sub-heading-2">
                                                    <h6 class="sub-title">Apply for PAN / TAN</h6>
                                                    <h6 class="sub-title">PAN/TAN Correction</h6>
                                                    <h6 class="sub-title">Second Original PAN/TAN</h6>
                                                    <h6 class="sub-title">PAN /TAN Status</h6>
                                                    <h6 class="sub-title">Verify PAN / TAN</h6>
                                                </div>
                                                <div id="data2">
                                                    <p>Only Govt. Fee plus Courier Exp. Payable</p>
                                                    <p>Premium Services also available</p>
                                                    <p>Verify PAN / TAN Nos. FREE</p>
                                                    <p>Bulk PAN / TAN Verification also available</p>
                                                </div>
                                                <div class="btn-align"><a href="/pan-aboutpan" title="more" class="btn btn-inverse btn-normal btn-primary " target="_self">more</a></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 ">
                                        <div class="service-box serv-3">
                                            <div class="service-box_body">
                                                <div id="heading-3">
                                                    <h3 class="title">Register Company</h3>
                                                </div>
                                                <div id="sub-heading-3">
                                                    <h6 class="sub-title">Private Limited</h6>
                                                    <h6 class="sub-title">Public Limited</h6>
                                                    <h6 class="sub-title">Limited Liability Partnership</h6>
                                                    <h6 class="sub-title">One person Company(OPC)</h6>
                                                </div>
                                                <div id="data3">
                                                    <p>Most Economical and Fastest Services</p>
                                                    <p>We serve almost all major cities of India</p>
                                                    <p>Door to Door Pick up and delivery</p>
                                                    <p>&nbsp;</p>
                                                    <p>&nbsp;</p>
                                                </div>
                                                <%--<p>- World class customer support services</p>--%>
                                                <div class="btn-align"><a href="#" title="more" class="btn btn-inverse btn-normal btn-primary " target="_self">more</a></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 ">
                                        <div class="service-box serv-4">
                                            <div class="service-box_body">
                                                <div id="heading-4">
                                                <h3 class="title">Sell/Buy Business</h3>
                                                    </div>
                                                <div id="sub-heading-4">
                                                    <h6 class="sub-title">Sell your Pvt Ltd, Public Ltd Co., NBFC</h6>
                                                    <h6 class="sub-title">Find buyer for your company</h6>
                                                    <h6 class="sub-title">Find buyer for your company</h6>
                                                </div>
                                                <div id="data4">
                                                    <p>Search Company as per your exact requirement</p>
                                                    <p>Your company information is kept Confidential and Discrete</p>
                                                    <p>First Service of its kind</p>
                                                    <p>&nbsp;</p>
                                                </div>
                                                <div class="btn-align"><a href="/sellbuybusiness.aspx" title="more" class="btn btn-inverse btn-normal btn-primary " target="_self">more</a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%-- <div class="content_box box-1 ">
                                    <div class="row ">
                                        <div class="span4 ">
                                            <h1><span style="color: #ffffff;">nemo enim sat aspernato!</span></h1>
                                            <h6><a href="#">Temporibus autem quibusdam et aut officiis debitis aut rerum</a></h6>
                                            <p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facerem possimus, omnis voluptas.</p>
                                        </div>
                                        <div class="span4 ">
                                            <h6>Lorem ipsum dolor sit amet</h6>
                                            <div class="list styled circle-list">
                                                <ul>
                                                    <li><a href="#">Nemo enim ipsam voluptatem</a></li>
                                                    <li><a href="#">Voluptas sit aspernatur aut odit</a></li>
                                                    <li><a href="#">Dgit sed quia consequuntur</a></li>
                                                    <li><a href="#">Dolores eos qui ratione</a></li>
                                                    <li><a href="#">Foluptatem sequi nesciunt</a></li>
                                                    <li><a href="#">Neque porro quisquam est</a></li>
                                                </ul>
                                            </div>
                                            <a href="blog/" title="View All" class="btn btn-default btn-normal btn-inline " target="_self">View All</a>
                                        </div>
                                        <div class="span4 ">
                                            <h6>Atvero eos et accusamus</h6>
                                            <div class="list styled circle-list">
                                                <ul>
                                                    <li><a href="#">At vero eos et accusamus</a></li>
                                                    <li><a href="#">Esto odio dignissimos ducimus qui</a></li>
                                                    <li><a href="#">Sanditiis praesentium voluptatum</a></li>
                                                    <li><a href="#">Atque corrupti quos dolores et</a></li>
                                                    <li><a href="#">Molestias excepturi sint occaecati</a></li>
                                                    <li><a href="#">Apiditate non provident</a></li>
                                                </ul>
                                            </div>
                                            <a href="blog/" title="View All" class="btn btn-default btn-normal btn-inline " target="_self">View All</a>
                                        </div>
                                    </div>
                                    <div class="clear"></div>
                                </div>--%>
                                <%-- <div class="content_box box-2 ">
                                    <div class="carousel-wrap owl-1">
                                        <h2>Our Updates</h2>
                                        <div id="owl-carousel-550a34814cfe2" class="owl-carousel-post owl-carousel" data-items="3" data-auto-play="0" data-nav="true" data-pagination="false">
                                            <div class="item format-standart item-list-0">
                                                <div class="desc">
                                                    <time datetime="2014-05-27T06:31:56">27/ <span>05</span></time><p class="excerpt"><a href="#">Aliquam dapibus tincidunt metus. Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent vestibulum molestie&hellip;</a></p>
                                                </div>
                                            </div>
                                            <div class="item format-standart item-list-1">
                                                <div class="desc">
                                                    <time datetime="2013-03-14T20:28:57">14/ <span>03</span></time><p class="excerpt"><a href="#">Aliquam dapibus tincidunt metus. Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent vestibulum molestie&hellip;</a></p>
                                                </div>
                                            </div>
                                            <div class="item format-standart item-list-2">
                                                <div class="desc">
                                                    <time datetime="2013-03-05T20:31:03">05/ <span>03</span></time><p class="excerpt"><a href="#">Aliquam dapibus tincidunt metus. Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent vestibulum molestie&hellip;</a></p>
                                                </div>
                                            </div>
                                            <div class="item format-standart item-list-3">
                                                <div class="desc">
                                                    <time datetime="2013-02-14T20:26:57">14/ <span>02</span></time><p class="excerpt"><a href="#">Aliquam dapibus tincidunt metus. Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent vestibulum molestie&hellip;</a></p>
                                                </div>
                                            </div>
                                            <div class="item format-standart item-list-4">
                                                <div class="desc">
                                                    <time datetime="2013-02-14T20:26:08">14/ <span>02</span></time><p class="excerpt"><a href="#">Aliquam dapibus tincidunt metus. Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent vestibulum molestie&hellip;</a></p>
                                                </div>
                                            </div>
                                            <div class="item format-standart item-list-5">
                                                <div class="desc">
                                                    <time datetime="2013-02-02T20:30:30">02/ <span>02</span></time><p class="excerpt"><a href="#">Aliquam dapibus tincidunt metus. Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent vestibulum molestie&hellip;</a></p>
                                                </div>
                                            </div>
                                            <div class="item format-standart item-list-6">
                                                <div class="desc">
                                                    <time datetime="2013-01-15T20:29:55">15/ <span>01</span></time><p class="excerpt"><a href="#">Aliquam dapibus tincidunt metus. Praesent justo dolor, lobortis quis, lobortis dignissim, pulvinar ac, lorem. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent vestibulum molestie&hellip;</a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <section class="parallax-box image-parallax-box style-1">
                                    <div class="parallax-content">
                                        <div class="row ">
                                            <div class="span4 ">
                                                <h5><span style="color: #ffffff;">BEST PROFESSIONAL CONSULTING AT YOUR SERVICE</span></h5>
                                            </div>
                                            <div class="span4 ">
                                                <div class="list styled circle-list">
                                                    <ul>
                                                        <li><a href="#">Nam libero tempore cum </a></li>
                                                        <li><a href="#">solutaest eligendi optio </a></li>
                                                        <li><a href="#">cumque nihil impedit quo minus </a></li>
                                                        <li><a href="#">id quod maxime placeat facere </a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="span4 ">
                                                <div class="list styled circle-list">
                                                    <ul>
                                                        <li><a href="#">omnis dolor repellendus </a></li>
                                                        <li><a href="#">Temporibus autem quibusdam </a></li>
                                                        <li><a href="#">et aut officiis debitis aut rerum </a></li>
                                                        <li><a href="#">Excepteur sint occaecat </a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                    <div class="parallax-bg" data-parallax-type="image" data-img-url="" data-speed="normal" data-invert="false"></div>
                                </section>--%>
                                <div class="content_box box-3 ">
                                    <h4>Have Questions? <span style="color: #ffffff;">Contact Our Specialists</span></h4>
                                    <address>Monday to Saturday <span style="color: #ffffff;">from <strong>10:00</strong> am to <strong>6:00</strong> pm</span></address>
                                    <h4>+91-120-432-2456, +91-8826693260,+91-9650606247</h4>
                                    <div class="clear"></div>
                                </div>
                                <div class="clear"></div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

