Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.Web.Modules
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports Core.Web
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.DataAccess

Namespace Easygrants_Web.Controls.PageSection
    Public Class cContact_Notes_View
        Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'==================================================================================

  Protected Overloads Overrides Sub RenderControls(ByRef aDisplayPropertyNodeList As XmlNodeList, ByVal aDataObjectList As cDataObjectList, ByVal aIndex As Integer)
		
		if aDataObjectList(aIndex).PrimaryKey = "NotesID" then
			if aDataObjectList(aIndex).GetPropertyString("Notes").Length > 250 then
				aDataObjectList(aIndex)("Notes") = aDataObjectList(aIndex).GetPropertyString("Notes").Substring(0, 250) + "..."
			end if
		end if
		
		MyBase.RenderControls(aDisplayPropertyNodeList, aDataObjectList, aIndex)
	End Sub    	
	
''-------------------------------------------------------------------------------------

        Public Sub DelMethod(ByVal NotesID As String)
            MyBase.EventController_Delete("Notes", NotesID)
            CorePage.Redirect()
        End Sub
        
'======================================================================================

    End Class
End Namespace