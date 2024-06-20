Imports System.Data.SqlClient
Imports System.Data
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports System.IO

Partial Class Checkout
    Inherits System.Web.UI.Page
    Dim connectionString As String = ConfigurationManager.ConnectionStrings("MyConnectionString").ConnectionString

    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("Auth") Is Nothing AndAlso Session("Auth") = False Then
            Response.Redirect("login.aspx")
        End If
        If Session("PaymentDetailsEntered") Is Nothing OrElse Not CType(Session("PaymentDetailsEntered"), Boolean) Then
            Response.Redirect("payment.aspx")
        End If

        Session("AtCheckoutPage") = True

    End Sub

    Protected Sub btnCheck_Click(sender As Object, e As EventArgs) Handles btnCheck.Click
        Dim rand As New Random()
        Dim Ticket_ID As Integer = rand.Next(1, 100)
        Dim dbcnic As String = CType(Session("CNIC"), String)
        Dim total_bill As Integer = CType(Session("total_bill"), Integer)
        Dim airport_ID As Integer = CType(Session("airport_ID"), Integer)
        Dim flight_ID As Integer = CType(Session("flight_ID"), Integer)
        insertairportdata(Ticket_ID, dbcnic, flight_ID, airport_ID, total_bill)
        Session("Ticket_ID") = Ticket_ID
        lblmessage.Text = "The total bill of Person with cnic (" & dbcnic & ") is Rs " & total_bill
        LoadTicketdetails(Ticket_ID)
        ' Clear the session variables indicating incomplete transaction
        Session("AtAirportPage") = Nothing
        Session("AirportDetailsEntered") = Nothing
        Session("AtFlightsPage") = Nothing
        Session("FlightDetailsEntered") = Nothing
        Session("AtPaymentPage") = Nothing
        Session("PaymentDetailsEntered") = Nothing
        Session("AtCheckoutPage") = Nothing
    End Sub

    Protected Sub btnPrint_Click(sender As Object, e As EventArgs) Handles btnPrint.Click
        If Session("Ticket_ID") IsNot Nothing Then
            Dim Ticket_ID As Integer
            If Integer.TryParse(Session("Ticket_ID").ToString(), Ticket_ID) Then
                GeneratePDF(Ticket_ID)
            Else
                lblmessage.Text = "Invalid Ticket ID found."
            End If
        Else
            lblmessage.Text = "No Ticket ID found to print."
        End If
    End Sub

    Private Sub insertairportdata(Ticket_ID As Integer, dbcnic As String, flight_ID As Integer, airport_ID As Integer, total_bill As Integer)
        Using connection As New SqlConnection(connectionString)
            Try
                connection.Open()

                Dim checkQuery As String = "SELECT COUNT(*) FROM TICKET_t WHERE Ticket_ID = @Ticket_ID;"
                Using checkCommand As New SqlCommand(checkQuery, connection)
                    checkCommand.Parameters.AddWithValue("@Ticket_ID", Ticket_ID)
                    Dim count As Integer = Convert.ToInt32(checkCommand.ExecuteScalar())
                    If count > 0 Then
                        lblmessage.Text = "Ticket ID already exists. Please use a unique ID."
                        Return
                    End If
                End Using

                Dim query As String = "INSERT INTO TICKET_t (Ticket_ID, CNIC, Flight_ID, Airport_ID, Total_price)"
                query &= "VALUES(@Ticket_ID, @CNIC, @flight_ID, @airport_ID, @Total_price);"
                Using command As New SqlCommand(query, connection)
                    command.Parameters.AddWithValue("@Ticket_ID", Ticket_ID)
                    command.Parameters.AddWithValue("@CNIC", dbcnic)
                    command.Parameters.AddWithValue("@flight_ID", flight_ID)
                    command.Parameters.AddWithValue("@airport_ID", airport_ID)
                    command.Parameters.AddWithValue("@Total_Price", total_bill)
                    command.ExecuteNonQuery()
                    connection.Close()
                    lblmessage.Text = "Ticket added successfully."
                End Using
                'Return
            Catch ex As Exception
                lblmessage.Text = "An error occurred while adding the passenger." & ex.Message
            End Try
        End Using
    End Sub

    Private Sub LoadTicketdetails(Ticket_ID As Integer)
        Using connection As New SqlConnection(connectionString)
            Try
                connection.Open()
                Dim query As String = "SELECT * FROM CHECKOUT WHERE Ticket_ID = @Ticket_ID;"
                Using command As New SqlCommand(query, connection)
                    command.Parameters.AddWithValue("@Ticket_ID", Ticket_ID)
                    Dim adapter As New SqlDataAdapter(command)
                    Dim dt As New DataTable()
                    adapter.Fill(dt)
                    GridView1.DataSource = dt
                    GridView1.Visible = True
                    GridView1.DataBind()
                End Using
            Catch ex As Exception
                lblmessage.Text = "Error " & ex.Message
            End Try
            connection.Close()
        End Using
    End Sub

    Private Sub GeneratePDF(Ticket_ID As Integer)
        Using connection As New SqlConnection(connectionString)
            Try
                connection.Open()
                Dim query As String = "SELECT * FROM CHECKOUT WHERE Ticket_ID = @Ticket_ID;"
                Using command As New SqlCommand(query, connection)
                    command.Parameters.AddWithValue("@Ticket_ID", Ticket_ID)
                    Using reader As SqlDataReader = command.ExecuteReader()
                        If reader.HasRows Then
                            reader.Read()
                            ' Create a PDF document
                            Dim doc As New Document()
                            Dim output As New MemoryStream()
                            PdfWriter.GetInstance(doc, output)
                            doc.Open()

                            ' Add content to the PDF
                            doc.Add(New Paragraph("Checkout Summary"))
                            doc.Add(New Paragraph("Ticket ID: " & reader("Ticket_ID").ToString()))
                            doc.Add(New Paragraph("First Name: " & reader("Firstname").ToString()))
                            doc.Add(New Paragraph("Last Name: " & reader("Lastname").ToString()))
                            doc.Add(New Paragraph("CNIC: " & reader("CNIC").ToString()))
                            doc.Add(New Paragraph("Airport Name: " & reader("Airport_name").ToString()))
                            doc.Add(New Paragraph("Destination: " & reader("Dest").ToString()))
                            doc.Add(New Paragraph("Airline: " & reader("Airline").ToString()))
                            doc.Add(New Paragraph("Flight No: " & reader("Flight_ID").ToString()))
                            doc.Add(New Paragraph("Departure Date: " & reader("deperaturedate").ToString()))
                            doc.Add(New Paragraph("Arrival Date: " & reader("arrivaldate").ToString()))
                            doc.Add(New Paragraph("Payment ID: " & reader("Payment_ID").ToString()))
                            doc.Add(New Paragraph("Payment Method: " & reader("Paymentmethod").ToString()))
                            doc.Add(New Paragraph("Account Number: " & reader("Accountnumber").ToString()))
                            doc.Close()

                            Response.ContentType = "application/pdf"
                            Response.AddHeader("content-disposition", "attachment;filename=CheckoutSummary.pdf")
                            Response.BinaryWrite(output.ToArray())
                            Response.End()
                        Else
                            lblmessage.Text = "No details found for the provided Ticket ID."
                        End If
                    End Using
                End Using
            Catch ex As Exception
                lblmessage.Text = "Error " & ex.Message
            End Try
        End Using

    End Sub
End Class
