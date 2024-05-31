<%@ Page Title="" Language="C#" MasterPageFile="~/Deeptipencilart.Master" AutoEventWireup="true" CodeBehind="explore.aspx.cs" Inherits="DeeptiPencilArt.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        select {
    -webkit-appearance: none;
    -moz-appearance: none;
    background-image: linear-gradient(45deg, transparent 50%, gray 50%), linear-gradient(135deg, gray 50%, transparent 50%), linear-gradient(to right, #ccc, #ccc);
    background-position: calc(100% - 30px) 16px, calc(100% - 25px) 16px, calc(100% - 3.5em) 2px;
    background-size: 5px 5px, 5px 5px, 1px 40px;
    background-repeat: no-repeat;
}
        a:hover {
            text-decoration: none;
        }

        #ContentPlaceHolder1_lv_explore_DataPager1 {
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


        .navbar-button input[type="submit"] {
            height: 70px;
            display: inline-block;
            border-radius: 0 !important;
            font-size: 14px;
            font-weight: 600;
            margin-top: 0px !important;
            color: #080808;
            background: #dee5f3;
            border: none;
            padding: 0 50px;
        }

        #ContentPlaceHolder1_lv_explore_DataPager1 span {
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

        .fbtn {
            width: 25%;
                height: 38px;
        }

        .page-header .inner .svg-morph path {
            fill: #dee5f3 !important;
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

            .fbtn {
                width: 84%;
            }

            .page-header {
                height: 423px !important;
            }

                .page-header .inner h1 {
                    margin-top: 108px !important;
                    font-size: 55px !important;
                }
        }

        @media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (orientation : portrait) {
            .fbtn {
                width: 36%;
            }

            .navbar .hamburger-menu {
                margin-left: 250px;
            }

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

        @media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (orientation : landscape) {
            .fbtn {
                width: 26%;
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

    <header class="page-header" data-background="images1/Banner/bnr2.png">
        <div class="inner">
            <svg width="580" height="400" class="svg-morph">
                <path id="svg_morph" d="m261,30.4375c0,0 114,6 151,75c37,69 37,174 6,206.5625c-31,32.5625 -138,11.4375 -196,-19.5625c-58,-31 -86,-62 -90,-134.4375c12,-136.5625 92,-126.5625 129,-127.5625z" />
            </svg>
            <h1>Explore</h1>
            <p>For the latest updates about reopening, booking tickets and what's happening at the Museum, sign up to our newsletter</p>
        </div>
        <!-- end inner -->
    </header>
    <!-- end page-header -->
    <section class="content-section" data-background="#fffbf7">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <%--<asp:DropDownList ID="ddlCategoryFilter" runat="server" CssClass="fbtn"  DataTextField="CategoryName" DataValueField="id" AutoPostBack="true" OnSelectedIndexChanged="ddlCategoryFilter_SelectedIndexChanged" >
                        <asp:ListItem Text="Filter with Category" Cssclass="submenu" Value="1"></asp:ListItem>
                    </asp:DropDownList>
                     

                       <asp:DropDownList ID="ddlSubCategory" runat="server" CssClass="fbtn"     DataTextField="SubCategory" DataValueField="id" >
                        <asp:ListItem Text="Filter with Sub Category" Cssclass="submenu" Value="1"></asp:ListItem>
                    </asp:DropDownList>--%>
                                        <asp:DropDownList ID="ddlCategories" runat="server" CssClass="fbtn" AutoPostBack="True" OnSelectedIndexChanged="ddlCategories_SelectedIndexChanged" AppendDataBoundItems="true">
                    <asp:ListItem Value="0" Cssclass="submenu">Filter With Category</asp:ListItem>  
                   
                        </asp:DropDownList>

                    <asp:DropDownList ID="ddlSubcategories" runat="server" CssClass="fbtn" AutoPostBack="true" OnSelectedIndexChanged="ddlSubcategories_SelectedIndexChanged">
                                      <asp:ListItem Value="0" Cssclass="submenu">Filter With Sub Category</asp:ListItem>  

                        </asp:DropDownList>

                </div>
                <asp:ListView ID="lv_explore" runat="server" OnPagePropertiesChanging="Lv_explore_PagePropertiesChanging" GroupPlaceholderID="groupPlaceHolder1" ItemPlaceholderID="itemPlaceHolder1">
                    <LayoutTemplate>

                        <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                        <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lv_explore" PageSize="12">
                            <Fields>
                                <asp:NumericPagerField NumericButtonCssClass="pgrBtns" ButtonType="button" />
                            </Fields>
                        </asp:DataPager>
                    </LayoutTemplate>
                    <GroupTemplate>
                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                    </GroupTemplate>
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6 mt-5 pt-5">
                            <div class="exhibition-box" data-scroll data-scroll-speed="-1">
                                <figure>
                                    <a href="product_detail.aspx?listing_cid=<%# Eval("id") %>">
                                        <img src="../images1/product/<%# Eval("image") %>" alt="Image" class="img"></a>

                                    <!-- end info -->
                                </figure>
                                <div class="content-box">
                                    <h4><a href="product_detail.aspx?listing_cid=<%# Eval("id") %>"><%# Eval("Product_Name") %></a></h4>
                                    <a href="product_detail.aspx?listing_cid=<%# Eval("id") %>">
                                        <p><%# Eval("Product_Description").ToString().PadRight(50).Substring(0,50).TrimEnd() %><b>...</b></p>
                                    </a>
                                </div>
                                <!-- end content-box -->
                            </div>
                            <!-- end exhibition-box -->
                        </div>

                        <!-- end col-4 -->
                    </ItemTemplate>

                </asp:ListView>
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </section>
    <!-- end content-section -->

</asp:Content>
