Imports Core.DataAccess
Imports Core.Web
Imports Core.Web.Modules
Imports EasyGrants.Web
Imports EasyGrants.Web.Modules
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page

Public MustInherit Class cConflictsAndPreferences
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
	
	Protected ctlList as cDataListCtl
	Protected ctlNewWindowOpener As cNewWindowOpener

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)

		Dim aWftaDOList As cDataObjectList	
		Dim aWftaDO As cDataObject
		Dim aWftaID As Integer
		Dim aOptionsHash As Hashtable
		Dim aOptionsList As cRadioButtonList
		Dim aConflictTypeHash As Hashtable
		Dim ctlConflictType As cDropDown
		
		'Dim IsSubmitted As Boolean = True
		aWftaDOList = CType(DataObjectCollection("ReviewConflicts"), cDataObjectList)
        ctlList = FindControl("ctlList")
        aOptionsHash =  ctlList.DataListCtl_GetControlCollection("ctlOptions")
        aConflictTypeHash =  ctlList.DataListCtl_GetControlCollection("ctlConflictType")
		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("RevWftaID")
				aOptionsList = CType(aOptionsHash(aWftaID), cRadioButtonList)
				ctlConflictType = CType(aConflictTypeHash(aWftaID), cDropDown)
				If (Not aOptionsList Is Nothing) Then
					If not IsDBNull(aWftaDO("RequestConflictID")) Then
						aOptionsList.SelectedField = aWftaDO.GetPropertyInt("RequestConflictID").ToString()
					Else
						aOptionsList.SelectedField = "1"
					End If
				End If
				If aWftaDO.GetPropertyInt("WfTaskStatusID", 0) = 2 Then
					aOptionsList.BaseControl.Enabled = False
					ctlConflictType.BaseControl.Enabled = False
				End If
			Next
		End If

	End Sub

	Public Overrides Sub DataPresenter_SaveDataObjects()
		Dim aWftaDOList As cDataObjectList
		Dim aWftaDO As cDataObject
		Dim aGranteeProjectID As Integer
		Dim aObj As cDataObject
		Dim aWftaID As Integer
		Dim aWfTaskID As Integer
		Dim aOptionsHash As Hashtable
		Dim aConflictTypeHash As Hashtable
		Dim aOptionsList As cRadioButtonList
		Dim ctlConflictType As cDropDown
		Dim aList As cDataObjectList
		Dim aRevWftaDO As cDataObject

        aWftaDOList = CType(DataObjectCollection("ReviewConflicts"), cDataObjectList)
		
		ctlList = FindControl("ctlList")
		aOptionsHash =  ctlList.DataListCtl_GetControlCollection("ctlOptions")
		aConflictTypeHash =  ctlList.DataListCtl_GetControlCollection("ctlConflictType")

		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				If Not aWftaDO.GetPropertyInt("WfTaskStatusID") = 2 Then
					aWftaID = aWftaDO.GetPropertyInt("RevWftaID")
					aRevWftaDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWftaID)
					aWfTaskID = aWftaDO.GetPropertyInt("RevWfTaskID")
					aOptionsList = CType(aOptionsHash(aWftaID), cRadioButtonList)
					ctlConflictType = CType(aConflictTypeHash(aWftaID), cDropDown)
					aGranteeProjectID = aWftaDO.GetPropertyInt("GranteeProjectID")
					If Not aOptionsList Is Nothing Then
						aRevWftaDO("ReviewPreferenceTypeID") = aOptionsList.SelectedValue
						If ctlConflictType.SelectedValue = "" Then
							aRevWftaDO("ReviewConflictTypeID") = System.DBNull.Value
						Else
							aRevWftaDO("ReviewConflictTypeID") = ctlConflictType.SelectedValue
						End If
						aRevWftaDO.SaveData()

						aList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleConflict", _
							"ReviewCycleID", aRevWftaDO.GetRelatedPropertyString("ReviewCycleStage.ReviewCycleID"), _
							"RevPersonID", aWftaDO.GetPropertyString("ReviewerID"), _
							"AppPersonID", aWftaDO.GetRelatedPropertyString("AppPersonID"))
						
						If aList.Count > 0 Then
							If aList(0)("ReviewSourceID") <> 3 And aList(0)("RequestConflictID") = 2 And aOptionsList.SelectedValue < 2 Then
							'do not do anything if reviewer wants to override a non external conflict
							Else
								aList(0)("RequestConflictID") = aOptionsList.SelectedValue
								If ctlConflictType.SelectedValue = "" Then
									aList(0)("ConflictTypeID") = System.DBNull.Value
								Else
									aList(0)("ConflictTypeID") = ctlConflictType.SelectedValue
								End If
								If aList(0).Modified Then
									'aList(0)("WFTAID") = aWftaDO.GetPropertyString("RevWftaID")
									aList(0)("RevWFTAID") = aWftaDO.GetPropertyString("RevWftaID")
									aList(0)("ReviewSourceID") = 3 'external
									aList(0).SaveData()
								End If
							End If
						Else
							aObj = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("ReviewCycleConflict")
							aObj("ReviewCycleID") = aRevWftaDO.GetRelatedPropertyString("ReviewCycleStage.ReviewCycleID")
							aObj("RevPersonID") = aWftaDO.GetPropertyString("ReviewerID")
							aObj("AppPersonID") = aWftaDO.GetRelatedPropertyString("AppPersonID")
							aObj("RequestConflictID") = aOptionsList.SelectedValue
							If ctlConflictType.SelectedValue = "" Then
								aObj("ConflictTypeID") = System.DBNull.Value
							Else
								aObj("ConflictTypeID") = ctlConflictType.SelectedValue
							End If
							aObj("ReviewSourceID") = 3 'external
							aObj("RevWFTAID") = aWftaDO.GetPropertyInt("RevWftaID")
							aObj("ReviewCommitteeID") = aRevWftaDO.GetPropertyInt("ReviewCommitteeID")
							aObj.SaveData()
						End If
					End If
				End If
			Next
		End If	
	End Sub
	
	Public Sub ViewParticipantSummary(ByVal aPageKey As String, ByVal aGranteeProjectID As String)
		If Not EventController_Save(True) Then
			Exit Sub
		End If
		Dim aNewWindowUrl As String = Request.Url.ToString
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "Page", aPageKey)
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "PageFrame=Print")
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, aGranteeProjectID)
		ctlNewWindowOpener.NewWindowURL() = aNewWindowUrl
		ctlNewWindowOpener.Open()
	End Sub

End Class
End Namespace