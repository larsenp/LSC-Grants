Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Easygrants.DataAccess
Imports Easygrants.DataAccess.Report
Imports EasyGrants.Web
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cStandardReports_Open
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

	Protected mGoMethod As String
	Protected mReportOutputDefinitionID As Integer
	Protected mReportDO As cDataObject
	Protected mFormattedReportXMLDoc As cXMLDoc

'=============================================================

	Public Property GoMethod() As String
		Get
			Return mGoMethod
		End Get
		Set(ByVal Value As String)
			mGoMethod = Value
		End Set
	End Property

'----------------------------------------------------

	Public Property ReportOutputDefinitionID() As Integer
		Get
			Return mReportOutputDefinitionID
		End Get
		Set(ByVal Value As Integer)
			mReportOutputDefinitionID = Value
		End Set
	End Property

'----------------------------------------------------

	Public ReadOnly Property ReportID() As String
		Get
			Return Request.QueryString("ReportID")
		End Get
	End Property

'----------------------------------------------------

	Public ReadOnly Property ReportDO() As cDataObject
		Get
			If mReportDO Is Nothing Then
				mReportDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Report", ReportID)
			End If

			Return mReportDO
		End Get
	End Property

'----------------------------------------------------

	Public ReadOnly Property FormattedReportNode() As XmlNode
		Get
			If mFormattedReportXMLDoc Is Nothing Then
				mFormattedReportXMLDoc = New cXMLDoc()
				mFormattedReportXMLDoc.LoadFromXML(ReportDO.GetPropertyString("DataObjectXML"))
			End If

			Return mFormattedReportXMLDoc.DocElement
		End Get
	End Property

'=============================================================

	Public Function Create_ReportOutput()
		Dim aReportOutput As cReportOutput

		aReportOutput = cReportOutput.ReportOutput_Create(WebSession.DataObjectFactory, 0, _
							ReportOutputDefinitionID)
		aReportOutput("ReportParametersXML") = FormattedReportNode.OuterXml
		aReportOutput.SaveData()

		Return aReportOutput
	End Function

'-------------------------------------------------------------

	Protected Sub Populate_FormattedReportNode_Arguments()
		Dim aDataObjectsNL As XmlNodeList
		Dim aDataObject As XmlNode

		aDataObjectsNL = FormattedReportNode.SelectNodes("DataObject")
		For Each aDataObject In aDataObjectsNL
			Dim aArgumentsNL As XmlNodeList
			Dim aArgumentNode As XmlNode

			aArgumentsNL = aDataObject.SelectNodes("Filters/Argument")

			For Each aArgumentNode In aArgumentsNL
				Dim aValue As String

				aValue = EventController_GetArgumentValue(aArgumentNode, Nothing)
				If Not aValue = "" Then
					cXMLDoc.AddAttribute_ToNode(aArgumentNode, "Value", aValue)
				End If
			Next
		Next
	End Sub
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		Dim aReportOutput As cDataObject
		aReportOutput = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Report", ReportID)
		ReportOutputDefinitionID = aReportOutput.GetPropertyInt("ReportOutputDefinitionID")

		If Not GoMethod = "" Then
			Dim aDataObjectNode As XmlNode
			Dim aControlNode As XmlNode
			Dim aActionNode As XmlNode

			aDataObjectNode = cXMLDoc.FindNode(mXMLDoc.DocElement, "DataObject", "Key", "Base")
			aControlNode = cXMLDoc.FindNode(aDataObjectNode, "DisplayProperties/DisplayProperty/Control", "ID", "ctlReportOutput")
			aActionNode = aControlNode.SelectSingleNode("Action")
			If aActionNode Is Nothing Then Exit Sub

			cXMLDoc.AddAttribute_ToNode(aActionNode, "Object", "ModulePageContent")
			cXMLDoc.AddAttribute_ToNode(aActionNode, "Method", GoMethod)
		End If
	End Sub

'----------------------------------------------------

	Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
		MyBase.CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)

		If Not GoMethod = "" Then
			Dim aActionNode As XmlNode
			aActionNode = aDisplayPropertyNode.SelectSingleNode("Control/Action")
			If aActionNode Is Nothing Then Exit Sub

			cXMLDoc.AddAttribute_ToNode(aActionNode, "Method", GoMethod)
		End If
	End Sub

'=============================================================
'this method will open a report using the FormattedReport Node in the Report object
	Public Sub OpenReport()
		Dim ctlWindowOpener As cNewWindowOpener
		Dim aURL As String
		Dim aReportOutput As cReportOutput

		aReportOutput = Create_ReportOutput()

		'Set window opener properties and open report output window
		ctlWindowOpener = CType(FindControl("ctlWindowOpener"), cNewWindowOpener)
		aURL = CType(WebAppl, cEGAppl).Build_ReportOutput_ReportOutputID_URL(aReportOutput)
		ctlWindowOpener.NewWindowURL() = aURL
		ctlWindowOpener.Open()

	End Sub

'=============================================================
End Class
End Namespace