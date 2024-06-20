Partial Class Logout
    Inherits System.Web.UI.UserControl

    Protected Sub btnLogout_Click(ByVal sender As Object, ByVal e As EventArgs)
        Session.Clear()
        Session.Abandon()
        Response.Redirect("login.aspx")
    End Sub
End Class
