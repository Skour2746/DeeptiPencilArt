<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="User_Enquiry.aspx.cs" Inherits="DeeptiPencilArt.admin.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">User Enquiry</h4>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Id
                                            </th>
                                            <th>Name
                                            </th>
                                            <th>Email
                                            </th>
                                            <th>Phone Number
                                            </th>
                                            <th>Message
                                            </th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="lv_enquiry" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <%# Eval("id") %>
                                                    </td>
                                                    <td class="py-1">
                                                        <%# Eval("user_name") %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("user_email") %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("user_number") %>
                                                    </td>
                                                    <td><%# Eval("user_message") %>
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
        <!-- content-wrapper ends -->
        <!-- partial:./partials/_footer.html -->

    </div>
</asp:Content>
