Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base


Namespace EasyGrants.Controls.Base

Public MustInherit Class cSelectCompetition
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

'============================================================
	Private mProgramID As String
	Private mCompetitionID As String
	Private mDrillDown As Boolean
	Private mctlProgram As cDropDown
    Protected trCompetition As HtmlTableRow
    Protected ctlProgram As cDropDown
    Protected ctlCompetition As cDropDown
	Protected btnCompetition As cCSSButton

'============================================================
	Public Property ProgramID() As String
		Get
			If mctlProgram Is Nothing Then
				Return ""
			Else
				Return mctlProgram.SelectedValue
			End If
		End Get
		Set
			If Not mctlProgram Is Nothing Then
				mctlProgram.SelectedField = Value
			End If
		End Set
	End Property

'-------------------------------------------------------------

	Public Property CompetitionID() As String
		Get
			Try
				Return ctlCompetition.SelectedValue
			Catch
				Return ""
			End Try
		End Get
		Set
			ctlCompetition.SelectedField = Value
		End Set
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
		mctlProgram = CType(Me.FindControl("ctlProgram"), cDropDown)
		If Not Request.QueryString("ProgramID") Is Nothing Then 
			ProgramID = Request.QueryString("ProgramID")
			
			Dim aXmlDoc as cXMLDoc
			Dim aDataObjectNode As XmlNode
			Dim aFiltersNode As XmlNode
			Dim aSortNode As XmlNode
			Dim aDataObjectList As cDataObjectList
			Dim aDataObject As cDataObject
			Dim aItem As ListItem

			trCompetition.Visible = True

			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Competition", aDataObjectNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ProgramID", ProgramID))
			aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode)
			aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "CompetitionDisplayName", ""))
			aDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)

			aItem = New ListItem("<None>", "")
			ctlCompetition.Items.Add(aItem)

			For Each aDataObject In aDataObjectList
				aItem = New ListItem(aDataObject.GetPropertyString("CompetitionDisplayName"), aDataObject.GetPropertyString("CompetitionID"))
				ctlCompetition.Items.Add(aItem)
			Next
			If Not Request.QueryString("CompetitionID") Is Nothing Then 
				CompetitionID = Request.QueryString("CompetitionID")
			End If
			If DrillDown Then
				btnCompetition.Set_ServerClick(AddressOf SelectCompetition)
			Else
				btnCompetition.Visible = False
			End If
		End If

	End Sub
	
'------------------------------------------------------------

	Public Sub SelectProgram
		Dim aURL As String

		aURL = Request.RawUrl
		aURL = cWebLib.AddQuerystringParameter(aURL, "CompetitionID", "")
		aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", "")
		aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskID", "")

		aURL = cWebLib.AddQuerystringParameter(aURL, "ProgramID", mctlProgram.SelectedValue)
		Response.Redirect(aURL)
	End Sub

'------------------------------------------------------------

	Private Sub SelectCompetition(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Dim aURL As String

		aURL = Request.RawUrl
		aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", "")
		aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskID", "")

		aURL = cWebLib.AddQuerystringParameter(aURL, "ProgramID", mctlProgram.SelectedValue)
		aURL = cWebLib.AddQuerystringParameter(aURL, "CompetitionID", ctlCompetition.SelectedValue)
		Response.Redirect(aURL)
	End Sub

'============================================================
End Class
End Namespace