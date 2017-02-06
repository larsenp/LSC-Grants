Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess


Namespace Easygrants_Web.Modules.Staff.Controls.Page
Public MustInherit Class cTaskEditor_content
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	'Private mWfTaskID As String = ""

	'Public ReadOnly Property WfTaskID() As String
	'	Get
	'		If Request.QueryString("WfTaskID") <> "" Then
	'			mWfTaskID = Request.QueryString("WfTaskID")
	'		Else
	'			If Request.QueryString("WfProjectTaskID") <> "0" Then
	'				Dim aWfProjectTask As cDataObject
	'				aWfProjectTask = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", Request.QueryString("WfProjectTaskID"))
	'				If Not aWfProjectTask Is Nothing Then
	'					mWfTaskID = aWfProjectTask.GetPropertyString("WfTaskID")
	'				End If
	'			End If
	'		End If
	'		Return mWfTaskID
	'	End Get
	'End Property

	'Protected Overrides Sub DataPresenter_SetDataObjectValuesFromCtls(ByRef aDataObjectList As cDataObjectList, ByVal aDataObjectElement As XmlNode)
	'	MyBase.DataPresenter_SetDataObjectValuesFromCtls(aDataObjectList, aDataObjectElement)
	'	If cXMLDoc.AttributeToString(aDataObjectElement, "Key") = "TaskEditor" Then
	'		If Not Request.QueryString("WfTaskID") Is Nothing Then
	'			aDataObjectList(0)("WfTaskID") = Request.QueryString("WfTaskID")
	'		End If
	'	End If
	'End Sub
	
		'Public Overrides Sub DataPresenter_SaveDataObjects()
		'	MyBase.DataPresenter_SaveDataObjects()
		'	Dim aWfProjectTaskOutcomeDO As cDataObject
		'	aWfProjectTaskOutcomeDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfProjectTaskOutcome")
		'	If Not CType(Me.DataObjectCollection("TaskEditor"), cDataObjectList)(0) Is Nothing Then
		'		aWfProjectTaskOutcomeDO("WfProjectTaskID") = CType(Me.DataObjectCollection("TaskEditor"), cDataObjectList)(0)("WfProjectTaskID")
		'		aWfProjectTaskOutcomeDO.SaveData()
		'	End If
		'End Sub
		
	Public Overrides Function EventController_Save() As Boolean
		MyBase.EventController_Save(True)
		'Dim aWfProjectTaskOutcomeDO As cDataObject
		'aWfProjectTaskOutcomeDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfProjectTaskOutcome")
		'If Not CType(Me.DataObjectCollection("TaskEditor"), cDataObjectList)(0) Is Nothing Then
		'	aWfProjectTaskOutcomeDO("WfProjectTaskID") = CType(Me.DataObjectCollection("TaskEditor"), cDataObjectList)(0)("WfProjectTaskID")
		'	aWfProjectTaskOutcomeDO.SaveData()
		'End If
	End Function

End Class
End Namespace