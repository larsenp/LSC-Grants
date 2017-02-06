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

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Reports

Public MustInherit Class cAdHocQueryList_Content
    Inherits Core_Web.Controls.Base.cFilterListDataPresenterCtl
'========================================================

	Protected spnListText As HtmlGenericControl
	Protected spnActionText As HtmlGenericControl
	Protected ctlShow As cNewWindowOpener
	Protected valGo As CustomValidator
	Protected btnAdd As cCSSButton
	Protected ctlBaseType As cDropDown
'========================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		If Not Request.QueryString("Find") = "True" Then
			spnListText.Visible = False
			spnActionText.Visible = False
		Else
			spnListText.Visible = True
			spnActionText.Visible = True
		End If		
		
		
	End Sub

Public Sub ValidateFieldGroup(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)

		ctlBaseType = CType(Me.FindControl("ctlBaseType"), cDropDown)
		Dim aValues() As String = Request.Form("__EVENTTARGET").Split("$")
		If aValues.Length >= 3 Then
			If aValues(2) = "btnAdd" Then
				If (ctlBaseType.SelectedField = "") Then
					aArgs.IsValid = False
				End If
			Else
				aArgs.IsValid = True
			End If
		End If

   End Sub

    
'========================================================
    
    Public Sub GoClick(ByVal aStepName As String, ByVal aValue As String)
		Dim aURL As String

		aURL = Request.Url.ToString()
		
		Select Case aStepName
			Case "QueryType"
				aURL = cWebLib.RemoveQuerystringParameter(aURL, "QueryName")
				aURL = cWebLib.AddQuerystringParameter(aURL, "QueryTypeID", aValue)
			Case "QueryName"
				aURL = cWebLib.RemoveQuerystringParameter(aURL, "QueryTypeID")
				aURL = cWebLib.AddQuerystringParameter(aURL, "QueryName", aValue)
		End Select

		Response.Redirect(aURL)
	End Sub
	
'========================================================

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