<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="our_team.aspx.cs" Inherits="DeeptiPencilArt.admin.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-6 grid-margin">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Our_Team form</h4>
                            <div class="forms-sample">
                                <div class="form-group">
                                    <br />
                                    <label for="exampleInputUsername1">Image</label>
                                    <asp:FileUpload ID="FileUpload2" class="form-control" runat="server" />
                                    <asp:Image ID="Image1" runat="server" Height="100px" />
                                </div>
                                <div class="form-group">
                                    <br />
                                    <label for="exampleInputUsername1">Employee_Name</label>
                                    <asp:TextBox ID="txtteamname" class="form-control" runat="server"></asp:TextBox>

                                </div>
                                <div class="form-group">
                                    <br />
                                    <label for="exampleInputUsername1">Employee_position</label>
                                    <asp:TextBox ID="txteamposition" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" class="btn btn-primary me-2" />

                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-12 grid-margin">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Our_Team Table</h4>

                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>id</th>
                                            <th>image</th>
                                            <th>Employee_Name</th>
                                            <th>Employee_Name</th>
                                            <th>status</th>
                                            <th>Change<br />
                                                Status</th>
                                            <th>Edit</th>
                                           
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:HiddenField ID="hfSelectedRecord" runat="server" />
                                        <asp:ListView ID="lv_team" OnItemCommand="Lv_Product_ItemCommand" OnItemEditing="Lv_Product_ItemEditing" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblimage" runat="server" Text='<%# Eval("image") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblempname" runat="server" Text='<%# Eval("Emp_name") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblposition" runat="server" Text='<%# Eval("position") %>' Visible="false"></asp:Label>

                                                    <td><%# Eval("id") %></td>
                                                    <td><img src="../images1/our_team/<%# Eval("image") %>" /></td>
                                                    <td><%# Eval("Emp_name") %></td>
                                                    <td><%# Eval("position") %></td>
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
