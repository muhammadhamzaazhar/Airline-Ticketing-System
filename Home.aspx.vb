Partial Class Home
    Inherits System.Web.UI.Page
    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("login.aspx")
    End Sub
End Class
