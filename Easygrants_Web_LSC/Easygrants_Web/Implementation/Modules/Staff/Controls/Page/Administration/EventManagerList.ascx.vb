Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration

Public MustInherit Class cEventManagerList
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlDataList As cDataListCtl

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)

		MyBase.CoreCtl_Load(aSrc, aEvent)
		Dim aEventManagerEventsDOL As cDataObjectList = CType(DataObjectCollection("EventManagerEvents"), cDataObjectList)
		Dim aEventManagerEventsDO As cDataObject
		'Hide Delete button in the task list if there are no task assignments with status 1 or 2
		Dim aDeleteHash As Hashtable
		Dim aDeleteBtn As cCSSButton
		ctlDataList = FindControl("ctlDataList")
		
		If Not ctlDataList Is Nothing Then
			aDeleteHash = ctlDataList.DataListCtl_GetControlCollection("btnDelete")
			Dim aEventManagerEventsID As Integer
			For Each aEventManagerEventsDO In aEventManagerEventsDOL
				aEventManagerEventsID = aEventManagerEventsDO("EventManagerEventsID")
				aDeleteBtn = CType(aDeleteHash(aEventManagerEventsID), cCSSButton)
			If Not aDeleteBtn Is Nothing AndAlso (aEventManagerEventsDO.GetPropertyBool("IsActive", False) OrElse aEventManagerEventsDO.GetRelatedPropertyDataObjectList("WorkflowEvents").Count > 0) Then
					aDeleteBtn.Visible = False
				End If
			Next
		End If
	End Sub

End Class

End Namespace