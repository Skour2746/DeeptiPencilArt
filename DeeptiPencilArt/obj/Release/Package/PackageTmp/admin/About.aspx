<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" ValidateRequest="false" CodeBehind="About.aspx.cs" Inherits="DeeptiPencilArt.admin.WebForm4" %>
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
                            <h4 class="card-title">About Form</h4>
                            <div class="forms-sample">
                                <div class="row">
                                    <div class="col-lg-6">

                                        <div class="form-group">
                                            <br />
                                            <label for="exampleInputUsername1">Image</label>
                                            <asp:FileUpload ID="FileUpload2" class="form-control" runat="server" />
                                            <asp:Image ID="Image1" runat="server" Height="100px" />
                                        </div>
                                    </div><div class="col-lg-6">

                                        <div class="form-group">
                                            <br />
                                            <label for="exampleInputUsername1">Heading</label>
                                            <asp:TextBox ID="txtheading" class="form-control" runat="server"></asp:TextBox>
                                            
                                        </div>
                                    </div>
                                    <div class="col-lg-12">

                                        <div class="form-group">
                                            <br />
                                            <label for="exampleInputUsername1">About</label>
                                            <asp:TextBox ID="txtpara" class="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                                            <script type="text/javascript">
                                                CKEDITOR.replace('<%=txtpara.ClientID%>');
                                            </script>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">

                                        <div class="form-group">
                                            <br />
                                            <label for="exampleInputUsername1">Opening_time</label>
                                            <asp:TextBox ID="txtopeningtime" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">

                                        <div class="form-group">
                                            <br />
                                            <label for="exampleInputUsername1">Visit</label>
                                            <asp:TextBox ID="txtvisit" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>

                                </div>
                                <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" Text="Submit" class="btn btn-primary me-2" />

                            </div>
                        </div>
                    </div>
                </div>

                 <div class="col-lg-12 grid-margin">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">About Table</h4>

                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>id</th>
                                            <th>image</th>
                                            <th>Heading</th>
                                            <th>about</th>
                                            <th>Opening_time</th>
                                            <th>Visit</th>
                                            <th>status</th>
                                            <th>Change<br />
                                                Status</th>
                                            <th>Edit</th>
                                           
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:HiddenField ID="hfSelectedRecord" runat="server" />
                                        <asp:ListView ID="lv_about" OnItemCommand="Lv_about_ItemCommand" OnItemEditing="Lv_about_ItemEditing" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblimage" runat="server" Text='<%# Eval("image") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblheading" runat="server" Text='<%# Eval("Heading") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblabout" runat="server" Text='<%# Eval("about") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblopeningtime" runat="server" Text='<%# Eval("Opening_time") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblvisit" runat="server" Text='<%# Eval("Visit") %>' Visible="false"></asp:Label>

                                                    <td><%# Eval("id") %></td>
                                                    <td><img src="../images1/About/<%# Eval("image") %>" /></td>
                                                    <td><%# Eval("Heading") %></td>
                                                    <td><%# Eval("about") %></td>
                                                    <td><%# Eval("Opening_time") %></td>
                                                    <td><%# Eval("Visit") %></td>
                                                    <td><%# Eval("status") %></td>
                                                    <td>
                                                        <asp:LinkButton ID="btnChangeStatus" type="submit" CommandName="active" class="btn btn-primary me-2 bg-secondary border-secondary" Visible='<%# Eval("status").ToString() == "1" ? false : true%>' runat="server"><i class="fa fa-play" aria-hidden="true"></i></asp:LinkButton>
                                                        <asp:LinkButton ID="Button3" type="submit" CommandName="deactive" class="btn btn-primary me-2 bg-warning border-warning" Visible='<%# Eval("status").ToString() == "0" ? false : true%>' runat="server"><i class="fa fa-pause" aria-hidden="true"></i></asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-primary me-2" CommandName="edit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>
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
