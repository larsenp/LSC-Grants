Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports EasyGrants.Web.User
Imports EasyGrants.Correspondence
Imports System.Xml
Imports EasyGrants.DataAccess.Report
Imports System.Text

Namespace Easygrants_Web.Controls.Base

    Public Class cExportWord
        Inherits Core.Web.cCorePage
        '=============================================================

#Region " Web Form Designer Generated Code "

        'This call is required by the Web Form Designer.
        <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

        End Sub

        Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region
        Private mCorrespondenceDefinitionID As String = ""
        Private mEmailArgs As IEmailArgs
        Protected spnDisplayName As HtmlGenericControl
        'Protected spnDefinitionKey As HtmlGenericControl
        Protected spnCount As HtmlGenericControl
        Protected mIsHtml As cCheckBox
        Protected ctlViewWord As cNewWindowOpener
		protected spnWinOpen as HtmlGenericControl
		Protected mURL As String

'=============================================================

	Public Property URL() As String
		Get
			Return mURL
		End Get
		Set(ByVal Value As String)
			mURL = Value
		End Set
	End Property

'=============================================================

        Public Overrides Sub CorePage_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
            'MyBase.CoreCtl_Load(sender, e)

   '         Dim aURL As String
			'Dim aEntityID As String
			Dim aReportOutput As cReportOutput
			'Dim aXMLDoc As cXMLDoc
			Dim aXmlNode As XmlNode
			Dim aAttr As XmlAttribute

			aReportOutput = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("ReportOutput")
			aReportOutput("EntityID") = request.QueryString("SubmittedFileID")
			aReportOutput("DefinitionID") = request.QueryString("DefinitionID")
			aReportOutput("GenRequestDate") = DateTime.Now
			aReportOutput("GenStatus") = 0
			aReportOutput("GenResult") = "Report is in the queue to be generated."

			aXmlNode = SavedQueryDO.SavedQueryDefXMLDoc.DocElement
			aAttr = aXmlNode.OwnerDocument.CreateAttribute("SubmittedFileID")
			aAttr.Value = request.QueryString("SubmittedFileID")
			aXmlNode.Attributes.Append(aAttr)

			'aReportOutput("ReportParametersXML") = aXmlNode.OuterXml
			aReportOutput("ReportParametersXML") = aXmlNode.SelectSingleNode("DataProviderInfo").InnerText
			Me.WebSession.DataObjectFactory.SaveDataObject(aReportOutput)

			URL = CType(WebAppl, cEGAppl).Build_ReportOutput_ReportOutputID_URL(aReportOutput)
			response.Redirect(URL)
			'spnWinOpen.Visible = True
			
		End Sub

		'-------------------------------------------------------------

		Public Function SetEmailTemplate() As cDataObject
			Dim aCorrespondenceDefinition As cDataObject
			Dim aXmlDoc As cXMLDoc
			Dim aDataObjectNode As XmlNode
			Dim aFiltersNode As XmlNode

			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("CorrespondenceDefinition", aDataObjectNode, aFiltersNode)
			aCorrespondenceDefinition = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)

			If mIsHtml.Value = True Then
				aCorrespondenceDefinition("IsHtml") = True
			Else
				aCorrespondenceDefinition("IsHtml") = False
			End If

			SetEmailTemplate = aCorrespondenceDefinition
		End Function

		'--------------------------------------------------------

		Public Property SavedQueryDO() As cSavedQuery
			Get
				Return CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser).GetSavedQueryDO
			End Get
			Set(ByVal Value As cSavedQuery)
				CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser).SavedQueryDO = Value
			End Set
		End Property

		'=============================================================
	End Class	'cEmailSend

End Namespace 'Easygrants_Web.Controls.Base
