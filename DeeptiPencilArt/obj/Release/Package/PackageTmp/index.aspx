<%@ Page Title="" Language="C#" MasterPageFile="~/Deeptipencilart.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DeeptiPencilArt.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .section-title h2 {
            font-size: 68px;
            text-align: center;
        }

        a:hover{
            text-decoration:none;
        }

        .cta-box h2 {
            font-size: 78px;
        }

        .slider .slider-nav .button-next:hover, .slider .slider-nav .button-prev:hover {
            color: #dee5f3;
        }

        .cta-box h6 {
            font-size: 12px;
        }

        .slider-texts .svg-morph path {
            fill: #dee5f3 !important;
        }

        .slider .slider-nav .button-prev {
            background: #dee5f3;
        }

        .slider .slider-nav .button-next {
            background: #dee5f3;
        }

        .navbar .navbar-button a {
            background: #dee5f3;
        }

        .image-icon-box .content-box a:before {
            background: #dee5f3 !important;
        }

        .exhibition-box figure .info span {
            background: #dee5f3;
        }

        .image-icon-box .content-box a:after {
            background: #dee5f3;
        }

        .play-now {
            margin-left: -175px;
            top: 60%;
        }



        .swiper-slide {
            padding-top: 87px;
        }

        .slider .slider-texts .swiper-slide h1 {
            font-size: 77px;
        }

        .content .content-overlay {
            color: rgba(0, 0, 0, 0.7);
            position: absolute;
            height: 99%;
            width: 100%;
            left: 0;
            top: 0;
            bottom: 0;
            right: 0;
            opacity: 0;
            -webkit-transition: all 0.4s ease-in-out 0s;
            -moz-transition: all 0.4s ease-in-out 0s;
            transition: all 0.4s ease-in-out 0s;
        }

        .content:hover .content-overlay {
            opacity: 1;
        }

        .content-image {
            width: 100%;
        }

        .content-details {
            position: absolute;
            text-align: center;
            padding-left: 1em;
            padding-right: 1em;
            width: 100%;
            top: 50%;
            left: 50%;
            opacity: 0;
            -webkit-transform: translate(-50%, -50%);
            -moz-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
            -webkit-transition: all 0.3s ease-in-out 0s;
            -moz-transition: all 0.3s ease-in-out 0s;
            transition: all 0.3s ease-in-out 0s;
        }

        .content:hover .content-details {
            top: 50%;
            left: 50%;
            opacity: 1;
        }

        .content-details h3 {
            color: #000 !important;
            font-weight: 500;
            margin-bottom: 0.5em;
            text-transform: capitalize;
            font-size: 18px;
        }

        .content-details p {
            color: #fff;
            font-size: 0.8em;
        }


        .fadeIn-bottom {
            top: 80%;
        }

        .fadeIn-top {
            top: 20%;
        }

        .fadeIn-left {
            left: 20%;
        }

        .fadeIn-right {
            left: 80%;
        }

        @media only screen and (max-device-width: 768px) {
            .navbar .logo img {
                margin-left: 20px !important;
                width: 100% !important;
            }

            .section-title h2 {
                font-size: 47px;
            }

            .slider .slider-texts .swiper-slide h1 {
                font-size: 66px;
            }
        }

        @media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (orientation : portrait) {
            .slider {
                height: 70vh !important;
            }

            .swiper-slider {
                width: 500px !important;
            }

            .swiper-slide {
                padding-top: 0px;
                padding-bottom: 114px;
            }

            .navbar .hamburger-menu {
                margin-left: 250px;
            }

            .slider .container-fluid {
                margin-left: 42px !important;
            }

            .slider .slider-texts .swiper-slide p {
                font-size: 16px;
            }

            .slider .slider-images .swiper-slide {
                height: 359px !important;
                margin-top: 38% !important;
            }

            .slider .slider-texts .swiper-slide h1 {
                font-size: 53px !important;
            }

            .slider .slider-texts .svg-morph {
                left: 91%;
            }
        }

        @media only screen and (min-device-width: 1024px) and (max-device-width: 1366px) and (-webkit-min-device-pixel-ratio: 2) and (orientation: landscape) {
            .navbar .hamburger-menu {
                margin-left: 110px;
            }
            .slider .slider-images .swiper-slide {
    height: 479px !important;
                margin-top: 25%;
            }
            .slider .slider-texts .svg-morph {
            left:68%;
            }
            .logo1{
                width:27%;
            }
        }

        @media only screen and (min-device-width: 1024px) and (max-device-width: 1366px) and (-webkit-min-device-pixel-ratio: 2) and (orientation: portrait) {
            .slider .slider-images .swiper-slide {
                height: 444px !important;
            }

            .navbar .hamburger-menu {
                margin-left: 68px;
            }

            .logo1 {
                width: 24% !important;
            }

            .slider .slider-texts .svg-morph {
                left: 68%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- end navbar -->
    <header class="slider">
        <div class="swiper-container slider-images">
            <div class="swiper-wrapper">
                <div class="swiper-slide" data-background="images1/Banner/slider-img.png">
                    <div class="mobile-slide" data-background="images1/Banner/slider-img.png"></div>
                </div>
                <div class="swiper-slide" data-background="images1/Banner/slider-img1.png">
                    <div class="mobile-slide" data-background="images1/Banner/slider-img1.png"></div>
                </div>
                <div class="swiper-slide" data-background="images1/Banner/slider-img2.png">
                    <div class="mobile-slide" data-background="images1/Banner/slider-img2.png"></div>
                </div>
            </div>
            <!-- end swiper-wrapper -->
            <div class="container-fluid slider-nav">
                <div class="swiper-pagination"></div>
                <!-- end swiper-pagination -->
                <div class="swiper-fraction"></div>
                <!-- end swiper-fraction -->
                <div class="button-prev"><i class="far fa-chevron-down"></i></div>
                <!-- end swiper-button-prev -->
                <div class="button-next"><i class="far fa-chevron-up"></i></div>
                <!-- end swiper-button-next -->
            </div>
            <!-- end slider-nav -->
        </div>
        <!-- end slider-images -->
        <div class="swiper-container slider-texts">
            <svg width="580" height="400" class="svg-morph">
                <path id="svg_morph" d="m261,30.4375c0,0 114,6 151,75c37,69 37,174 6,206.5625c-31,32.5625 -138,11.4375 -196,-19.5625c-58,-31 -86,-62 -90,-134.4375c12,-136.5625 92,-126.5625 129,-127.5625z" />
            </svg>
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="container-fluid">
                        <h1>The sketchy journey<br>
                            to creativity.
                            
                        </h1>
                        <p>
                        The word "sketchy" implies both the raw nature of early creative<br /> endeavors and the potential for brilliance that can emerge <br /> from these initial outlines.        

                        </p>
                    </div>
                    <!-- end container -->
                </div>
                <!-- end swiper-slide -->
                <div class="swiper-slide">
                    <div class="container-fluid">
                        <h1>Beautiful art<br />
                            with pencils. </h1>
                        <p>
                          The artist's hands dance across the paper, orchestrating <br /> a symphony of shades and textures that come<br /> together to form a visual masterpiece.
                        </p>
                    </div>
                    <!-- end container -->
                </div>
                <!-- end swiper-slide -->
                <div class="swiper-slide">
                    <div class="container-fluid">
                        <h1>Dream on paper<br />
                            with pencils. </h1>
                        <p>
                           With every stroke, pencils become conduits of possibility,<br /> sketching out the vivid landscapes and characters<br /> that once only existed in the mind's eye. 
                        </p>
                    </div>
                    <!-- end container -->
                </div>
                <!-- end swiper-slide -->
            </div>
            <!-- end swiper-wrapper -->
        </div>
        <!-- end slider-texts -->

        <!-- end play-now -->
    </header>
    <!-- end slider -->
    <section class="content-section" data-background="rgb(235 230 224)">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12">
                    <div class="section-title text-center">
                        <%--  <figure>
                            <img src="images1/comapny_detail/logo.png" alt="Image">
                        </figure>--%>
                        <h2>About Ourself</h2>
                    </div>
                    <!-- end section-title -->
                </div>
                <!-- end col-12 -->

                <asp:ListView ID="lv_about_detail" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-7" style="text-align: justify !important;">
                            <figure class="image-box" data-scroll data-scroll-speed="-1">
                                <a href="about.aspx">
                                <figure class="text-center">
                                    <img src="images1/comapny_detail/logo.png" style="width: 20%;" alt="Image">
                                </figure>
                                <p><%# Eval("about") %></p>

                            </figure></a>
                        </div>
                        <!-- end col-7 -->
                        <div class="col-lg-5">
                            <div class="side-icon-list right-side">
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
                                            <a href="explore.aspx">See a Products</a>
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
                    </ItemTemplate>
                </asp:ListView>


                <!-- end col-5 -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </section>
    <!-- end content-section -->
    <section class="content-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-9">
                    <div class="section-title">
                        <figure style="text-align: center;">
                            <img src="images1/comapny_detail/logo.png" alt="Image">
                        </figure>
                        <h2>Our Categories</h2>
                    </div>
                    <!-- end section-title -->
                </div>
                <!-- end col-9 -->

            </div>
            <!-- end row -->
            <div class="row justify-content-center">
                <asp:ListView ID="lv_category" runat="server">

                    <ItemTemplate>

                        <div class="col-lg-4 col-12 col-md-6">
                            <div class="collection-box " data-scroll data-scroll-speed="1.5">
                                <div class="content">
                                <a href="explore.aspx?product_id=<%# Eval("id") %>">
                                <div class="content-overlay"></div>
                                    <figure>
                                        <img src="images1/category/<%# Eval("image") %>" alt="Image">
                                    </figure>
                                    <div class="content-details fadeIn-bottom">
                                        <h3 class="content-title" style="color: white !important;"><%# Eval("CategoryName") %></h3>

                                    </div>
                                </a>
                                    </div>
                            </div>
                            <!-- end collection-box -->
                        </div>
                    </ItemTemplate>

                </asp:ListView>
                <!-- end col-4 -->

                <!-- end col-12 -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </section>
    <!-- end content-section -->










    <%--<section class="content-section no-bottom-spacing">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="section-title text-center">
                        <figure>
                            <img src="images1/comapny_detail/logo.png" alt="Image">
                        </figure>
                        <h6>Visit the National Wandau Museum</h6>
                        <h2>3 steps to be safe</h2>
                    </div>
                    <!-- end section-title -->
                </div>
                <!-- end col-12 -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
        <div class="container-fluid px-0">
            <div class="row g-0">
                <asp:ListView ID="lv_pdetail" runat="server">
                    <itemtemplate>
                        <div class="col-lg-4">
                            <div class="image-icon-box mt-5" data-scroll data-scroll-speed="-1">

                                <figure class="content-image">
                                    <a href="product_detail.aspx?listing_cid=<%# Eval("id") %>">
                                        <img src="images1/product/<%# Eval("image") %>" alt="Image"></a>
                                </figure>
                                <div class="content-box">

                                    <a href="product_detail.aspx?listing_cid=<%# Eval("id") %>">
                                        <h4><%# Eval("Product_Name") %></h4>
                                    </a>
                                    <div class="expand">
                                        <a href="product_detail.aspx?listing_cid=<%# Eval("id") %>">
                                            <p><%# Eval("Product_Description").ToString().PadRight(40).Substring(0,40).TrimEnd() %><b>...</b></p>
                                        <h5>Rs. <%# Eval("Price") %>/-</h5>
                                        
                                        </a>

                                    </div>
                                    <!-- end expand -->
                                </div>
                                <!-- end content-box -->
                            </div>
                            <!-- end image-icon-box -->
                        </div>
                    </itemtemplate>
                </asp:ListView>
                <!-- end col-4 -->

            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </section>--%>


    <!-- end content-section -->
    <section class="content-section">
        <div class="container">
            <div class="row g-0 align-items-center">
                <div class="col-lg-6">
                    <div class="art-slider">
                        <div class="titles">
                            <h6>Our Some Demos</h6>
                            <h2>Painting</h2>
                        </div>
                        <!-- end titles -->
                        <div class="swiper-container art-slider-content">

                            <div class="swiper-wrapper">
                                <asp:ListView ID="lv_image1" runat="server">
                                    <ItemTemplate>
                                        <div class="swiper-slide">
                                            <span></span>
                                            <h3><%# Eval("Product_Name") %></h3>
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
                                <!-- end swiper-slide -->
                            </div>
                            <!-- end swiper-wrapper -->
                        </div>
                        <!-- end art-slider-content -->
                    </div>
                    <!-- end art-slider -->
                </div>
                <!-- end col-6 -->
                <div class="col-lg-6">
                    <div class="art-slider" data-scroll data-scroll-speed="1">
                        <div class="swiper-container art-slider-images">
                            <div class="swiper-wrapper">
                                <asp:ListView ID="lv_image" runat="server">
                                    <ItemTemplate>

                                        <div class="swiper-slide" style="padding: 0px !important;">
                                            <img src="images1/product/<%# Eval("image") %>" alt="Image">
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
                                <!-- end swiper-slide -->

                            </div>
                            <!-- end swiper-wrapper -->
                        </div>
                        <!-- end art-slider-images -->
                    </div>
                    <!-- end art-slider -->
                </div>
                <!-- end col-6 -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </section>
    <!-- end content-section -->

</asp:Content>
