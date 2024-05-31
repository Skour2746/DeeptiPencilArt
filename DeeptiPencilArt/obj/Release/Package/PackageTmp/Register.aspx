<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="DeeptiPencilArt.Register" %>

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
                        <div class="col-lg-6 mx-auto">
                            <div class="auth-form-light text-left pt-3 pb-5 px-4 px-sm-5">
                                <div class="brand-logo">
                                    <img src="images1/comapny_detail/logo.png" class="w-25" alt="logo"/>
                                </div>
                                <h4>New here?</h4>
                                <h6 class="font-weight-light">Signing up is easy. It only takes a few steps</h6>
                                <div class="pt-3">
                                    <div class="form-group">
                                            <label for="">Name</label>

                                        <asp:TextBox ID="txtusername" runat="server" class="form-control form-control-lg" placeholder="Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtusername" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>
                                        
                                    </div>
                                    <div class="form-group">
                                            <label for="">Email</label>
                                        <asp:TextBox ID="txtuseremail" runat="server" class="form-control form-control-lg" placeholder="Email"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtuseremail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtuseremail" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>
                                  <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                        </div>
                                    <div class="form-group">
                                            <label for="">Contact</label>
                                        <asp:TextBox ID="txtusercontact" runat="server" MaxLength="10" class="form-control form-control-lg" placeholder="Contact"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ControlToValidate="txtusercontact" ErrorMessage="Enter only Number"  ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtusercontact" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="form-group">
                                            <label for="">Password</label>
                                        <asp:TextBox ID="txtuserpassword" type="password" runat="server" class="form-control form-control-lg" placeholder="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtuserpassword" ErrorMessage="Compulsory"></asp:RequiredFieldValidator>
                                    
                                    
                                    </div>
                                   <div class="mt-3">
                              <asp:Button ID="register" OnClick="Register_Click"  class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" runat="server" Text="Register" />

                                    </div>
                                  
                                    
    <br /><br />
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
        <!-- endinject -->/script>
    </form>
</body>
</html>
