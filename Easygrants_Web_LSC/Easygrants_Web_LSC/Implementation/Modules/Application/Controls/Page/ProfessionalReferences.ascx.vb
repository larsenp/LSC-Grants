Imports System.Xml
Imports System.Web.UI.HtmlControls
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Implementation.Modules.Application

Public Class cProfessionalReferences
	Inherits Easygrants_Web.Controls.Base.cWfTADataPresenterCtl

	Protected spnAdd As HtmlGenericControl
	Protected spnNoAdd As HtmlGenericControl

		'Enforce upper limit on number of references provided
		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			Dim aRefList As cDataObjectList = DataObjectCollection("References")
			Dim aRefEl As XmlElement = Me.mXMLDoc.DocElement.SelectSingleNode("ProfessionalReferences")
			Dim aRefLimit As Integer = cXMLDoc.AttributeToInt(aRefEl, "MaxCount", -1)
			If aRefLimit = -1 Then Exit Sub
			If aRefList.Count >= aRefLimit Then
				spnAdd.Visible = False
				spnNoAdd.Visible = True
			End If
		End Sub

End Class
End Namespace