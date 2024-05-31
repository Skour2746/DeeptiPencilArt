<%@ Page Title="" Language="C#" MasterPageFile="~/Deeptipencilart.Master" AutoEventWireup="true" CodeBehind="gallery.aspx.cs" Inherits="DeeptiPencilArt.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #ContentPlaceHolder1_lv_gallery_DataPager1 {
            display: flex;
            justify-content: center;
        }

        input[type="submit"], .pgrbtns {
            height: 42px;
            border-radius: 50% !important;
            font-size: 14px;
            font-weight: 600;
            color: #080808;
            background: #CDCAC9;
            border: none;
            padding: 0 17px;
        }

        .section-title h2 {
            font-size: 70px;
        }


        .navbar-button input[type="submit"] {
            height: 70px;
            display: inline-block;
            border-radius: 0 !important;
            font-size: 14px;
            font-weight: 600;
            color: #080808;
            background: #dee5f3;
            border: none;
            padding: 0 50px;
        }

        #ContentPlaceHolder1_lv_gallery_DataPager1 span {
            height: 44px;
            border-radius: 50% !important;
            font-size: 14px;
            font-weight: 600;
            color: #080808;
            background: #dee5f3;
            border: none;
            padding: 12px 17px;
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
            text-transform: uppercase;
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

        .page-header .inner .svg-morph path {
            fill: #dee5f3 !important;
        }

        @media only screen and (max-device-width: 768px) {
            .navbar .logo img {
                margin-left: 20px !important;
                width: 100% !important;
            }

            .page-header {
                height: 423px !important;
            }

            .section-title h2 {
                font-size: 49px;
            }

            .page-header .inner h1 {
                margin-top: 108px !important;
                font-size: 55px !important;
            }
        }

        @media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (orientation : portrait) {
            .page-header {
                margin-TOP: 19% !important;
                height: 306px !important;
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
                margin-top:40% !important;
            }

            .logo1 {
                width: 28% !important;
            }
        }

        @media only screen and (min-device-width: 1024px) and (max-device-width: 1366px) and (-webkit-min-device-pixel-ratio: 2) and (orientation: landscape) {
            .page-header {
                margin-top: 10%;
                height: 413px !important;
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
    <header class="page-header" data-background="images1/Banner/resize-169236018595492142bnr11.png">

        <div class="inner">
            <svg width="580" height="400" class="svg-morph">
                <path id="svg_morph" d="m261,30.4375c0,0 114,6 151,75c37,69 37,174 6,206.5625c-31,32.5625 -138,11.4375 -196,-19.5625c-58,-31 -86,-62 -90,-134.4375c12,-136.5625 92,-126.5625 129,-127.5625z" />
            </svg>
            <h1>Gallery</h1>
            <p style="color: black;">For the latest updates about reopening, booking tickets and what's happening at the Museum, sign up to our newsletter</p>
        </div>
        <!-- end inner -->
    </header>
    <!-- end page-header -->
    <section class="content-section" data-background="#fffbf7">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title text-center">
                        <figure>
                            <img src="images1/comapny_detail/logo.png" alt="Image">
                        </figure>
                        <h2>Our collections</h2>
                    </div>
                    <!-- end section-title -->
                </div>
                <!-- end col-12 -->
            </div>
            <!-- end row -->
            <div class="row justify-content-center">
                <asp:ListView ID="lv_gallery" runat="server" OnPagePropertiesChanging="Lv_gallery_PagePropertiesChanging" GroupPlaceholderID="groupPlaceHolder1" ItemPlaceholderID="itemPlaceHolder1">
                    <LayoutTemplate>
                        <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                        <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lv_gallery" PageSize="15">
                            <Fields>
                                <asp:NumericPagerField NumericButtonCssClass="pgrBtns" ButtonType="button" />
                            </Fields>
                        </asp:DataPager>
                    </LayoutTemplate>
                    <GroupTemplate>
                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                    </GroupTemplate>
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6">
                            <div class="collection-box content" data-scroll data-scroll-speed="1.5">
                                <div class="content-overlay"></div>
                                <figure>
                                    <a href="product_detail.aspx?listing_cid=<%# Eval("id") %>">
                                        <img src="images1/gallery/<%# Eval("image") %>" alt="Image" style="border-radius: 15%;">
                                </figure>
                                <div class="content-details fadeIn-bottom">
                                    <h3 class="content-title" style="color: white !important;">View Details</h3>
                                    </a> 
                                </div>
                            </div>
                            <!-- end collection-box -->
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
