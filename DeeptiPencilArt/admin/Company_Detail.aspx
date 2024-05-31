<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="Company_Detail.aspx.cs" Inherits="DeeptiPencilArt.admin.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Company_Detail form</h4>

                            <div class="forms-sample">
                                <div class="row">
                                    <div class="col-lg-6">

                                        <br />
                                        <div class="form-group">
                                            <label for="exampleInputUsername1">Comany_Name</label>
                                            <asp:TextBox ID="txtcompanyname" type="text" class="form-control" placeholder="Company_Name" runat="server"></asp:TextBox>

                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Company_logo</label>
                                            <asp:FileUpload ID="FileUpload1" class="form-control" runat="server"></asp:FileUpload>
                                            <asp:Image ID="Image1" runat="server"></asp:Image>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Company_Address</label>
                                            <asp:TextBox ID="txtcompanyaddress" type="text" class="form-control" placeholder="Company_Address" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <br />
                                        <div class="form-group">
                                            <label for="exampleInputConfirmPassword1">Company_Contact_Number</label>
                                            <asp:TextBox ID="txtcontactnumber" type="text" class="form-control" placeholder="Company_Contact_Number" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputConfirmPassword1">Company_googleMap_link</label>
                                            <asp:TextBox ID="txtmaplink" type="text" class="form-control" placeholder="Company_googleMap_link" runat="server"></asp:TextBox>


                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputConfirmPassword1">Company_Email</label>
                                            <asp:TextBox ID="txtemail" type="text" class="form-control" placeholder="Company_Email" runat="server"></asp:TextBox>
                                        </div>

                                         <div class="form-group">
                                            <label for="exampleInputConfirmPassword1">Opening_Time</label>
                                            <asp:TextBox ID="txtopeningtime" type="text" class="form-control" placeholder="Opening_time" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <asp:Button runat="server" ID="Button1" OnClick="Button1_Click" class="btn btn-primary me-2" Text="Submit" />

                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-12 grid-margin">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Company_Detail Table</h4>

                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>id</th>
                                            <th>Comapany_Name</th>
                                            <th>Company_logo</th>
                                            <th>Company_Address</th>
                                            <th>Company_Contact_Number</th>
                                            <th>Company_googleMap_link</th>
                                            <th>Company_Email</th>
                                            <th>Opening_time</th>
                                            <th>status</th>
                                            <th>Change<br />
                                                Status</th>
                                            <th>Edit</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:HiddenField ID="hfSelectedRecord" runat="server" />
                                        <asp:ListView ID="lv_Product" OnItemCommand="Lv_Product_ItemCommand" OnItemEditing="Lv_Product_ItemEditing" runat="server">
                                            <itemtemplate>
                                                <tr>
                                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblcompanyname" runat="server" Text='<%# Eval("Comapany_Name") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblcompanylogo" runat="server" Text='<%# Eval("Company_logo") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblcompanyaddress" runat="server" Text='<%# Eval("Company_Address") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblcontactnumber" runat="server" Text='<%# Eval("Company_Contact_Number") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblcompanygooglelink" runat="server" Text='<%# Eval("Company_googleMap_link") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblcompanyemail" runat="server" Text='<%# Eval("Company_Email") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblopeningtime" runat="server" Text='<%# Eval("Opening_time") %>' Visible="false"></asp:Label>

                                                    <td><%# Eval("id") %></td>
                                                    <td><%# Eval("Comapany_Name") %></td>
                                                    <td><img src="../images1/comapny_detail/<%# Eval("Company_logo") %>" /></td>
                                                    <td><%# Eval("Company_Address") %></td>
                                                    <td><%# Eval("Company_Contact_Number") %></td>
                                                    <td><iframe src="<%# Eval("Company_googleMap_link") %>" width="100" height="100" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></td>
                                                    <td><%# Eval("Company_Email") %></td>
                                                    <td><%# Eval("Opening_time") %></td>
                                                   

                                                    <td><%# Eval("status") %></td>
                                                    <td>
                                                        <asp:LinkButton ID="btnChangeStatus" type="submit" CommandName="active" class="btn btn-primary me-2 bg-secondary border-secondary" Visible='<%# Eval("status").ToString() == "1" ? false : true%>' runat="server"><i class="fa fa-play" aria-hidden="true"></i></asp:LinkButton>
                                                        <asp:LinkButton ID="Button3" type="submit" CommandName="deactive" class="btn btn-primary me-2 bg-warning border-warning" Visible='<%# Eval("status").ToString() == "0" ? false : true%>' runat="server"><i class="fa fa-pause" aria-hidden="true"></i></asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-primary me-2" CommandName="edit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </itemtemplate>
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
