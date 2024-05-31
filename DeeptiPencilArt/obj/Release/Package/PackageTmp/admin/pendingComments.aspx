<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="pendingComments.aspx.cs" Inherits="DeeptiPencilArt.admin.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="main-panel">
        <div class="content-wrapper">
            <h4 class="card-title">Pending Comments</h4>

            <div class="row">
                <asp:ListView ID="lv_comment" runat="server" OnItemCommand="Lv_comment_ItemCommand" OnItemDataBound="Lv_comment_ItemDataBound">
                    <ItemTemplate>
                        <div class="col-md-11 mx-5 mt-3">
                            <div class="card">
                                <div class="card-body">

                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                    <h4 class="card-title">
                                        <img src="../images1/commenter/<%# Eval("image") %>" style="float: left;height:150px;width:150px;" class="rounded-circle me-5" /></h4>
                                    <asp:Label ID="ratingLabel" runat="server" Style="color: #FAE729"></asp:Label>
                                   
                                    <h1 class="card-description">
                                        <%# Eval("c_name") %>
                                    </h1>

                                    <p>
                                        <%# Eval("comment") %>
                                    </p>

                                    <asp:Button ID="Button1" class="btn btn-primary btn-rounded btn-fw" runat="server" Text="Approve" CommandName="Approve" />
                                    <asp:Button ID="Button2" class="btn btn-danger btn-rounded btn-fw" runat="server" Text="Remove" CommandName="Remove" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
</asp:Content>
