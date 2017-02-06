Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports EasyGrants.Web


Namespace Implementation.Modules.Home.Controls.Page
Public Class cRequestNewSubgrantApproval
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected txtStartDate As cDateTextBox
	Protected txtEndDate As cDateTextBox

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		txtStartDate = GetControl("txtStartDate")
		txtEndDate = GetControl("txtEndDate")
	End Sub

	Public Overridable Sub RequestNewSubgrantApproval(ByVal aPersonID As String, ByVal aStartDate As String, ByVal aEndDate As String, ByVal aSubgrantee As String, _
				ByVal aSubgrantAmount As String, ByVal aWfTaskID As String, ByVal aWfProjectID As String)
		Page.Validate()
		If Not Page.IsValid() Then Exit Sub
		Dim aXmlDoc As cXMLDoc
		Dim aDataObjectNode, aFiltersNode As XmlNode
		aDataObjectNode = Nothing
		aFiltersNode = Nothing
		Dim aDO As cDataObject
		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("LscCreateSubgrantApprovalRequest", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "person_id", aPersonID))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "start_date", aStartDate))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "end_date", aEndDate))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "subgrantee", aSubgrantee))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "subgrant_amount", aSubgrantAmount))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "wf_project_id", aWfProjectID))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "wf_task_id", aWfTaskID))
		aDO = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
		If aDO Is Nothing Then
			Throw New System.Exception("LSC Grants was unable to create a new Subgrant Approval Request: " + aPersonID + ", " + aStartDate + ", " + aEndDate + ", " + aSubgrantee + ", " + aSubgrantAmount)
		End If
		If aDO.GetPropertyInt("wf_task_assignment_id", 0) = 0 Then
			Throw New System.Exception("This user is not the primary contact for a grantee organization. Please contact techsupport@lsc.gov")
		End If
		Select Case aWfTaskID
			Case "53"
				CType(WebSession, cEGSession).RedirectToModule("Application", "RequestSubgrantApproval53Config", "", aDO.GetPropertyString("wf_task_assignment_id"))
			Case "101"
			CType(WebSession, cEGSession).RedirectToModule("Application", "RequestProvisionalSubgrantApproval101Config", "", aDO.GetPropertyString("wf_task_assignment_id"))
		End Select

	End Sub

	Public Overridable Sub RequestNewSubgrantApproval(ByVal aPersonID As String, ByVal aStartDate As String, ByVal aEndDate As String, ByVal aSubgrantee As String, ByVal aSubgrantAmount As String)
		RequestNewSubgrantApproval(aPersonID, aStartDate, aEndDate, aSubgrantee, aSubgrantAmount, "53", "2810")
	End Sub

	Public Sub ValidateSubgrantDateOrder(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		If Me.txtStartDate.myDate Is System.DBNull.Value Or Me.txtEndDate.myDate Is System.DBNull.Value Then Return
		If Me.txtStartDate.myDate >= Me.txtEndDate.myDate Then
			aArgs.IsValid = False
		End If
	End Sub

	Public Sub ValidateSubgrantDuration(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		If Me.txtStartDate.myDate Is System.DBNull.Value Or Me.txtEndDate.myDate Is System.DBNull.Value Then Return
		Dim aDiff As TimeSpan = Me.txtEndDate.myDate.Subtract(Me.txtStartDate.myDate)
		Dim aYear As TimeSpan = New TimeSpan(366, 0, 0, 0)
		If aDiff >= aYear Then
			aArgs.IsValid = False
		End If
	End Sub

End Class
End Namespace
