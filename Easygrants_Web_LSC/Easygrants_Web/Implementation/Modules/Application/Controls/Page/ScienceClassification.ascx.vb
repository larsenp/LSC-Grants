Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.Web.Modules
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports Core.Web

Namespace Easygrants_Web.Controls.PageSection
Public Class cScienceClassification
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'============================================================= 

	Protected ctlClass1 As cDropDown
	Protected ctlClass2 As cDropDown
	Protected ctlGranteeProjectScience1 as cDoubleListBox2
	Protected ctlGranteeProjectScience2 as cDoubleListBox2

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		dim aGPInfoList as cDataObjectList
		dim aClassID as Integer
		dim aClassID2 as Integer
		dim aURL as String
		
		ctlClass1 = CType(Me.FindControl("ctlClass1"), cDropDown)
		ctlClass1.Set_ServerIndexChange(AddressOf AddFilter)
		ctlClass2 = CType(Me.FindControl("ctlClass2"), cDropDown)
		ctlClass2.Set_ServerIndexChange(AddressOf AddFilter)
		
		if me.Request.QueryString("Class1") <> "" then
			ctlClass1.SelectedField = me.Request.QueryString("Class1")
		End If		
		
		if me.Request.QueryString("Class2") <> "" then
			ctlClass2.SelectedField = me.Request.QueryString("Class2")
		End If
		
		ctlClass2.Items.Remove(ctlClass2.Items.FindByValue(me.Request.QueryString("Class1")))
		
		aGPInfoList = Me.DataObjectCollection("Class")
		
		if me.Request.QueryString("IsRedirect") = "" then
			if aGPInfoList.Count = 1 then
				aClassID = aGPInfoList(0).GetPropertyInt("ScienceClassificationID", 0)
				aClassID2 = aGPInfoList(0).GetPropertyInt("ScienceClassification2ID", 0)
			'else
			'	dim aPRDO as cDataObject	
			'	aPRDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("PersonReviewer", me.Request.QueryString("PersonReviewerID"))
			'	aClassID = aPRDO.GetPropertyInt("ScienceClassificationID", 0)
			'	aClassID2 = aPRDO.GetPropertyInt("ScienceClassification2ID", 0)
			end if
			aURL = Me.Request.RawUrl.ToString()
			aURL = cWebLib.AddQuerystringParameter(aURL, "Class1", aClassID)
			aURL = cWebLib.AddQuerystringParameter(aURL, "Class2", aClassID2)
			aURL = cWebLib.AddQuerystringParameter(aURL, "IsRedirect", "True")
			me.Response.Redirect(aURL)
		end if
				
		'if me.Request.QueryString("ReviewCycleID") <> "0" and me.Request.QueryString("CmptType") is nothing then
		'	dim aObjList as cDataObjectList = ctype(me.DataObjectCollection("ReviewCycle"), cDataObjectList)
		'	me.Response.Redirect(cWebLib.AddQuerystringParameter(me.Request.RawUrl(), "CmptType", aObjList(0).GetPropertyString("CompetitionTypeID")))
		'End If
	End Sub

'-------------------------------------------------------------

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		
		'if not me.Request.QueryString("Class1") is nothing then
		'	ctlClass1.SelectedField = me.Request.QueryString("Class1")
		'End If
		
		'if not me.Request.QueryString("Class2") is nothing then
		'	ctlClass2.SelectedField = me.Request.QueryString("Class2")
		'End If
		
		dim aGPDO as cDataObject
		dim aList as cDataObjectList
		dim aDataObj as cDataObject
		Dim aLI As ListItem
		dim aList2 as cDataObjectList
		Dim aUser As cEGUser
		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		
		aGPDO = CType(me.DataObjectCollection("Class"), cDataObjectList)(0)
		dim ctlPersonReviewerScience1 as cDoubleListBox2
		dim ctlPersonReviewerScience2 as cDoubleListBox2
		
		ctlGranteeProjectScience1 = CType(me.FindControl("ctlGranteeProjectScience1"), cDoubleListBox2)
		ctlGranteeProjectScience2 = CType(me.FindControl("ctlGranteeProjectScience2"), cDoubleListBox2)
		
		if not me.Request.QueryString("Class2") is nothing then
			ctlClass2.SelectedField = me.Request.QueryString("Class2")
			aList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectScience1", "GranteeProjectID", _
				aUser.GranteeProjectID.ToString())
			
			ctlGranteeProjectScience1.AGCtl_ClearRightRows()
				For Each aDataObj In aList
					aLI = New ListItem()
					aLI.Value = aDataObj.GetRelatedPropertyString("Science.ScienceID")
					aLI.Text = aDataObj.GetRelatedPropertyString("Science.Description")
					ctlGranteeProjectScience1.AddItemRight(aLI)
				Next
		elseif not me.Request.QueryString("Class1") is nothing then
			ctlClass1.SelectedField = me.Request.QueryString("Class1")
			aList2 = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectScience2", "GranteeProjectID", _
				aUser.GranteeProjectID.ToString())
			
			ctlGranteeProjectScience2.AGCtl_ClearRightRows()
				For Each aDataObj In aList2
					aLI = New ListItem()
					aLI.Value = aDataObj.GetRelatedPropertyString("Science.ScienceID")
					aLI.Text = aDataObj.GetRelatedPropertyString("Science.Description")
					ctlGranteeProjectScience2.AddItemRight(aLI)
				Next					
		end If
	End Sub

'-------------------------------------------------------------

	Private Sub AddFilter(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Select Case CType(sender, Control).Parent.ID
			'Case "ctlClass1"
			'	me.Response.Redirect(cWebLib.AddQuerystringParameter(me.Request.RawUrl(), "Class1", ctlClass1.SelectedValue) + "&#Class1")
			'Case "ctlClass2"
			'	me.Response.Redirect(cWebLib.AddQuerystringParameter(me.Request.RawUrl(), "Class2", ctlClass2.SelectedValue) + "&#Class2")
			
			Case "ctlClass1"
				'if me.Request.QueryString("Class2") <> "Nothing" then
					if me.Request.QueryString("Class2") = "" then
						dim aURL as String
						aURL = Me.Request.RawUrl.ToString()
						aURL = cWebLib.AddQuerystringParameter(aURL, "Class1", ctlClass1.SelectedValue + "&#Class1")
						'MyBase.DataPresenter_SaveDataObjects()
						me.Response.Redirect(aURL)
					else
						MyBase.DataPresenter_SaveDataObjects()
						Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
						dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectScience1", _
							"GranteeProjectID", aUser.GranteeProjectID.ToString())
						me.WebSession.DataObjectFactory.DeleteData(aList)
						me.Response.Redirect(cWebLib.AddQuerystringParameter(me.Request.RawUrl(), "Class1", ctlClass1.SelectedValue) + "&#Class1")
					end if
				'end if
			Case "ctlClass2"
				MyBase.DataPresenter_SaveDataObjects()
				Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
				dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectScience2", _
					"GranteeProjectID", aUser.GranteeProjectID.ToString())
				me.WebSession.DataObjectFactory.DeleteData(aList)
				me.Response.Redirect(cWebLib.AddQuerystringParameter(me.Request.RawUrl(), "Class2", ctlClass2.SelectedValue) + "&#Class2")
		End Select
	End Sub

'-------------------------------------------------------------

  '  Public Sub Cancel()
		'dim aObjList as cDataObjectList = ctype(me.DataObjectCollection("ReviewCycle"), cDataObjectList)
		
		'if aObjList(0).GetPropertyString("CompetitionTypeID") = "" then
		'	me.WebSession.DataObjectFactory.DeleteData(aObjList(0))
		'end if
		
		'me.EventController_NavigateToModulePageKey("ReviewCycle")
  '  End Sub    
   
'=============================================================
End Class 'cBudgetPeriod_Editor
End Namespace
