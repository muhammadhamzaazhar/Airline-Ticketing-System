Imports System.Data.SqlClient

Partial Class Forget_password
    Inherits System.Web.UI.Page
    Dim connectionString As String = ConfigurationManager.ConnectionStrings("MyConnectionString").ConnectionString

    Protected Sub btnChange_Click(sender As Object, e As EventArgs) Handles btnChange.Click
        Dim cnic As String = txtcnic.Text
        Dim password As String = txtPassword.Text
        Dim confirmpassword As String = txtConfirmPassword.Text

        If password = confirmpassword Then
            Using connection As New SqlConnection(connectionString)
                Try
                    connection.Open()
                    Dim query As String = "UPDATE USER_t SET user_password = @password WHERE CNIC = @cnic;"
                    Using commandupdate As New SqlCommand(query, connection)
                        commandupdate.Parameters.AddWithValue("@password", password)
                        commandupdate.Parameters.AddWithValue("@cnic", cnic)
                        commandupdate.ExecuteNonQuery()
                    End Using
                    lblmessage.Text = "Successfully changed password."
                Catch ex As Exception
                    lblmessage.Text = "An error occurred while changing the password."
                End Try
            End Using
        Else
            lblmessage.Text = "Passwords do not match. Please try again."
        End If
    End Sub

End Class
