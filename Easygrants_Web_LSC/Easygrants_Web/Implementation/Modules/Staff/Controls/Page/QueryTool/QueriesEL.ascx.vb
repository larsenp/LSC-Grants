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

Namespace Implementation.Modules.Staff.Controls.Page.QueryTool

Public MustInherit Class cQueriesEL
    Inherits Core_Web.Controls.Base.cFilterListDataPresenterCtl
'========================================================

	Protected spnListText As HtmlGenericControl
	Protected spnActionText As HtmlGenericControl
	Protected ctlShow As cNewWindowOpener
	Protected tbSearchParameters As HtmlTable
	Protected spnShow As HtmlGenericControl
	Protected spnHide As HtmlGenericControl
	Protected spnShowLink As HtmlGenericControl
	Protected spnHideLink As HtmlGenericControl
	
	Protected newBox As cMessageBox = New cMessageBox()
    Protected WithEvents PlaceHolder As System.Web.UI.WebControls.PlaceHolder

'========================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
			If Request.QueryString("Find") = "True" Then
            'btnShow = CType(FindControl("btnShow"), cButton)
            spnShow.Visible = False
            spnShowLink.Visible = False
            spnHide.Visible = True
            spnHideLink.Visible = True
            If Request.QueryString("ShowParams") <> "True" Then
                spnShow.Visible = True
                spnShowLink.Visible = True
                spnHide.Visible = False
                spnHideLink.Visible = False
                tbSearchParameters.Visible = False
            End If
        Else
            spnShow.Visible = False
            spnShowLink.Visible = False
            spnHide.Visible = True
            spnHideLink.Visible = True
        End If

		If Request.QueryString("Task") = "No" Then
			Response.Write("<script language='JavaScript'>"+chr(13)+chr(10))
			Response.Write("alert('There is no project task for this record.');"+chr(13)+chr(10))
			Response.Write("</script>")
			spnShow.Visible = True
			spnHide.Visible = False
			tbSearchParameters.Visible = False
		End If
		'Server-Side pop up method
		CheckYesNo()
		
	End Sub	
	
 '-------------------------------------------------------------------------

        Public Sub ShowSearchParameters()
            'tbSearchParameters.Visible = True
            Dim aURL As String = cWebLib.AddQuerystringParameter(Request.RawUrl().ToString(), "ShowParams", "True")
			aURL = cWebLib.RemoveQuerystringParameter(aURL, "Task")
            Response.Redirect(aURL)
        End Sub
        
'-------------------------------------------------------------------------

        Public Sub HideSearchParameters()
            Dim aURL As String = cWebLib.AddQuerystringParameter(Request.Url().ToString(), "ShowParams", "False")
			aURL = cWebLib.RemoveQuerystringParameter(aURL, "Task")
            Response.Redirect(aURL)
        End Sub
     
'========================================================

    Public Sub Execute_Query_Action(ByVal aSavedQueryID As String, ByVal aQueryOutputID As String)
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
                If  aSavedQueryDO.GetPropertyInt("AccessTypeID", 0) = 3 Then  'Read-only Security 
					're-directs to read-only page
					MessageBox("Attention", "Query is Read-only.  To edit, click Cancel and select the Copy Action to create a new editable copy of this query.", _
						aSavedQueryID, aActionDD.SelectedValue, "350", "150")
				Else
					EventController_NavigateToModulePageKey("SelectFields", "QueryType=Saved", _
                                                "SavedQueryID=" + aSavedQueryID, "Display=0", "ReturnURL=" + Request.Url.PathAndQuery)
				End If
            Case 2
                'View Results (HTML output, even if saved query output is not html format)
                ctlShow.NewWindowURL() = WebAppl.Build_RootURL("Implementation/Modules/Staff/Controls/Page/QueryTool/pgQueryResults.aspx?UserKey=" + CType(Page, cModulePage).ModuleUser.GetWebSessionKey)
                ctlShow.Open()
 			Case 5
				'Delete query (warn user with server-side pop up)                
                MessageBox("Attention", "Are you sure that you want to delete?", aSavedQueryID, aActionDD.SelectedValue, "225", "125")
			Case 7
				'Copy
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
 			Case 9  'Run Query
				Dim aURL As String
				Dim aEntityID As String
				Dim aReportOutput As cReportOutput
				Dim aXMLDoc As cXMLDoc
				Dim aRONode As XmlNode
				Dim aDataObjectNode As XmlNode				
				Select Case aQueryOutputID
					Case 1  'Export to Word
						aEntityID = CType(WebSession.User("cEGStaffUser"), cEGUser).UserID.ToString
						aReportOutput = aSavedQueryDO.Create_ReportOutputWord(WebSession.DataObjectFactory, aEntityID)

						aURL = CType(WebAppl, cEGAppl).Build_ReportOutput_ReportOutputID_URL(aReportOutput)

						ctlShow.NewWindowURL() = aURL
						ctlShow.Open()
					Case 2  'Export to Excel
						'Export to Excel (move to Run Query - default)
						aEntityID = CType(WebSession.User("cEGStaffUser"), cEGUser).UserID.ToString
						aReportOutput = aSavedQueryDO.Create_ReportOutput(WebSession.DataObjectFactory, aEntityID)

						aURL = CType(WebAppl, cEGAppl).Build_ReportOutput_ReportOutputID_URL(aReportOutput)

						ctlShow.NewWindowURL() = aURL
						ctlShow.Open()
					Case 3  'View HTML
						ctlShow.NewWindowURL() = WebAppl.Build_RootURL("Implementation/Modules/Staff/Controls/Page/QueryTool/pgQueryResults.aspx?UserKey=" + CType(Page, cModulePage).ModuleUser.GetWebSessionKey)
						ctlShow.Open()
					Case 4  'Export to E-mail Utility
						aDataObjectNode = aSavedQueryDO.GetRelationalDataObjectNode()
						aDataObjList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
						CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser).SetEmailArgs(aDataObjList)
						EventController_NavigateToModulePageKey("EmailSend", "ReturnURL=" + Request.Url.PathAndQuery, "ReturnPageKey=" + CType(WebSession.CurrentPage, cModulePage).PageKey)
				End Select
            End Select
    End Sub
    
 '=============================================================

	Public Sub MessageBox(aTitle As String, aMessage As String, aSavedQueryID as String, aActionID as String, aBoxWidth as String, aBoxHeight as String)

		newBox.MessageBoxButton = 3
        newBox.MessageBoxTop = 175  '175
        newBox.MessageBoxLeft = 600  '550
        newBox.MessageBoxWidth = aBoxWidth  '300
		newBox.MessageBoxHeight = aBoxHeight  '150
		newBox.MessageBoxButtonWidth = 50
		newBox.MessageBoxIDYes = "yesno"
        newBox.MessageBoxIDCancel = "yesno"
        newBox.MessageBoxButtonYesText = "OK"
        newBox.MessageBoxButtonCancelText = "Cancel"
		newBox.MessageBoxTitle = aTitle
        newBox.MessageBoxMessage = aMessage
        'cannot use until can add to CSS.DefaultStyles.  Waiting on file.
        'newBox.MessageBoxCssTitle = "MessageBoxCssTitle"
        'newBox.MessageBoxCssMessage = "MessageBoxCssMessage"
		PlaceHolder.Controls.Add(newBox)
		Session("SavedQueryID") = aSavedQueryID
        Session("ActionID") = aActionID

	End Sub
   
'=============================================================

        Private Sub CheckYesNo()
			If CType(me.Session("ActionID"), String) <> "" AndAlso CType(me.Session("ActionID"), String) = 1 Then  'Edit
				If Request.Form("mPageFrameCtl:ctlPageContent:yesno") = "OK" Then
					Session.Remove("SavedQueryID")
					Session.Remove("ActionID")
					EventController_NavigateToModulePageKey("SelectFields")
				ElseIf Request.Form("mPageFrameCtl:ctlPageContent:yesno") = "Cancel" Then
					'do nothing
				End If
			Else
				If Request.Form("mPageFrameCtl:ctlPageContent:yesno") = "OK" Then
					WebSession.DataObjectFactory.DeleteData("SavedQuery", CType(Me.Session("SavedQueryID"), String))
					Session.Remove("SavedQueryID")
					Session.Remove("ActionID")
					CorePage.Redirect() 
				ElseIf Request.Form("mPageFrameCtl:ctlPageContent:yesno") = "Cancel" Then
					'do nothing
				End If
			End If
        End Sub   
	
'========================================================


End Class
End Namespace