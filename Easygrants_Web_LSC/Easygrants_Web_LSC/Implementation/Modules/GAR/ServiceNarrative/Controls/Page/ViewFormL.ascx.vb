Imports Core.DataAccess


Namespace Implementation.Modules.GAR.ServiceNarrative.Controls.Page
    Public Class cViewFormL
        Inherits Core_Web.Controls.Base.cLSCDataPresenterCtl



        Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            MyBase.CoreCtl_Load(aSrc, aEvent)
            Dim aList As cDataObjectList = DataObjectCollection("SubmittedFile")
            If aList.Count > 0 Then
                Dim aSFID As String = aList(0).GetPropertyString("SubmittedFileID")
                Response.Redirect("/EasyGrants_Web_LSC/Core/Controls/Base/pgUploadReader.aspx?SubmittedFileID=" + aSFID)
            End If
        End Sub
    End Class
End Namespace
