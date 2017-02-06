Imports System.Xml
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.Page.QueryTool

Public Class cPersistQueryInfo
     Inherits Core_Web.Controls.Base.cDataPresenterCtl
    
     
'========================================================
	'Protected lnkView As cLink
	Protected mFieldsList as SortedList
'========================================================


	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		
		'lnkView.Set_ServerClick(AddressOf lnkView_Click)
	End Sub
	
	
	Public Overridable Sub PersistQueryInfo(ByVal aPageKey as String)
	End Sub


	Public Overridable Sub btnView_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)   
    End Sub
	
	Public Overridable Sub btnReturn_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)   
    End Sub
    
   
	
'=============================================================

End Class
End Namespace