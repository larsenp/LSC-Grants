Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports Easygrants.Web.User
Imports EasyGrants.DataAccess.Budget

Namespace Implementation.Modules.Home.Controls.Page
	Public Class cCopyExistTaskContent_Lsc
		'Inherits Implementation.Modules.Home.Controls.Page.cCopyExistTaskContent
		Inherits Core_Web.Controls.Base.cDataPresenterCtl

		Protected btnSaveReview As cCSSButton
		Protected btnSave As cCSSButton

		Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
			MyBase.CoreCtl_Load(sender, e)
			btnSaveReview = GetControl("btnSaveReview")
			btnSave = GetControl("btnSave")
			Dim aList As cDataObjectList = DataObjectCollection("WfTaskAssignment")
			If aList.Count > 0 Then
				If aList(0).GetRelatedPropertyInt("WfTask.WfTaskTypeID") = 4 Then
					btnSave.Visible = False
				Else
					btnSaveReview.Visible = False
				End If
			End If
		End Sub

		Public Sub CopyReview(ByVal aSourceWfTAID As String, ByVal aTargetWfTAID As String)
			Dim aXmlDoc As cXMLDoc
			Dim aDataObjectNode, aFiltersNode As XmlNode
			aDataObjectNode = Nothing
			aFiltersNode = Nothing
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("CopyReviewWfTA", aDataObjectNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "source_wf_task_assignment_id", aSourceWfTAID))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "target_wf_task_assignment_id", aTargetWfTAID))
			WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
		End Sub


	Public Sub CopyToExistingTask(ByVal aWfTaskAssignmentID As String, ByVal aExistingWfTaskAssignmentID As String, ByVal aCopyType As String)
		Dim aUser As cEGUser
		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)

		Dim aWfTaskAssignmentDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", Request.QueryString("WfTaskAssignmentID"))
		Dim aGranteeProjectID As String = aWfTaskAssignmentDO.GetPropertyString("GranteeProjectID")
		Dim aGranteeProjectDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", aGranteeProjectID)
		Dim aExistingWfTaskAssignmentDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aExistingWfTaskAssignmentID)
		Dim aExistingGranteeProjectID As Integer = aExistingWfTaskAssignmentDO.GetPropertyInt("GranteeProjectID")
		Dim aExistingGranteeDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", aExistingGranteeProjectID.ToString())
		Dim aWfTaskTypeID As Integer = aWfTaskAssignmentDO.GetRelatedPropertyInt("WfTask.WfTaskTypeID")
		Dim aCounter As Integer
		'Dim aAttributeCopyType As String = aWfTaskAssignmentDO.GetRelatedPropertyString("WfTask.AttributeCopyType.AttributeCopyType")
		'Dim aPropertyCopyType As String = aWfTaskAssignmentDO.GetRelatedPropertyString("WfTask.AttributeCopyType.PropertyCopyType")
		Dim aPersonDO As cDataObject = aWfTaskAssignmentDO.GetRelatedPropertyDataObject("Person")
		Dim aAppExistingBudgetList As cDataObjectList

		Try
			BeginTrans()

			'Copy Budgets
			'NOTE:  Since application budgets are only collected for Proposal tasks, we are only copying the budget data objects for these tasks.
			Dim aAppBudgetList As cDataObjectList = aGranteeProjectDO.GetRelatedPropertyDataObjectList("ApplicationBudgets")

			If aWfTaskTypeID = 1 Then
				aAppExistingBudgetList = aExistingGranteeDO.GetRelatedPropertyDataObjectList("ApplicationBudgets")
				Copy_BudgetDataObjects(aWfTaskAssignmentDO, aAppBudgetList, aAppExistingBudgetList, aGranteeProjectID, aExistingGranteeProjectID.ToString(), _
					aGranteeProjectDO.PrimaryKey, aCopyType)
			End If

			'Get GP record copying to
			Dim aExistingGranteeProjectDO As cDataObject
			aExistingGranteeProjectDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", aExistingGranteeProjectID.ToString())

			'copy all grantee project columns, in case grantee project fields are configured
			Dim aGranteeID, aWfProjectID As Integer
			aGranteeID = aExistingGranteeProjectDO.GetPropertyInt("GranteeID", 0)
			aWfProjectID = aExistingGranteeProjectDO.GetPropertyInt("WfProjectID", 0)

			WebSession.DataObjectFactory.CopyDataObject(aGranteeProjectDO, aExistingGranteeProjectDO)

			aExistingGranteeProjectDO("GranteeID") = aGranteeID
			aExistingGranteeProjectDO("WfProjectID") = aWfProjectID
			aExistingGranteeProjectDO("CopiedBasedOn") = aGranteeProjectID

			If aCopyType = "New" Then
				aExistingGranteeProjectDO("GrantStatusID") = 2
				aExistingGranteeProjectDO("PrimaryPersonID") = aUser.PersonID
				aExistingGranteeProjectDO("WfProjectOutcomeID") = System.DBNull.Value
				Dim aExistingPersonDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", aUser.PersonID.ToString())
				If Not aExistingPersonDO.GetRelatedPropertyString("PersonPrimaryAffiliation.OrganizationID") = "" Then
					aExistingGranteeProjectDO("PrimaryOrganizationID") = aExistingPersonDO.GetRelatedPropertyString("PersonPrimaryAffiliation.OrganizationID")
				Else
					aExistingGranteeProjectDO("PrimaryOrganizationID") = System.DBNull.Value
				End If
				If Not aExistingPersonDO.GetRelatedPropertyString("PrimaryAddress.AddressID") = "" Then
					aExistingGranteeProjectDO("PrimaryAddressID") = aExistingPersonDO.GetRelatedPropertyString("PrimaryAddress.AddressID")
				Else
					aExistingGranteeProjectDO("PrimaryAddressID") = System.DBNull.Value
				End If
				aExistingGranteeProjectDO("GrantAwardDate") = System.DBNull.Value
			End If

			Update_Dates(aExistingGranteeProjectDO, aCopyType)

			WebSession.DataObjectFactory.SaveDataObject(aExistingGranteeProjectDO)

			Dim aPropertyKeys() As String = {aGranteeProjectDO.PrimaryKey}
			Dim aPropertyValues() As String = {aExistingGranteeProjectID.ToString()}

			If aWfTaskTypeID = 1 Then
				'Copy_RelatedDataObjects(aGranteeProjectDO, aExistingGranteeProjectDO, Nothing, aGranteeProjectID, aExistingGranteeProjectID.ToString(), aPropertyKeys, aPropertyValues, _
						'aAttributeCopyType, aPropertyCopyType, aCopyType)
				Copy_RelatedDataObjects(aGranteeProjectDO, aGranteeProjectID, aExistingGranteeProjectID)
			End If

			Dim aExistWfTaskAssignmentDOList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("WfTaskAssignment", aExistingWfTaskAssignmentID)

			'change task status to incomplete and task outcome for existing wfta
			aExistingWfTaskAssignmentDO("SelectedOutcomeID") = aWfTaskAssignmentDO.GetPropertyInt("SelectedOutcomeID", 0)
			aExistingWfTaskAssignmentDO("AppWftaID") = aWfTaskAssignmentDO.GetPropertyInt("AppWftaID", 0)
			If aCopyType <> "New" Then
				aExistingWfTaskAssignmentDO("WfTaskStatusID") = 1
				aExistingWfTaskAssignmentDO("WfTaskOutcomeID") = System.DBNull.Value
				aExistingWfTaskAssignmentDO("ModifyUser") = aUser.UserID
				aExistingWfTaskAssignmentDO("ModifyDate") = System.DateTime.Now()
				WebSession.DataObjectFactory.SaveDataObject(aExistingWfTaskAssignmentDO)
			End If

			aPropertyKeys(0) = aWfTaskAssignmentDO.PrimaryKey
			aPropertyValues(0) = aExistingWfTaskAssignmentID.ToString()

			'Copy_RelatedDataObjects(aWfTaskAssignmentDO, aExistingWfTaskAssignmentDO, aExistWfTaskAssignmentDOList, aWfTaskAssignmentID, aExistingWfTaskAssignmentID, _
			'		aPropertyKeys, Nothing, aAttributeCopyType, aPropertyCopyType, aCopyType)
			Copy_RelatedDataObjects(aWfTaskAssignmentDO, aWfTaskAssignmentID, aExistingWfTaskAssignmentID)


			'Progress Report and External Review task types
			If aWfTaskTypeID = 3 Then
				'we in fact need to pass the existing wfta data object list, which is used when we perform copy

				'Copy_RelatedDataObjects(aWfTaskAssignmentDO, aExistingWfTaskAssignmentDO, aExistWfTaskAssignmentDOList, aWfTaskAssignmentID, aExistingWfTaskAssignmentID, _
				'    aPropertyKeys, nothing, aAttributeCopyType, aPropertyCopyType, "Update")
					aAppExistingBudgetList = aExistingGranteeDO.GetRelatedPropertyDataObjectList("ApplicationBudgets")
					Copy_BudgetDataObjects(aWfTaskAssignmentDO, aAppBudgetList, aAppExistingBudgetList, aGranteeProjectID, aExistingGranteeProjectID.ToString(), _
						aGranteeProjectDO.PrimaryKey, aCopyType)
			ElseIf aWfTaskTypeID = 4 Then
				Dim aExistRevPersonID As Integer
				Dim aReviewDOList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "PersonID", _
					aWfTaskAssignmentDO.GetPropertyInt("PersonID", 0).ToString(), "WfTaskID", aWfTaskAssignmentDO.GetPropertyInt("WfTaskID", 0).ToString(), _
					"ReviewCycleStageID", aWfTaskAssignmentDO.GetPropertyInt("ReviewCycleStageID", 0).ToString())
				Dim aExistReviewDOList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "PersonID", _
					aExistingWfTaskAssignmentDO.GetPropertyInt("PersonID", 0).ToString(), "WfTaskID", aExistingWfTaskAssignmentDO.GetPropertyInt("WfTaskID", 0).ToString(), _
					"ReviewCycleStageID", aExistingWfTaskAssignmentDO.GetPropertyInt("ReviewCycleStageID", 0).ToString())
				aCounter = 0
				Dim aExistWftaReviewDOList, aWftaReviewDOList As cDataObjectList
				For i As Integer = 0 To aReviewDOList.Count - 1
					aExistRevPersonID = aExistingWfTaskAssignmentDO.GetPropertyInt("PersonID", 0)
					If i <= aExistReviewDOList.Count - 1 Then
						aGranteeProjectID = aReviewDOList(i).GetPropertyInt("GranteeProjectID", 0)
						aExistingGranteeProjectID = aExistReviewDOList(i).GetPropertyInt("GranteeProjectID", 0)
						Dim aReviewWfTaskID As Integer = aReviewDOList(i).GetPropertyInt("WfTaskID", 0)
						Dim aReviewCycleStageID As Integer = aReviewDOList(i).GetPropertyInt("ReviewCycleStageID", 0)
						Dim aReviewPersonID As Integer = aReviewDOList(i).GetPropertyInt("PersonID", 0)
						Dim aCopyToDOPropertyKey() As String = {"PersonID", "WfTaskID", "ReviewCycleStageID"}
						Dim aCopyToDOPropertyValues() As String = {aExistRevPersonID, aReviewWfTaskID, aReviewCycleStageID}
						If WebSession.DataObjectFactory.CopyDataObject(aReviewDOList(i), aExistReviewDOList(i)) = True Then
							aExistReviewDOList(i)("GranteeProjectID") = aExistingGranteeProjectID
							aExistReviewDOList(i)("PersonID") = aExistRevPersonID
							Update_Dates(aExistReviewDOList(i), aCopyType)
							aExistReviewDOList(i).SaveData()
						End If
						aExistWftaReviewDOList = aExistReviewDOList(i).GetRelatedPropertyDataObjectList("WfTaskAssignmentReview")
						aWftaReviewDOList = aReviewDOList(i).GetRelatedPropertyDataObjectList("WfTaskAssignmentReview")
						If Not aExistWftaReviewDOList Is Nothing AndAlso aExistWftaReviewDOList.Count > 0 Then
							aExistWftaReviewDOList(0)("Comments") = aReviewDOList(i).GetRelatedPropertyString("WfTaskAssignmentReview.Comments")
							aExistWftaReviewDOList(0).SaveData()
						Else
							aPropertyKeys(0) = aReviewDOList(i).PrimaryKey
							aPropertyValues(0) = aWftaReviewDOList(i).GetPropertyInt("WfTaskAssignmentID")
							Copy_DataObject_Contents(aWftaReviewDOList(0), aGranteeProjectDO.PrimaryKey, aGranteeProjectID, aExistingGranteeProjectID)
						End If
					Else
						aPropertyKeys(0) = aPersonDO.PrimaryKey
						aPropertyValues(0) = aExistRevPersonID
						Copy_DataObject_Contents(aReviewDOList(i), aGranteeProjectDO.PrimaryKey, aGranteeProjectID, aExistingGranteeProjectID)
					End If

					'aCounter += 1      
				Next
				'Delete any data objects where existing records > CopyFrom records
				'if not aExistReviewDOList is nothing AndAlso aExistReviewDOList.Count > aCounter then
				'    dim aDeletedCount as Integer = aExistReviewDOList.Count - aCounter
				'    For i as Integer = 0 To aDeletedCount - 1
				'        WebSession.DataObjectFactory.DeleteData(aExistReviewDOList(aCounter + i))
				'    Next
				'end if
			End If


			'SUBMITTED FILES
			'NOTE:  Because LOI uploads do collect the UploadID and EntityDataObjectKey fields, we need to create a separate submitted file list for Proposal
					'tasks, which do NOT collect UploadID and EntityDataObjectKey.
			Dim aExistDOSubmittedFileList As cDataObjectList
			Dim aSubmittedFileList As cDataObjectList
			Dim aExistSubmittedFileID As Integer
			aSubmittedFileList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SubmittedFile", "EntityID", aWfTaskAssignmentDO("WfTaskAssignmentID").ToString(), "EntityDataObjectKey", "WfTaskAssignment")
			aExistDOSubmittedFileList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SubmittedFile", "EntityID", aExistingWfTaskAssignmentDO("WfTaskAssignmentID").ToString(), "EntityDataObjectKey", "WfTaskAssignment")
				For aSubmittedFileIndex As Integer = 0 To aSubmittedFileList.Count - 1
					Dim aUploadId As String
					Dim aProjectTaskId As Integer
					Dim aProjectTaskUploadId As Integer
					Dim aWfProjectTaskList As cDataObjectList
					Dim aWfProjectTaskUploadList As cDataObjectList

					Dim aNewWfProjectID As Integer = aWfTaskAssignmentDO.GetRelatedPropertyInt("GranteeProject.WfProjectID")
					Dim aWfTaskID As Integer = aWfTaskAssignmentDO.GetPropertyInt("WfTaskID")

					aUploadId = aSubmittedFileList(aSubmittedFileIndex).GetRelatedPropertyInt("TaskUploadType.UploadId")

					aWfProjectTaskList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", aNewWfProjectID, "WfTaskID", aWfTaskID)
					aProjectTaskId = aWfProjectTaskList(0).GetPropertyInt("WfProjectTaskID")

					aWfProjectTaskUploadList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskUpload", "WfProjectTaskID", aProjectTaskId, "UploadId", aUploadId)
					aProjectTaskUploadId = aWfProjectTaskUploadList(0).GetPropertyInt("WfProjectTaskUploadID")

					aUploadId = aProjectTaskUploadId
					aPropertyKeys(0) = "UploadID"
					aPropertyValues(0) = aUploadId

					If aSubmittedFileIndex <= aExistDOSubmittedFileList.Count - 1 Then
						aExistSubmittedFileID = aExistDOSubmittedFileList(aSubmittedFileIndex).GetPropertyInt("SubmittedFileID", 0)
						Dim aEntityID As Integer = aExistDOSubmittedFileList(aSubmittedFileIndex).GetPropertyInt("EntityID", 0)
						If WebSession.DataObjectFactory.CopyDataObject(aSubmittedFileList(aSubmittedFileIndex), aExistDOSubmittedFileList(aSubmittedFileIndex)) = True Then
							aExistDOSubmittedFileList(aSubmittedFileIndex)("EntityID") = aEntityID
							aExistDOSubmittedFileList(aSubmittedFileIndex)("UploadID") = aUploadId
							aExistDOSubmittedFileList(aSubmittedFileIndex).SaveData()
						End If
					Else
						Copy_DataObject_Contents(aSubmittedFileList(aSubmittedFileIndex), "EntityID", aSubmittedFileList(aSubmittedFileIndex).GetPropertyString("EntityID"), _
							aExistingWfTaskAssignmentDO.GetPropertyString("WfTaskAssignmentID"))
					End If

					'Copy submitted file data and converted file data objects
					Copy_RelatedDataObjects(aSubmittedFileList(aSubmittedFileIndex), aSubmittedFileList(aSubmittedFileIndex).GetPropertyString("SubmittedFileID"), aExistDOSubmittedFileList(aSubmittedFileIndex).GetPropertyString("SubmittedFileID"))
				Next

		CommitTrans()
		Catch ex As Exception
			RollbackTrans()
			Throw (ex) 'Throwing the error redirects to the configured error page.
			Exit Sub
		End Try

	End Sub

	Private Sub Copy_BudgetDataObjects(ByVal aDataObject As cDataObject, ByVal aCopyFromDOList As cDataObjectList, ByVal aCopyToDOList As cDataObjectList, _
					ByVal aCopyFromID As String, ByVal aCopyToID As String, ByVal aCopyToDOPropertyKey As String, ByVal aCopyType As String)
		Dim aBudgetIndex As Integer
		Dim aCounter As Integer = 0
		Dim aBudgetID As String
		Dim aWfTaskTypeID As Integer = aDataObject.GetRelatedPropertyInt("WfTask.WftaskTypeID")

		'FIRST, we copy over any Budgets.  If CopyFrom records > exising records, then we create new budget records
		If Not aCopyFromDOList Is Nothing AndAlso aCopyFromDOList.Count > 0 Then
			For aBudgetIndex = 0 To aCopyFromDOList.Count - 1
				Dim aExistingBudgetItemList As cDataObjectList
				'Application Tasks and New PR Tasks
				'aCopyToDOList = Budget list
				If aWfTaskTypeID = 1 Or (aCopyType = "New" AndAlso aWfTaskTypeID = 3) Then
					If Not aCopyToDOList Is Nothing AndAlso aBudgetIndex <= aCopyToDOList.Count - 1 Then
						If WebSession.DataObjectFactory.CopyDataObject(aCopyFromDOList(aBudgetIndex), aCopyToDOList(aBudgetIndex)) = True Then
							aCopyToDOList(aBudgetIndex)(aCopyToDOPropertyKey) = aCopyToID
							aCopyToDOList(aBudgetIndex).SaveData()
						End If
					Else
						'aCopyToDOPropertyKey = "GranteeProjectID", aCopyFromID/aCopyToID = grantee_project_id
						Copy_DataObject_Contents(aCopyFromDOList(aBudgetIndex), aCopyToDOPropertyKey, aCopyFromID, aCopyToID)
					End If

					If aCopyType = "New" Or aCopyToDOList.Count = 0 Then
						Dim aNewBudgetDOList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Budget", "GranteeProjectID", aCopyToID, _
							"BudgetTypeID", aCopyFromDOList(aBudgetIndex).GetPropertyInt("BudgetTypeID", 0).ToString())
						aBudgetID = aNewBudgetDOList(0).GetPropertyInt("BudgetID", 0).ToString()
					Else
						aBudgetID = aCopyToDOList(aBudgetIndex).GetPropertyInt("BudgetID", 0).ToString()
					End If

					'SECOND, we copy the Budget Period records.  Again, if the CopyFrom records > existing records, then we create NEW budget period
						'records 
					Dim aExistingBudgetPeriodList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetPeriod", "BudgetID", _
																			aBudgetID)

					Dim aBudgetPeriodList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetPeriod", "BudgetID", _
																	aCopyFromDOList(aBudgetIndex).GetPropertyInt("BudgetID", 0).ToString())
					Dim aBudgetPeriodIndex As Integer
					For aBudgetPeriodIndex = 0 To aBudgetPeriodList.Count - 1
						If aBudgetPeriodIndex <= aExistingBudgetPeriodList.Count - 1 Then

							aBudgetID = aExistingBudgetPeriodList(aBudgetPeriodIndex).GetPropertyInt("BudgetID")
							If WebSession.DataObjectFactory.CopyDataObject(aBudgetPeriodList(aBudgetPeriodIndex), aExistingBudgetPeriodList(aBudgetPeriodIndex)) = True Then
								aExistingBudgetPeriodList(aBudgetPeriodIndex)("BudgetID") = aBudgetID
								aExistingBudgetPeriodList(aBudgetPeriodIndex).SaveData()
							End If
						Else
							'passing aCopyToDOPropertyKey parameter as "BudgetID"
							Copy_DataObject_Contents(aBudgetPeriodList(aBudgetPeriodIndex), aCopyFromDOList(0).PrimaryKey, _
								aBudgetPeriodList(aBudgetPeriodIndex).GetPropertyInt("BudgetID", 0).ToString(), aBudgetID)
						End If
						aCounter += 1
					Next
					'Delete any Budget Period data objects where existing buddget period records > CopyFrom budget period records 
					'NOTE:  this needs to be deleted before we copy budget item records, otherwise existing budgets will not be consistent
								'with CopyFrom budget records               
					'if aExistingBudgetPeriodList.Count > aCounter then
					'    dim aDeletedCount as Integer = aExistingBudgetPeriodList.Count - aCounter
					'    For aBudgetPeriodIndex = 0 To aDeletedCount - 1
					'        'delete budget items
					'        aExistingBudgetItemList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetItem", "BudgetPeriodID", _
					'                            aExistingBudgetPeriodList(aCounter + aBudgetPeriodIndex).GetPropertyInt("BudgetPeriodID").ToString()) 
					'        WebSession.DataObjectFactory.DeleteData(aExistingBudgetItemList)
					'        WebSession.DataObjectFactory.DeleteData(aExistingBudgetPeriodList(aCounter + aBudgetPeriodIndex))
					'    Next
					'    'aCounter = 0
					'end if

					aCounter = 0
					aExistingBudgetPeriodList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetPeriod", "BudgetID", aBudgetID)

					'THIRD, we copy the Budget Item records.  Again, if the CopyFrom records > existing records, then we create NEW budget item
						'existing records 
					For aBudgetPeriodIndex = 0 To aBudgetPeriodList.Count - 1

						If aBudgetPeriodIndex <= aExistingBudgetPeriodList.Count - 1 Then
							aExistingBudgetItemList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetItem", "BudgetPeriodID", _
																					aExistingBudgetPeriodList(aBudgetPeriodIndex).GetPropertyInt("BudgetPeriodID").ToString())
							Dim aPropertyKeys() As String = {"GranteeProjectID", "BudgetCategoryID"}
							Dim aPropertyValues() As String = {aCopyToID, ""}
							If aExistingBudgetItemList.Count > 0 Then
								Copy_RelatedDataObjects(aBudgetPeriodList(aBudgetPeriodIndex), aBudgetPeriodList(aBudgetPeriodIndex).GetPropertyString("BudgetPeriodID"), aExistingBudgetItemList(aBudgetPeriodIndex).GetPropertyString("BudgetPeriodID"))
							Else
								Copy_RelatedDataObjects(aBudgetPeriodList(aBudgetPeriodIndex), aBudgetPeriodList(aBudgetPeriodIndex).GetPropertyString("BudgetPeriodID"), aExistingBudgetPeriodList(aBudgetPeriodIndex).GetPropertyString("BudgetPeriodID"))
							End If
						End If
					Next
				End If
			Next

			'Need to Update budget total after copying to existing records is complete
			Dim aBudget As cBudget
			Dim aBudgetDO As cDataObject
			If Not aCopyToDOList Is Nothing Then
				For Each aBudgetDO In aCopyToDOList
					aBudget = aBudgetDO
					aBudget.UpdateBudgetTotal()
				Next
			End If

			'Delete any Budget data objects where budget existing records > CopyFrom budget records
			'if not aCopyToDOList is nothing AndAlso aCopyToDOList.Count >  aCopyFromDOList.Count then
			'    dim aDeletedCount as Integer = aCopyToDOList.Count - aCopyFromDOList.Count
			'    For aBudgetIndex = 0 To aDeletedCount - 1
			'        WebSession.DataObjectFactory.DeleteData(aCopyToDOList(aCopyFromDOList.Count + aBudgetIndex))
			'    Next
			'end if

		End If

		'dim aBudgetDOList as cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Budget", "GranteeProjectID", aCopyToID)
		'Copy_BudgetItemExpenses(aDataObject, aCopyFromID, aCopyToID, aBudgetDOList(0), "New") 

		'PR Budgets
		'FIRST, We get the CopyFrom budget item list and then the existing budget item records.  If the CopyFrom budget item records > 
			'existing item records then we create NEW existing item records
		If aCopyType <> "New" AndAlso aWfTaskTypeID = 3 Then
			'Copy_BudgetItemExpenses(aDataObject, aCopyFromID, aCopyToID, aCopyToDOList(0), "Budget")
		End If


	End Sub

		Private Function Update_Dates(ByVal aCopyToDO As cDataObject, ByVal aCopyType As String) As cDataObject
			Dim aUser As cEGUser
			aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			'if a new task, store create date/user
			If aCopyType = "New" Then
				If aCopyToDO.HasProperty("CreateUser") Then
					aCopyToDO("CreateUser") = aUser.UserID
				End If
				If aCopyToDO.HasProperty("CreateDate") Then
					aCopyToDO("CreateDate") = System.DateTime.Now()
				End If
				If aCopyToDO.HasProperty("ModifyUser") Then
					aCopyToDO("ModifyUser") = System.DBNull.Value
				End If
				If aCopyToDO.HasProperty("ModifyDate") Then
					aCopyToDO("ModifyDate") = System.DBNull.Value
				End If
			Else
			'if existing copy, store modify user/date
				If aCopyToDO.HasProperty("ModifyUser") Then
					aCopyToDO("ModifyUser") = aUser.UserID
				End If
				If aCopyToDO.HasProperty("ModifyDate") Then
					aCopyToDO("ModifyDate") = System.DateTime.Now()
				End If
			End If

			Return aCopyToDO
		End Function

		Private Sub Copy_RelatedDataObjects(ByVal aDataObject As cDataObject, ByVal aCopyFromDOID As String, ByVal aCopyToDOID As String)
			Dim aXmlDoc As cXMLDoc
			aXmlDoc = WebAppl.DataDefinitionDoc()
			Dim aDataObjectDefNode As XmlNode = aDataObject.ObjDefNode()
			Dim aName() As String = {"DataType", "ApplicationCopy"}
			Dim aValue() As String = {"cDataObject", "True"}

			Dim aDataObjectPropertiesNodeList As XmlNodeList = cXMLDoc.FindNodes(aDataObjectDefNode.SelectSingleNode("Properties"), "Property", aName, aValue)

			'looping through the RelationShip properties in the DataObject definition
			For Each aXmlNode As XmlNode In aDataObjectPropertiesNodeList
				Dim aRelationType As String = aXmlNode.SelectSingleNode("Relationship").Attributes("Type").Value()
				Dim aCount As Integer = aXmlNode.SelectNodes("Relationship/RelationshipProperties/RelationshipProperty").Count()
				Dim aParentProperty(aCount - 1) As String
				Dim aChildProperty(aCount - 1) As String
				Dim aChildPropertyValue(aCount - 1) As String

				Dim aRelationshipPropertyNodeList As XmlNodeList = aXmlNode.SelectNodes("Relationship/RelationshipProperties/RelationshipProperty")
				Dim aChildDefinitionKey = aXmlNode.SelectSingleNode("Relationship").Attributes("ChildDefinitionKey").Value()

				Dim i As Integer
				For i = 0 To aRelationshipPropertyNodeList.Count - 1

					If aRelationshipPropertyNodeList(i).Attributes("Data") Is Nothing Then
						aParentProperty(i) = aRelationshipPropertyNodeList(i).Attributes("parentProperty").Value()

						aChildProperty(i) = aRelationshipPropertyNodeList(i).Attributes("childProperty").Value()
						If aParentProperty(i).IndexOf(".") <> -1 Then
							aChildPropertyValue(i) = aDataObject.GetRelatedPropertyString(aParentProperty(i))
						Else
							aChildPropertyValue(i) = aDataObject.GetPropertyString(aParentProperty(i))
						End If
					Else
						aChildProperty(i) = aRelationshipPropertyNodeList(i).Attributes("childProperty").Value()
						aChildPropertyValue(i) = aRelationshipPropertyNodeList(i).Attributes("Data").Value().ToString()
					End If
				Next

				Dim aChildDefinitionDOList As cDataObjectList
				aChildDefinitionDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter(aChildDefinitionKey, aChildProperty, aChildPropertyValue)

				If aChildDefinitionDOList.Count > 0 Then
					DeleteDataObjects(aChildDefinitionDOList.DefinitionKey, aChildProperty(0), aCopyToDOID)
					Copy_DataObject(aChildDefinitionDOList, aChildProperty(0), aCopyFromDOID, aRelationType, aCopyToDOID)
				End If

			Next
		End Sub

	Private Sub Copy_DataObject_Contents(ByVal aCopyFromDO As cDataObject, ByVal aCopyToDOPropertyKey As String, ByVal aCopyFromDOID As String, ByVal aCopyToDOID As String)

		Dim aCopyToDO As cDataObject
		aCopyToDO = WebSession.DataObjectFactory.CloneDataObject(aCopyFromDO)
		aCopyToDO(aCopyToDOPropertyKey) = aCopyToDOID
		aCopyToDO = Update_Dates(aCopyToDO, "Existing")
		aCopyToDO.SaveData()
	End Sub

		Private Sub Copy_DataObject(ByVal aChildDefinitionDOList As cDataObjectList, ByVal aCopyToDOPropertyKey As String, ByVal aCopyFromDOID As String, ByVal aRelationType As String, ByVal aCopyToDOID As String)
			Dim aChildDefinitionDO As cDataObject

			If aRelationType = "One" Then
				aChildDefinitionDO = aChildDefinitionDOList(0)
				Copy_DataObject_Contents(aChildDefinitionDO, aCopyToDOPropertyKey, aCopyFromDOID, aCopyToDOID)
			Else
				For Each aChildDefinitionDO In aChildDefinitionDOList
					Copy_DataObject_Contents(aChildDefinitionDO, aCopyToDOPropertyKey, aCopyFromDOID, aCopyToDOID)
				Next
			End If

		End Sub

		Protected Overridable Sub DeleteDataObjects(ByVal aDefinitionKey As String, ByVal aProperty As String, ByVal aValue As String)
			Dim aList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter(aDefinitionKey, aProperty, aValue)
			WebSession.DataObjectFactory.DeleteData(aList)
		End Sub
	End Class
End Namespace
