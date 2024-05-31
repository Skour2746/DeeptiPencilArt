<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="frame.aspx.cs" Inherits="DeeptiPencilArt.admin.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-6 grid-margin">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Frame form</h4>
                            <div class="forms-sample">

                                <div class="form-group">
                                    <br />
                                    <label for="exampleInputUsername1">Image</label>
                                    <asp:TextBox ID="txtframename" class="form-control" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <br />
                                    <label for="exampleInputUsername1">Image</label>
                                    <asp:FileUpload ID="FileUpload2" class="form-control" runat="server" />
                                    <asp:Image ID="Image1" runat="server" Height="100px" />
                                </div>
                                <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" class="btn btn-primary me-2" />

                            </div>
                        </div>
                    </div>
                </div>

                
                <div class="col-lg-12 grid-margin">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Frame Table</h4>

                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>id</th>
                                            <th>FrameCategory</th>
                                            <th>image</th>
                                            <th>status</th>
                                            <th>Change<br />
                                                Status</th>
                                            <th>Edit</th>
                                            <th>Delete</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:HiddenField ID="hfSelectedRecord" runat="server" />
                                        <asp:ListView ID="lv_frames" OnItemCommand="Lv_Product_ItemCommand" OnItemDeleting="Lv_Product_ItemDeleting" OnItemEditing="Lv_Product_ItemEditing" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblfcategory" runat="server" Text='<%# Eval("FrameCategory") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblimage" runat="server" Text='<%# Eval("Frame") %>' Visible="false"></asp:Label>

                                                    <td><%# Eval("id") %></td>
                                                    <td><%# Eval("FrameCategory") %></td>
                                                    <td><img src="../images1/frame/<%# Eval("Frame") %>" /></td>
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
