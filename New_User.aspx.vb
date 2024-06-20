Imports System.Data.SqlClient
Imports System.Security.Cryptography

Partial Class New_User
    Inherits System.Web.UI.Page

    Dim connectionString As String = ConfigurationManager.ConnectionStrings("MyConnectionString").ConnectionString

    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Dim firstname As String = txtFirstName.Text.Trim()
            Dim lastname As String = txtLastName.Text.Trim()
            Dim cnic As String = txtcnic.Text.Trim()
            Dim email As String = txtEmail.Text.Trim()
            Dim gender As String = String.Empty
            If chkGender.SelectedItem IsNot Nothing Then
                gender = chkGender.SelectedItem.Value
            End If
            Dim city As String = txtcity.Text.Trim()
            Dim province As String = String.Empty
            If ddlprovince.SelectedItem IsNot Nothing Then
                province = ddlprovince.SelectedItem.Value
            End If
            Dim postalcode As String = txtpostalcode.Text.Trim()
            Dim username As String = txtUsername.Text.Trim()
            Dim password As String = txtPassword.Text.Trim()
            Dim confirmpassword As String = txtConfirmPassword.Text.Trim()

            If password = confirmpassword Then
                Dim hashedPassword As String = HashPassword(password)
                If insertuser(firstname, lastname, cnic, email, gender, city, province, postalcode, username, hashedPassword) Then
                    Response.Redirect("login.aspx")
                Else
                    lblmessage.ForeColor = System.Drawing.Color.Red
                    lblmessage.Text = "An error occurred while adding the user."
                End If
            Else
                lblmessage.ForeColor = System.Drawing.Color.Red
                lblmessage.Text = "Passwords do not match."
            End If
        End If
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click

    End Sub

    Private Function insertuser(firstname As String, lastname As String, cnic As String, email As String, gender As String, city As String, province As String, postalcode As String, username As String, hashedPassword As String) As Boolean
        Using connection As New SqlConnection(connectionString)
            Try
                connection.Open()
                Dim query As String = "INSERT INTO USER_T (Firstname, Lastname, CNIC, Email, Gender, City, Province, Postal_code, Username, user_password) " &
                                      "VALUES(@Firstname, @Lastname, @CNIC, @Email, @Gender, @City, @Province, @Postal_code, @Username, @user_password);"
                Using command As New SqlCommand(query, connection)
                    command.Parameters.AddWithValue("@Firstname", firstname)
                    command.Parameters.AddWithValue("@Lastname", lastname)
                    command.Parameters.AddWithValue("@CNIC", cnic)
                    command.Parameters.AddWithValue("@Email", email)
                    command.Parameters.AddWithValue("@Gender", gender)
                    command.Parameters.AddWithValue("@City", city)
                    command.Parameters.AddWithValue("@Province", province)
                    command.Parameters.AddWithValue("@Postal_code", postalcode)
                    command.Parameters.AddWithValue("@Username", username)
                    command.Parameters.AddWithValue("@user_password", hashedPassword)
                    command.ExecuteNonQuery()
                    Return True
                End Using
            Catch ex As Exception
                lblmessage.ForeColor = System.Drawing.Color.Red
                lblmessage.Text = "An error occurred while adding the passenger" & ex.Message
                Return False
            End Try
        End Using
    End Function

    Private Function HashPassword(password As String) As String
        Using hmac As New HMACSHA256()
            Dim salt As Byte() = hmac.Key
            Dim hash As Byte() = hmac.ComputeHash(Encoding.UTF8.GetBytes(password))
            Return Convert.ToBase64String(salt) & ":" & Convert.ToBase64String(hash)
        End Using
    End Function

    Protected Sub btnSign_in_Click(sender As Object, e As EventArgs) Handles btnSign_in.Click

    End Sub
End Class
