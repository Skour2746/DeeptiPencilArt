<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DeeptiPencilArt.admin.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="main-panel">
        <div class="content-wrapper">

            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Deepti Pencil Art</h4>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                   
                                    <tbody>
                                        <tr>

                                            <td>Total Product
                                            </td>


                                            <td>
                                                <%=Product_count %>
                                            </td>

                                        </tr>
                                        <tr>

                                            <td>Total User Registration
                                            </td>
                                            <td>
                                                <%=Registration_count %>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>Total User Enquiries
                                            </td>
                                            <td>
                                                <%=Enquiry_Count %>
                                            </td>

                                        </tr>
                                        <tr>
                         
                          <td>
                         Total Pending Comments
                          </td>
                        
                           
                          <td>
                          <%=Pending_Comments %>

                          </td>
                         
                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- row end -->
            <div class="row">
                <div class="col-md-4 grid-margin stretch-card">
                    <div class="card bg-facebook d-flex align-items-center">
                        <div class="card-body py-5">
                            <div
                                class="d-flex flex-row align-items-center flex-wrap justify-content-md-center justify-content-xl-start py-1">
                                <i class="mdi mdi-facebook text-white icon-lg"></i>
                                <div class="ms-3 ml-md-0 ml-xl-3">
                                    <h5 class="text-white font-weight-bold">2.62 Subscribers</h5>
                                    <p class="mt-2 text-white card-text">You main list growing</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 grid-margin stretch-card">
                    <div class="card bg-google d-flex align-items-center">
                        <div class="card-body py-5">
                            <div
                                class="d-flex flex-row align-items-center flex-wrap justify-content-md-center justify-content-xl-start py-1">
                                <i class="mdi mdi-google-plus text-white icon-lg"></i>
                                <div class="ms-3 ml-md-0 ml-xl-3">
                                    <h5 class="text-white font-weight-bold">3.4k Followers</h5>
                                    <p class="mt-2 text-white card-text">You main list growing</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 grid-margin stretch-card">
                    <div class="card bg-twitter d-flex align-items-center">
                        <div class="card-body py-5">
                            <div
                                class="d-flex flex-row align-items-center flex-wrap justify-content-md-center justify-content-xl-start py-1">
                                <i class="mdi mdi-twitter text-white icon-lg"></i>
                                <div class="ms-3 ml-md-0 ml-xl-3">
                                    <h5 class="text-white font-weight-bold">3k followers</h5>
                                    <p class="mt-2 text-white card-text">You main list growing</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- row end -->
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:./partials/_footer.html -->
     
    </div>
</asp:Content>
