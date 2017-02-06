Imports System.Xml
Imports Core.DataAccess.XMLAccess
Imports Core.DataAccess
Imports Core.Util

Namespace Core_Web.Controls.Base
Public Class cDocumentListCtl
    Inherits Core_Web.Controls.Base.cDataListCtl
'====================================================
#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region
'====================================================
 
    Protected Overrides Function Column_Should_Display(ByVal aDisplayPropertyNode As XmlNode) As Boolean		
		Dim aPropertyKey as String
		Dim aDesc As String		
		Dim aDataObject As cDataObject
		
		aPropertyKey = cXMLDoc.AttributeToString(aDisplayPropertyNode, "PropertyKey", "")
		select case aPropertyKey
			case "Description"
				aDesc = MyBase.EventController_GetArgumentValue(aDisplayPropertyNode, aDataObject)				
				if aDesc = "True" then
					return True
				else
					return False
				End If				
			case else
				return mybase.Column_Should_Display(aDisplayPropertyNode)
		End Select		
					
	End Function    

'====================================================	
End Class
End Namespace
