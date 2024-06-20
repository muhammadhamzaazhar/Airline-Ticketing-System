Imports System.Data.SqlClient
Partial Class Payment
    Inherits System.Web.UI.Page

    Dim connectionString As String = ConfigurationManager.ConnectionStrings("MyConnectionString").ConnectionString

    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("Auth") Is Nothing AndAlso Session("Auth") = False Then
            Response.Redirect("login.aspx")
        End If
        If Session("FlightDetailsEntered") Is Nothing OrElse Not CType(Session("FlightDetailsEntered"), Boolean) Then
            Response.Redirect("Flight.aspx")
        End If

        Session("AtPaymentPage") = True
    End Sub

    Private Sub insertpaymentdata(payment_ID As String, airport_ID As Integer, flight_ID As Integer, dbcnic As String, paymentMethod As String, accountNumber As String, cvv As String, expirationDate As String, cardholderName As String, billingAddress As String, InsertedAt As DateTime)
        Using connection As New SqlConnection(connectionString)
            Try
                connection.Open()

                Dim checkQuery As String = "SELECT COUNT(*) FROM PAYMENT_t WHERE Payment_ID = @Payment_ID"
                Using checkCommand As New SqlCommand(checkQuery, connection)
                    checkCommand.Parameters.AddWithValue("@Payment_ID", payment_ID)
                    Dim count As Integer = Convert.ToInt32(checkCommand.ExecuteScalar())
                    If count > 0 Then
                        lblmessage.Text = "Payment ID already exists. Please use a unique ID."
                        Return
                    End If
                End Using

                Dim query As String = "INSERT INTO PAYMENT_t (Payment_ID, Flight_ID, Airport_ID, CNIC, Paymentmethod, Accountnumber, CVV, "
                query &= "expirationdate, Cardholder, Billing_address, InsertedAt) "
                query &= "VALUES(@Payment_ID, @flight_ID, @airport_ID, @CNIC, @Paymentmethod, @Accountnumber, @cvv, @expiry_date, @cardholdername, @billingaddress, @InsertedAt);"
                Using command As New SqlCommand(query, connection)
                    command.Parameters.AddWithValue("@Payment_ID", payment_ID)
                    command.Parameters.AddWithValue("@flight_ID", flight_ID)
                    command.Parameters.AddWithValue("@airport_ID", airport_ID)
                    command.Parameters.AddWithValue("@CNIC", dbcnic)
                    command.Parameters.AddWithValue("@Paymentmethod", paymentMethod)
                    command.Parameters.AddWithValue("@Accountnumber", accountNumber)
                    command.Parameters.AddWithValue("@cvv", cvv)
                    command.Parameters.AddWithValue("@expiry_date", expirationDate)
                    command.Parameters.AddWithValue("@cardholdername", cardholderName)
                    command.Parameters.AddWithValue("@billingaddress", billingAddress)
                    command.Parameters.AddWithValue("@InsertedAt", InsertedAt)
                    command.ExecuteNonQuery()
                    connection.Close()
                    lblmessage.Text = "Flight added successfully."
                End Using
            Catch ex As Exception
                lblmessage.Text = "An error occurred while adding the passenger." & ex.Message
            End Try
        End Using
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim rand As New Random()
        Dim payment_ID As Integer = rand.Next(1, 100)

        Dim paymentMethod As String = String.Empty
        If Payment_Method.SelectedItem IsNot Nothing Then
            paymentMethod = Payment_Method.SelectedItem.Value
        End If
        Dim accountNumber As String = txtaccount.Text
        Dim cvv As String = txtCVV.Text
        Dim expirationDate As String = txtExpiration.Text
        Dim cardholderName As String = txtCardholderName.Text
        Dim billingAddress As String = txtBillingAddress.Text
        add_to_bill(paymentMethod)
        Dim insertedAt As DateTime = DateTime.UtcNow
        Dim dbcnic As String = CType(Session("CNIC"), String)
        Dim airport_ID As Integer = CType(Session("airport_ID"), Integer)
        Dim flight_ID As Integer = CType(Session("flight_ID"), Integer)
        insertpaymentdata(payment_ID, airport_ID, flight_ID, dbcnic, paymentMethod, accountNumber, cvv, expirationDate, cardholderName, billingAddress, insertedAt)
        Session("PaymentDetailsEntered") = True
        Response.Redirect("Checkout.aspx")
    End Sub

    Private Sub add_to_bill(paymentmethod As String)
        Dim total_bill As Integer = CType(Session("total_bill"), Integer)
        If paymentmethod = "visa" Then
            total_bill += 20000
        ElseIf paymentmethod = "master_card" Then
            total_bill += 18000
        ElseIf paymentmethod = "pay_pal" Then
            total_bill += 21000
        ElseIf paymentmethod = "bank_transfer" Then
            total_bill += 10000
        ElseIf paymentmethod = "credit_card" Then
            total_bill += 13000
        End If
        Session("total_bill") = total_bill
    End Sub

End Class
