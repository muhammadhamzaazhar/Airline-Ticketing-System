Imports System.Data.SqlClient
Imports System.Security.Cryptography
Imports System.Data

Partial Class login
    Inherits System.Web.UI.Page
    Dim connectionString As String = ConfigurationManager.ConnectionStrings("MyConnectionString").ConnectionString

    Protected Sub btnSign_in_Click(sender As Object, e As EventArgs) Handles btnSign_in.Click
        Dim username As String = txtusername.Text
        Dim password As String = txtpassword.Text

        Try
            If ValidateUser(username, password) Then
                Session("Auth") = True
                Response.Redirect("airport1.aspx")
            Else
                lblmessage.Text = "Invalid username or password."
            End If
        Catch ex As Exception
            lblmessage.Text = "An error occurred while checking credentials."
        End Try
    End Sub

    Private Function ValidateUser(username As String, password As String) As Boolean
        Dim query As String = "SELECT user_password, CNIC FROM USER_t WHERE Username = @Username;"
        Using connection As New SqlConnection(connectionString)
            Try
                connection.Open()
                Using command As New SqlCommand(query, connection)
                    command.Parameters.Add("@Username", SqlDbType.VarChar, 50).Value = username
                    Using reader As SqlDataReader = command.ExecuteReader()
                        If reader.HasRows Then
                            While reader.Read()
                                Dim dbPassword As String = reader("user_password").ToString()
                                Dim dbcnic As String = reader("CNIC").ToString()
                                If VerifyHashedPassword(dbPassword, password) Then
                                    Session("CNIC") = dbcnic
                                    Return True
                                End If
                            End While
                        End If
                    End Using
                End Using
            Catch ex As Exception
                lblmessage.Text = "An error occurred while checking credentials."
            End Try
        End Using
        Return False
    End Function

    Private Function VerifyHashedPassword(storedHash As String, password As String) As Boolean
        Dim parts As String() = storedHash.Split(":"c)
        Dim salt As Byte() = Convert.FromBase64String(parts(0))
        Dim hash As Byte() = Convert.FromBase64String(parts(1))
        Using hmac As New HMACSHA256(salt)
            Dim computedHash As Byte() = hmac.ComputeHash(Encoding.UTF8.GetBytes(password))
            Return computedHash.SequenceEqual(hash)
        End Using
    End Function

    Protected Sub btnSign_up_Click(sender As Object, e As EventArgs) Handles btnSign_up.Click
        Response.Redirect("New_User.aspx")
    End Sub
End Class
