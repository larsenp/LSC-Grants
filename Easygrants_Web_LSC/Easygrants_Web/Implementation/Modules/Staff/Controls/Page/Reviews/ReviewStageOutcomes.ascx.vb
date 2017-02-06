Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core.Web.User
Imports EasyGrants.Web.User
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.Page.Reviews

Public MustInherit Class cReviewStageOutcomes
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected Overrides Sub ProcessSorts(ByRef aDataObjectElement As XmlElement)
		Dim aKey As String

		aKey = cXMLDoc.AttributeToString(aDataObjectElement, "Key", "")
		Select Case aKey
			Case "Apps"
				'check property to see what we should sort by
				'add property to this control: AppsListSortKey
				MyBase.ProcessSorts(aDataObjectElement)
			Case Else
				MyBase.ProcessSorts(aDataObjectElement)
		End Select
	End Sub

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)

		If Not IsPostBack Then
			Dim ctlList As cDataListCtl
			Dim aCheckboxHash As Hashtable
			Dim myEnumerator As IDictionaryEnumerator
			Dim aChk As cCheckBox
			Dim aSelected As String
			Dim aIndex As Integer
			Dim aID As Integer

			ctlList = FindControl("ctlList")
			aCheckboxHash = ctlList.DataListCtl_GetControlCollection("chkFlag")
			aSelected = Request.QueryString("Selected")
			If Not aSelected Is Nothing AndAlso Not aCheckboxHash Is Nothing Then
				myEnumerator = aCheckboxHash.GetEnumerator()
				While myEnumerator.MoveNext()
					aChk = CType(myEnumerator.Value, cCheckBox)
					aChk.BaseCheckButton.Checked = False
				End While
				If aSelected <> "None" Then
					While aSelected <> ""
						aIndex = aSelected.IndexOf(",")
						If aIndex > -1 Then
							aID = Integer.Parse(aSelected.Substring(0, aIndex))
							aSelected = aSelected.Substring(aIndex + 1)
						Else
							aID = Integer.Parse(aSelected)
							aSelected = ""
						End If
						aChk = CType(aCheckboxHash(aID), cCheckBox)
						If Not aChk Is Nothing Then
							aChk.BaseCheckButton.Checked = True
						End If
					End While
				End If
			End If
		End If
	End Sub

	Public Sub ApplyCutoff(ByVal aPropertyToCompare As String)
		'This method applies cutoffs by saving data to the FlagForAction property of the GPRS object
		Dim txtCutoffLow As cTextBox
		Dim txtCutoffHigh As cTextBox
		Dim aCutoffLow As Double
		Dim aCutoffHigh As Double
		Dim aGPRSDOList As cDataObjectList 'GranteeProjectReviewStage data object list
		Dim aGPRSDO As cDataObject
		Dim aRSDO As cDataObject 'ReviewStage data object
		Dim aURL As String
		Dim ctlList As cDataListCtl
		Dim aCheckboxHash As Hashtable
		Dim aChk As cCheckBox

		If aPropertyToCompare = "AverageRating" Then
			txtCutoffLow = FindControl("txtCutLow")
			txtCutoffHigh = FindControl("txtCutHigh")
		Else
			txtCutoffLow = FindControl("txtCutoffLow")
			txtCutoffHigh = FindControl("txtCutoffHigh")
		End If
		
		If txtCutoffLow.Value = "" Then
			txtCutoffLow.Value = "0"
		End If
		
		If txtCutoffHigh.Value = "" Then
			txtCutoffHigh.Value = "0"
		End If

		aCutoffLow = Convert.ToDouble(txtCutoffLow.Value)
		aCutoffHigh = Convert.ToDouble(txtCutoffHigh.Value)
		ctlList = FindControl("ctlList")
		aCheckboxHash = ctlList.DataListCtl_GetControlCollection("chkFlag")
		If aCheckboxHash Is Nothing Then
			Exit Sub
		End If
		aGPRSDOList = CType(DataObjectCollection("Apps"), cDataObjectList)
		For Each aGPRSDO In aGPRSDOList
			If aGPRSDO.GetPropertyDouble(aPropertyToCompare) >= aCutoffLow And _
					aGPRSDO.GetPropertyDouble(aPropertyToCompare) <= aCutoffHigh Then
				aGPRSDO("FlagForAction") = True
			Else
				aGPRSDO("FlagForAction") = False
			End If
			aChk = CType(aCheckboxHash(aGPRSDO.GetPropertyInt("GranteeProjectReviewStageID")), cCheckBox)
			aChk.BaseCheckButton.Checked = aGPRSDO("FlagForAction")
			WebSession.DataObjectFactory.SaveDataObject(aGPRSDO)
		Next

		aRSDO = (CType(DataObjectCollection("ReviewStage"), cDataObjectList))(0)

		If aPropertyToCompare = "AverageRating" Then
			aRSDO("ScoreCutoffHigh") = aCutoffHigh
			aRSDO("ScoreCutoffLow") = aCutoffLow
		Else
			aRSDO("CutoffHigh") = aCutoffHigh
			aRSDO("CutoffLow") = aCutoffLow
		End If

		WebSession.DataObjectFactory.SaveDataObject(aRSDO)

		If aPropertyToCompare = "AverageRating" Then
			Refresh("Select1")
		Else
			Refresh("Select2")
		End If
	End Sub

	Public Sub CheckClearAll(ByVal aAction As String)
		Dim aCheckboxHash As Hashtable
		Dim aCheckbox As cCheckBox
		Dim ctlList As cDataListCtl
		Dim aURL As String

		ctlList = FindControl("ctlList")
		aCheckboxHash = ctlList.DataListCtl_GetControlCollection("chkFlag")

		If Not aCheckboxHash Is Nothing Then
			Dim myEnumerator As IDictionaryEnumerator = aCheckboxHash.GetEnumerator()
			While myEnumerator.MoveNext()
				aCheckbox = CType(myEnumerator.Value, cCheckBox)
				If aAction.ToLower = "check" Then
					aCheckbox.BaseCheckButton.Checked = True
				ElseIf aAction.ToLower = "clear" Then
					aCheckbox.BaseCheckButton.Checked = False
				End If
			End While
		End If

		If aAction.ToLower = "check" Then
			Refresh("Check")
		Else
			Refresh("Clear")
		End If
	End Sub

	Public Sub SetProposedApplOutcomes()
		'This version of the SetProposedOutcomes method does not rely on flags being saved. 
		'Instead, it reads the checkbox values directly off the page.
		Dim aGPRSDOList As cDataObjectList
		Dim aGPRSDO As cDataObject
		Dim aCheckboxHash As Hashtable
		Dim aCheckbox As cCheckBox
		Dim ctlList As cDataListCtl
		Dim aGPRSID As Integer 'GranteeProjectReviewStageID
		Dim ctlApplOutcomes As cDropDown
		Dim aProposedGPOutcomeID As Integer
		Dim aURL As String

		'get grantee project review stage data object list from data presenter's collection
		aGPRSDOList = CType(DataObjectCollection("Apps"), cDataObjectList)
		ctlList = FindControl("ctlList")
		aCheckboxHash = ctlList.DataListCtl_GetControlCollection("chkFlag")
		If aCheckboxHash Is Nothing Then
			Exit Sub
		End If
		'get proposed outcome ID from drop-down
		ctlApplOutcomes = CType(FindControl("ctlApplOutcomes"), cDropDown)
		If ctlApplOutcomes.SelectedValue <> "" Then
			aProposedGPOutcomeID = CType(ctlApplOutcomes.SelectedValue, Integer)
			If aGPRSDOList.Count > 0 Then
				For Each aGPRSDO In aGPRSDOList
					aGPRSID = aGPRSDO.GetPropertyInt("GranteeProjectReviewStageID")
					aCheckbox = CType(aCheckboxHash(aGPRSID), cCheckBox)
					If aCheckbox.Value = True Then
						aGPRSDO("ProposedOutcomeID") = aProposedGPOutcomeID
						aGPRSDO("FlagForAction") = True
						aGPRSDO("ApplOutcomeFinalize") = False
					Else
						aGPRSDO("FlagForAction") = False
					End If
					aGPRSDO.SaveData()
				Next
			End If
		End If

		Refresh("Set1")
	End Sub

	Public Sub SetApplOutcomes()
		Dim aGPRSDOList As cDataObjectList
		Dim aGPRSDO As cDataObject
		Dim aCheckboxHash As Hashtable
		Dim aCheckbox As cCheckBox
		Dim ctlList As cDataListCtl
		Dim aGPRSID As Integer
		Dim aProposedGPOutcomeID As Integer
		Dim aList As cDataObjectList
		Dim aWfTA As cDataObject
		Dim aURL As String

		'get grantee project review stage data object list from data presenter's collection
		aGPRSDOList = CType(DataObjectCollection("Apps"), cDataObjectList)
		ctlList = FindControl("ctlList")
		aCheckboxHash = ctlList.DataListCtl_GetControlCollection("chkFlag")
		If aCheckboxHash Is Nothing Then
			Exit Sub
		End If
		For Each aGPRSDO In aGPRSDOList
			aGPRSID = aGPRSDO.GetPropertyInt("GranteeProjectReviewStageID")
			aCheckbox = CType(aCheckboxHash(aGPRSID), cCheckBox)
			If aCheckbox.Value = True Then
				cGranteeProjectOutcomes.Create_Outcome(WebSession.DataObjectFactory, aGPRSDO.GetPropertyInt("GranteeProjectID"), aGPRSDO.GetRelatedPropertyInt("ReviewCycleStage.WfTaskID"), aGPRSDO.GetPropertyInt("ProposedOutcomeID", 0), 1, 0, 0)
				aGPRSDO("ApplOutcomeFinalize") = True
				aGPRSDO("FlagForAction") = True
				'Update all review task assignments for this granteeprojectid and review stage with the selected outcome
				Dim aRevWftaDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "GranteeProjectID", aGPRSDO.GetPropertyInt("GranteeProjectID"), "WfTaskID", aGPRSDO.GetRelatedPropertyInt("ReviewCycleStage.WfTaskID"), "ReviewCycleStageID", aGPRSDO.GetRelatedPropertyInt("ReviewCycleStageID"))
				If aRevWftaDOL.Count > 0 Then
					Dim aRevWftaDO As cDataObject				
					For Each aRevWftaDO in aRevWftaDOL
						aRevWftaDO("WfTaskOutcomeID") = aGPRSDO.GetPropertyInt("ProposedOutcomeID", 0)
						aRevWftaDO.SaveData()
					Next
					Dim aRevWfTaskAssignment As cWfTaskAssignment = CType(aRevWftaDOL(0), cWfTaskAssignment)
					aRevWfTaskAssignment.SetWfTaskOutcome(WebSession.BuildOutcomeConfig(aRevWfTaskAssignment.GetWfProjectTask), False, True, True, "GranteeProject.PrimaryPersonID")
				End If
			Else
				aGPRSDO("FlagForAction") = False
			End If
			aGPRSDO.SaveData()
		Next

		Refresh("Finalize1")
	End Sub

	Public Sub SetProposedGPOutcomes()
		'This version of the SetProposedOutcomes method does not rely on flags being saved. 
		'Instead, it reads the checkbox values directly off the page.
		Dim aGPRSDOList As cDataObjectList
		Dim aGPRSDO As cDataObject
		Dim aCheckboxHash As Hashtable
		Dim aCheckbox As cCheckBox
		Dim ctlList As cDataListCtl
		Dim aGPRSID As Integer 'GranteeProjectReviewStageID
		Dim ctlGPOutcomes As cDropDown
		Dim aProposedGPOutcomeID As Integer
		Dim aURL As String

		'get grantee project review stage data object list from data presenter's collection
		aGPRSDOList = CType(DataObjectCollection("Apps"), cDataObjectList)
		ctlList = FindControl("ctlList")
		aCheckboxHash = ctlList.DataListCtl_GetControlCollection("chkFlag")
		If aCheckboxHash Is Nothing Then
			Exit Sub
		End If
		'get proposed outcome ID from drop-down
		ctlGPOutcomes = CType(FindControl("ctlGPOutcomes"), cDropDown)
		If ctlGPOutcomes.SelectedValue <> "" Then
			aProposedGPOutcomeID = CType(ctlGPOutcomes.SelectedValue, Integer)
			If aGPRSDOList.Count > 0 Then
				For Each aGPRSDO In aGPRSDOList
					aGPRSID = aGPRSDO.GetPropertyInt("GranteeProjectReviewStageID")
					aCheckbox = CType(aCheckboxHash(aGPRSID), cCheckBox)
					If aCheckbox.Value = True Then
						aGPRSDO("ProposedGranteeProjectOutcomeID") = aProposedGPOutcomeID
						aGPRSDO("FlagForAction") = True
					Else
						aGPRSDO("FlagForAction") = False
					End If
					aGPRSDO.SaveData()
				Next
			End If
		End If

		Refresh("Set2")
	End Sub

	Public Sub SetProposedGPStatuses()
		Dim aGPRSDOList As cDataObjectList
		Dim aGPRSDO As cDataObject
		Dim aCheckboxHash As Hashtable
		Dim aCheckbox As cCheckBox
		Dim ctlList As cDataListCtl
		Dim aGPRSID As Integer 'GranteeProjectReviewStageID
		Dim ctlGPStatuses As cDropDown
		Dim aProposedGPStatusID As Integer
		Dim aURL As String

		'get grantee project review stage data object list from data presenter's collection
		aGPRSDOList = CType(DataObjectCollection("Apps"), cDataObjectList)
		ctlList = FindControl("ctlList")
		aCheckboxHash = ctlList.DataListCtl_GetControlCollection("chkFlag")
		If aCheckboxHash Is Nothing Then
			Exit Sub
		End If
		'get proposed outcome ID from drop-down
		ctlGPStatuses = CType(FindControl("ctlGPStatuses"), cDropDown)
		If ctlGPStatuses.SelectedValue <> "" Then
			aProposedGPStatusID = CType(ctlGPStatuses.SelectedValue, Integer)
			If aGPRSDOList.Count > 0 Then
				For Each aGPRSDO In aGPRSDOList
					aGPRSID = aGPRSDO.GetPropertyInt("GranteeProjectReviewStageID")
					aCheckbox = CType(aCheckboxHash(aGPRSID), cCheckBox)
					If aCheckbox.Value = True Then
						aGPRSDO("ProposedGranteeProjectStatusID") = aProposedGPStatusID
						aGPRSDO("FlagForAction") = True
					Else
						aGPRSDO("FlagForAction") = False
					End If
					aGPRSDO.SaveData()
				Next
			End If
		End If

		Refresh("Set2")

	End Sub

	Public Sub FinalizeOutcomeGP()
		Dim aGPRSDOList As cDataObjectList
		Dim aGPRSDO As cDataObject
		'Dim ctlOutcomes As cDropDown
		Dim aCheckboxHash As Hashtable
		Dim aCheckbox As cCheckBox
		Dim ctlList As cDataListCtl
		Dim aGPRSID As Integer 'GranteeProjectReviewStageID
		Dim aGranteeProjectID As Integer
		Dim aProposedGPOutcomeID As Integer
		Dim aDO As cDataObject
		Dim aURL As String

		'get grantee project review stage data object list from data presenter's collection
		aGPRSDOList = CType(DataObjectCollection("Apps"), cDataObjectList)
		ctlList = FindControl("ctlList")
		aCheckboxHash = ctlList.DataListCtl_GetControlCollection("chkFlag")
		If aCheckboxHash Is Nothing Then
			Exit Sub
		End If
		'finalize only items that are checked
		For Each aGPRSDO In aGPRSDOList
			aGPRSID = aGPRSDO.GetPropertyInt("GranteeProjectReviewStageID")
			aCheckbox = CType(aCheckboxHash(aGPRSID), cCheckBox)
			If aCheckbox.Value = True Then
				aDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", aGPRSDO.GetPropertyInt("GranteeProjectID", 0))
				If Not aDO Is Nothing Then
					aDO("WfProjectOutcomeID") = aGPRSDO.GetPropertyInt("ProposedGranteeProjectOutcomeID", 0)
					aDO("GrantStatusID") = aGPRSDO.GetPropertyInt("ProposedGranteeProjectStatusID", 0)
					aDO.SaveData()
				End If
				aGPRSDO("FlagForAction") = True
			Else
				aGPRSDO("FlagForAction") = False
			End If
			aGPRSDO.SaveData()
		Next

		Refresh("Finalize2")
	End Sub

	Public Sub Refresh(ByVal aAnchor As String)
		Dim aURL As String
		Dim ctlList As cDataListCtl
		Dim aCheckboxHash As Hashtable
		Dim aDOList As cDataObjectList
		Dim aDO As cDataObject
		Dim aChk As cCheckBox
		Dim aSelected As String

		ctlList = FindControl("ctlList")
		aCheckboxHash = ctlList.DataListCtl_GetControlCollection("chkFlag")
		aSelected = ""
		aDOList = CType(DataObjectCollection("Apps"), cDataObjectList)
		For Each aDO In aDOList
			aChk = CType(aCheckboxHash(aDO.GetPropertyInt("GranteeProjectReviewStageID")), cCheckBox)
			If (Not aChk Is Nothing) And (aChk.BaseCheckButton.Checked) Then
				aSelected += aDO.GetPropertyString("GranteeProjectReviewStageID") + ","
			End If
		Next
		If aSelected.Length > 0 Then
			aSelected = aSelected.Substring(0, aSelected.Length - 1)
		End If

		aURL = Request.RawUrl
		If aSelected = "" Then
			aURL = cWebLib.AddQuerystringParameter(aURL, "Selected", "None")
		Else
			aURL = cWebLib.AddQuerystringParameter(aURL, "Selected", aSelected)
		End If
		aURL += "&#" + aAnchor
		Response.Redirect(aURL)
	End Sub

End Class
End Namespace
