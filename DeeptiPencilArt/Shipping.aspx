<%@ Page Title="" Language="C#" MasterPageFile="~/Deeptipencilart.Master" AutoEventWireup="true" CodeBehind="Shipping.aspx.cs" Inherits="DeeptiPencilArt.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #question .accor .accordion-container .accordion-title {
            position: relative;
            margin: 0;
            padding: 0.625em 0.625em 0.625em 2em;
            background: #dee5f3;
            border-radius: 20px;
            font-size: 15px;
            font-weight: normal;
            color: #000;
            letter-spacing: 3px;
            cursor: pointer;
        }

            #question .accor .accordion-container .accordion-title:hover,
            #question .accor .accordion-container .accordion-title:active,
            #question .accor .accordion-title.open {
                background: #dee5f3;
            }

            #question .accor .accordion-container .accordion-title::after {
                content: "";
                position: absolute;
                top: 25px;
                right: 25px;
                width: 0;
                height: 0;
                border: 8px solid transparent;
                border-top-color: #000;
            }

            #question .accor .accordion-container .accordion-title.open::after {
                content: "";
                position: absolute;
                top: 15px;
                border: 8px solid transparent;
                border-bottom-color: #000;
            }

        /*CSS for CodePen*/
        #question .accor .accordion-content {
            padding: 40px 20px;
            box-shadow: 0 8px 18px 0 rgb(0 0 0 / 5%);
        }

        #question .accor .accordion-container {
            width: 100%;
            margin: 0 auto;
        }

        input[type="text"] {
            width: 100%;
        }

        .address {
            margin-top: 20px;
        }

            .address label {
                font-size: 20px;
            }

            .address textarea {
                width: 100%;
            }

        .content {
            position: relative;
            width: 100%;
            max-width: 400px;
            margin: auto;
        }


            .content .content-overlay {
                background-size: cover;
                position: absolute;
                height: 100%;
                width: 100%;
                left: 0%;
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

        .test {
            border: 1px solid black;
            padding: 20px;
            background: white;
            border-radius: 20px;
            margin-top: 10px;
            /*filter:drop-shadow(3px 3px 3px grey);*/
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />


    <section id="question" class="question mb-5 pb-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-9">
                    <div class="question1 pt-5 mt-5 mb-5">
                        <div class="accor mb-5">
                            <div id="accordion" class="accordion-container">
                                <h4 class="accordion-title js-accordion-title py-4 fw-bold">DELIVERY ADDRESS</h4>
                                <div class="accordion-content">
                                    <div class="row">
                                        <asp:ListView ID="lv_address" runat="server">
                                            <ItemTemplate>

                                                <p>sdr<%# Eval("Address") %><%# Eval("City") %><%# Eval("State") %><%# Eval("PinCode") %></p>

                                            </ItemTemplate>
                                        </asp:ListView>

                                        <div class="col-lg-6">
                                            <div class="address">
                                                <label>Name</label>
                                                <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtname" Style="color: red; font-weight: bold;" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="address">
                                                <label>Contact</label>
                                                <asp:TextBox ID="txtcontact" runat="server" MaxLength="10"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtcontact" Style="color: red; font-weight: bold;" ErrorMessage="Enter only Number" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtcity" Style="color: red; font-weight: bold;" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="address">
                                                <label>Address</label>
                                                <asp:TextBox ID="txtaddress" TextMode="MultiLine" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtaddress" Style="color: red; font-weight: bold;" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>


                                        <div class="col-lg-6">
                                            <div class="address">
                                                <label>State</label>
                                                <asp:TextBox ID="txtstate" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtstate" Style="color: red; font-weight: bold;" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="address">
                                                <label>City</label>
                                                <asp:TextBox ID="txtcity" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtcity" Style="color: red; font-weight: bold;" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="address">
                                                <label>Pin Code</label>
                                                <asp:TextBox ID="txtpincode" runat="server"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="regularExp" runat="server" ControlToValidate="txtpincode" Style="color: red; font-weight: bold;" ValidationExpression="[0-9]{5}" ErrorMessage="Invalid Zip Code."></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtcity" Style="color: red; font-weight: bold;" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="address">
                                                <label>Email</label>
                                                <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Style="color: red; font-weight: bold;" ControlToValidate="txtemail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtcity" Style="color: red; font-weight: bold;" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="address">
                                                <label>Order Note</label><br />
                                                <asp:TextBox ID="txtOrderNote" TextMode="MultiLine" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <asp:Button ID="Button1" runat="server" class="w-25" Text="Submit" OnClick="Button1_Click" />

                                    </div>
                                </div>
                                <h4 class="accordion-title js-accordion-title py-4 mt-2 fw-bold">PAYMENT METHOD</h4>
                                <div class="accordion-content">
                                    <p>Mea facilisis urbanitas moderatius id. Vis ei rationibus definiebas, eu qui purto zril laoreet. Ex error omnium interpretaris pro, alia illum ea vim. Lorem ipsum dolor sit amet, te ridens gloriatur temporibus qui.Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper. Lorem ipsum dolor sit amet, consectetue. Aenean commodo ligula eget dolor. Aenean massa. Cum soc</p>
                                </div>
                                <h4 class="accordion-title js-accordion-title py-4 mt-2 fw-bold">SELECTED PRODUCTS</h4>
                                <div class="accordion-content">

                                    <div class="container">
                                        <div class="row">
                                            <asp:ListView ID="ListView1" runat="server">
                                                <ItemTemplate>

                                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblCid" runat="server" Text='<%# Eval("Customer_id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblPid" runat="server" Text='<%# Eval("Painting_id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblFid" runat="server" Text='<%# Eval("Frame_id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblqty" runat="server" Text='<%# Eval("Quantity") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblprice" runat="server" Text='<%# Eval("Price") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblsize" runat="server" Text='<%# Eval("Size") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblrts" runat="server" Text='<%# Eval("rts") %>' Visible="false"></asp:Label>

                                                    <div class="col-lg-6">

                                                        <div class="test mt-2">
                                                            <div class="row">
                                                                <div class="col-lg-4">
                                                                    <div class="content">
                                                                        <span id="frid"></span>
                                                                        <img id="myDIV" class="content-overlay" src="images1/frame/<%# Eval("Frame") %>">
                                                                        <img class="content-image" src="images1/product/<%# Eval("image") %>" />
                                                                    </div>

                                                                </div>
                                                                <div class="col-lg-8">
                                                                    <h3><%# Eval("Product_Name") %></h3>

                                                                    <h4>Price: <span>Rs. <%# Eval("Price") %>/-</span></h4>
                                                                    <h6>Size: <span class="fst-normal"><%# Eval("Size") %></span></h6>
                                                                    <h6>Quantity:<span><%# Eval("Quantity") %> Qty</span></h6>

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
                    </div>
                </div>

                <div class="col-lg-3   ">
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <div class="box" style="border: 1px solid black; border-radius: 10px;">
                        <h4 class="text-center my-4">Order Summary:</h4>

                        <div class="box1 px-2 d-flex" style="justify-content: space-between;">
                            <h5>Total: </h5>
                            <p>
                                <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>
                            </p>
                        </div>

                        <asp:Button ID="Button2" runat="server" class="my-4" Style="height: 54px; padding: 0 !important; width: 50%; margin-left: 70px;" Text="Place to Order" />


                    </div>
                </div>
            </div>
        </div>

    </section>

    <script>
        $(function () {

            $(".accordion-content:not(:first-of-type)").css("display", "none");

            $(".js-accordion-title:first-of-type").addClass("open");

            $(".js-accordion-title").click(function () {
                $(".open").not(this).removeClass("open").next().slideUp(300);
                $(this).toggleClass("open").next().slideToggle(300);
            });
        });
    </script>

    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
        crossorigin="anonymous"></script>


</asp:Content>
