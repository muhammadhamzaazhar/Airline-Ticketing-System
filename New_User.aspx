<%@ Page Language="VB" AutoEventWireup="false" CodeFile="New_User.aspx.vb" Inherits="New_User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="StyleSheet.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        body {
            background-image: url('./resources/login.png');
            background-repeat: no-repeat; 
            background-size: cover;
        }

        .form-control:focus {
            border-width: 2px; 
            box-shadow: none; 
        }

        a {
            text-decoration: none;
            color: cornflowerblue;
        }

    </style>
</head>
<body class="scrollbar-hide">
    <form id="form1" runat="server" class="mb-3">
        <h2 class="text-center mt-2" style="color: white">New User Login</h2>
        <div class="d-flex justify-content-center">
            <div class="container" style="max-width: 600px; background: rgba(248, 248, 255, 0.5450980392) !important; border-radius: 10px">
                <asp:Label ID="lblmessage" runat="server" ForeColor="" Text=""></asp:Label>
                <div class="row mt-2">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="txtFirstName" class="form-label">First Name:</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                <asp:TextBox ID="txtFirstName" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="first name"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvtxtFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First name required " Display="Dynamic" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="txtLastName" class="form-label">Last Name:</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-user"></i></span>
                                <asp:TextBox ID="txtLastName" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="last name"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfctxtLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last name required " Display="Dynamic" CssClass="text-danger" />
                        </div>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="txtcnic" class="form-label col-md-4">CNIC:</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="far fa-id-card"></i></span>
                                <asp:TextBox ID="txtcnic" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="XXXX-XXXXXXX-X"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfctxtcnic" runat="server" ControlToValidate="txtcnic" ErrorMessage="CNIN is required" Display="Dynamic" CssClass="text-danger" />
                            <asp:RegularExpressionValidator ID="revtxtcnic" runat="server" ControlToValidate="txtcnic" ErrorMessage="Invalid CNIC format" ValidationExpression="^\d{5}-\d{7}-\d$" Display="Dynamic" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="txtEmail" class="form-label col-md-4">Email</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="far fa-envelope"></i></span>
                                <asp:TextBox ID="txtEmail" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="user@example.com"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfctxtEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email address required" Display="Dynamic" CssClass="text-danger" />
                            <asp:RegularExpressionValidator ID="revtxtEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Address" ValidationExpression="^[^\s@]+@[^.\s]+\.com$" Display="Dynamic" CssClass="text-danger" />
                        </div>
                    </div>
                </div>


                
                <div class="row mt-2">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtcity" class="form-label col-md-4">City:</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="far fa-id-card"></i></span>
                                <asp:TextBox ID="txtcity" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="City"></asp:TextBox>
                            </div>
                           <asp:RequiredFieldValidator ID="rfctxtcity" runat="server" ControlToValidate="txtcity" ErrorMessage="Please provide city name" Display="Dynamic" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="ddlprovince" class="form-label col-md-4">Province:</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="far fa-id-card"></i></span>
                                <asp:DropDownList ID="ddlprovince" runat="server" CssClass="form-control" AutoPostBack="False">
                                     <asp:ListItem Text="Balochistan" Value="Balochistan"></asp:ListItem>
                                     <asp:ListItem Text="Khyber Pakhtunkhwa" Value="Khyber Pakhtunkhwa"></asp:ListItem>
                                     <asp:ListItem Text="Punjab" Value="Punjab"></asp:ListItem>
                                     <asp:ListItem Text="Sindh" Value="Sindh"></asp:ListItem>
                                     <asp:ListItem Text="Islamabad" Value="Islamabad"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                          </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtpostalcode" class="form-label col-md-4">Postal code:</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="far fa-id-card"></i></span>
                                <asp:TextBox ID="txtpostalcode" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="XXXXX"></asp:TextBox>
                            </div>
                           <asp:RequiredFieldValidator ID="rfctxtpostalcode" runat="server" ControlToValidate="txtpostalcode" ErrorMessage="Please provide postal code" Display="Dynamic" CssClass="text-danger" />
                        </div>
                    </div>
                </div>


                <div class="row mt-2">
                    <div class="form-group d-flex flex-row">
                        <label for="chkGender" class="form-label">Gender:</label>
                        <div class="input-group">
                            <asp:CheckBoxList ID="chkGender" runat="server" CssClass="form-check" required="">
                                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                            </asp:CheckBoxList>
                        </div>
                    </div>
                    <asp:CustomValidator ID="cvchkGender" runat="server" ErrorMessage="Please select at least one gender" Display="Dynamic" CssClass="text-danger" ClientValidationFunction="validateGender"></asp:CustomValidator>
                </div>

                <div class="row mt-2">
                    <div class="form-group">
                        <label for="txtUsername" class="form-label col-md-4">Username:</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                            <asp:TextBox ID="txtUsername" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="username"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfctxtUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username required" Display="Dynamic" CssClass="text-danger" />
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="txtPassword" class="form-label">Password:</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="password"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfctxtPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password required" Display="Dynamic" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="txtConfirmPassword" class="form-label">Confirm Password:</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="confirm password"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:Label ID="errorMessage" runat="server" ForeColor="Red" Text=""></asp:Label>

                <div class="row mt-4 mb-2">
                    <div class="col-md-12 text-center">
                        <asp:Button ID="btnSubmit" runat="server" Text="Sign Up" OnClick="btnSubmit_Click" CssClass="btn btn-success" style="width: 150px;" />
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-md-12 text-center">
                        <asp:Label ID="Label1" runat="server" Text="Already Have an account?" />
                        <asp:LinkButton ID="btnSign_in" runat="server" Text="Sign In" OnClick="btnSign_in_Click" CausesValidation="false"></asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        function validateGender(source, args) {
            var chkGender = document.getElementById('<%= chkGender.ClientID %>');
            var checkBoxes = chkGender.getElementsByTagName('input');
            var isChecked = false;
            for (var i = 0; i < checkBoxes.length; i++) {
                if (checkBoxes[i].checked) {
                    isChecked = true;
                    break;
                }
            }
            args.IsValid = isChecked;
        }
    </script>
</body>
</html>
