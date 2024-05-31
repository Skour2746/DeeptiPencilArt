<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DeeptiPencilArt.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <!-- Required meta tags -->
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <title>Deepti Pencil Art</title>
  <!-- base:css -->
  <link rel="stylesheet" href="admin/vendors/mdi/css/materialdesignicons.min.css"/>
  <link rel="stylesheet" href="admin/vendors/css/vendor.bundle.base.css"/>
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="admin/css/style.css"/>
  <!-- endinject -->
  <link rel="shortcut icon" href="images1/logo2.ico" />

    
<style>
    .auth .auth-form-light {
    background: #a5aeaf36  !important;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-scroller d-flex">
    <div class="container-fluid page-body-wrapper full-page-wrapper d-flex">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left pt-3 pb-5 px-3 px-sm-5" >
              <div class="brand-logo text-center">
                <img src="images1/comapny_detail/logo.png" style="width:50%;" alt="logo"/>
              </div>
              <h4 class="text-center">Hello! let's get started</h4>
              <h6 class="font-weight-light text-center">Sign in to continue.</h6>
              <div class="pt-3">
                <div class="form-group">
            <asp:TextBox ID="txtusername" type="email" class="form-control form-control-lg" placeholder="Email" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
            <asp:TextBox ID="txtpassword" type="password" class="form-control form-control-lg" placeholder="Password" runat="server"></asp:TextBox>
                </div>
                <div class="mt-3 text-center">
                <asp:Button ID="Button1" OnClick="Button1_Click" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" runat="server" Text="SIGN IN" />
               
                </div>
                   <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                <div class="text-center mt-4 font-weight-light">
                  Don't have an account? <a href="Register.aspx" class="text-primary">Create</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- base:js -->
  <script src="admin/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <script src="admin/js/jquery.cookie.js" type="text/javascript"></script>
  <!-- inject:js -->
  <script src="admin/js/off-canvas.js"></script>
  <script src="admin/js/hoverable-collapse.js"></script>
  <script src="admin/js/template.js"></script>
  <!-- endinject -->
    </form>
</body>
</html>
