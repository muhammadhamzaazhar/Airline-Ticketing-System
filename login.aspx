<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            height: 100vh;
            background-image: url('./resources/signIn.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        #btnSign_up {
            text-decoration: none;
            color: #4361ee;
        }

        .form-control:focus {
            border-width: 1px; 
            box-shadow: none; 
        }

        a {
            text-decoration: none;
            color: white;
        }

        a:hover {
            color: cornflowerblue;
        }

        h2 {
            color: whitesmoke;
            margin-bottom: 20px; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Fly High with Our Premier Airline Reservation Hub!</h2>
        <div class="container p-3" style="max-width: 400px; background: rgba(248, 248, 255, 0.5450980392) !important; border-radius: 10px">
            <asp:Label ID="lblmessage" runat="server" ForeColor="Red" />
            <div class="row mt-2">
                <div class="form-group">
                    <asp:Label for="txtusername" runat="server" class="form-label col-md-4" AssociatedControlID="txtusername">Username: </asp:Label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                        <asp:TextBox ID="txtusername" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="username"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvtxtusername" runat="server" ControlToValidate="txtusername" ErrorMessage="Username required" Display="Dynamic" CssClass="text-danger" />
                </div>
            </div>

            <div class="row mt-2">
                <div class="form-group">
                    <asp:Label for="txtpassword" runat="server" class="form-label col-md-4" AssociatedControlID="txtpassword">Password: </asp:Label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                        <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="password"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvtxtpassword" runat="server" ControlToValidate="txtpassword" ErrorMessage="Password required" Display="Dynamic" CssClass="text-danger" />
                </div>
            </div>

            <div class="row mt-4 mb-2">
                <div>
                    <a href="Forget_password.aspx">Forgot password?</a>
                </div>
            </div>

            <div class="row mt-4 mb-2">
                <div class="col-md-12 text-center">
                    <asp:Button ID="btnSign_in" runat="server" Text="Sign In" OnClick="btnSign_in_Click" CssClass="btn btn-success" style="width: 150px;" />
                </div>
            </div>

            <div class="row mt-4 mb-2">
                <div class="col-md-12 text-center">
                    <asp:Label ID="Label1" runat="server" Text="Don't Have an account?" />
                    <asp:LinkButton ID="btnSign_up" runat="server" Text="Sign Up" OnClick="btnSign_up_Click" CausesValidation="false"></asp:LinkButton>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
