<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="Approvedcomment.aspx.cs" Inherits="DeeptiPencilArt.admin.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="main-panel">
        <div class="content-wrapper">
            <h4 class="card-title">Approved Comments</h4>

            <div class="row">
                <asp:ListView ID="lv_comment" runat="server" OnItemDataBound="Lv_comment_ItemDataBound">
                    <ItemTemplate>
                        <div class="col-md-11 mx-5 mt-3">
                            <div class="card">
                                <div class="card-body">

                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                    <h4 class="card-title">
                                        <img src="../images1/commenter/<%# Eval("image") %>" style="float: left;" class="rounded-circle me-5" height="150px" width="150px" /></h4>
                                            <asp:Label ID="ratingLabel" runat="server" Style="color: #FAE729"></asp:Label>
                                  
                                    <h1 class="card-description">
                                        <%# Eval("c_name") %>
                                    </h1>
                                    <p>
                                        <%# Eval("comment") %>
                                    </p>

                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
</asp:Content>
