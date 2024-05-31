<%@ Page Title="" Language="C#" MasterPageFile="~/Deeptipencilart.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="DeeptiPencilArt.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        td {
            text-align: center !important;
            border: 1px solid black;
            height: 40px;
        }

        .td1 {
            background: #dee5f3;
        }

        .content {
            position: relative;
            width: 100%;
            max-width: 400px;
            margin: auto;
        }
        .test{
            border:1px solid black;
            padding:20px;
            background:white;
            border-radius:20px;
            margin-top:10px;
            filter:drop-shadow(3px 3px 3px grey);
        }

            .content .content-overlay {
                background-size: cover;
                position: absolute;
                height: 100%;
                width: 100%;
                left:0%;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <br />
    <br />
    <br />


    <section class="content-section">
        <div class="container">
            <h1 class="text-center" style="font-family: 'Cinzel', serif;">Shopping Cart</h1>
            <br />
            <br />
            <div class="row">

            <table width="100%" border="1">
               <%-- <tr>
                    <td class="td1">Product Name</td>
                    <td class="td1">Painting </td>
                    <td class="td1">Quantity</td>
                    <td class="td1">Size</td>
                    <td class="td1">Price</td>
                    <td class="td1">Remove</td>
                </tr>--%>


                <asp:ListView ID="lv_Cart" runat="server" OnItemCommand="Lv_Cart_ItemCommand" OnItemDeleting="Lv_Cart_ItemDeleting">
                    <ItemTemplate>
                        <div class="col-lg-6">
                          
                      <div class="test">
            <div class="row">
                <div class="col-lg-4 col-5">
                    <div class="content">
                        <span id="frid"></span>
                        <img id="myDIV" class="content-overlay" src="images1/frame/<%# Eval("Frame") %>">
                        <img class="content-image" src="images1/product/<%# Eval("image") %>" />
                        </div>
      
                </div>
                <div class="col-lg-8 col-7">
                    <h3><%# Eval("Product_Name") %></h3>
                  
                    <h4>Price: <span>Rs. <%# Eval("Price") %>/-</span></h4>
                      <h6>Size: <span class="fst-normal"><%# Eval("Size") %></span></h6>
                    <h6>Quantity:<span><%# Eval("Quantity") %>Qty</span></h6><br />
                    <asp:LinkButton ID="LinkButton1" runat="server" style="background:#dee5f3" class="btn btn-default me-2" CommandName="delete"><i class="fa fa-trash" aria-hidden="true"></i> Delete</asp:LinkButton>

                </div>
            </div>
        </div>                                           </div>

                        <tr>
                            <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblqty" runat="server" Text='<%# Eval("Quantity") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblprice" runat="server" Text='<%# Eval("Price") %>' Visible="false"></asp:Label>

                            <%--<td><%# Eval("Product_Name") %></td>
                            <td>
                                <div class="content">
                                    <span id="frid"></span>
                                    <img id="myDIV" class="content-overlay" src="images1/frame/<%# Eval("Frame") %>">
                                    <img src="images1/product/<%# Eval("image") %>" style="width: 32%;" />

                                </div>
                                </div>  
                            </td>
                            <td><%# Eval("Quantity") %> Qty</td>
                            <td><%# Eval("Size") %></td>
                            <td>Rs. <%# Eval("Price") %>/-</td>
                            <td>
                                <asp:LinkButton ID="LinkButton2" runat="server" class="btn btn-default me-2" CommandName="delete"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                            </td>--%>

                        </tr>
                    </ItemTemplate>

                </asp:ListView>

            </table>

                </div>  
            <asp:Label ID="Label1" runat="server"></asp:Label>

            <br />
            <br />
            <asp:Label ID="lblTotal" runat="server" class="me-5 fs-4" Style="float: right;"></asp:Label>
            <br />
            <br />
            <br />

            <asp:Button ID="Button2" type="submit" value="Process to Order" runat="server" Text="Process to Order" Style="float: right;" class="me-5" OnClick="Button2_Click" />


        </div>
    </section>



    <%--<section class="content-section">
        <div class="container">
             <div class="test">
            <div class="row">
                <div class="col-lg-4">
                    <div class="content">
                        <span id="frid"></span>
                        <img id="myDIV" class="content-overlay" src="images1/frame/frame.png">
                        <img src="images1/product/shivji4.jpeg" style="width: 60%;" />
                        </div>

                </div>
                <div class="col-lg-8">
                    <h3>Shiv Ji</h3>
                  
                    <h4>Price: <span>Rs.255/-</span></h4>
                      <h6>Size: <span class="fst-normal">4 inch</span></h6>
                    <h6>Quantity:<span>4 Qty</span></h6><br />
                    <asp:LinkButton ID="LinkButton1" runat="server" style="background:#dee5f3" class="btn btn-default me-2" CommandName="delete"><i class="fa fa-trash" aria-hidden="true"></i> Delete</asp:LinkButton>

                </div>
            </div>
        </div>
         </div>
       
    </section>--%>

</asp:Content>
