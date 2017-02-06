Imports System.Xml
Imports System.Diagnostics
Imports Core.DataAccess
Imports Core.DataAccess.DBAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Util
Imports Core.Web
Imports Core.Web.SvrCtls
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.DataAccess.Report
Imports EasyGrants.Web
Imports EasyGrants.Web.User
Imports Easygrants_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.Page.QueryTool.PageSection

Public Class cQueryNav
     Inherits Implementation.Modules.Staff.Controls.Page.QueryTool.cPersistQueryInfo
    
	Protected btnView As cCSSButton
	Protected btnReturn As cCSSButton
    Protected ctlViewResults As cNewWindowOpener
    Protected newBox As cMessageBox = New cMessageBox()
    Protected WithEvents PlaceHolder As System.Web.UI.WebControls.PlaceHolder
     
''========================================================
	
	Public Property SavedQueryDO() As cSavedQuery
		Get
			Return CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser).GetSavedQueryDO
		End Get
		Set(ByVal Value As cSavedQuery)
			CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser).SavedQueryDO = Value
		End Set
    End Property

''========================================================

    Public ReadOnly Property QueryResultsWindowURL()
        Get
            QueryResultsWindowURL = WebAppl.Build_RootURL("Implementation/Modules/Staff/Controls/Page/QueryTool/pgQueryResults.aspx?UserKey=" + CType(Page, cModulePage).ModuleUser.GetWebSessionKey)
        End Get
    End Property

''========================================================

	Private Function GetCurrentQueryURL() As String
		Dim aURL As String

		aURL = Request.Url.PathAndQuery
		aURL = cWebLib.RemoveQuerystringParameter(aURL, "BaseDODKey")
		aURL = cWebLib.RemoveQuerystringParameter(aURL, "QueryID")
		aURL = cWebLib.RemoveQuerystringParameter(aURL, "EditFilterKey")
		aURL = cWebLib.AddQuerystringParameter(aURL, "QueryType", "User", Server)
		aURL = cWebLib.AddQuerystringParameter(aURL, "Display", Request.QueryString("Display"), Server)
		Return aURL
	End Function

''========================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		ctlViewResults.NewWindowURL = QueryResultsWindowURL
		ctlViewResults.RefreshURL = GetCurrentQueryURL()
		
		btnReturn.Set_ServerClick(AddressOf btnReturn_Click)
		btnView.Set_ServerClick(AddressOf btnView_Click)
		
		'Server-Side pop up method
		CheckYesNo()	
	End Sub
	
''========================================================
	
	Public Overrides Sub btnView_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		dim aActionNode as XmlNode = CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).GetControl("btnContinue").DisplayPropertyNode.SelectSingleNode("Control/Action")
		dim aCtl as cCoreCtl = CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).GetControl("btnContinue")
		CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).EventController_ExecuteActionMethod(aActionNode, aSrc, aCtl)
		
		Me.ctlViewResults.Open()
    End Sub
	
''========================================================
	
	Public Overrides Sub btnReturn_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		Dim aReturnURL As String = Request.QueryString("ReturnURL")
		Dim aQueryType as String = Request.QueryString("QueryType")
		dim aDLCtl as cDoubleListBox = CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).GetControl("ctlSelect")
		dim aCtlLength as Integer = 0
		dim aSelectedItems as String()
		dim aItem as String
		
		aSelectedItems = aDLCtl.SelectedValueList.Split(",")
		aCtlLength = aSelectedItems.Length
		
		'need to make check that an item in fact was selected.  DoubleListBox will assign nothing to aSelectedItems and
		'  therefore length = 1.  This will only occur when nothing has been selected.
		for each aItem in aSelectedItems
			if aItem = "" then 
				aCtlLength = 0 
				exit For
			end if	
		next
		
		'if a field has been selected and user has not saved query, throw up server-side pop up ask if user wants to save query
		'  before re-directing user to Queries EL
		Select Case aCtlLength
			Case > 0
				Select Case aQueryType
					Case "New"
						dim aActionNode as XmlNode = CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).GetControl("btnContinue").DisplayPropertyNode.SelectSingleNode("Control/Action")
						dim aContinueCtl as cCoreCtl = CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).GetControl("btnContinue")
						CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).EventController_ExecuteActionMethod(aActionNode, aSrc, aContinueCtl)
						Dim aSavedQueryDO as cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SavedQuery", Request.QueryString("SavedQueryID"))
							MessageBox("Attention", "Do you want to save your changes to this query?", aQueryType, aReturnURL, "225", "100")
					Case "Saved"
						dim aActionNode as XmlNode = CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).GetControl("btnContinue").DisplayPropertyNode.SelectSingleNode("Control/Action")
						dim aContinueCtl as cCoreCtl = CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).GetControl("btnContinue")
						CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).EventController_ExecuteActionMethod(aActionNode, aSrc, aContinueCtl)
							Dim aSavedQueryDO as cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SavedQuery", Request.QueryString("SavedQueryID"))
							'if XML in session <> a_SAVED_QUERY.DataObjectXML from db, then call server-side pop up 
							'  to see if user wants to save changes
							if SavedQueryDO.SavedQueryDefXMLDoc.DocElement.OuterXml <> aSavedQueryDO.GetPropertyString("DataObjectXML") then
								Session.Add("DataObjectXML", SavedQueryDO("DataObjectXML")) 
								MessageBox("Attention", "Do you want to save your changes to this query?", aQueryType, aReturnURL, "275", "125")
							else
								EventController_NavigateToURL(aReturnURL)
							end if
					Case "User"
						dim aActionNode as XmlNode = CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).GetControl("btnContinue").DisplayPropertyNode.SelectSingleNode("Control/Action")
						dim aContinueCtl as cCoreCtl = CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).GetControl("btnContinue")
						CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).EventController_ExecuteActionMethod(aActionNode, aSrc, aContinueCtl)
						
						if Request.QueryString("SavedQueryID") Is Nothing then
							MessageBox("Attention", "Do you want to save your changes to this query?", aQueryType, aReturnURL, "225", "100")
						else
							Dim aSavedQueryDO as cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SavedQuery", Request.QueryString("SavedQueryID"))
							'IMPORTANT:  because the DisplayProperties element in Web Session and from a_SAVED_QUERY.DataObjectXML can be identical,
							'  even though the Joins/Provider Info nodes are not, we are stripping the excess XML in the Web Session 
							'  and a_SAVED_QUERY.DataObjectXML so that we can perform an accurate comparison, kda 7/18/06.
							'Joins/ProviderInfo nodes from Web Session
							dim aJoinsXMLNode as XmlNode = SavedQueryDO.SavedQueryDefXMLDoc.DocElement.SelectSingleNode("Joins")
							dim aDProviderInfoXMLNode as XmlNode = SavedQueryDO.SavedQueryDefXMLDoc.DocElement.SelectSingleNode("DataProviderInfo")
							dim aDataObjectXML as String = aSavedQueryDO.GetPropertyString("DataObjectXML")
							dim aXmlDoc as cXMLDoc = new cXMLDoc()
							aXmlDoc.LoadFromXML(aDataObjectXML)
							'Joins/ProviderInfo nodes from a_Saved_Query table
							dim aSQJoinsXMLNode as XmlNode = aXmlDoc.DocElement.SelectSingleNode("Joins")
							dim aSQDProviderInfoXMLNode as XmlNode = aXmlDoc.DocElement.SelectSingleNode("DataProviderInfo")							
							if not aJoinsXMLNode is nothing then
								SavedQueryDO.SavedQueryDefXMLDoc.DocElement.RemoveChild(aJoinsXMLNode)
							end if
							if not aDProviderInfoXMLNode is nothing
								SavedQueryDO.SavedQueryDefXMLDoc.DocElement.RemoveChild(aDProviderInfoXMLNode)
							end if
							if not aSQJoinsXMLNode is nothing then
								aXmlDoc.DocElement.RemoveChild(aSQJoinsXMLNode)
							end if
							if not aSQDProviderInfoXMLNode is nothing 
								aXmlDoc.DocElement.RemoveChild(aSQDProviderInfoXMLNode)
							end if
							'comparing XML in Web Session to XML in database, so that if there are changes we only call server side pop up
							if SavedQueryDO.SavedQueryDefXMLDoc.DocElement.OuterXml <> aXmlDoc.DocElement.OuterXml then
								Session.Add("DataObjectXML", SavedQueryDO.SavedQueryDefXMLDoc.DocElement.OuterXml) 
								MessageBox("Attention", "Do you want to save your changes to this query?", aQueryType, aReturnURL, "225", "125")
							else
								EventController_NavigateToURL(aReturnURL)
							end if
						end if
				End Select
			Case Else
				EventController_NavigateToURL(aReturnURL)
		End Select	
    End Sub
	
''========================================================

	Public Sub MessageBox(aTitle As String, aMessage As String, aQueryType as String, aReturnURL as String, aBoxWidth as String, aBoxHeight as String)

		newBox.MessageBoxButton = 3
        newBox.MessageBoxTop = 125  '175
        newBox.MessageBoxLeft = 350  '550
        newBox.MessageBoxWidth = aBoxWidth  '300
		newBox.MessageBoxHeight = aBoxHeight  '150
		newBox.MessageBoxButtonWidth = 50
		newBox.MessageBoxIDYes = "yesno"
        newBox.MessageBoxIDCancel = "yesno"
        newBox.MessageBoxButtonYesText = "OK"
        newBox.MessageBoxButtonCancelText = "Cancel"
		newBox.MessageBoxTitle = aTitle
        newBox.MessageBoxMessage = aMessage
        'waiting on CSS.DefaultStyles control to add these.
        'newBox.MessageBoxCssTitle = "MessageBoxCssTitle"
        'newBox.MessageBoxCssMessage = "MessageBoxCssMessage"
		PlaceHolder.Controls.Add(newBox)
		Session("QueryType") = aQueryType
		Session("ReturnURL") = aReturnURL
	End Sub
	
''========================================================
	
	Private Sub CheckYesNo()
		'if a "New" query, re-direct to save and run query page, otherwise only re-direct to Queries EL
		If CType(me.Session("QueryType"), String) <> "" AndAlso CType(me.Session("QueryType"), String) = "New" Then
			If Request.Form("mPageFrameCtl:ctlPageContent:ctlQueryNav:yesno") = "OK" Then
				Session.Remove("QueryType")
				Session.Remove("ReturnURL")
				EventController_NavigateToModulePageKey("SaveQuery")
			're-direct back to Queries EL
			ElseIf Request.Form("mPageFrameCtl:ctlPageContent:ctlQueryNav:yesno") = "Cancel" Then
				Session.Remove("QueryType")
				dim aReturnURL as String = Session("ReturnURL")
				Session.Remove("ReturnURL")
				EventController_NavigateToURL(aReturnURL)
			End If
		'if a "Saved" query, save and re-direct to Queries EL, otherwise only re-direct to Queries EL
		Elseif CType(me.Session("QueryType"), String) = "Saved" Or CType(me.Session("QueryType"), String) = "User" then
			If Request.Form("mPageFrameCtl:ctlPageContent:ctlQueryNav:yesno") = "OK" Then
				Session.Remove("QueryType")
				dim aReturnURL as String = Session("ReturnURL")
				Session.Remove("ReturnURL")
				'need this check when QueryType=User and XML has not changed
				if CType(me.Session("DataObjectXML"), String) <> "" then
					SavedQueryDO("DataObjectXML") = Session("DataObjectXML")
					WebSession.DataObjectFactory.SaveDataObject(CType(CType(Page, cModulePage).ModuleUser, cEGStaffUser).SavedQueryDO)
					Session.Remove("DataObjectXML")
				end if
				EventController_NavigateToURL(aReturnURL)
			're-direct back to Queries EL
			ElseIf Request.Form("mPageFrameCtl:ctlPageContent:ctlQueryNav:yesno") = "Cancel" Then
					Session.Remove("QueryType")
					Session.Remove("DataObjectXML")
					dim aReturnURL as String = Session("ReturnURL")
					Session.Remove("ReturnURL")
					EventController_NavigateToURL(aReturnURL)
			End If
		End If
    End Sub 
          
'=============================================================

End Class
End Namespace