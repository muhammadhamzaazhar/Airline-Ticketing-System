<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Payment.aspx.vb" Inherits="Payment" %>
<%@ Register Src="~/Logout.ascx" TagName="Logout" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Final Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('./resources/airport.jpg');
            background-size: cover;
            background-repeat: no-repeat;
        }
        form {
            background: rgba(248, 248, 255, 0.5450980392);
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }
        .container {
            width: 700px;
            padding: 20px;
        }
         .logout-button-container {
            position: absolute;
            top: 20px;
            right: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="logout-button-container">
            <uc1:Logout ID="LogoutControl" runat="server" />
        </div>
        <div class="container">
            <h1 class="text-center mb-3">Payment Details</h1>
            <div class="form-group mb-3">
                <asp:Label runat="server" CssClass="form-label">Accepted Cards: </asp:Label>
                <img src="./resources/imgcards.png" class="img-fluid" alt="Responsive image" />
            </div>
            <div class="form-group mb-3">
                <asp:Label runat="server" AssociatedControlID="Payment_method" CssClass="form-label">Payment Method: </asp:Label>
                <asp:DropDownList ID="Payment_Method" runat="server" CssClass="form-select">
                    <asp:ListItem Text="Visa" Value="visa"></asp:ListItem>
                    <asp:ListItem Text="Master Card" Value="master_card"></asp:ListItem>
                    <asp:ListItem Text="PayPal" Value="paypal"></asp:ListItem>
                    <asp:ListItem Text="Bank Transfer" Value="bank_transfer"></asp:ListItem>
                    <asp:ListItem Text="Credit Card" Value="credit_card"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="row">
                <div class="col">
                    <div class="form-group mb-3">
                        <asp:Label runat="server" AssociatedControlID="txtaccount" CssClass="form-label">Account/Card Number: </asp:Label>
                        <asp:TextBox ID="txtaccount" runat="server" CssClass="form-control" placeholder="Enter 16-digit Account/Card Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAccountNumber" runat="server" ControlToValidate="txtaccount" ErrorMessage="Account/Card Number is required" Display="Dynamic" CssClass="text-danger" />
                        <asp:RegularExpressionValidator ID="revAccountNumber" runat="server" ControlToValidate="txtaccount" ErrorMessage="Invalid Account/Card Number format" ValidationExpression="^\d{16}$" Display="Dynamic" CssClass="text-danger" />
                    </div>
                </div>
                <div class="col">
                    <div class="form-group mb-3">
                        <asp:Label runat="server" AssociatedControlID="txtCVV" CssClass="form-label">CVV: </asp:Label>
                        <asp:TextBox ID="txtCVV" runat="server" CssClass="form-control" placeholder="Enter 3-digit CVV"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCVV" ErrorMessage="CVV is required" Display="Dynamic" CssClass="text-danger" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCVV" ErrorMessage="Invalid CVV format" ValidationExpression="^\d{3}$" Display="Dynamic" CssClass="text-danger" />
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <div class="form-group mb-3">
                        <asp:Label runat="server" AssociatedControlID="txtExpiration" CssClass="form-label">Expiration Date: </asp:Label>
                        <asp:TextBox ID="txtExpiration" runat="server" CssClass="form-control" placeholder="MM/YY"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtExpiration" ErrorMessage="Expiration Date is required" Display="Dynamic" CssClass="text-danger" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtExpiration" ErrorMessage="Invalid Expiration Date format (MM/YY)" ValidationExpression="^(0[1-9]|1[0-2])\/\d{2}$" Display="Dynamic" CssClass="text-danger" />
                    </div>
                </div>
                <div class="col">
                    <div class="form-group mb-3">
                        <asp:Label runat="server" AssociatedControlID="txtCardholderName" CssClass="form-label">Cardholder Name: </asp:Label>
                        <asp:TextBox ID="txtCardholderName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCardholderName" ErrorMessage="Cardholder Name is required" Display="Dynamic" CssClass="text-danger" />
                    </div>
                </div>
            </div>

            <div class="form-group mb-3">
                <asp:Label runat="server" AssociatedControlID="txtBillingAddress" CssClass="form-label">Billing Address: </asp:Label>
                <asp:TextBox ID="txtBillingAddress" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtBillingAddress" ErrorMessage="Billing Address is required" Display="Dynamic" CssClass="text-danger" />
            </div>

            <div class="form-group text-center">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Payment" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />
            </div>

            <div class="form-group text-center">
                <asp:Label ID="lblmessage" runat="server" CssClass="text-success"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
