Imports System.Xml
Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.Page.Reviews

Public MustInherit Class cAssignmentsEditorByReviewer
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

    Protected ctlReviewCommitteeMember As cDoubleListBox
	Protected btnSaveApplicants As cCSSButton
	Protected btnSaveAndClose As cCSSButton
    Protected ctlType as cDropDown
    
    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
        MyBase.CoreCtl_Load(aSrc, aEvent)
		'If Not IsPostBack Then
            ctlReviewCommitteeMember.DisplaySort = False
			ctlReviewCommitteeMember.Size = 15
			ctlType = CType(Me.FindControl("ctlType"), cDropDown)
			PopulateDoubleListBox()
			ctlType.Set_ServerIndexChange(AddressOf AddTypeFilter)
			btnSaveApplicants.Set_ServerClick(AddressOf SaveDoubleListBox)
			btnSaveAndClose.Set_ServerClick(AddressOf SaveAndClose)
		'End If
    End Sub

    Public Sub PopulateDoubleListBox()
        Dim aApplicantPool As cDataObjectList
        Dim aList As cDataObjectList
        Dim aListItem As ListItem
        Dim aItem As cDataObject
        Dim aWFTA As cDataObject
        Dim aXmlDoc As cXMLDoc
        Dim aFiltersNode As XmlNode
        Dim aDataObjectNode As XmlNode
		'Dim aReviewCommitteeMember As cDataObject
		Dim aSortedList As SortedList
		Dim aKey As String
		Dim aFirstKey As String
		Dim aRemovablePrefTypeDOL As cDataObjectList
        aApplicantPool = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleProjectTaskOutcome", _
			"ReviewCycleID", Request.QueryString("ReviewCycleID"))

        'Add every item to the left hand box
		aSortedList = New SortedList()
        
        For Each aItem In aApplicantPool
            aList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "WfTaskRoleID", "1", _
				"WfTaskID", aItem.GetPropertyString("WfTaskID"), "WfTaskOutcomeID", aItem.GetPropertyString("WfTaskOutcomeID"))
			
			for each aWFTA in aList
				if aWFTA.GetRelatedPropertyString("GranteeProject.WfProjectID") = aItem.GetPropertyString("WfProjectID") then
						If Not aSortedList.ContainsKey(aWFTA.GetPropertyString("GranteeProjectID")) Then
							aSortedList.Add(aWFTA.GetPropertyString("GranteeProjectID"), aWFTA.GetRelatedPropertyString("Person.LastNameFirstName"))
						End If
                end if
            next
        Next
 
		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewCycleStageID", Request.QueryString.Get("ReviewCycleStageID")))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "PersonID", Request.QueryString.Get("ReviewerID")))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewAssignmentTypeID", ctlType.SelectedValue, "AND", "NotEqual"))
		aRemovablePrefTypeDOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
		
            Dim aRemovablePrefTypeList As SortedList = New SortedList()
            For Each aWFTA In aRemovablePrefTypeDOL
                aRemovablePrefTypeList.Add(aWFTA.GetPropertyString("GranteeProjectID"), aWFTA.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstName"))
            Next
		
        While aSortedList.Count > 0
			aFirstKey = aSortedList.GetKey(0)
			For Each aKey In aSortedList.Keys
				If CType(aSortedList(aKey), String).CompareTo(aSortedList(aFirstKey)) < 0 Then
					aFirstKey = aKey
				End If
			Next
			aListItem = New ListItem()
			aListItem.Value = aFirstKey
			aListItem.Text = aSortedList(aFirstKey)
			If Not aRemovablePrefTypeList.ContainsKey(aFirstKey) Then
				ctlReviewCommitteeMember.AddItemLeft(aListItem)
			End If
			
			aSortedList.Remove(aFirstKey)
		End While        

		aSortedList.Clear()
        aList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", _
				"ReviewCycleStageID", Request.QueryString("ReviewCycleStageID"), "PersonID", Request.QueryString("ReviewerID"), "ReviewAssignmentTypeID", ctlType.SelectedValue)
		
        For Each aItem In aList
			If Not aSortedList.ContainsKey(aItem.GetPropertyString("GranteeProjectID")) Then
				aSortedList.Add(aItem.GetPropertyString("GranteeProjectID"), aItem.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstName"))
			End If
        Next
        While aSortedList.Count > 0
			aFirstKey = aSortedList.GetKey(0)
			For Each aKey In aSortedList.Keys
				If CType(aSortedList(aKey), String).CompareTo(aSortedList(aFirstKey)) < 0 Then
					aFirstKey = aKey
				End If				
			Next
			aListItem = New ListItem()
			aListItem.Value = aFirstKey
			aListItem.Text = aSortedList(aFirstKey)
			ctlReviewCommitteeMember.AddItemRight(aListItem)
			aSortedList.Remove(aFirstKey)
		End While        
    End Sub

    Public Sub SaveAndClose(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		SaveDoubleListBox(aSrc, aEvent)
        CorePage.Redirect(Request.QueryString("ReturnURL"))
	End Sub
    
    Public Sub SaveDoubleListBox(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		Dim aItem As String
  '      Dim aXMLDoc As cXMLDoc
		'Dim aFiltersNode As XmlNode
		'Dim aDataObjectNode As XmlNode
		'Dim aReviewCommitteeMember As cDataObject
        Dim aExistingAssignments As cDataObjectList
        Dim aExistingAssignmentsBufferTbl as ArrayList
        Dim aExistingAssignmentsBufferCopyTbl as ArrayList
		Dim aNewDataObject As cDataObject
		'Dim aNewDataObjectNode As XmlNode
        Dim aExistingItem As cDataObject
        Dim aExistingItemCopy As cDataObject
        Dim aReviewStageDO As cDataObject
		'Dim aWfProjectTaskID As Integer
        Dim aWfTaskID As Integer

		ctlType = FindControl("ctlType")
		aReviewStageDO = CType(DataObjectCollection("ReviewCycleStage"), cDataObjectList)(0)
		aWfTaskID = aReviewStageDO.GetRelatedPropertyInt("WfTaskID")
 		aExistingAssignments = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", _
				"ReviewCycleStageID", Request.QueryString("ReviewCycleStageID"), "PersonID", Request.QueryString("ReviewerID"), "ReviewAssignmentTypeID", ctlType.SelectedValue)
		''Create two clones - one for checking and one for the deletion list (cannot enumerate through items that have been deleted)
        aExistingAssignmentsBufferTbl = aExistingAssignments.DataObjectList.Clone()
        aExistingAssignmentsBufferCopyTbl = aExistingAssignments.DataObjectList.Clone()

        ''create a DataObject to save.
        If ctlReviewCommitteeMember.SelectedValueList() <> "" Then
            Dim aSelectedItems As String()
            Dim aCreateNewItem As Boolean
            aSelectedItems = ctlReviewCommitteeMember.SelectedValueList().Split(",")

            'Insert a new row for each checked checkbox
            For Each aItem In aSelectedItems
                aCreateNewItem = True
                For Each aExistingItem In aExistingAssignmentsBufferTbl
                    If aExistingItem.GetPropertyValue("GranteeProjectID") = aItem.ToString Then
                        'if found, remove from ExistingGranteeProjIDList
                        aExistingAssignmentsBufferCopyTbl.Remove(aExistingItem)
                        aCreateNewItem = False
                    End If
                Next
                If aCreateNewItem = True Then
                    aNewDataObject = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskAssignment")
					aNewDataObject("WfTaskID") = aWfTaskID
                	aNewDataObject("WfTaskStatusID") = 1
                	aNewDataObject("GranteeProjectID") = aItem.ToString
                	aNewDataObject("PersonID") = Request.QueryString("ReviewerID")
                	aNewDataObject("WfTaskRoleID") = 7
                	aNewDataObject("ReviewCycleStageID") = Request.QueryString("ReviewCycleStageID")
                	aNewDataObject("ReviewAssignmentTypeID") = ctlType.SelectedField

					Dim aReviewCommitteeID As Integer = 0
					Dim aCommitteePool As cDataObjectList
					aCommitteePool = WebSession.DataObjectFactory.GetDataObjectListWithFilter("vCommitteePool", _
						"PersonID", aNewDataObject.GetPropertyString("PersonID"), "ReviewCycleID", Request.QueryString("ReviewCycleID"))
					If aCommitteePool.Count > 0 Then
						aNewDataObject("ReviewCommitteeID") = aCommitteePool(0).GetPropertyInt("ReviewCommitteeID", 0)
					End If

					Dim aRCCList As cDataObjectList
					aRCCList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleConflict", "ReviewCycleID", Request.QueryString("ReviewCycleID"), "RevPersonID", aNewDataObject.GetPropertyString("PersonID"), "AppPersonID", aNewDataObject.GetRelatedPropertyString("GranteeProject.PrimaryPersonID"))
					If aRCCList.Count >= 1 Then
						aNewDataObject("ReviewPreferenceTypeID") = aRCCList(0).GetPropertyInt("RequestConflictID", 0)
					End If

                	aNewDataObject.SaveData()

					'Creates GRANTEE_PROJECT_REVIEW_STAGE record if necessary
					Dim aDO As cDataObject
					Dim aGP As cGranteeProject
					aGP = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", aNewDataObject.GetPropertyString("GranteeProjectID"))
					aDO = aGP.GetGranteeProjectReviewStageDO(Request.QueryString("ReviewCycleStageID"), _
						Request.QueryString("ReviewCycleID"), Request.QueryString("ReviewerID"))
                End If
            Next
        End If

        'iterate through any items left in aExistingAssignmentsBufferCopyTbl and delete
		Dim aWftaReviewDOList As cDataObjectList
        For Each aExistingItemCopy In aExistingAssignmentsBufferCopyTbl
			aWftaReviewDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentReview", "WfTaskAssignmentID", aExistingItemCopy.GetPropertyInt("WfTaskAssignmentID", -1))
			WebSession.DataObjectFactory.DeleteData(aWftaReviewDOList)
			WebSession.DataObjectFactory.DeleteData(aExistingItemCopy)
        Next
    End Sub
    
	Public Sub AddTypeFilter(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Dim aURL As String = Request.RawUrl()
		aURL = cWebLib.AddQuerystringParameter(aURL, "ReviewAssignmentTypeID", ctlType.SelectedValue)
		aURL = aURL + "&#Type"
		Response.Redirect(aURL)
	End Sub

End Class
End Namespace
