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
Public MustInherit Class cGranteeProjectTaskEditor2
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

    Protected mGPOList As cDataObjectList
    
'=============================================================

	Protected ReadOnly Property WfTaskAssignment() As cDataObject
		Get
			If Request.QueryString("WfTaskAssignmentID") Is Nothing Then Return Nothing

			Return WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", _
				Request.QueryString("WfTaskAssignmentID"))
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property GranteeProject() As cGranteeProject
		Get
			If WfTaskAssignment Is Nothing Then 
				If Request.QueryString("GranteeProjectID") Is Nothing then
					Return Nothing
				else
					Return WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", _
						Request.QueryString("GranteeProjectID"))
				end if
			end if
            Return WfTaskAssignment.GetRelatedPropertyDataObject("GranteeProject")
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property WfProject() As cWfProject
		Get
			If GranteeProject Is Nothing Then Return Nothing

			Return GranteeProject.GetRelatedPropertyDataObject("WfProject")
		End Get
	End Property

'=============================================================

    Protected Overrides Function DataPresenter_Get_DataObjectList(ByRef aDataObjectElement As XmlElement) As cDataObjectList
			Dim aRowNum As Integer
			Dim aWfTask As cDataObject
			Dim aWfTaskList As cDataObjectList
			aWfTaskList = WfProject.Get_WfProjectTasks_All()
			'aWfTaskList = WfProject.Get_WfTasks_All()

			Dim aReturnList As cDataObjectList
  			aReturnList = new cDataObjectList(WebSession.DataObjectFactory)

			aRowNum = 1
			For Each aWfTask In aWfTaskList

				Dim aXMLDoc As cXMLDoc 
				Dim aDataObjectNode As XmlNode 
				Dim aFiltersNode As XmlNode 
				Dim aArgNode As XmlNode 
				Dim aGranteeProjectOutcomes As cGranteeProjectOutcomes 

				aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("GranteeProjectOutcomes", aDataObjectNode, aFiltersNode)
				aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "GranteeProjectID", GranteeProject.GetPropertyString("GranteeProjectID"))
				aFiltersNode.AppendChild(aArgNode)
				aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskID", aWfTask.GetPropertyString("WfTaskID"))
				aFiltersNode.AppendChild(aArgNode)
				aGranteeProjectOutcomes = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
				If aGranteeProjectOutcomes Is Nothing Then
					aGranteeProjectOutcomes = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
					aGranteeProjectOutcomes("GranteeProjectID") = GranteeProject.GetPropertyInt("GranteeProjectID")
					aGranteeProjectOutcomes("WfTaskID") = aWfTask.GetPropertyInt("WfTaskID")
					aGranteeProjectOutcomes("GranteeProjectOutcomesID") = -aRowNum
				End If
				aReturnList.Add(aGranteeProjectOutcomes)
				
				aRowNum = aRowNum + 1
			Next		
  
			mGPOList = aReturnList
			return aReturnList
        
    End Function

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		If Not IsPostBack Then
			Dim aRowNum As Integer
			Dim aButtonEdit As cCSSButton
			Dim aDataListCtl As cDataListCtl
			aDataListCtl = CType(FindControl("ctlDataList"), cDataListCtl)
			Dim aGPO As cGranteeProjectOutcomes
			For Each aGPO In mGPOList
				aRowNum = aGPO.GetPropertyInt("GranteeProjectOutcomesID", 0)
				If aRowNum < 1 Then
					aButtonEdit = CType(aDataListCtl.DataListCtl_GetControl("btnEdit", aRowNum), cCSSButton)
					if Not aButtonEdit Is Nothing Then
						aButtonEdit.Visible = False
					End If
				End If				
			Next
		End If

	End Sub

'=============================================================

End Class
End Namespace