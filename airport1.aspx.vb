Imports System.Data.SqlClient
Partial Class airport1
    Inherits System.Web.UI.Page
    Dim connectionString As String = ConfigurationManager.ConnectionStrings("MyConnectionString").ConnectionString

    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("Auth") Is Nothing AndAlso Session("Auth") = False Then
            Response.Redirect("login.aspx")
        End If
        Session("AtAirportPage") = True
    End Sub

    Private Sub insertairportdata(airport_ID As Integer, dbcnic As String, airport As String, dest As String, airline As String, InsertedAt As DateTime)
        Using connection As New SqlConnection(connectionString)
            Try
                connection.Open()
                Dim checkQuery As String = "SELECT COUNT(*) FROM AIRPORT_t WHERE Airport_ID = @Airport_ID"
                Using checkCommand As New SqlCommand(checkQuery, connection)
                    checkCommand.Parameters.AddWithValue("@Airport_ID", airport_ID)
                    Dim count As Integer = Convert.ToInt32(checkCommand.ExecuteScalar())
                    If count > 0 Then
                        lblmessage.Text = "Airport ID already exists. Please use a unique ID."
                        Return
                    End If
                End Using

                Dim query As String = "INSERT INTO AIRPORT_t (Airport_ID, CNIC, "
                query &= "Airport_name, Dest, Airline, InsertedAt) "
                query &= "VALUES(@Airport_ID, @CNIC, @Airport_name, @Dest, @Airline, @InsertedAt);"
                Using command As New SqlCommand(query, connection)
                    command.Parameters.AddWithValue("@Airport_ID", airport_ID)
                    command.Parameters.AddWithValue("@CNIC", dbcnic)
                    command.Parameters.AddWithValue("@Airport_name", airport)
                    command.Parameters.AddWithValue("@Dest", dest)
                    command.Parameters.AddWithValue("@Airline", airline)
                    command.Parameters.AddWithValue("@InsertedAt", InsertedAt) ' Pass DateTime object
                    command.ExecuteNonQuery()
                    connection.Close()
                    lblmessage.Text = "Passenger added successfully."
                End Using
            Catch ex As Exception
                lblmessage.Text = "An error occurred while adding the passenger." & ex.Message
            End Try
        End Using
    End Sub

    Protected Sub btnProceed_Click(sender As Object, e As EventArgs) Handles btnProceed.Click
        Dim rand As New Random()
        Dim airport_ID As Integer = rand.Next(1, 100)

        Dim airport As String = String.Empty
        If Airport_name.SelectedItem IsNot Nothing Then
            airport = Airport_name.SelectedItem.Value
        End If
        Dim dest As String = String.Empty
        If Destination.SelectedItem IsNot Nothing Then
            dest = Destination.SelectedItem.Value
        End If
        Dim airline As String = String.Empty
        If Airline_name.SelectedItem IsNot Nothing Then
            airline = Airline_name.SelectedItem.Value
        End If
        add_to_bill(dest, airline)
        Dim insertedAt As DateTime = DateTime.UtcNow
        Dim dbcnic As String = CType(Session("CNIC"), String)
        insertairportdata(airport_ID, dbcnic, airport, dest, airline, insertedAt)
        Session("AirportDetailsEntered") = True
        Session("airport_ID") = airport_ID
        Response.Redirect("Flight.aspx")
    End Sub


    Private Sub add_to_bill(dest As String, airline As String)
        Dim total_bill As Integer = 0
        If dest = "Barcelona" Then
            total_bill += 110431
        ElseIf dest = "Dubai" Then
            total_bill += 77259
        ElseIf dest = "Rome" Then
            total_bill += 186016
        ElseIf dest = "Bali" Then
            total_bill += 287076
        ElseIf dest = "Sydney" Then
            total_bill += 332492
        ElseIf dest = "Saudi_Arabia" Then
            total_bill += 135202
        End If

        If airline = "Qatar_airways" Then
            total_bill += 100000

        ElseIf airline = "PIA" Then
            total_bill += 35000

        ElseIf airline = "Air_canada" Then
            total_bill += 75000

        ElseIf airline = "Turkish_airlines" Then
            total_bill += 45000

        ElseIf airline = "Emirates" Then
            total_bill += 120000

        ElseIf airline = "Saudi_airline" Then
            total_bill += 90000

        ElseIf airline = "Airblue" Then
            total_bill += 130000
        End If
        Session("total_bill") = total_bill
    End Sub
End Class
