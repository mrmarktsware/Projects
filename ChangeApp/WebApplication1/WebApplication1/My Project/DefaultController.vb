Imports System.Web.Mvc

Namespace MyProject
    Public Class DefaultController
        Inherits Controller

        ' GET: Default
        Function Index() As ActionResult
            Return View()
        End Function
    End Class
End Namespace