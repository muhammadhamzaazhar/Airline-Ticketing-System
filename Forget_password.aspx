<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Forget_password.aspx.vb" Inherits="Forget_password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Passowrd</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background-image: url('./resources/signIn.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background: rgba(248, 248, 255, 0.5450980392);
            border-radius: 10px;
            width: 500px;
            max-width: 700px;
            padding: 20px;
        }

        .form-control:focus {
            border-width: 1px; 
            box-shadow: none; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="form-container" >
            <div class="container p-3" style="background: rgba(248, 248, 255, 0.5450980392) !important; border-radius: 10px">
                <h3 class="text-body-secondary">Enter the following details</h3>
                <div class="row mt-2">
                    <div class="form-group">
                         <asp:Label runat="server" AssociatedControlID="txtusername" for="txtusername" class="form-label col-md-4">User Name: </asp:Label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                            <asp:TextBox ID="txtusername" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="username"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvtxtusername" runat="server" ControlToValidate="txtusername" ErrorMessage="Username required" Display="Dynamic" CssClass="text-danger" />
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="form-group">
                         <asp:Label runat="server" AssociatedControlID="txtcnic" for="txtcnic" class="form-label col-md-4">CNIC: </asp:Label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="far fa-id-card"></i></span>
                                <asp:TextBox ID="txtcnic" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="XXXX-XXXXXXX-X"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvtxtcnic" runat="server" ControlToValidate="txtcnic" ErrorMessage="CNIC required" Display="Dynamic" CssClass="text-danger" />
                            <asp:RegularExpressionValidator ID="revtxtcnic" runat="server" ControlToValidate="txtcnic" ErrorMessage="Invalid CNIC format" ValidationExpression="^\d{5}-\d{7}-\d$" Display="Dynamic" CssClass="text-danger" />
                    </div>
                </div>

                <h3 class="mt-2 text-body-secondary">Reset your password</h3>
                <div class="row mt-2">
                    <div class="form-group">
                         <asp:Label runat="server" AssociatedControlID="txtPassword" for="txtPassword" class="form-label col-md-4">Password: </asp:Label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="password"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvtxtPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password required" Display="Dynamic" CssClass="text-danger" />
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtConfirmPassword" for="txtConfirmPassword" class="form-label col-md-4">Confirm Password: </asp:Label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="confirm password"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvtxtConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Required" Display="Dynamic" CssClass="text-danger" />
                            <asp:CompareValidator ID="cvtxtPassword" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ErrorMessage="Passwords do not match" Display="Dynamic" CssClass="text-danger" />
                    </div>
                </div>
                <div class="row mt-4 d-flex justify-content-around">
                    <asp:Button ID="btnChange" runat="server" Text="Change Password" OnClick="btnChange_Click" CssClass="btn btn-success" style="width: 150px;"/><br />
                    <asp:Button ID="btnlogin" runat="server" Text="Back to Login" OnClientClick="window.location='login.aspx'; return false;" UseSubmitBehavior="false" CssClass="btn btn-primary" style="width: 150px;" />
                </div>
                 <asp:Label ID="lblmessage" runat="server" ForeColor="Green" class="mt-2" />
            </div>      
    </form>
</body>
</html>
