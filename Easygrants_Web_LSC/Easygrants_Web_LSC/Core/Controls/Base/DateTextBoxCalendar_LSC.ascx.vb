Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess


Namespace Core_Web.Controls.Base
Public Class cDateTextBoxCalendar_LSC
	Inherits cDateTextBoxCalendar

	Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
		Dim aPropertyKey As String

		aPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey").ToString()
		If (Not aDataObject Is Nothing) AndAlso (Not IsDBNull(aDataObject(aPropertyKey))) Then
			myDate = aDataObject(aPropertyKey)
		Else
			myDate = Nothing
		End If
	End Sub

End Class
End Namespace
