Imports System.Diagnostics
Imports System.Web.UI
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User

Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cContactCategory_Editor
	Inherits Core_Web.Controls.Base.cDataObjectEditor
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		DataObjectCollectionKey = "ContactCategory"
		PrimaryKeyPropertyID = "ContactCategoryID"
		
		mybase.CoreCtl_Load(aSrc, aEvent)
	End Sub	
	
'=============================================================
End Class
End Namespace