Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
'Imports Core_Web.Controls.Base
Imports EasyGrants.DataAccess.Report

Namespace Core_Web.Controls.Base
Public MustInherit Class cstaffReportOutput
	Inherits Core.Web.cstaffCtl
'====================================================

	Protected btnReset As cCSSButton
	Protected btnDelete As cCSSButton
	Protected tabStaffReportOutput As HtmlTable
	Protected tdDefinition As HtmlTableCell
	Protected tdGenStatus As HtmlTableCell
	Protected tdOptions As HtmlTableCell

	Protected mReportOutputLinkCtl As cReportOutputLink

	Protected mReportOutput As cReportOutput

'----------------------------------------------------

	Public Property ReportOutputLinkCtl() As cReportOutputLink
		Get
			ReportOutputLinkCtl = mReportOutputLinkCtl
		End Get
		Set(ByVal Value As cReportOutputLink)
			mReportOutputLinkCtl = Value
		End Set
	End Property

'----------------------------------------------------

	Protected ReadOnly Property ReportOutput() As cReportOutput
		Get
			If mReportOutput Is Nothing Then
				Dim aXmlDoc As cXMLDoc
				Dim aDataObjectNode As XmlNode
				Dim aFiltersNode As XmlNode
				Dim aArgNode As XmlNode

				aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("ReportOutput", aDataObjectNode, aFiltersNode)
					aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "EntityID", _
								EntityID))
					aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "DefinitionID", _
								DefinitionID))

				mReportOutput = CType(WebSession.DataObjectFactory.GetDataObject(aDataObjectNode), _
									cReportOutput)
			End If

			ReportOutput = mReportOutput
		End Get
	End Property

'----------------------------------------------------

	Public ReadOnly Property EntityID() As String
		Get
			EntityID = ""
			If ReportOutputLinkCtl Is Nothing Then Exit Property
			EntityID = ReportOutputLinkCtl.EntityID
		End Get
	End Property

'----------------------------------------------------

	Public ReadOnly Property DefinitionID() As String
		Get
			DefinitionID = ""
			If ReportOutputLinkCtl Is Nothing Then Exit Property
            DefinitionID = ReportOutputLinkCtl.DefinitionID
		End Get
	End Property

'----------------------------------------------------

	Public ReadOnly Property DefinitionDescription() As String
		Get
			Dim aReportOutputDefinition As cDataObject

			DefinitionDescription = ""
			If ReportOutputLinkCtl Is Nothing Then Exit Property
			If Not DefinitionID Is Nothing Then 'Wtrinh 03/29/04
				aReportOutputDefinition = Me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("ReportOutputDefinition", DefinitionID.ToString())
			End If
			If aReportOutputDefinition Is Nothing Then Exit Property
			DefinitionDescription = aReportOutputDefinition("Description") & " (" & DefinitionID & ")"
		End Get
	End Property

'----------------------------------------------------

	Public ReadOnly Property GenStatus() As String
		Get
			GenStatus = ""
			If ReportOutput Is Nothing Then Exit Property

			'GenStatus = ReportOutput("GenStatus")
			GenStatus = ReportOutput("GenResult")
		End Get
	End Property

'====================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
		If Not Visible Then Exit Sub

		If ReportOutput Is Nothing Then
			btnReset.Visible = False
			btnDelete.Visible = False
		Else
			btnReset.Set_ServerClick(AddressOf Me.btnReset_Click)
			btnDelete.Set_ServerClick(AddressOf Me.btnDelete_Click)
			
			If ReportOutput.GetRelatedPropertyBool("WfTaskAssignment.WfProjectTaskPDF.PDFGenerationID", True) = True Then
				btnReset.Visible = False
				btnDelete.Visible = False
			Else
				Dim aDO As cDataObject
				Dim aDOL As cDataObjectList
				aDOL = ReportOutput.GetRelatedPropertyDataObjectList("WfTaskAssignment.WfProjectTaskPDF")
				For Each aDO In aDOL
					If ReportOutput.GetRelatedPropertyString("ReportOutputDefinition.Key") = aDO.GetPropertyString("FinalPDFReportKey", "0") Then
						If aDO.GetRelatedPropertyBool("PDFGenerationID", True) = True Then
							btnReset.Visible = False
							btnDelete.Visible = False
						End If
					End If
				Next
			End If
		End If
	End Sub

'====================================================

	Public Sub btnReset_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		If Not ReportOutput Is Nothing Then
			ReportOutput.Save_GenerationStatus(0)
		End If

		Me.CorePage.Redirect()
	End Sub

'----------------------------------------------------

	Public Sub btnDelete_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		If Not ReportOutput Is Nothing Then
			ReportOutput.ReportOutput_Delete()
		End If

		Me.CorePage.Redirect()
	End Sub

'====================================================
End Class
End Namespace