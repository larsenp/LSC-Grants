Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.Staff.Controls.PageContent
Public MustInherit Class cApplicantPoolEditor
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlOutcome As cCheckBoxList
	Protected ctlSelectedTask as cDropDown
	Protected spnSelectedTask as HtmlGenericControl
	Protected spnTask as HtmlGenericControl
	
	Public ReadOnly Property ReviewStageID() As String
		Get
            If Not Request.QueryString("ReviewStageID") Is Nothing Then
                Return Request.QueryString("ReviewStageID")
            Else
                Return ""
            End If
		End Get
	End Property
	
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		if me.Request.QueryString("ReviewCycleProjectTaskID") = "0" then
			spnSelectedTask.Visible = True
			ctlSelectedTask = Me.FindControl("ctlSelectedTask")
			
			ctlSelectedTask.Set_ServerIndexChange(AddressOf AddFilter)
		else
			spnTask.Visible = True
		End If		
		
	End Sub

	Private Sub AddFilter(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Dim aURL As String
		Dim aItem as ListItem
		Dim aItemValue as String
		Dim aDataObjectList as cDataObjectList

		aURL = Request.RawUrl.ToString()

		ctlOutcome = Me.FindControl("ctlOutcome")
		ctlSelectedTask = Me.FindControl("ctlSelectedTask")

		If ctlSelectedTask.SelectedValue <> "" then
			dim aObj as cDataObject = me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", ctlSelectedTask.SelectedValue)
			if not aObj is nothing then
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskID", aObj.GetPropertyString("WfTaskID"))
			end if
			aURL = cWebLib.AddQuerystringParameter(aURL, "ProjectTaskID", ctlSelectedTask.SelectedValue)
		Else
			aURL = cWebLib.RemoveQuerystringParameter(aURL, "WfTaskID")
			aURL = cWebLib.RemoveQuerystringParameter(aURL, "ProjectTaskID")
		End If
		
		Response.Redirect(aURL)
	End Sub

	Public Sub GoClick(ByVal aStepName As String, ByVal aValue As String)
		Dim aURL As String
		Dim aItem as ListItem
		Dim aItemValue as String
		Dim aDataObjectList as cDataObjectList

		aURL = Request.RawUrl.ToString()

		ctlOutcome = Me.FindControl("ctlOutcome")
		ctlSelectedTask = Me.FindControl("ctlSelectedTask")

		Select Case aStepName
			Case "Task"
				If ctlSelectedTask.SelectedValue <> "" then
					dim aObj as cDataObject = me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", aValue)
					if not aObj is nothing then
						aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskID", aObj.GetPropertyString("WfTaskID"))
					end if
				aURL = cWebLib.AddQuerystringParameter(aURL, "ProjectTaskID", aValue)
				Else
					For each aItem in ctlOutcome.BaseControl.Items
						aItemValue = aItem.Value.ToString()				
						aItem.Selected = False	
					Next
					aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewStageGranteeProjectCriteria", "ReviewStageID", ReviewStageID)
					If aDataObjectList.Count > 0 then
						WebSession.DataObjectFactory.DeleteData(aDataObjectList)	
					End If	
					Dim aReturnURL as String
					aReturnURL = Request.QueryString("ReturnURL")
					
					EventController_NavigateToURL(aReturnURL)
					
					'TODO:  Display "None" in drop down
					 'ctlSelectedTask.BaseControl.SelectedIndex = -1
					
					'dim aObj as cDataObject = me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", aValue)
					'aURL = Core.Web.cWebLib.RemoveQuerystringParameter(aURL, "WfTaskID")
					'aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskID", aObj.GetPropertyString("WfTaskID"))
					'response.Redirect(aURL)

					'TODO:  Display outcomes for current outcome				
				End If
			End Select

		Response.Redirect(aURL)
	End Sub

	Public Overrides Sub DataPresenter_SaveDataObjects()
		MyBase.DataPresenter_SaveDataObjects()
		
		Dim aDataObject As cDataObject
		Dim aDataObjectList As cDataObjectList
		Dim aReviewCycleProjectTaskID As Integer
		Dim aTaskOutcomeID As Integer
		Dim aWfTaskID As Integer
		Dim aWfProjectID As Integer
		Dim aItem as ListItem
		Dim aFound As Boolean 
		Dim aXmlDoc As cXMLDoc
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode

		aDataObject = Me.DataObjectCollection("ReviewCycleProjectTask")(0)
		aReviewCycleProjectTaskID = aDataObject.GetPropertyInt("ReviewCycleProjectTaskID")

		aDataObject = Me.DataObjectCollection("WfProjectTask")(0)
		aWfTaskID = aDataObject.GetPropertyInt("WfTaskID")
		aWfProjectID = aDataObject.GetPropertyInt("WfProjectID")

		aDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleProjectTaskOutcome", "ReviewCycleProjectTaskID", aReviewCycleProjectTaskID)
		ctlOutcome = CType(FindControl("ctlOutcome"), cCheckBoxList)

		For Each aItem In ctlOutcome.BaseControl.Items
			aTaskOutcomeID = Integer.Parse(aItem.Value.ToString())
			If aItem.Selected Then
				'add it, if it doesn't exist
				aFound = False
				For Each aDataObject In aDataObjectList
					If aDataObject.GetPropertyInt("WfTaskOutcomeID") = aTaskOutcomeID Then
						aFound = True
					End If
				Next
				If Not aFound Then
					aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("ReviewCycleProjectTaskOutcome", aDataObjectNode, aFiltersNode)
					aDataObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
					aDataObject("ReviewCycleProjectTaskID") = aReviewCycleProjectTaskID
					aDataObject("WfTaskOutcomeID") = aItem.Value
					aDataObject("ReviewCycleID") = Request.QueryString("ReviewCycleID")
					aDataObject("WfTaskID") = aWfTaskID
					aDataObject("WfProjectID") = aWfProjectID
					WebSession.DataObjectFactory.SaveDataObject(aDataObject)
				End If				
			Else
				'delete it, if it exists
				For Each aDataObject In aDataObjectList
					If aDataObject.GetPropertyInt("WfTaskOutcomeID") = aTaskOutcomeID Then
						WebSession.DataObjectFactory.DeleteData(aDataObject)
					End If			
				Next
			End If			
		Next
	End Sub

    Public Sub ValidateApplicationTask(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ctlSelectedTask = Me.FindControl("ctlSelectedTask")
		aArgs.IsValid = (ctlSelectedTask.SelectedValue <> "")
   End Sub

    Public Sub ValidateOutcomes(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ctlOutcome = Me.FindControl("ctlOutcome")
		aArgs.IsValid = (ctlOutcome.BaseControl.SelectedIndex > -1)
   End Sub

End Class
End Namespace