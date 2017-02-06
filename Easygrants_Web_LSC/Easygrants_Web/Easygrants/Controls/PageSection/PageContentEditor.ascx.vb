Imports Core.Web
Imports Core.Web.Modules
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports System.Xml
Imports System.Text
Imports System.IO
Imports System.Collections


Namespace Easygrants_Web.Controls.PageSection

Public Class cPageContentEditor
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================
#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region
'=============================================================
	Protected ctlPageKey As cDropDown
	Protected ctlStatus As cDropDown
	Protected spnDisplay As HtmlGenericControl
	Protected trValRegMetContent As HtmlTableRow
	Protected trValRegNotMetContent As HtmlTableRow
	Protected trContent As HtmlTableRow
	Dim IsReviewandSubmitForm As Boolean = False
'=============================================================
	
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		mybase.CoreCtl_Load(aSrc, aEvent)

		ctlPageKey.Set_ServerIndexChange(AddressOf DropDownChanged)
		ctlStatus = CType(FindControl("ctlStatus"), cDropDown)
		ctlStatus.Set_ServerIndexChange(AddressOf DropDownChanged)
		
		ctlPageKey.ValidationText = "Page Name is required."

		dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModule", _
			"WfTaskID", me.Request.QueryString("WfTaskID"))
		
		Dim aSortedPagesList As SortedList = new SortedList()
		if aList.Count > 0 then
			dim aModule as String = aList(0).GetPropertyString("ModuleName")
			Dim aConfigDoc As cXMLDoc = New cXMLDoc()
			If Not aConfigDoc.Load(Server.MapPath(aList(0).GetPropertyString("ModuleConfigFilename"))) Then
				aConfigDoc = WebSession.LoadModuleConfigXmlFromDB(aList(0).GetPropertyString("ModuleConfigFilename"))
			End If
			Dim aNodeList As XmlNodeList = aConfigDoc.DocElement.SelectNodes("Module/Pages/Page")
			Dim aNode As XmlNode
			Dim aItem As ListItem

			For Each aNode In aNodeList
				If Not aSortedPagesList.ContainsKey(cXMLDoc.AttributeToString(aNode, "PageTitle")) Then
					aSortedPagesList.Add(cXMLDoc.AttributeToString(aNode, "PageTitle"), cXMLDoc.AttributeToString(aNode, "Key"))
				End If
				'If cXMLDoc.AttributeToString(aNode, "NavTitle") <> "(" Then
					'aItem = New ListItem(cXMLDoc.AttributeToString(aNode, "PageTitle"), cXMLDoc.AttributeToString(aNode, "Key"))
					'ctlPageKey.Items.Add(aItem)
				'End If
			Next
		End If
		ctlPageKey.Items.Clear
		ctlPageKey.Items.Add(New ListItem("<Select>", ""))
		Dim aSortedListEnum as IDictionaryEnumerator = aSortedPagesList.GetEnumerator
		While aSortedListEnum.MoveNext
			Dim aItem As ListItem = New ListItem(aSortedListEnum.Key.ToString, aSortedListEnum.Value.ToString)
			ctlPageKey.Items.Add(aItem)
		End While

		If Request.QueryString("PageContentID") = "" Then
			DropDownChanged(New Object(), New EventArgs())
		End If

		ctlPageKey.SelectedField = Request.QueryString("PageKey")
		ctlStatus.SelectedField = Request.QueryString("WfTaskStatusID")


		'Initally getting the Standard Form ID from TaskID and PageKey , then checking whether this form id is of Review and Submit Form type.
		'Dim SFList As cDataObjectList
		'Dim aWTMCNList As cDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModuleConfigNavElement", _
		'	"WfTaskID", Me.Request.QueryString("WfTaskID"), "NavKey", Request.QueryString("PageKey"))
		'If aWTMCNList.Count > 0 Then
		'	SFList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("StandardForms", _
		'		"StandardFormsID", aWTMCNList(0)("StandardFormsID").ToString, "FormTypeID", "4")
		'	If SFList.Count > 0 Then
		'		IsReviewandSubmitForm = True
		'	End If
		'End If

		Dim SFList As cDataObjectList
		Dim aWFTMNSFList As cDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModuleNavelementStandardForms", _
			"WfTaskID", Me.Request.QueryString("WfTaskID"), "PageKey", Request.QueryString("PageKey"), "FormTypeID", 4)
		If aWFTMNSFList.Count > 0 Then
				IsReviewandSubmitForm = True
		End If


		Dim aObj As cDataObject = CType(Me.DataObjectCollection("PageContent"), cDataObjectList)(0)
		If Me.Request.QueryString("Preview") = "True" Then
			spnDisplay.InnerHtml = aObj.GetPropertyString("Content")
			If IsReviewandSubmitForm = True Then
				spnDisplay.InnerHtml = aObj.GetPropertyString("ValidationPassedContent") & "<br><br>" & aObj.GetPropertyString("ValidationFailedContent")
			End If
		End If

		If IsReviewandSubmitForm = True Then
			trValRegMetContent.Visible = True
			trValRegNotMetContent.Visible = True
			trContent.Visible = False
		End If
		
		'If Not IsPostBack Then
		'	If Not Request.QueryString("PageContentID") Is Nothing AndAlso Not Request.QueryString("PageContentID") = "0" AndAlso Not Request.QueryString("PageContentID") = "" Then
		'		Dim aPageContentDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("PageContent", Request.QueryString("PageContentID"))
		'		ctlStatus.SelectedField = aPageContentDO("WfTaskStatusID")
		'	End If
		'End If
	End Sub

'=============================================================

	Public Sub DropDownChanged(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		Dim aWfProjectID As String
		Dim aWfTaskID As String
		Dim aPageKey As String
		Dim aWfTaskStatusID As String
		Dim aDOList As cDataObjectList
		Dim aNewPageContentID As String
		Dim aURL As String
		
		aWfProjectID = Request.QueryString("WfProjectID")
		aWfTaskID = Request.QueryString("WfTaskID")
		aPageKey = ctlPageKey.SelectedValue
		aWfTaskStatusID = ctlStatus.SelectedValue

		If IsReviewandSubmitForm = True Then
			trValRegMetContent.Visible = True
			trValRegNotMetContent.Visible = True
			trContent.Visible = False
		End If

		'aDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("PageContent", "ProjectID", _
		'	aWfProjectID, "WfTaskID", aWfTaskID, "PageKey", aPageKey, "WfTaskStatusID", aWfTaskStatusID)
		'If aDOList.Count > 0 Then
		'	aNewPageContentID = aDOList(0).GetPropertyString("PageContentID")
		'Else
		'	aNewPageContentID = "0"
		'End If

		aURL = Request.RawUrl
		'aURL = cWebLib.AddQuerystringParameter(aURL, "PageContentID", aNewPageContentID)
		aURL = cWebLib.AddQuerystringParameter(aURL, "PageKey", aPageKey)
		aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskStatusID", aWfTaskStatusID)
		Response.Redirect(aURL)
	End Sub

'=============================================================

	Public Overrides Sub DataPresenter_SaveDataObjects()
		ctype(me.DataObjectCollection("PageContent"), cDataObjectList)(0)("PageKey") = ctlPageKey.SelectedValue
		ctype(me.DataObjectCollection("PageContent"), cDataObjectList)(0)("WfTaskStatusID") = ctlStatus.SelectedValue
		MyBase.DataPresenter_SaveDataObjects()
	End Sub
	
'=============================================================

	Public Sub Preview()
		dim aObj as cDataObject = ctype(me.DataObjectCollection("PageContent"), cDataObjectList)(0)
		dim aURL as String = cWebLib.AddQuerystringParameter(Request.RawUrl(), "PageContentID", aObj.GetPropertyString("PageContentID"))
		me.Response.Redirect(cWebLib.AddQuerystringParameter(aURL, "Preview", "True"))
	End Sub

'=============================================================

    Public Sub ModulePage_RedirectToModule(ByVal aModuleName As String, ByVal aModuleConfig As String, ByVal aPageKey As String)
		Dim aURL As StringBuilder = new StringBuilder()
		aURL.Append(WebAppl.Get_ModuleRoot(aModuleName) + "/" + aModuleName + "/" + "ModuleContent.aspx"  + "?Config=" + aModuleConfig + "&Page=" + aPageKey)
		If Not Request.QueryString.Get("ProgramID") Is Nothing Then
			aURL.Append("&ProgramID=" + Request.QueryString.Get("ProgramID"))
		End If
		If Not Request.QueryString.Get("WfProjectID") Is Nothing Then
			aURL.Append("&WfProjectID=" + Request.QueryString.Get("WfProjectID"))
		End If
		If Not Request.QueryString.Get("CmptID") Is Nothing Then
			aURL.Append("&CmptID=" + Request.QueryString.Get("CmptID"))
		End If
		If Not Request.QueryString.Get("WfTaskID") Is Nothing Then
			aURL.Append("&WfTaskID=" + Request.QueryString.Get("WfTaskID"))
		End If
		Response.Redirect(aURL.ToString)
	End Sub
	
	Public Sub ValidateUniquePageKeyStatus(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aPageContentDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("PageContent", "PageKey", ctlPageKey.SelectedValue, "WfTaskStatusID", ctlStatus.SelectedValue, "ProjectID", Request.QueryString("WfProjectID"), "WfTaskID", Request.QueryString("WfTaskID"))
		Dim aPageContentDO As cDataObject
		Dim aPageContentID As String = Request.QueryString("PageContentID")
		'If Not aPageContentID = "0" Then
			
		'End If
		For Each aPageContentDO in aPageContentDOL
			If Not aPageContentDO.GetPropertyString("PageContentID") = aPageContentID Then
				aArgs.IsValid = False
			End If
		Next
		
	End Sub
	
End Class
End Namespace