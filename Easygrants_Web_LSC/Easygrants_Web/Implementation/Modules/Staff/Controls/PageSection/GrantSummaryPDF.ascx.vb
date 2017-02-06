Imports System.Diagnostics
Imports System.Web.UI
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core.Web
Imports System.Text
Imports Core.Web.SvrCtls

Namespace Easygrants_Web.Modules.Staff.Controls.PageContent
Public MustInherit Class cGrantSummaryPDF
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

	Protected tbPDF as HtmlTable
	Protected ctlDefinition As cDropDown
	Protected trViewPDF As HtmlTableRow
	
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		ctlDefinition = CType(Me.FindControl("ctlDefinition"), cDropDown)
		ctlDefinition.Set_ServerIndexChange(AddressOf AddFilter)

		if ctype(me.DataObjectCollection("AppWfTA"), cDataObjectList).Count > 0 then
			tbPDF.Visible = True
		end if
		
		ConfigureDropDown()
		
		If ctlDefinition.SelectedValue = "" Then
			trViewPDF.Visible = False
		End If
		
	End Sub

'-------------------------------------------------------------

	Private Sub AddFilter(ByVal sender As System.Object, ByVal e As System.EventArgs)
		me.Response.Redirect(cWebLib.AddQuerystringParameter(me.Request.RawUrl(), "DefinitionID", ctlDefinition.SelectedValue))
	End Sub
'-------------------------------------------------------------

	Private Sub ConfigureDropDown
		'Configuration filters on DataObjectCollections only consider the first record in the
		'collection, so we have to apply the filter for the dropdown manually.

		Dim aWfTaskAssignmentList As cDataObjectList
		Dim aWfProjectPDFList As cDataObjectList
		Dim aWfProjectPDF As cDataObject
		Dim aReportOutputDefinitionList As cDataObjectList
		Dim aReportOutputDefinition As cDataObject
		Dim aTempReportOutputDefinitionList As cDataObjectList
		Dim aItem As ListItem
		Dim aFound As Boolean
		Dim aIndex As Integer
		
		ctlDefinition = CType(Me.FindControl("ctlDefinition"), cDropDown)
		
		'If there are no PDF types or no wftas, just show <None>
		aWfTaskAssignmentList = DataObjectCollection("AppWfTA")
		If (aWfTaskAssignmentList.Count = 0) Or (ctlDefinition.BaseControl.Items.Count = 0) Then
			ctlDefinition.BaseControl.Items.Clear()
			aItem = new ListItem("<None>", "")
			ctlDefinition.BaseControl.Items.Add(aItem)
			Return
		End If		
		
		'Get all the ReportOutputDefinition records whose Key is one of the
		'FinalPDFReportKeys of our project
		aWfProjectPDFList = DataObjectCollection("WfProjectPDF")
		aReportOutputDefinitionList = new cDataObjectList(WebSession.DataObjectFactory)
		For Each aWfProjectPDF In aWfProjectPDFList
			aTempReportOutputDefinitionList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReportOutputDefinition", "Key", aWfProjectPDF.GetPropertyString("FinalPDFReportKey"))
			aReportOutputDefinitionList.AddList(aTempReportOutputDefinitionList)
		Next

		'Remove from the DropDown any items whose ReportOutputDefinitionID is not in our list		
		For aIndex = ctlDefinition.BaseControl.Items.Count - 1 To 0 Step -1
			aItem = ctlDefinition.BaseControl.Items(aIndex)
			aFound = False
			For Each aReportOutputDefinition In aReportOutputDefinitionList
				If aItem.Value = aReportOutputDefinition.GetPropertyString("ReportOutputDefinitionID") Then
					aFound = True
				End If				
			Next
			If Not aFound Then
				ctlDefinition.BaseControl.Items.Remove(aItem)
			End If			
		Next
		
	End Sub
	
'=============================================================

	Protected Overrides Sub OnPreRender(e As EventArgs)
		MyBase.OnPreRender(e)
		
		If tbPDF.Visible And (Request.QueryString("DefinitionID") Is Nothing) And (Not ctlDefinition.SelectedValue = "") Then
			AddFilter(new Object(), new EventArgs())
		End If		

	End Sub		
'=============================================================

End Class
End Namespace