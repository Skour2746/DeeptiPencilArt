<%@ Page Title="" Language="C#" MasterPageFile="~/Deeptipencilart.Master" AutoEventWireup="true" CodeBehind="testimonial.aspx.cs" Inherits="DeeptiPencilArt.WebForm9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #read .owl-carousel {
            display: block !important;
        }

        .navbar-button input[type="submit"] {
            height: 70px;
            display: inline-block;
            margin-top: 0px !important;
            border-radius: 0 !important;
            font-size: 14px;
            font-weight: 600;
            color: #080808;
            background: #dee5f3;
            border: none;
            padding: 0 50px;
        }


        #read h1 {
            font-size: 46px;
            color: white;
        }

        #read p {
            color: #fff !important;
            font-weight: 400;
        }

        #read .testimonial1 {
            margin: 60px 20px 40px;
        }

            #read .testimonial1 .pic1 {
                display: inline-block;
                width: 120px;
                /* border: 1px solid red; */
                height: 120px;
                border-radius: 50%;
                /*margin: 15px 15px 15px 0;*/
            }

                #read .testimonial1 .pic1 img {
                    /*width: 100%;
  height: auto;*/
                    border-radius: 50%;
                }

            #read .testimonial1 .testimonial-profile1 {
                display: inline-block;
                position: relative;
                top: 15px;
            }

            #read .testimonial1 .title {
                display: block;
                font-size: 20px;
                font-weight: 600;
                color: #2f2f2f;
                text-transform: capitalize;
                margin: 0 0 7px 0;
            }

            #read .testimonial1 .post {
                display: block;
                font-size: 14px;
                color: #5d7aa7;
            }

            #read .testimonial1 .description1 {
                padding: 25px 22px;
                background: #dee5f3;
                font-size: 15px;
                color: #000;
                font-family: 'Poppins', sans-serif;
                border-radius: 10px;
                line-height: 25px;
                margin: 0;
                position: relative;
            }


        #read .owl-theme .owl-controls {
            margin-top: 10px;
            margin-left: 30px;
        }

            #read .owl-theme .owl-controls .owl-buttons div {
                opacity: 1;
                background: #dee5f3;
                height: 10px;
                width: 10px;
                padding: 0px;
            }

        #read .owl-next:before {
            content: "\f054";
        }

        #read .testimonial1 .description1 ul {
            padding-left: 0px !important;
        }

            #read .testimonial1 .description1 ul li {
                float: left;
                list-style: none;
            }

        #read .owl-next:before {
            content: "";
        }

        #read .testimonial1 .description1 h4 {
            transition: 0.3s all !important;
        }

        #read .testimonial1 .description1 ul li i {
            color: #3abdc1;
        }

        #read .testimonial1 .description1 p {
            color: #000 !important;
        }

        #read .testimonial1 .description1 h4:hover {
            color: #3abdc1 !important;
        }

        .pdetail {
            font-size: 86px;
            font-weight: 400;
            font-family: 'Cinzel', serif;
            line-height: 1;
            text-align: center;
            color: black !important;
            margin-bottom: 30px;
            position: relative;
        }

        .page-header .inner .svg-morph path {
            fill: #dee5f3 !important;
        }

        #ContentPlaceHolder1_lv_testimonial_DataPager1 {
            display: flex;
            justify-content: center;
        }

        input[type="submit"], .pgrbtns {
            height: 42px;
            margin-top: 60px !important;
            border-radius: 50% !important;
            font-size: 14px;
            font-weight: 600;
            color: #080808;
            background: #CDCAC9;
            border: none;
            padding: 0 17px;
        }

        #ContentPlaceHolder1_lv_testimonial_DataPager1 span {
            height: 44px;
            margin-top: 60px !important;
            border-radius: 50% !important;
            font-size: 14px;
            font-weight: 600;
            color: #080808;
            background: #dee5f3;
            border: none;
            padding: 12px 17px;
        }

        .newsletter-box .form input[type="submit"] {
            margin-top: 0px !important;
            height: 70px;
            border-radius: 0 !important;
            display: inline-block;
            font-size: 14px;
            font-weight: 600;
            color: #080808;
            background: #dee5f3;
            border: none;
            padding: 0 50px;
        }

        @media only screen and (max-device-width: 768px) {
            .navbar .logo img {
                margin-left: 20px !important;
                width: 100% !important;
            }

            .page-header .inner h1 {
                font-size: 65px !important;
            }

            .section-title h2 {
                font-size: 45px;
            }

            .contact-box h6 {
                font-size: 18px;
            }

            .contact-box p {
                font-size: 14px;
            }

            .page-header {
                height: 423px !important;
            }

                .page-header .inner h1 {
                    margin-top: 108px !important;
                    font-size: 55px !important;
                }
                .testimonial1 {
    margin: 23px 18px 46px !important;
}
        }

        @media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (orientation : portrait) {
            .page-header {
                margin-TOP: 23% !important;
                padding-bottom: 17% !important;
                height: 314px !important;
            }

                .page-header .inner h1 {
                    margin-top: 0px !important;
                }

            .navbar .hamburger-menu {
                margin-left: 250px;
            }

            .page-header .inner p {
                padding-right: 45%;
                font-size: 19px !important;
            }

            .page-header .inner {
                margin-top: 96px;
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
            }

            .logo1 {
                width: 28% !important;
            }
        }



        @media only screen and (min-device-width: 1024px) and (max-device-width: 1366px) and (-webkit-min-device-pixel-ratio: 2) and (orientation: landscape) {
            .page-header {
                margin-top: 10%;
                height: 419px !important;
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
    <header class="page-header" data-background="images1/Banner/bnr5.png">
        <div class="inner">
            <svg width="580" height="400" class="svg-morph">
                <path id="svg_morph" d="m261,30.4375c0,0 114,6 151,75c37,69 37,174 6,206.5625c-31,32.5625 -138,11.4375 -196,-19.5625c-58,-31 -86,-62 -90,-134.4375c12,-136.5625 92,-126.5625 129,-127.5625z" />
            </svg>
            <h1 style="font-size: 94px;">Testimonials</h1>
            <p>For the latest updates about reopening, booking tickets and what's happening at the Museum, sign up to our newsletter</p>
        </div>
        <!-- end inner -->
    </header>
    <!-- end page-header -->
    <section id="read" class="read">

        <div class="container-fluid">
            <div class="row">
                <h1 class="pdetail mt-5">Comments</h1>

                <div class="col-md-12">
                    <div id="testimonial-slider1" class="owl-carousel">

                        <div class="row">
                            <asp:ListView ID="lv_testimonial" runat="server" OnPagePropertiesChanging="ListView1_PagePropertiesChanging" GroupPlaceholderID="groupPlaceHolder1" ItemPlaceholderID="itemPlaceHolder1" OnItemDataBound="Lv_testimonial_ItemDataBound">
                                <LayoutTemplate>
                                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lv_testimonial" PageSize="12">
                                        <Fields>
                                            <asp:NumericPagerField NumericButtonCssClass="pgrBtns" ButtonType="button" />
                                        </Fields>
                                    </asp:DataPager>
                                </LayoutTemplate>
                                <GroupTemplate>
                                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                                </GroupTemplate>
                                <ItemTemplate>
                                    <div class="col-lg-4 col-sm-6 col-12">
                                        <div class="testimonial1">
                                            <div class="description1">
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-sm-3 col-6 ps-0">
                                                            <div class="pic1">
                                                                <img src="images1/commenter/<%# Eval("image") %>" class="rounded-circle" style="width: 60%;">
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-8 col-6 col-sm-8">
                                                            <div class="test1 ms-3">

                                                                <asp:Label ID="ratingLabel" runat="server" Style="color: #FAE729"></asp:Label>
                                                                <br>
                                                                <p style="font-size: 18px;"><%# Eval("comment") %></p>
                                                                <h6><%# Eval("c_name") %></h6>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end content-section -->

</asp:Content>
