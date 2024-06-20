Imports System.Data.SqlClient
Partial Class Flight
    Inherits System.Web.UI.Page
    Dim connectionString As String = ConfigurationManager.ConnectionStrings("MyConnectionString").ConnectionString

    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("Auth") Is Nothing OrElse Session("Auth").ToString() = "False" Then
            Response.Redirect("login.aspx")
        End If

        If Session("AirportDetailsEntered") Is Nothing OrElse Not CType(Session("AirportDetailsEntered"), Boolean) Then
            Response.Redirect("airport1.aspx")
        End If

        Session("AtFlightsPage") = True
    End Sub

    Private Sub insertflightdata(flight_ID As Integer, airport_ID As Integer, dbcnic As String, departuredate As DateTime, arrivaldate As DateTime, seat As String, InsertedAt As DateTime)
        Using connection As New SqlConnection(connectionString)
            Try
                connection.Open()
                Dim checkQuery As String = "SELECT COUNT(*) FROM FLIGHT_t WHERE Flight_ID = @Flight_ID"
                Using checkCommand As New SqlCommand(checkQuery, connection)
                    checkCommand.Parameters.AddWithValue("@Flight_ID", flight_ID)
                    Dim count As Integer = Convert.ToInt32(checkCommand.ExecuteScalar())
                    If count > 0 Then
                        lblmessage.Text = "Flight ID already exists. Please use a unique ID."
                        Return
                    End If
                End Using

                Dim query As String = "INSERT INTO FLIGHT_t (Flight_ID, CNIC, "
                query &= "Airport_ID, deperaturedate, arrivaldate, seat, InsertedAt) "
                query &= "VALUES(@Flight_ID, @airport_ID, @CNIC, @deperature, @arrival, @seat, @InsertedAt);"
                Using command As New SqlCommand(query, connection)
                    command.Parameters.AddWithValue("@Flight_ID", flight_ID)
                    command.Parameters.AddWithValue("@airport_ID", airport_ID)
                    command.Parameters.AddWithValue("@CNIC", dbcnic)
                    command.Parameters.AddWithValue("@deperature", departuredate)
                    command.Parameters.AddWithValue("@arrival", arrivaldate)
                    command.Parameters.AddWithValue("@seat", seat)
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
        Dim departureDate As Date
        Dim arrivalDate As Date

        If Date.TryParse(txtDeparturedate.Text, departureDate) AndAlso Date.TryParse(txtArrivaldate.Text, arrivalDate) Then
            Dim rand As New Random()
            Dim flight_ID As Integer = rand.Next(1, 100)

            Dim seat As String = String.Empty
            If chkClass.SelectedItem IsNot Nothing Then
                seat = chkClass.SelectedItem.Value
            End If

            add_to_bill(seat)
            Dim insertedAt As DateTime = DateTime.UtcNow
            Dim dbcnic As String = CType(Session("CNIC"), String)
            Dim airport_ID As Integer = CType(Session("airport_ID"), Integer)
            insertflightdata(flight_ID, airport_ID, dbcnic, departureDate, arrivalDate, seat, insertedAt)
            Session("FlightDetailsEntered") = True
            Session("flight_ID") = flight_ID
            Response.Redirect("Payment.aspx")
        Else
            lblmessage.Text = "Please enter valid dates."
        End If
    End Sub

    Private Sub add_to_bill(seat As String)
        Dim total_bill As Integer = CType(Session("total_bill"), Integer)
        If seat = "Economy" Then
            total_bill += 10000
        ElseIf seat = "Premium_Economy" Then
            total_bill += 15000
        ElseIf seat = "Business" Then
            total_bill += 30000
        ElseIf seat = "First_Class" Then
            total_bill += 50000
        End If
        Session("total_bill") = total_bill
    End Sub
End Class
