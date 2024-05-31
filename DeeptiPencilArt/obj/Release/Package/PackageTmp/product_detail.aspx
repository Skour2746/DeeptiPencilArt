<%@ Page Title="" Language="C#" MasterPageFile="~/Deeptipencilart.Master" AutoEventWireup="true" CodeBehind="product_detail.aspx.cs" Inherits="DeeptiPencilArt.WebForm7" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        #ContentPlaceHolder1_ListView1_LinkButton1_0 {
            height: 70px;
            display: inline-block;
            font-size: 14px;
            font-weight: 600;
            color: #080808;
            background: #dee5f3;
            border: none;
            padding: 25px 30px;
        }

        input[type="submit"] {
            padding: 0px 30px;
        }

        .pdetail {
            font-size: 86px;
            font-weight: 400;
            font-family: 'Cinzel', serif;
            line-height: 1;
            text-align: center;
            margin-bottom: 30px;
            position: relative;
        }

        .ratingStar {
            font-size: 0pt;
            font-size: 20px;
            cursor: pointer;
            display: block;
            background-repeat: no-repeat;
        }

        .filledStar::before {
            content: "\2605";
            width: 13px;
            height: 12px;
            color: yellow !important;
        }


        .emptyStar::before {
            content: "\2606";
            width: 13px;
            height: 12px;
            color: black !important;
        }

        .savedStar {
            content: "\2606";
            width: 13px;
            height: 12px;
        }

        .auto-style1 {
            height: 50px;
        }

        .page-header .inner .svg-morph path {
            fill: #dee5f3;
        }

        input[type="submit"] {
            background: #dee5f3;
        }


        /*testimonial*/
        .owl-carousel {
            display: block !important;
        }

        .testimonial1 {
            margin: 27px 1px 46px;
        }

            .testimonial1 .pic1 {
                display: inline-block;
                width: 120px;
                height: 120px;
                border-radius: 50%;
            }

            .testimonial1 .testimonial-profile1 {
                display: inline-block;
                position: relative;
                top: 15px;
            }

            .testimonial1 .title {
                display: block;
                font-size: 20px;
                font-weight: 600;
                color: #2f2f2f;
                text-transform: capitalize;
                margin: 0 0 7px 0;
            }

            .testimonial1 .post {
                display: block;
                font-size: 14px;
                color: #5d7aa7;
            }

        .owl-theme .owl-controls {
            margin-top: 10px;
            margin-left: 30px;
        }

            .owl-theme .owl-controls .owl-buttons div {
                opacity: 1;
                background: #dee5f3;
                height: 10px;
                width: 10px;
                padding: 0px;
            }

        .owl-next:before {
            content: "\f054";
        }

        .testimonial1 .description1 ul {
            padding-left: 0px !important;
        }

            .testimonial1 .description1 ul li {
                float: left;
                list-style: none;
            }

        .owl-next:before {
            content: "";
        }

        .testimonial1 .description1 h4 {
            transition: 0.3s all !important;
        }

        .testimonial1 .description1 ul li i {
            color: #3abdc1;
        }

        .testimonial1 .description1 p {
            color: #000 !important;
        }

        .testimonial1 .description1 h4:hover {
            color: #3abdc1 !important;
        }


        .content {
            position: relative;
            width: 90%;
            max-width: 400px;
            margin: auto;
        }

            .content .content-overlay {
                background-size: cover;
                position: absolute;
                height: 100%;
                width: 75%;
                left: 50px;
                top: 0;
                bottom: 0;
                right: 0;
                opacity: 1;
                -webkit-transition: all 0.4s ease-in-out 0s;
                -moz-transition: all 0.4s ease-in-out 0s;
                transition: all 0.4s ease-in-out 0s;
            }

        .content-image {
            width: 100%;
        }

        .increment-button, .decrement-button {
            height: 43px !important;
            padding: 0px 18px !important;
            border-radius: 50% !important;
        }

        .fcc {
            width: 50% !important;
        }

        .owl-theme .owl-controls .owl-page span {
            background: #dee5f3;
        }
        .tryit{
            text-align:center;
            margin-top:30px;
            font-family: 'Cinzel', serif;
        }

        @media only screen and (max-device-width: 768px) {
            .navbar .logo img {
                margin-left: 20px !important;
                width: 100% !important;
            }

            .page-header .inner h1 {
                margin-top: 108px !important;
                font-size: 52px !important;
            }

            .page-header {
                height: 423px !important;
            }


            .qtydesign {
                width: 54% !important;
                margin-left: 25% !important;
            }

            .fcc {
                width: 96% !important;
                margin-left: 10px !important;
            }

            .fmm {
                text-align: center;
            }

            .logo1 img {
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

            .owl-theme .owl-controls {
                margin-left: 0px !important;
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
            .page-header{
                height: 421px !important;
            }
            .logo1{
                width:28% !important;
            }
            .qtydesign{
                width:40% !important;
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
                .logo1{
                    width:23% !important;
                }
                .qtydesign{
                    width:40% !important;
                }
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="page-header" data-background="images1/Banner/pdetail.png">
        <div class="inner">
            <svg width="580" height="400" class="svg-morph">
                <path id="svg_morph" d="m261,30.4375c0,0 114,6 151,75c37,69 37,174 6,206.5625c-31,32.5625 -138,11.4375 -196,-19.5625c-58,-31 -86,-62 -90,-134.4375c12,-136.5625 92,-126.5625 129,-127.5625z" />
            </svg>
            <h1 style="font-size: 94px;">Product_Details</h1>
            <p>For the latest updates about reopening, booking tickets and what's happening at the Museum, sign up to our newsletter</p>
        </div>
        <!-- end inner -->
    </header>
    <div class="container">
        <div class="row">
            <asp:ListView ID="ListView1" runat="server" OnItemDataBound="ListView1_ItemDataBound">
                <ItemTemplate>
                    <div class="col-lg-6 col-sm-6 pt-5">


                        <div class="content text-center text-lg-none" style="margin-top: 20px;">

                            <span id="frid"></span>
                            <div id="myDIV" class="content-overlay" />
                        </div>

                        <img src="images1/product/<%# Eval("image") %>" style="width: 75%;" />

                    </div>
                    </div>

                    <div class="col-lg-6 col-sm-6 pt-5">
                        <div class="fmm">
                            <asp:Label ID="Label2" runat="server" Style="color: #FAE729"></asp:Label>
                            <asp:Label ID="Label3" runat="server"></asp:Label>
                            <h3><%# Eval("Product_Name") %></h3>
                            <asp:DropDownList ID="DropDownList1" Class="form-control fcc" DataTextField="Size" runat="server">
                                <asp:ListItem Text="Select size" Value="Select size"></asp:ListItem>
                                <asp:ListItem Text="6 inch" Value="6 inch"></asp:ListItem>
                                <asp:ListItem Text="7 inch" Value="7 inch"></asp:ListItem>
                                <asp:ListItem Text="8 inch" Value="8 inch"></asp:ListItem>
                                <asp:ListItem Text="9 inch" Value="9 inch"></asp:ListItem>
                                <asp:ListItem Text="10 inch" Value="10 inch"></asp:ListItem>
                                <asp:ListItem Text="11 inch" Value="11 inch"></asp:ListItem>
                                <asp:ListItem Text="12 inch" Value="12 inch"></asp:ListItem>
                                <asp:ListItem Text="13 inch" Value="13 inch"></asp:ListItem>
                                <asp:ListItem Text="14 inch" Value="14 inch"></asp:ListItem>
                                <asp:ListItem Text="15 inch" Value="15 inch"></asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <div class="qtydesign border" style="width: 34%; border-radius: 20px; padding: 2px;">
                                <asp:Button ID="decrementButton" runat="server" Text="-" CssClass="decrement-button" OnClientClick="return false;" />
                                <asp:TextBox ID="quantityTextBox" Style="text-align: center; padding: 0px 0px; width: 80px; height: 44px; border: none;" runat="server" CssClass="quantity-input" Text="1"></asp:TextBox>
                                <asp:Button ID="incrementButton" runat="server" Text="+" CssClass="increment-button" OnClientClick="return false;" />
                            </div>
                            <br />
                            <h3>Rs. <%# Eval("Price") %>/-</h3>



                            <asp:TextBox ID="selectedFID" runat="server" Style="width: 1px; height: 1px; margin: 0; padding: 0; opacity: 0;"></asp:TextBox>
                            <asp:LinkButton ID="LinkButton1" OnClick="Button2_Click" type="submit" value="Add to Cart" runat="server" class="mt-4 mb-4"><i class="fa fa-shopping-cart" aria-hidden="true"></i>Add to Cart</asp:LinkButton>
                            <%--<asp:Button ID="Button2" />--%>
                            <a href="Cart.aspx"></a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>

            <div class="col-md-12">
                    <h3 class="tryit">Try It With Frame</h3>

                <div id="testimonial-slider2" class="owl-carousel">
                    <asp:ListView ID="lv_frames" runat="server">
                        <ItemTemplate>
                            <div class="testimonial1">
                                <div class="description1">
                                    <div class="container px-0">
                                        <div class="pic1">
                                            <span onclick="myFunction('<%#Eval("Frame") %>', '<%#Eval("id") %>')">
                                                <img class="mt-2" src="../images1/frame/<%# Eval("Frame") %>" /></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>

            <div class="col-lg-12" style="text-align: justify;">
                <asp:ListView ID="lv_frame_desc" runat="server">
                    <ItemTemplate>
                        <p style="text-align: justify;"><%# Eval("Product_Description") %></p>
                    </ItemTemplate>
                </asp:ListView>
            </div>
            <div class="col-lg-12">
                <br />
                <div class="row">
                    <h3 class="">Comments:-</h3>
                    <br />
                    <br />
                    <h1 runat="server" id="reviewcount"></h1>

                    <asp:ListView ID="lv_comment" runat="server" OnItemDataBound="Lv_comment_ItemDataBound">
                        <ItemTemplate>
                            <div class="col-lg-6 col-sm-6">

                                <div class="border p-3 mt-2" style="border-radius: 10px;">
                                    <div class="row">
                                        <div class="col-lg-3 col-sm-4 col-6">
                                            <img src="../images1/commenter/<%#Eval("image") %>" class="rounded-circle" style="width: 60%;" />
                                        </div>
                                        <div class="col-lg-9 col-sm-7 col-6">
                                            <asp:Label ID="ratingLabel" runat="server" Style="color: #FAE729"></asp:Label>
                                            <p style="font-size: 17px;"><%#Eval("comment") %></p>

                                            <h6 class="fw-bold"><%#Eval("c_name") %>
                                            </h6>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </ajaxToolkit:ToolkitScriptManager>
                    <div class="col-lg-12">
                        <br />
                        <br />
                        <br />
                        <br />
                        <div class="card">
                            <div class="card-body">
                                <h1 class="">Leave a Comment</h1>
                                <div class="forms-sample">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <div class="col-lg-12">
                                                    <label class="fs-5 ps-2">Name:</label>
                                                    <asp:TextBox ID="txtname" class="form-control" placeholder="Name" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <div class="col-lg-12">
                                                    <label class="fs-5 ps-2">Image:</label>
                                                    <asp:FileUpload ID="FileUpload1" class="form-control" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <div class="col-lg-12">
                                                    <label class="fs-5 ps-2">Rating:</label>
                                                    <ajaxToolkit:Rating ID="Rating1" runat="server" StarCssClass="ratingStar" WaitingStarCssClass="savedStar"
                                                        FilledStarCssClass="filledStar" EmptyStarCssClass="emptyStar" AutoPostBack="true" CurrentRating="1" MaxRating="5">
                                                    </ajaxToolkit:Rating>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <label class="fs-5 ps-2">Comment:</label>
                                                <asp:TextBox ID="txtcomment" placeholder="Leave a comment" class="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                                            </div>
                                            <br />
                                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Post Comment" />
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <%--Frame Changer--%>

    <script>
        function myFunction(Frame, id) {
            document.getElementById("myDIV").style.backgroundImage = "url(../images1/frame/" + Frame + ")";
            document.getElementById("ContentPlaceHolder1_ListView1_selectedFID_0").value = id;
        }
    </script>

    <%--increase/decrease input--%>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".increment-button").click(function () {
                var textBox = $(this).siblings(".quantity-input");
                var quantity = parseInt(textBox.val());
                if (!isNaN(quantity)) {
                    quantity++;
                    textBox.val(quantity);
                }
            });

            $(".decrement-button").click(function () {
                var textBox = $(this).siblings(".quantity-input");
                var quantity = parseInt(textBox.val());
                if (!isNaN(quantity) && quantity > 0) {
                    quantity--;
                    textBox.val(quantity);
                }
            });
        });
    </script>
</asp:Content>
