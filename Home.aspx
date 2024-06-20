<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Home.aspx.vb" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Airline Reservation Hub</title>
    <style>
        body {
            font-family: "Inter", sans-serif;
        }

        .container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .image-container {
            grid-column: 2;
        }

        .content-container {
            grid-column: 1;
            margin-top: -30px;
        }

        #Button1 {
            font-size: 16px;
            font-weight: 600;
            line-height: 150%;
            letter-spacing: 0.32px;
            padding: 16px 28px;
            display: flex;
            justify-content: center;
            width: fit-content;
            align-items: center;
            gap: 8px;
            border-radius: 10px;
            border: none;
            background: #4D73FC;
            box-shadow: 4px 4px 10px 0px rgba(77, 115, 252, 0.3);
            color: #F8F8FF;
            transition: all 0.5s ease-in-out;
        }

        #Button1:hover {
            cursor: pointer;
            background-color: #ECECF2;
            color: #16191A;
        }   

        #LogoImage {
            width: 100px;
            height: auto;
            margin-left: 20px;
            margin-top: 20px;
        }

        span {
            color: #4D73FC !important;
        }

        h1 {
            font-weight: 700;
            font-size: 58px;
            line-height: 80%;
            letter-spacing: -1.22px;
        }

        p {
            color: #7A7F85;
            font-size: 16px;
            font-weight: 400;
            line-height: 150%;
            letter-spacing: 0.32px;
        }

        #Image1 {
            margin-top: 20px;
            margin-right: 10px;
            transition: transform 0.3s ease; 
        }

        #Image1:hover {
            cursor: pointer;
            transform: scale(1.05);
        }

    </style>
</head>
<body>
   <form id="form1" runat="server">
        <div>
            <div class="container">
                <div class="logo-container">
                    <asp:Image ID="LogoImage" ImageUrl="~/resources/logo.png" runat="server" />
                </div>
                <div>
                    <h1 style="font-weight: 600; font-size: 50px;">Airline Reservation Hub</h1>
                </div>
                <div class="content-container" style="margin-left: 20px">
                    <h1 runat="server"><span>Book</span> Your</h1>
                    <h1 runat="server">Dream <span>Flights</span></h1>
                    <h1 runat="server">Now!</h1>
                    <p>
                       Welcome to our airline reservation system. Book your flights with ease and convenience. 
                       Whether it's a business trip or a vacation getaway, we have you covered with our wide range of destinations and flexible booking options. 
                       Enjoy a seamless travel experience with us!
                    </p>
                    <asp:Button ID="Button1" runat="server" Text="Login/SignUp" OnClick="btnSubmit_Click" />
                </div>
                <div class="image-container">
                    <asp:Image ID="Image1" ImageUrl="~/resources/home.png" runat="server" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>