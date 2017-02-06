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

	Public Class cWordMerge
		Inherits Core_Web.Controls.Base.cDataPresenterCtl
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
		Protected spnDescription As HtmlGenericControl
		Protected spnFieldGroup As HtmlGenericControl
		Protected spnCount As HtmlGenericControl
		Protected mIsHtml As cCheckBox
		Protected ctlViewWord As cNewWindowOpener
		Protected spnWinOpen As HtmlGenericControl
		Protected mURL As String
		Protected lnkView As cLink
		Protected ctlViewResults As cNewWindowOpener
		Protected ctlTemplate As cDropDown


'=============================================================

	Public Property URL() As String
		Get
			Return mURL
		End Get
		Set(ByVal Value As String)
			mURL = Value
		End Set
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property QueryResultsWindowURL()
		Get
			QueryResultsWindowURL = WebAppl.Build_RootURL("Implementation/Modules/Staff/Controls/Page/Reports/pgQueryResults.aspx?UserKey=" + CType(Page, cModulePage).ModuleUser.GetWebSessionKey)
		End Get
	End Property

'=============================================================

		Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
			
			Dim aDataObjectList As cDataObjectList
			Dim aXmlDoc As cXMLDoc = new cXMLDoc()
			
			aXMLDoc.LoadFromXML(spnConfigXML.InnerText)
			Dim aDisplayPropertiesNode As XmlNode = aXmlDoc.DocElement.SelectSingleNode("DataObject[@Key='Base']/DisplayProperties")
			Dim aTemplateControlFiltersNode As XmlNode = aDisplayPropertiesNode.SelectSingleNode("DisplayProperty/Control[@ID='ctlTemplate']/Filters")
			
			Try
				aDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(SavedQueryDO.SavedQueryDefXMLDoc.DocElement)
				'aFirstColumn = aDataObjectList.Properties(0).ColumnName.ToString()
				spnDisplayName.InnerText = SavedQueryDO.GetPropertyString("Name")
				spnDescription.InnerText = SavedQueryDO.GetPropertyString("Description")
				spnFieldGroup.InnerText = SavedQueryDO.Category
				Dim aArgNode As XmlNode = aXmlDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Argument", "")
				Dim aSavedQueryBaseTypeID As String = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SavedQueryBaseType", "BaseType", SavedQueryDO.Category)(0).GetPropertyString("SavedQueryBaseTypeID")
				cXMLDoc.AddAttribute_ToNode(aArgNode, "PropertyKey", "QueryBaseTypeID")
				cXMLDoc.AddAttribute_ToNode(aArgNode, "Value", aSavedQueryBaseTypeID)
				aTemplateControlFiltersNode.AppendChild(aArgNode)
				spnConfigXML.InnerText = aXMLDoc.DocElement.OuterXml
				spnCount.InnerText = aDataObjectList.Count
				ctlViewResults.NewWindowURL = QueryResultsWindowURL
				lnkView.Set_ServerClick(AddressOf lnkView_Click)
			Catch
			End Try
			
			MyBase.CoreCtl_Load(sender, e)
			ctlTemplate = CType(FindControl("ctlTemplate"), cDropDown)
		End Sub

'--------------------------------------------------------

	Public Sub lnkView_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		SavedQueryDO.UpdateXML()
		Me.ctlViewResults.Open()
	End Sub

'-------------------------------------------------------------

		Public Sub GetEmailTemplate(ByVal aCorrespondenceDefinitionID As String)
			Dim aNewURL As String

			mCorrespondenceDefinitionID = aCorrespondenceDefinitionID
			CorePage.Redirect("CorrespondenceDefinitionID", aCorrespondenceDefinitionID)
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

		'-------------------------------------------------------------

		Public Sub SendEmail()

			Page.Validate()
			If Not Page.IsValid Then
				Exit Sub
			End If

			Dim aCorrespondenceJob As cCorrespondenceJob
			Dim aReturnURL As String
			Dim aReturnPageKey As String

			Dim aEGUser As cEGUser
			Dim aUserID As Integer

			aUserID = 0
			aEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			If Not aEGUser Is Nothing Then
				If aEGUser.UserID > 0 Then
					aUserID = aEGUser.UserID
				Else
					If aEGUser.PersonID > 0 Then
						aUserID = aEGUser.PersonID
					End If
				End If
			End If

			aCorrespondenceJob = New cCorrespondenceJob(aUserID)

			aCorrespondenceJob.CorrespondenceDefinition = SetEmailTemplate()
			aCorrespondenceJob.EmailArgs = mEmailArgs

			Try
				aCorrespondenceJob.SendEmail(WebSession.WebAppl)
			Catch

			End Try

			aReturnURL = "ReturnURL=" & Request.QueryString("ReturnURL")
			aReturnPageKey = "ReturnPageKey=" & Request.QueryString("ReturnPageKey")

			Me.EventController_NavigateToModulePageKey("EmailSendConfirmation", aReturnURL, aReturnPageKey)

		End Sub

		'--------------------------------------------------------

		Public Property SavedQueryDO() As cSavedQuery
			Get
				Return CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser).GetSavedQueryDO
			End Get
			Set(ByVal Value As cSavedQuery)
				CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser).SavedQueryDO = Value
			End Set
		End Property

		'--------------------------------------------------------

		Public Sub Export_Word(ByVal aSubmittedFileID As String, ByVal aDefinitionID As String)
			Dim aURL As String
			Dim aEntityID As String
			Dim aReportOutput As cReportOutput
			Dim aXMLDoc As cXMLDoc
			Dim aXmlNode As XmlNode
			Dim aAttr As XmlAttribute
			Dim aBasesDODPrimaryKey As String
			
			Page.Validate()
			If Not Page.IsValid Then
				Exit Sub
			End If

			aReportOutput = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("ReportOutput")
			aReportOutput("EntityID") = aSubmittedFileID
			aReportOutput("DefinitionID") = aDefinitionID
			aReportOutput("GenRequestDate") = DateTime.Now
			aReportOutput("GenStatus") = 0
			aReportOutput("GenResult") = "Report is in the queue to be generated."

			aXmlNode = SavedQueryDO.SavedQueryDefXMLDoc.DocElement
			aAttr = aXmlNode.OwnerDocument.CreateAttribute("TemplateSubmittedFileID")
			aAttr.Value = aSubmittedFileID
			aXmlNode.Attributes.Append(aAttr)
			
			Dim aBasesDODKey As String = cXMLDoc.AttributeToString(aXmlNode, "BaseDODKey", "")
			If Not aBasesDODKey = "" Then
				aBasesDODPrimaryKey = WebSession.DataObjectFactory.GetDataObjectDefPrimaryKey(aBasesDODKey)
			End If

			'The ReportParametersXML has all the query results columns as DisplayProperties
			'Delete all DisplayProperty nodes and add just one for the BasesDODKey's primary key
			
			Dim aDisplayPropertiesNode As XmlNode = aXmlNode.SelectSingleNode("DisplayProperties")
			aDisplayPropertiesNode.RemoveAll
			
			Dim aBaseDODPkeyDispNode As XmlNode = SavedQueryDO.SavedQueryDefXMLDoc.XMLDocument.CreateNode(XmlNodeType.Element, "DisplayProperty", "")
			cXMLDoc.AddAttribute_ToNode(aBaseDODPkeyDispNode, "PropertyKey", aBasesDODPrimaryKey)
			cXMLDoc.AddAttribute_ToNode(aBaseDODPkeyDispNode, "ColumnHeader", "")
			cXMLDoc.AddAttribute_ToNode(aBaseDODPkeyDispNode, "Join", "")
			aDisplayPropertiesNode.AppendChild(aBaseDODPkeyDispNode)

			aReportOutput("ReportParametersXML") = aXmlNode.OuterXml
			Me.WebSession.DataObjectFactory.SaveDataObject(aReportOutput)

			URL = CType(WebAppl, cEGAppl).Build_ReportOutput_ReportOutputID_URL(aReportOutput)
			'response.Redirect(URL)
			spnWinOpen.Visible = True

		End Sub
		'--------------------------------------------------------
		 Protected Sub SubmittedFileIDCheck(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
			If ctlTemplate.SelectedValue = "" Then
				aArgs.IsValid = False
			Else
				aArgs.IsValid = True
			End If
		End Sub

		'=============================================================
	End Class 'cEmailSend

End Namespace 'Easygrants_Web.Controls.Base
