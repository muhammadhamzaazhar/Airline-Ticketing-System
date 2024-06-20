<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Flight.aspx.vb" Inherits="Flight" %>
<%@ Register Src="~/Logout.ascx" TagName="Logout" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Flight Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <style>
        body {
            background-image: url('./resources/banner2.png');
            background-repeat: no-repeat; 
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        form {
            background: rgba(248, 248, 255, 0.5450980392);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            margin-top: 70px; 
        }
        .container {
            width: 500px;
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
        <div class="container">
            <div class="logout-button-container">
                <uc1:Logout ID="LogoutControl" runat="server" />
            </div>
            <h1 class="text-center mb-4">Flight Details</h1>
            <div class="form-group mb-3">
                <asp:Label ID="lblDepartureDate" runat="server" Text="Departure Date:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtDeparturedate" runat="server" type="date" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDepartureDate" runat="server"
                    ControlToValidate="txtDepartureDate" 
                    ErrorMessage=" Please enter a Departure date."
                    Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group mb-3">
                <asp:Label ID="lblArrivaldate" runat="server" Text="Arrival Date:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtArrivaldate" runat="server" type="date" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvArrivalDate" runat="server"
                    ControlToValidate="txtArrivalDate" 
                    ErrorMessage=" Please enter an Arrival date."
                    Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group mb-3">
                <asp:Label runat="server" AssociatedControlID="chkclass" CssClass="form-label">Class: </asp:Label>
                <asp:DropdownList ID="chkClass" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Economy" Value="Economy"></asp:ListItem>
                    <asp:ListItem Text="Premium Economy Class" Value="Premium_Economy"></asp:ListItem>
                    <asp:ListItem Text="Business" Value="Business"></asp:ListItem>
                    <asp:ListItem Text="First Class" Value="First_Class"></asp:ListItem>
                </asp:DropdownList>
            </div>

            <div class="form-group text-center mt-3">
                <asp:Button ID="btnSubmit" runat="server" Text="Proceed" OnClick="btnSubmit_Click" CssClass="btn btn-primary"/>
            </div>
            
            <div class="form-group text-center">
                <asp:Label ID="lblmessage" runat="server" CssClass="text-success"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
