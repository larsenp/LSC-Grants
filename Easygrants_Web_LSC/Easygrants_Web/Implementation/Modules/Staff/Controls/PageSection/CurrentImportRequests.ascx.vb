Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports EasyGrants.Web.User
Imports Core.Web.Modules
Imports System.Xml
Imports Core.DataAccess.XMLAccess

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
    Public MustInherit Class cCurrentImportRequests
        Inherits Core_Web.Controls.Base.cDataPresenterCtl

        '=============================================================

        Protected ctlShow As cNewWindowOpener

        '=============================================================


	'Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)


        
 '       Dim aXMLDoc As cXMLDoc
 '       aXMLDoc = New cXMLDoc()
	'	aXMLDoc.LoadFromXML(spnConfigXML.InnerText)
 '       dim aImportedFileDOList as cDataObjectList
 '       dim aImportedFileDO as cDataObject
 '       aImportedFileDOList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("ImportedFile", "ImportStatusID", "-1")
 '       if aImportedFileDOList.Count > 0
 '           For each aImportedFileDO in aImportedFileDOList
 '               'if aImportedFileDOList.Count > 0 AndAlso aImportedFileDO.GetPropertyValue("ImportStatusID") = "-1" Then  'Error
 '                   dim aNode as XmlNode = aXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='ImportedFileList']").SelectSingleNode("DisplayProperties/DisplayProperty/Control/DisplayProperty[@ID='Commit']")
	'		        'dim aNode as XmlNode = cXMLDoc.FindNode(mXMLDoc.DocElement.SelectSingleNode("DataObject/Filters"), "Argument", "TypeKey", "PersonID")
	'		        aXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='ImportedFileList']").SelectSingleNode("DisplayProperties/DisplayProperty/Control").RemoveChild(aNode)
	'	        'End If        
 '           Next
 '       end if
 '       spnConfigXML.InnerText = aXMLDoc.DocElement.OuterXml
	'	'spnErrMsg.Visible = False
	'	MyBase.CoreCtl_Load(sender, e)
				
	'End Sub


        Public Sub OnView(ByVal aImportedFileID As String, ByVal aImportTypeID As String)
            Dim BaseQueryString As String
            BaseQueryString = WebAppl.Build_RootURL("/Implementation/Modules/Staff/Controls/Page/Administration/pgImportViewHtml.aspx?")
            BaseQueryString = BaseQueryString & "ImportedFileID=" & aImportedFileID.ToString()
            BaseQueryString = BaseQueryString & "&ImportTypeID=" & aImportTypeID.ToString()
            ctlShow.NewWindowURL = BaseQueryString
            ctlShow.Open()
        End Sub

        '=============================================================

        Public Sub CommitImport(ByVal aImportedFileID As String)
            Dim aImportedFileDO As cDataObject
            aImportedFileDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("ImportedFile", aImportedFileID)
            aImportedFileDO("ImportStatusID") = 3
            aImportedFileDO.SaveData()
    
            'Dim aJournalizePaymentImportDOList as cDataObjectList
            'Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
            'Dim aJournalizePaymentImportDO as cDataObject
            'aJournalizePaymentImportDOList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("JournalizePaymentImport", _
            '    "ImportedFileID", aImportedFileID) 
            'if aJournalizePaymentImportDOList.Count > 0 then
            '    for each aJournalizePaymentImportDO in aJournalizePaymentImportDOList
            '        aJournalizePaymentImportDO("IsImported") = True
            '    Next
            '    aJournalizePaymentImportDO.SaveData()
            'End If

            Dim aURL As String
            'aURL = Request.RawUrl.ToString()
            'Response.Redirect(aURL)
            Me.EventController_NavigateToModulePageKey("HistoricalImportRequests")
        End Sub

        '=============================================================


	'Public Overrides Sub LoadConfigXML()
	'	'Me.mXMLDoc.LoadFromXML(spnConfigXML.InnerText)
 '       Dim aXMLDoc As cXMLDoc
 '       aXMLDoc = New cXMLDoc()
	'	aXMLDoc.LoadFromXML(spnConfigXML.InnerText)
        
 '       If WebSession.HasStaffUser Then
 '           dim aNode as XmlNode = aXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='ImportedFileList']").SelectSingleNode("DisplayProperties/DisplayProperty[@ID='Commit']")
	'		'dim aNode as XmlNode = cXMLDoc.FindNode(mXMLDoc.DocElement.SelectSingleNode("DataObject/Filters"), "Argument", "TypeKey", "PersonID")
	'		me.mXMLDoc.DocElement.SelectSingleNode("DataObject/Filters").RemoveChild(aNode)
	'	End If        
 '   End Sub


    End Class
End Namespace