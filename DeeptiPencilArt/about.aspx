<%@ Page Title="" Language="C#" MasterPageFile="~/Deeptipencilart.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="DeeptiPencilArt.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @media only screen and (max-device-width: 768px) {
            .navbar .logo img {
                margin-left: 20px !important;
                width: 100% !important;
            }

            .offar h2 {
                font-size: 48px !important;
            }

            .offar ul {
                transform: translate(5%, -40%) !important;
            }

            .section-title h2 {
                font-size: 45px;
            }

            .image-box.is-inview img {
                margin: 10px 0px;
            }

            

                .page-header .inner h1 {
                    margin-top: 108px !important;
                    font-size: 55px !important;
                }
        }




        @media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (orientation : portrait) {
            .page-header {
                margin-TOP: 10% !important;
                height: 375px !important;
            }

                .page-header .inner h1 {
                    margin-top: 0px !important;
                }

            .navbar .hamburger-menu {
                margin-left: 250px;
            }

            .page-header .inner p {
                padding-right: 38%;
                font-size: 19px !important;
            }

            .page-header .inner .svg-morph {
                left: 91%;
            }
        }

        /*  .logo2 ul li {
            float: left;
            text-decoration: none;
            list-style: none;
            margin-left: 15px;
            font-size: 19px;
          
        }
        .logo2 ul li i{
              color:#fff;
        }*/


        .offar {
            margin-bottom: 100px !important;
        }

            .offar ul {
                position: absolute;
                text-align: center;
                margin-top: 20px;
                transform: translate(27%, -40%);
            }

                .offar ul li {
                    list-style: none;
                    display: inline-block;
                    margin-left: 13px;
                    position: relative;
                    width: 50px;
                    height: 50px;
                    margin-top: 60px;
                    border-radius: 50%;
                    border: 3px solid #dee5f3;
                    overflow: hidden;
                }

                    .offar ul li i {
                        font-size: 20px;
                        line-height: 47px;
                    }

                    .offar ul li a {
                        text-decoration: none;
                        display: inline-block;
                        width: 100%;
                        height: 100%;
                        line-height: 50px;
                        border-radius: 50%;
                        transition: .5s;
                    }

                        .offar ul li a:nth-of-type(1) {
                            position: relative;
                            left: 0;
                            color: #000;
                            background: #fff;
                        }

                        .offar ul li a:nth-of-type(2) {
                            position: absolute;
                            top: 0;
                            left: -100%;
                            color: #fff !important;
                            background: #dee5f3;
                            z-index: -1;
                        }

                    .offar ul li:hover a:nth-of-type(1) {
                        left: 100%;
                        color: #fff !important;
                    }

                    .offar ul li:hover a:nth-of-type(2) {
                        left: 0;
                        color: #fff !important;
                    }

        @media only screen and (min-device-width: 1024px) and (max-device-width: 1366px) and (-webkit-min-device-pixel-ratio: 2) and (orientation: portrait) {
            .navbar .hamburger-menu {
                margin-left: 25px;
            }

            .page-header .inner .svg-morph {
                left: 68%;
            }

            .page-header .inner p {
                padding-right: 57%;
                font-size: 19px !important;
            }

            .page-header .inner h1 {
                font-size: 72px !important;
            }

            .page-header {
                height: 421px !important;
            }

            .logo1 {
                width: 28% !important;
            }
        }

        @media only screen and (min-device-width: 1024px) and (max-device-width: 1366px) and (-webkit-min-device-pixel-ratio: 2) and (orientation: landscape) {
            .page-header {
                margin-top: 5%;
                height: 500px !important;
            }

                .page-header .inner .svg-morph {
                    left: 71%;
                }

                .page-header .inner p {
                    padding-right: 49%;
                    font-size: 17px !important;
                }

            .logo1 {
                width: 23% !important;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="page-header" data-background="images1/Banner/resize-1687934636169414781resize16879344491551255929673123.jpg">
        <div class="inner">
            <svg width="580" height="400" class="svg-morph">
                <path id="svg_morph" d="m261,30.4375c0,0 114,6 151,75c37,69 37,174 6,206.5625c-31,32.5625 -138,11.4375 -196,-19.5625c-58,-31 -86,-62 -90,-134.4375c12,-136.5625 92,-126.5625 129,-127.5625z" />
            </svg>
            <h1 class="mt-3">About Us</h1>
            <p style="color: black;">For the latest updates about reopening, booking tickets and what's happening at the Museum, sign up to our newsletter</p>

        </div>
        <!-- end inner -->
    </header>


    <!-- end page-header -->

    <!-- end content-section -->
    <asp:ListView ID="lv_about_detail" runat="server">
        <ItemTemplate>
            <section class="content-section">
                <div class="container">
                    <div class="row g-0">
                        <div class="col-lg-6">
                            <div class="side-image left-half" data-scroll data-scroll-speed="2">
                                <img src="images1/About/<%# Eval("image") %>" alt="Image">
                            </div>
                            <!-- end side-image -->
                            <div class="side-icon-list left-side">
                                <ul>
                                    <li>
                                        <figure>
                                            <img src="images/icon01.png" alt="Image">
                                        </figure>
                                        <div class="content">
                                            <h5>Opening times</h5>
                                            <p>
                                                <%# Eval("Opening_time") %>
                                            </p>
                                        </div>
                                        <!-- end content -->
                                    </li>
                                    <li>
                                        <figure>
                                            <img src="images/icon02.png" alt="Image">
                                        </figure>
                                        <div class="content">
                                            <h5>Book Online</h5>
                                            <p>
                                                  Buy a Online Products.
                                            </p>
                                            <a href="#">See a Products</a>
                                        </div>
                                        <!-- end content -->
                                    </li>
                                    <li>
                                        <figure>
                                            <img src="images/icon03.png" alt="Image">
                                        </figure>
                                        <div class="content">
                                            <h5>Where You Visit</h5>
                                            <p>
                                                <%# Eval("Visit") %>
                                            </p>
                                        </div>
                                        <!-- end content -->
                                    </li>
                                </ul>
                            </div>
                            <!-- end side-icon-list -->
                        </div>
                        <!-- end col-6 -->
                        <div class="col-lg-6">
                            <div class="side-arts">
                                <div class="titles">
                                    <h2><%# Eval("Heading") %></h2>
                                </div>
                                <!-- end titles -->
                                <ul>

                                    <p><%# Eval("about") %></p>

                                </ul>
                            </div>
                            <!-- end side-arts -->
                        </div>
                        <!-- end col-6 -->
                    </div>
                    <!-- end row -->
                </div>
                <!-- end container -->
            </section>
        </ItemTemplate>
    </asp:ListView>
    <!-- end content-section -->


    <section class="content-section">
        <div class="video-bg">
            <video src="videos/video.mp4" loop autoplay playsinline muted></video>
        </div>
        <!-- end video-bg -->
        <div class="container">
            <div class="cta-box" data-scroll data-scroll-speed="-1">
                <div class="offar">
                    <h2 style="font-size: 60px;">Connect With Us</h2>

                    <ul>
                        <li>
                            <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                            <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                            <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                            <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                        </li>
                    </ul>
                </div>

            </div>
            <!-- end cta-box -->
        </div>
        <!-- end container -->
    </section>
    <!-- end content-section -->
    <section class="content-section no-bottom-spacing bottom-white" data-background="#dee5f3">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12">
                    <div class="section-title text-center">
                        <figure>
                            <img src="images1/comapny_detail/logo.png" alt="Image">
                        </figure>
                        <h2>Exploring Creativity in the Digital Age. </h2>
                    </div>
                    <!-- end section-title -->
                </div>
                <!-- end col-12 -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
        <div class="horizontal-scroll">
            <div class="scroll-inner" data-scroll data-scroll-direction="horizontal" data-scroll-speed="5">
                <div class="scroll-wrapper">
                    <div class="container-fluid">
                        <div class="row">
                            <asp:ListView ID="lv_about_gallery" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-4">
                                        <figure class="image-box" data-scroll data-scroll-speed="0">
                                            <img src="../images1/gallery/<%# Eval("image") %>" alt="Image">
                                        </figure>
                                    </div>
                                </ItemTemplate>
                            </asp:ListView>
                            <!-- end col-3 -->
                        </div>
                        <!-- end row -->
                    </div>
                    <!-- end container-fluid -->
                </div>
                <!-- end scroll-wrapper -->
                <div class="scroll-wrapper">
                    <div class="container-fluid">
                        <div class="row">
                            <asp:ListView ID="ListView1" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-4">
                                        <figure class="image-box" data-scroll data-scroll-speed="0">
                                            <img src="images1/gallery/<%# Eval("image") %>" alt="Image">
                                        </figure>
                                    </div>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                        <!-- end row -->
                    </div>
                    <!-- container-fluid -->
                </div>
                <!-- end scroll-wrapper -->
            </div>
            <!-- end scroll-inner -->
        </div>
        <!-- end horizontal-scroll -->
    </section>
    <!-- end content-section -->

    <section class="content-section no-bottom-spacing">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title text-center">
                        <figure>
                            <img src="images1/comapny_detail/logo.png" alt="Image">
                        </figure>
                        <h2>Our Team</h2>
                    </div>
                    <!-- end section-title -->
                </div>
                <!-- end col-12 -->
            </div>
            <!-- end row -->
            <div class="row justify-content-center">
                <asp:ListView ID="lv_our_team1" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6">
                            <div class="image-content-box" data-scroll data-scroll-speed="-1">
                                <figure>
                                    <img src="../images1/our_team/<%# Eval("image") %>" alt="Image">
                                </figure>
                                <div class="content-box">
                                    <h3><%# Eval("Emp_name") %></h3>
                                    <p><%# Eval("position") %></p>
                                    <ul>
                            <li><a href="#"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></li>
                            <li class="ms-4"><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                            <li class="ms-4"><a href="#"><i class="fa fa-twitter-square" aria-hidden="true"></i></a></li>
                        </ul>
                                </div>
                                <!-- end content-box -->
                            </div>
                            <!-- end image-content-box -->
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <!-- end col-4 -->

            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </section>
    <!-- end content-section -->


</asp:Content>
