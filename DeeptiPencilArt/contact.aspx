<%@ Page Title="" Language="C#" MasterPageFile="~/Deeptipencilart.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="DeeptiPencilArt.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .page-header .inner .svg-morph path {
            fill: #dee5f3 !important;
        }

        a{
            text-decoration:none !important;
        }
 


        .newsletter-box .form input[type="submit"] {
            background: #dee5f3;
        }

        input[type="submit"] {
            background: #dee5f3 !important;
        }

        .section-title h2 {
            font-size: 70px;
        }

        @media only screen and (max-device-width: 768px) {
            .navbar .logo img {
                margin-left: 20px !important;
                width: 100% !important;
            }

            .page-header .inner h1 {
                font-size: 70px !important;
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
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- end navbar -->
    <header class="page-header" data-background="images1/Banner/bnr4.png">
        <div class="inner">
            <svg width="580" height="400" class="svg-morph">
                <path id="svg_morph" d="m261,30.4375c0,0 114,6 151,75c37,69 37,174 6,206.5625c-31,32.5625 -138,11.4375 -196,-19.5625c-58,-31 -86,-62 -90,-134.4375c12,-136.5625 92,-126.5625 129,-127.5625z" />
            </svg>
            <h1>Contact Us</h1>
            <p>For the latest updates about reopening, booking tickets and what's happening at the Museum, sign up to our newsletter</p>
        </div>
        <!-- end inner -->
    </header>
    <!-- end page-header -->
    <section class="content-section" data-background="#fffbf7">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="section-title text-center">
                        <figure>
                            <img src="images1/comapny_detail/logo.png" alt="Image">
                        </figure>
                        <h2>Help us to respond to
                            <br>
                            you more quickly</h2>
                    </div>
                    <!-- end section-title -->
                </div>
                <!-- end col-12 -->

                <div class="col-lg-5">
                    <asp:ListView ID="lv_contact" runat="server">
                        <ItemTemplate>
                            <div class="contact-box">
                                <h6>Company Name and Contact Number</h6>
                                <p><a href="#"><%# Eval("Comapany_Name") %></a></p>
                                <p><%# Eval("Company_Contact_Number") %> (Monday to Friday, 10am to 2pm)</p>
                                <p>
                                    Please use this number if you know the name of the person
or department you would like to contact. 
                                </p>
                            </div>
                            <!-- end contact-box -->
                            <div class="contact-box">
                                <h6>General enquiries</h6>
                                <p>
                                    <a href="#"><%# Eval("Company_Email") %></a>

                                </p>
                            </div>
                            <!-- end contact-box -->
                            <div class="contact-box">
                                <h6>Address</h6>
                                <p>
                                    <a href="#"><%# Eval("Company_Address") %></a>

                                </p>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                    <!-- end contact-box -->
                </div>
                <!-- end col-5 -->
                <div class="col-lg-5">
                    <div class="contact-form">
                        <div class="mb-3">
                            <asp:TextBox ID="txtname" runat="server" name="txtname" type="text" placeholder="Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtname" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>


                        </div>
                        <!-- end mb-3 -->
                        <div class="mb-3">
                            <asp:TextBox ID="txtemail" runat="server" name="txtemail" type="text" placeholder="E-mail Address"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtemail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>

                        </div>
                        <!-- end mb-3 -->
                        <div class="mb-3">
                            <asp:TextBox ID="txtnumber" runat="server" name="txtnumber" type="text" placeholder="Phone Number"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtnumber" ErrorMessage="Enter only Number" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

                        </div>
                        <!-- end mb-3 -->
                        <div class="mb-3">
                            <asp:TextBox ID="txtpara" TextMode="MultiLine" name="txtpara" runat="server" placeholder="Your Message"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtpara" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>

                        </div>
                        <!-- end mb-3 -->
                        <div class="mb-3">
                            <asp:Button ID="Button1" type="submit" OnClick="Button1_Click" value="Send Us" runat="server" Text="Send Us" />

                        </div>
                        <!-- end mb-3 -->
                    </div>
                    <!-- end contact-form -->
                </div>
                <!-- end col-5 -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </section>
    <!-- end content-section -->
    <asp:ListView ID="lv_Map" runat="server">
        <ItemTemplate>
            <div class="google-maps">
                <iframe src="<%#Eval("Company_googleMap_link") %>"></iframe>
            </div>
        </ItemTemplate>
    </asp:ListView>
    <!-- end google-maps -->

</asp:Content>
