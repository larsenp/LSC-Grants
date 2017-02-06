Imports System.Diagnostics
Imports System.Web.UI
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cContent_Mgmt
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'=============================================================

	Protected spnAdd As HtmlGenericControl
        Protected ctlShow As cNewWindowOpener
        Protected ctlList as cDataListCtl
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		if me.Request.QueryString("WfTaskID") = "" Then 
			spnAdd.Visible = False
		Else
			Dim aConfigDoc As cXMLDoc = New cXMLDoc()
			Dim aList As cDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModule", _
			"WfTaskID", Me.Request.QueryString("WfTaskID"))
			If aList.Count < 1 Then
				Exit Sub
			End If
			If Not aConfigDoc.Load(Server.MapPath(aList(0).GetPropertyString("ModuleConfigFilename"))) Then
				aConfigDoc = WebSession.LoadModuleConfigXmlFromDB(aList(0).GetPropertyString("ModuleConfigFilename"))
			End If
			Dim aPageContentDO As cDataObject
			Dim aPageContentDOL As cDataObjectList = CType(DataObjectCollection("PageContentList"), cDataObjectList)
			ctlList = FindControl("ctlDataList")
			Dim aTitleHash As Hashtable =  ctlList.DataListCtl_GetControlCollection("lblTitle")
			Dim aTitleLabel As cLabel
			For Each aPageContentDO in aPageContentDOL
				Dim aPageContentID As Integer = aPageContentDO.GetPropertyInt("PageContentID")
				Dim aPageKey As String = aPageContentDO.GetPropertyString("PageKey")
				Dim aWfTaskID As String = aPageContentDO.GetPropertyString("WfTaskID")
				'Dim aPagesNode As XmlNode = aConfigDoc.DocElement.SelectSingleNode("Module/Pages")
				Dim aPageNode As XmlNode = aConfigDoc.DocElement.SelectSingleNode("Module/Pages/Page[@Key='" + aPageKey + "']")
				If Not aTitleHash Is Nothing AndAlso Not aPageNode Is Nothing Then
					aTitleLabel = CType(aTitleHash(aPageContentID), cLabel)
					If Not aTitleLabel Is Nothing Then
						aTitleLabel.Value = cXMLDoc.AttributeToString(aPageNode, "PageTitle", "")
					End If
				End If
			Next
		End If
		
		'Dim aPageContentDO As cDataObject
		'Dim aPageContentDOL As cDataObjectList = CType(DataObjectCollection("PageContentList"), cDataObjectList)
		'ctlList = FindControl("ctlDataList")
  '      Dim aTitleHash As Hashtable =  ctlList.DataListCtl_GetControlCollection("lblTitle")
  '      Dim aTitleLabel As cLabel
  '      For Each aPageContentDO in aPageContentDOL
		'	Dim aPageContentID As Integer = aPageContentDO.GetPropertyInt("PageContentID")
		'	Dim aPageKey As String = aPageContentDO.GetPropertyString("PageKey")
		'	Dim aWfTaskID As String = aPageContentDO.GetPropertyString("WfTaskID")
		'	aTitleLabel = CType(aTitleHash(aPageContentID), cLabel)
		'	If aTitleLabel.Value = "" Then
		'		Dim aDataObjectNode As XmlNode = Nothing
		'		Dim aFiltersNode As XmlNode = Nothing
		'		Dim aArgNode As XmlNode = Nothing
		'		Dim aXmlDoc As cXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("StandardFormRelatedPage", aDataObjectNode, aFiltersNode)
		'		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "PageKey", aPageKey))
		'		aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskID", aWfTaskID))
		'		aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "WfTaskModuleConfigNavElement"))
		'		Dim aStandardFormRelatedPageDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
		'		If aStandardFormRelatedPageDOL.Count > 0 Then
		'			aTitleLabel.Value = aStandardFormRelatedPageDOL(0).GetPropertyString("PageTitle", "")
		'		End If
		'	End If
		'Next
	End Sub
'-------------------------------------------------------------
	
	Public Sub DisplayPageContent(ByVal Page As String, ByVal PageName As String, ByVal PageContentID As String, _
		ByVal ProgramID As String, ByVal CmptID As String, ByVal WfProjectID As String, ByVal WfTaskID As String, _
		ByVal PageKey As String, ByVal WfTaskStatusID As String)

		Dim aURL As String 
		aURL = WebAppl.Root + "/" + Page
		aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, PageName)
		aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, PageContentID)
		aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, ProgramID)
		aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, CmptID)
		aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, WfProjectID)
		aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, WfTaskID)
		aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, PageKey)
		aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, WfTaskStatusID)
		aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "Config", "ModuleConfig")
		Response.Redirect(aURL)
		
	End Sub	
        Public Sub OnPreview(ByVal PageContentID As String)
            Dim BaseQueryString As String
            BaseQueryString = WebAppl.Build_RootURL("Easygrants/Controls/PageSection/pgContentManagerPreview.aspx?")
            BaseQueryString = cWebLib.AddQuerystringParameter(BaseQueryString, "PageContentID", PageContentID)
            ctlShow.NewWindowURL = BaseQueryString
            ctlShow.Open()
        End Sub
'=============================================================
End Class
End Namespace