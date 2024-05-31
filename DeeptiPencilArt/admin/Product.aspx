<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" ValidateRequest="false" Inherits="DeeptiPencilArt.admin.WebForm11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.ckeditor.com/4.20.1/standard/ckeditor.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-12 grid-margin">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Product Form</h4>
                            <br />

                            <div class="forms-sample">

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="exampleInputUsername1">Category</label>
                                            <asp:DropDownList ID="ddcategory" runat="server" class="form-control" DataTextField="CategoryName" DataValueField="id" AutoPostBack="true" OnSelectedIndexChanged="Ddcategory_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputUsername1">Sub-Category</label>
                                            <asp:DropDownList ID="ddsubcategory" runat="server" class="form-control" DataTextField="SubCategory" DataValueField="id">
                                            </asp:DropDownList>
                                        </div>

                                        <div class="form-group">
                                            <label for="">Image</label>
                                            <asp:FileUpload ID="FileUpload1" class="form-control" runat="server" />
                                            <asp:Image ID="Image1" runat="server" />
                                        </div>
                                    </div>

                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="exampleInputUsername1">Product_Name</label>

                                            <asp:TextBox ID="txtproductname" type="text" class="form-control" placeholder="Product_Name" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputUsername1">Product_Description</label>


                                            <asp:TextBox ID="txtproductdesc" TextMode="MultiLine" runat="server" Width="100%" Height="300"></asp:TextBox>

                                            <script type="text/javascript">
                                                CKEDITOR.replace('<%=txtproductdesc.ClientID%>');
                                            </script>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputUsername1">Product_Price</label>
                                            <asp:TextBox ID="txtprice" type="text" class="form-control" placeholder="Product_Price" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <asp:Button ID="Button1" type="submit" class="btn btn-primary me-2" runat="server" OnClick="Button1_Click" Text="Submit" />

                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Product_Detail Table</h4>

                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>id</th>
                                            <th>Category_id</th>
                                            <th>Sub-Category</th>
                                            <th>image</th>
                                            <th>Product_Name</th>
                                            <th>Product_Description</th>
                                            <th>Product_Price</th>
                                            <th>status</th>
                                            <th>Change<br />
                                                Status</th>
                                            <th>Edit</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:HiddenField ID="hfSelectedRecord" runat="server" />
                                        <asp:ListView ID="lv_Product" OnItemCommand="Lv_Product_ItemCommand" OnItemEditing="Lv_Product_ItemEditing" runat="server" OnItemDeleting="Lv_Product_ItemDeleting">
                                            <ItemTemplate>
                                                <tr>
                                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblcategoryid" runat="server" Text='<%# Eval("Category_id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblSubCategory" runat="server" Text='<%# Eval("SubCategoryId") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblimage" runat="server" Text='<%# Eval("image") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblproductname" runat="server" Text='<%# Eval("Product_Name") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblproductdesc" runat="server" Text='<%# Eval("Product_Description") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblprice" runat="server" Text='<%# Eval("Price") %>' Visible="false"></asp:Label>


                                                    <td><%# Eval("id") %></td>
                                                    <td><%# Eval("Category_id") %></td>
                                                    <td><%# Eval("SubCategoryId") %></td>
                                                    <td>
                                                        <img src="../images1/product/<%# Eval("image") %>" /></td>
                                                    <td><%# Eval("Product_Name") %></td>
                                                    <td style="text-align: justify;"><%# Eval("Product_Description") %></td>
                                                    <td><%# Eval("Price") %></td>
                                                    <td><%# Eval("status") %></td>
                                                    <td>
                                                        <asp:LinkButton ID="btnChangeStatus" type="submit" CommandName="active" class="btn btn-primary me-2 bg-secondary border-secondary" Visible='<%# Eval("status").ToString() == "1" ? false : true%>' runat="server"><i class="fa fa-play" aria-hidden="true"></i></asp:LinkButton>
                                                        <asp:LinkButton ID="Button3" type="submit" CommandName="deactive" class="btn btn-primary me-2 bg-warning border-warning" Visible='<%# Eval("status").ToString() == "0" ? false : true%>' runat="server"><i class="fa fa-pause" aria-hidden="true"></i></asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-primary me-2" CommandName="edit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="btndelete" runat="server" class="btn btn-primary me-2" CommandName="delete"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
