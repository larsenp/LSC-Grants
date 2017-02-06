Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports EasyGrants.Web



Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cToDoList_Applicant
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlNewWindowOpener As cNewWindowOpener
	Protected ctlToDoListApplicant As cDataListCtl
	Protected aButtonHash As Hashtable
'========================================================================
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		'Here we are Updating the Href of the Links , before we use to Open a new window with NewWindowControl , but now we are opening a New window with Target=_blank
		Dim aWFTaskAssignmentDO As cDataObject
		Dim aEntityID As Integer
		Dim aDefinitionID As Integer
		Dim aGetButtonID As Integer
		Dim aButton As cLink
		Dim aWFTaskAssignmentList As cDataObjectList = CType(DataObjectCollection("WfTaskAssignmentCalculatedDates"), cDataObjectList)
		ctlToDoListApplicant = FindControl("ctlToDoListApplicant")
		aButtonHash = ctlToDoListApplicant.DataListCtl_GetControlCollection("btnView")
		For Each aWFTaskAssignmentDO In aWFTaskAssignmentList
			aEntityID = aWFTaskAssignmentDO.GetRelatedPropertyInt("WfTaskAssignment.WfTaskAssignmentID", 0)
			aDefinitionID = aWFTaskAssignmentDO.GetRelatedPropertyInt("WfTaskAssignment.WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID", 0)
			aGetButtonID = aWFTaskAssignmentDO.GetRelatedPropertyInt("WfTaskAssignment.WfTaskAssignmentID")
			aButton = CType(aButtonHash(aGetButtonID), cLink)
			If Not aButton Is Nothing Then
				Dim aUrl As String = WebAppl.Build_RootURL("Core/Controls/Base/pgReportOutputReader.aspx")
				aButton.Href = aUrl & "?EntityID=" & aEntityID & "&DefinitionID=" & aDefinitionID
				aButton.Add_Attribute("class", "CSSButtonStyle")
			End If
		Next

	End Sub

	Public Sub ViewAppPDF(ByVal aEntityID As String, ByVal aDefinitionID As String)
		Dim aHref As String
		aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aEntityID, aDefinitionID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub
End Class
End Namespace