Imports Core.DataAccess


Namespace Easygrants_Web.Controls.PageSection
Public Class cPrincipal_List
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'============================================================= 

	Protected trAdd as HtmlTableRow
    
'=============================================================
    Public overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)		
		MyBase.CoreCtl_Load(sender, e)
		
		dim aList as cDataObjectList = CType(Me.DataObjectCollection("GranteeProjectPI"), cDataObjectList)
        if aList.Count > 0 then
			trAdd.Visible = False
        end if
	End Sub   

'=============================================================
End Class 'cInternalReviewEditor
End Namespace