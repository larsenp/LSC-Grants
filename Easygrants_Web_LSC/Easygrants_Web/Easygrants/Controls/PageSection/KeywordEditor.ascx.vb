Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Controls.PageSection
Public Class cKeywordEditor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
	
'============================================================= 

    Public Function ValidateOther(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs) As Boolean
	    Dim ctlArea As cDropDown
        ctlArea = CType(FindControl("ctlArea"), cDropDown)
	    Dim ctlAreaOther As cTextBox
        ctlAreaOther = CType(FindControl("ctlAreaOther"), cTextBox)
        
        If ctlArea.SelectedText = "Other" And ctlAreaOther.Value.Trim = "" Then
			Return False
		Else
			Return True
		End If        
   End Function

'============================================================= 

End Class 'cKeywordEditor
End Namespace