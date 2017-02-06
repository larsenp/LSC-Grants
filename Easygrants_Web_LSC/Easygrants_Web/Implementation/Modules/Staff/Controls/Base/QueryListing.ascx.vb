Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants_Web.Controls.Base
Imports EasyGrants.Web
Imports EasyGrants.Web.User
Imports EasyGrants.DataAccess.Report

Namespace Easygrants_Web.Modules.Staff.Controls.Base

Public MustInherit Class cQueryListing
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
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
'========================================================
    Protected ctlShow As cNewWindowOpener
'========================================================
	'Public ReadOnly Property QueryTypeID() As String
	'	Get
	'		If Not Request.QueryString.Get("QueryTypeID") Is Nothing Then
	'			If Request.QueryString.Get("QueryTypeID") = "All" Then
					
	'			End If				
	'		End If			
			
	'	End Get
	'End Property
	
    Public Sub Execute_Query_Action(ByVal aSavedQueryID As String)
        Dim aDataList As cDataListCtl
        Dim aActionDD As cDropDown
		Dim aDataObjList As cDataObjectList

		Dim aSavedQueryDO As cSavedQuery
		aSavedQueryDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SavedQuery", CType(aSavedQueryID, Integer))
		'add saved query to Staff User
        CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser).SavedQueryDO = aSavedQueryDO

        'Based on saved query ID, find drop-down control
        aDataList = CType(FindControl("ctlList"), cDataListCtl)
        
        aActionDD = CType(aDataList.DataListCtl_GetControl("ctlActions", CType(aSavedQueryID, Integer)), cDropDown)

        'Based on drop-down value, call appropriate method
        Select Case aActionDD.SelectedValue
            Case 1
                'Edit
                EventController_NavigateToModulePageKey("AdHocQueryTool", "QueryType=Saved", _
                                                "SavedQueryID=" + aSavedQueryID, "Display=0")
            Case 2
                'View Results
                ctlShow.NewWindowURL() = WebAppl.Build_RootURL("Implementation/Modules/Staff/Controls/Page/Reports/pgQueryResults.aspx?UserKey=" + CType(Page, cModulePage).ModuleUser.GetWebSessionKey)
                ctlShow.Open()
            Case 3
                'Export to Excel
                Dim aURL As String
                Dim aEntityID As String
				Dim aReportOutput As cReportOutput
                Dim aXMLDoc As cXMLDoc
                Dim aRONode As XmlNode

                aEntityID = CType(WebSession.User("cEGStaffUser"), cEGUser).UserID.ToString
				aReportOutput = aSavedQueryDO.Create_ReportOutput(WebSession.DataObjectFactory, aEntityID)

				aURL = CType(WebAppl, cEGAppl).Build_ReportOutput_ReportOutputID_URL(aReportOutput)

				ctlShow.NewWindowURL() = aURL
				ctlShow.Open()
			Case 4
				'Export to E-mail Utility
				'Get data from relational version of data object node in saved query
				Dim aDataObjectNode As XmlNode

				aDataObjectNode = aSavedQueryDO.GetRelationalDataObjectNode()
				aDataObjList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
				CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser).SetEmailArgs(aDataObjList)
				EventController_NavigateToModulePageKey("EmailSend", "ReturnURL=" + Request.Url.PathAndQuery, "ReturnPageKey=" + CType(WebSession.CurrentPage, cModulePage).PageKey)
			Case 5
				'Delete query
				'Dim aBtnGo As cButton
				'aBtnGo.Confirmation = "Are you sure you want to delete this Record?"
				WebSession.DataObjectFactory.DeleteData("SavedQuery", aSavedQueryID)
				CorePage.Redirect()
			Case 6
				EventController_NavigateToModulePageKey("WordMerge", "ReturnURL=" + Request.Url.PathAndQuery, "ReturnPageKey=" + CType(WebSession.CurrentPage, cModulePage).PageKey)
			Case 7
				dim aObj as cDataObject = me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SavedQuery", aSavedQueryID)
				dim aNewObj as cDataObject = me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("SavedQuery")
				aNewObj("Name") = "Copy of " + aObj.GetPropertyString("Name")
				aNewObj("DataObjectXML") = aObj.GetPropertyString("DataObjectXML")
				aNewObj("UserID") = aObj.GetPropertyString("UserID")
				aNewObj("Description") = aObj.GetPropertyString("Description")
				aNewObj("AccessTypeID") = aObj.GetPropertyInt("AccessTypeID")
				aNewObj("QueryTypeID") = aObj.GetPropertyInt("QueryTypeID")
				WebSession.DataObjectFactory.SaveDataObject(aNewObj)
				CorePage.Redirect()
                Case 8
                    'Export to Excel
                    Dim aURL As String
                    Dim aEntityID As String
                    Dim aReportOutput As cReportOutput
                    Dim aXMLDoc As cXMLDoc
                    Dim aRONode As XmlNode

                    aEntityID = CType(WebSession.User("cEGStaffUser"), cEGUser).UserID.ToString
                    aReportOutput = aSavedQueryDO.Create_ReportOutputWord(WebSession.DataObjectFactory, aEntityID)

                    aURL = CType(WebAppl, cEGAppl).Build_ReportOutput_ReportOutputID_URL(aReportOutput)

                    ctlShow.NewWindowURL() = aURL
                    ctlShow.Open()

            End Select
    End Sub
    
'========================================================

End Class
End Namespace