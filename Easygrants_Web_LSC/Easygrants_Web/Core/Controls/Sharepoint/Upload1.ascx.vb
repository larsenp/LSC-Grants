Imports System.Xml
Imports System.IO
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core.Web.Modules
Imports System.Text
Imports EasyGrants.Web.User
Imports Core.DataAccess.DBAccess
Imports Core_Web.Controls.Base
Imports EasyGrants.Web

Namespace Core_Web.Controls.Sharepoint
    <ValidationPropertyAttribute("EntityAssocID")> Public MustInherit Class cUpload1
        Inherits Core_Web.Controls.Base.cUpload1

	   Protected trUploadControl As HtmlTableRow

		Public Overrides Sub CoreCtl_Configure(ByVal aDisplayControlNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
			UploadValidator = New cSpUploadValidator(WebSession, upl1.ID)
			MyBase.CoreCtl_Configure(aDisplayControlNode, aDataObjectList)
			If WebSession.HasStaffUser Then
				If Not SubmittedFileObj Is Nothing AndAlso SubmittedFileID > 0 Then
					trUploadControl.Visible = False
				End If
			End If
		End Sub

        '----------------------------------------------------
	End Class
End Namespace