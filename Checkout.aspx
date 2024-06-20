<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Checkout.aspx.vb" Inherits="Checkout" %>
<%@ Register Src="~/Logout.ascx" TagName="Logout" TagPrefix="uc1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Checkout</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <style>
        .logout-button-container {
            position: absolute;
            top: 20px;
            right: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <div class="logout-button-container">
            <uc1:Logout ID="LogoutControl" runat="server" />
        </div>
        <h2 class="text-center form-header mb-3">Checkout Summary</h2>
        <div class="mb-4">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped" Visible="false">
                <Columns>
                    <asp:BoundField DataField="Firstname" HeaderText="First name" />
                    <asp:BoundField DataField="Lastname" HeaderText="Last name" />
                    <asp:BoundField DataField="CNIC" HeaderText="CNIC" />
                    <asp:BoundField DataField="Airport_name" HeaderText="Airport name" />
                    <asp:BoundField DataField="Dest" HeaderText="Destination" />
                    <asp:BoundField DataField="Airline" HeaderText="Airline" />
                    <asp:BoundField DataField="Flight_ID" HeaderText="Flight No" />
                    <asp:BoundField DataField="deperaturedate" HeaderText="Departure Date" />
                    <asp:BoundField DataField="arrivaldate" HeaderText="Arrival Date" />
                    <asp:BoundField DataField="Payment_ID" HeaderText="Payment Id" />
                    <asp:BoundField DataField="Paymentmethod" HeaderText="Payment Method" />
                    <asp:BoundField DataField="Accountnumber" HeaderText="Account number" />
                    <asp:BoundField DataField="Ticket_ID" HeaderText="Ticket Number" />
                </Columns>
            </asp:GridView>
        </div>

        <div class="text-center mb-3">
            <asp:Button ID="btnCheck" runat="server" Text="Display bill" OnClick="btnCheck_Click" CssClass="btn btn-primary" />
            <asp:Button ID="btnPrint" runat="server" Text="Print Bill" OnClick="btnPrint_Click" CssClass="btn btn-secondary" />
        </div>

        <div class="text-center">
            <asp:Label ID="lblmessage" runat="server"></asp:Label>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YTXcFn3E4QVRlNPl2gG0WOV5OB5UtSzG1hRZx62GRmndYfZCq4hwn6AfsBd0gl2k" crossorigin="anonymous"></script>
</body>
</html>
