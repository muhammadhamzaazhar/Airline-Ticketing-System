<%@ Application Language="VB" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

<script runat="server">
    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("MyConnectionString").ConnectionString

        Dim dbcnic As String = CType(Session("CNIC"), String)

        If Not String.IsNullOrEmpty(dbcnic) Then
            DeleteUserRelatedData(dbcnic, connectionString)
        End If
    End Sub

    Private Sub DeleteUserRelatedData(dbcnic As String, connectionString As String)
        Using connection As New SqlConnection(connectionString)
            Try
                connection.Open()

                Dim deleteAirportQuery As String = "DELETE FROM AIRPORT_t WHERE CNIC = @CNIC AND InsertedAt = (SELECT MAX(InsertedAt) FROM AIRPORT_t WHERE CNIC = @CNIC)"
                Using airportCommand As New SqlCommand(deleteAirportQuery, connection)
                    airportCommand.Parameters.AddWithValue("@CNIC", dbcnic)
                    airportCommand.ExecuteNonQuery()
                End Using

                Dim deleteFlightQuery As String = "DELETE FROM FLIGHT_t WHERE CNIC = @CNIC AND InsertedAt = (SELECT MAX(InsertedAt) FROM FLIGHT_t WHERE CNIC = @CNIC)"
                Using flightCommand As New SqlCommand(deleteFlightQuery, connection)
                    flightCommand.Parameters.AddWithValue("@CNIC", dbcnic)
                    flightCommand.ExecuteNonQuery()
                End Using

                Dim deletePaymentQuery As String = "DELETE FROM PAYMENT_t WHERE CNIC = @CNIC AND InsertedAt = (SELECT MAX(InsertedAt) FROM FLIGHT_t WHERE CNIC = @CNIC)"
                Using flightCommand As New SqlCommand(deletePaymentQuery, connection)
                    flightCommand.Parameters.AddWithValue("@CNIC", dbcnic)
                    flightCommand.ExecuteNonQuery()
                End Using

            Catch ex As Exception

            End Try
        End Using
    End Sub
</script>
