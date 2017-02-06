Imports System.Xml
Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports EasyGrants.Controls.Base

Namespace EasyGrants.Controls.Base

Public MustInherit Class cSelectWfProject
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

'============================================================
	Private mDrillDown As Boolean
	Protected trProject As HtmlTableRow
	Protected ctlProject As cDropDown
	Protected btnProject As cCSSButton
	Protected ctlSelectComp As cSelectCompetition
'============================================================

	Public Property WfProjectID() As String
		Get
			If ctlProject.Visible = False Then
				Return ""
			Else
				Return ctlProject.SelectedValue
			End If
		End Get
		Set
			ctlProject.SelectedField = Value
		End Set
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property CompetitionID() As String
		Get
			Return ctlSelectComp.CompetitionID
		End Get
	End Property
	
'-------------------------------------------------------------

	Public ReadOnly Property ProgramID() As String
		Get
			Return ctlSelectComp.ProgramID
		End Get
	End Property
	
'-------------------------------------------------------------

	Public Property DrillDown() As Boolean
		Get
			Return mDrillDown
		End Get
		Set
			mDrillDown = Value
		End Set
	End Property
	
'============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		If Request.QueryString("CompetitionID") <> "" Then 
			Dim aXmlDoc as cXMLDoc
			Dim aDataObjectNode As XmlNode
			Dim aFiltersNode As XmlNode
			Dim aSortNode As XmlNode
			Dim aDataObjectList As cDataObjectList
			Dim aDataObject As cDataObject
			Dim aItem As ListItem

			trProject.Visible = True

			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfProject", aDataObjectNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "CompetitionID", Request.QueryString("CompetitionID")))
			aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode)
			aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfProjectName", ""))
			aDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)

			'aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProject", "CompetitionID", Request.QueryString("CompetitionID"))

			aItem = New ListItem("<None>", "")
			ctlProject.Items.Add(aItem)

			For Each aDataObject In aDataObjectList
				aItem = New ListItem(aDataObject.GetPropertyString("WfProjectName"), aDataObject.GetPropertyString("WfProjectID"))
				ctlProject.Items.Add(aItem)
			Next

			If DrillDown Then
				btnProject.Set_ServerClick(AddressOf SelectWfProject)
			Else
				btnProject.Visible = False
			End If
			If Not Request.QueryString("WfProjectID") Is Nothing Then 
				WfProjectID = Request.QueryString("WfProjectID")
			End If
		End If
	End Sub
	
'------------------------------------------------------------

	Private Sub SelectWfProject(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Dim aURL As String

		aURL = Request.RawUrl
		aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskID", "")

		aURL = cWebLib.AddQuerystringParameter(aURL, "ProgramID", ProgramID)
		aURL = cWebLib.AddQuerystringParameter(aURL, "CmptID", CompetitionID)
		aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", WfProjectID)
		Response.Redirect(aURL)
	End Sub

'============================================================

End Class
End Namespace