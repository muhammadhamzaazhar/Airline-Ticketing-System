<%@ Page Language="VB" AutoEventWireup="true" CodeFile="airport1.aspx.vb" Inherits="airport1" %>
<%@ Register Src="~/Logout.ascx" TagName="Logout" TagPrefix="uc1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Airport Selection</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url('./resources/airport.jpg');
            background-size: cover;
            background-repeat: no-repeat; 
        }
        .grid-container {
            display: grid;
            grid-template-columns: 1.5fr 2.5fr;
            height: 100vh;
        }
        .logout-button-container {
            position: absolute;
            top: 20px;
            right: 20px;
        }
        .form-container {
            background: rgba(248, 248, 255, 0.8);
            border-radius: 10px;
            padding: 0;
            width: 500px;
        }
        .form-container img {
            width: 100%;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .form-content {
            padding: 20px;
        }
        .left-container {
            background-color: rgba(236, 236, 242, 0.2);
            color: #fff;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .right-container {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .img-fluid {
            height: 200px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="grid-container">
            <div class="logout-button-container">
                    <uc1:Logout ID="LogoutControl" runat="server" />
                </div>
            <div class="left-container">
                <h1 style="color:#4D73FC">Welcome</h1>
                <h3 style="color:black">Please select the required fields</h3>
            </div>

            <div class="right-container">
                <div class="form-container">
                    <img src="./resources/airport.png" class="img-fluid" alt="Responsive image" />
                    <div class="form-content">
                        <div class="mb-3">
                            <asp:Label runat="server" AssociatedControlID="Airport_name" class="form-label">Airports Available: </asp:Label>
                            <asp:DropDownList ID="Airport_name" runat="server" class="form-select">
                                <asp:ListItem Text="Jinnah International Airport" Value="JIA"></asp:ListItem>
                                <asp:ListItem Text="Multan International Airport" Value="MIA"></asp:ListItem>
                                <asp:ListItem Text="Lahore International Airport" Value="LIA"></asp:ListItem>
                                <asp:ListItem Text="Islamabad International Airport" Value="IIA"></asp:ListItem>
                                <asp:ListItem Text="Gwadar International Airport" Value="GIA"></asp:ListItem>
                                <asp:ListItem Text="Quetta International Airport" Value="QIA"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <asp:Label runat="server" AssociatedControlID="Destination" class="form-label">Destination: </asp:Label>
                            <asp:DropDownList ID="Destination" runat="server" class="form-select">
                                <asp:ListItem Text="Barcelona" Value="Barcelona"></asp:ListItem>
                                <asp:ListItem Text="Rome" Value="Rome"></asp:ListItem>
                                <asp:ListItem Text="Bali" Value="Bali"></asp:ListItem>
                                <asp:ListItem Text="Sydney" Value="Sydney"></asp:ListItem>
                                <asp:ListItem Text="Dubai" Value="Dubai"></asp:ListItem>
                                <asp:ListItem Text="Saudi Arabia" Value="Saudi_Arabia"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <asp:Label runat="server" AssociatedControlID="Airline_name" class="form-label">Airline Available: </asp:Label>
                            <asp:DropDownList ID="Airline_name" runat="server" class="form-select">
                                <asp:ListItem Text="PIA" Value="PIA"></asp:ListItem>
                                <asp:ListItem Text="Airblue" Value="Airblue"></asp:ListItem>
                                <asp:ListItem Text="Qatar Airways" Value="Qatar_airways"></asp:ListItem>
                                <asp:ListItem Text="Air Canada" Value="Air_canada"></asp:ListItem>
                                <asp:ListItem Text="Turkish Airlines" Value="Turkish_airlines"></asp:ListItem>
                                <asp:ListItem Text="Emirates" Value="Emirates"></asp:ListItem>
                                <asp:ListItem Text="Saudi Arabian Airlines" Value="Saudi_airline"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="mb-3 text-center">
                            <asp:Button ID="btnProceed" runat="server" Text="Proceed To Airline Selection" CssClass="btn btn-primary" OnClick="btnProceed_Click" />
                        </div>
                        <div class="text-center">
                            <asp:Label ID="lblmessage" runat="server" CssClass="text-danger"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
