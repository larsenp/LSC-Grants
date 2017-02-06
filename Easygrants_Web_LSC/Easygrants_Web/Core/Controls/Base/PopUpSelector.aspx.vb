Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core.Web.SvrCtls
Imports System.Text

Namespace Core_Web.Controls.Base

Public MustInherit Class cPopUpSelector
    Inherits Core.Web.cCorePage
    
'=============================================================	

    Protected valReqInst As RequiredFieldValidator
    Protected txtInstID As HtmlInputText
    Protected txtInstName As HtmlInputText
    Protected trSearch1 As HtmlTableRow
    Protected trSearch2 As HtmlTableRow
    Protected txtSearch As HtmlInputText
    Protected txtEdLevel as HtmlInputText
	Protected btnFind As cCSSButton
    Protected trResults1 As HtmlTableRow
    Protected trResults2 As HtmlTableRow
    Protected ctlInstitutionList As cDropDown
    Protected trSelect As HtmlTableRow
	Protected btnSelect As cCSSButton
    Protected spDivider As HtmlGenericControl
	Protected btnCancel1 As cCSSButton
	Protected btnCancel1b As cCSSButton
    Protected trOr As HtmlTableRow
    Protected trNewInstName As HtmlTableRow
    Protected txtInstitutionOther As HtmlInputText
    Protected valReqInstOther As RequiredFieldValidator
    Protected trCity As HtmlTableRow
    Protected txtCityOther As HtmlInputText
    Protected valReqCityOther As RequiredFieldValidator
    Protected trState As HtmlTableRow
    Protected ctlState As cDropDown
    Protected trCountry As HtmlTableRow
    Protected ctlCountry As cDropDown
    Protected trSave As HtmlTableRow
	Protected btnSave As cCSSButton
    Protected spDivider1 As HtmlGenericControl
	Protected btnCancel2 As cCSSButton
    Protected spAnchorInstSelect As HtmlGenericControl
    Protected spCloseWindow As HtmlGenericControl
    Protected spnConfigXML As HtmlGenericControl
	Protected CtlDisplayLabel As cLabel
	Protected spRefreshParentPage As HtmlGenericControl
	Protected valLength As CustomValidator
	Protected spnText as HtmlGenericControl
	Protected ctlStyleLoader As cUserCtlLoader

    Private mDataObjName As String
    Private mDataObjID As String
    Private mDisplayValue As String
    Private mInstitutionName As String
    Private mInstitutionID As String
    Private mSQLString As String
    Private mPageURL As String
    Private mXMLDoc As cXMLDoc = New cXMLDoc()
	Private mParentPageURL As String
	Private mPopUpTitle As String
	Protected spnNoResultsMessage As HtmlGenericControl
	Protected trResults3 As HtmlTableRow

'=============================================================	

	Public ReadOnly Property DisplayName as String
		Get
			dim aDisplayName as String = cXMLDoc.AttributeToString(DataObjNodeList(0), "DisplayName")
			
			if aDisplayName = "" then return DataObjName
					
			Return ConfigurableText(aDisplayName)
		End Get		
	End Property	

'-----------------------------------------------------

	Public ReadOnly Property DataObjNodeList as XmlNodeList
		Get
			dim aID as String = request.QueryString("CtlID")
			return CType(Session(aID), XmlNodeList)
		End Get		
	End Property	

'-----------------------------------------------------

    Public Property DataObjID() As String
        Get
            return request.QueryString("DataObjID")
        End Get
        Set(ByVal Value As String)
            mDataObjID = Value
        End Set
    End Property

'-------------------------------------------------------------	

    Public Property DataObjName() As String
        Get
            return request.QueryString("DataObjName")
        End Get
        Set(ByVal Value As String)
            mDataObjName = Value
        End Set
    End Property

'-------------------------------------------------------------	

    Public Property DisplayValue() As String
        Get
            return request.QueryString("DisplayValue")
        End Get
        Set(ByVal Value As String)
            mDisplayValue = Value
        End Set
    End Property

'-------------------------------------------------------------	

    Public Property InstitutionName() As String
        Get
            InstitutionName = txtInstName.Value
        End Get
        Set(ByVal Value As String)
            txtInstName.Value = Value
        End Set
    End Property

'-------------------------------------------------------------	

    Public Property InstitutionID() As String
        Get
            InstitutionID = txtInstID.Value
        End Get
        Set(ByVal Value As String)
            txtInstID.Value = Value
        End Set
    End Property

'-------------------------------------------------------------	

    Public Property SQLString() As String
        Get
            SQLString = mSQLString
        End Get
        Set(ByVal Value As String)
            mSQLString = Value
        End Set
    End Property

'-------------------------------------------------------------	

    Public Property PageURL() As String
        Get
            PageURL = mPageURL
        End Get
        Set(ByVal Value As String)
            mPageURL = Value
        End Set
    End Property

'----------------------------------------------------

    Public Property RequiredField() As Boolean
        Get
            RequiredField = valReqInst.Enabled
        End Get
        Set(ByVal Value As Boolean)
            valReqInst.Enabled = Value
        End Set
    End Property

'-------------------------------------------------------------	

	Public Property PopUpTitle() As String
		Get
			If DataObjName = "Person" Then
				PopUpTitle = "Person Selector"
			ElseIf DataObjName = "Organization" Then
				PopUpTitle = "Select " + GetLabel("Organization") + " Wizard"
			elseif DataObjName = "GranteeProjectTitle" then
			    PopUpTitle = "Grant ID Selector"	
			Else
				PopUpTitle = "Pop-Up Selector"
			End If
		End Get
		Set(ByVal Value As String)
			mPopUpTitle = Value
		End Set
	End Property

'----------------------------------------------------

	'Public Property ParentPageURL() as String
	'	Get
	'		ParentPageURL = mParentPageURL
	'	End Get
	'	Set
	'		mParentPageURL = Value
	'	End Set
	'End Property

'=============================================================	

	Public Overrides Sub CorePage_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		Dim aDisplayPropertyNode As XmlNode
		Dim aInstNameNode As XmlNode
		Dim aFilterNode As XmlNode
		Dim aXmlNode As XmlNode
		Dim aSearchValue As String
		Dim aConfigXml As StringBuilder = New StringBuilder("<ModuleSection><DisplayProperties>")

		aConfigXml.Append("<DisplayProperty PropertyKey='")
		aConfigXml.Append(DataObjName)
		aConfigXml.Append("'><Control ID='ctlInstitutionList' Type='cDropDown' ")
		aConfigXml.Append("DataObjectDefinitionKey='")
		aConfigXml.Append(DataObjName)
		aConfigXml.Append("' StoredValue='")
		aConfigXml.Append(DataObjID)
		aConfigXml.Append("' DisplayValue='")
		aConfigXml.Append(DisplayValue)
		aConfigXml.Append("' DisplayNone='False'><Filters>")
		aConfigXml.Append("<Argument Type='QueryString' TypeKey='find' Operator='Like' PropertyKey='")

		aXmlNode = DataObjNodeList(0).SelectSingleNode("DisplayProperties/DisplayProperty")
		Dim aAlternateText As String = cXMLDoc.AttributeToString(aXmlNode, "AlternateText")

		If aAlternateText = "" Then
                spnText.InnerHtml = "Enter all or part of the " + DisplayName + " name in the textbox below. Then, click <b>Find</b>"
			spnText.InnerHtml = cXMLDoc.AttributeToString(aXmlNode, "AlternateText")
		End If
		spnText.InnerHtml = ConfigurableText(spnText.InnerHtml)

		aXmlNode = DataObjNodeList(0).SelectSingleNode("SearchProperties/SearchProperty")
		aSearchValue = cXMLDoc.AttributeToString(aXmlNode, "DisplayValue")

		aConfigXml.Append(aSearchValue)
		aConfigXml.Append("'/>")

		aFilterNode = DataObjNodeList(0).SelectSingleNode("Filters")

		If Not aFilterNode Is Nothing Then
			aConfigXml.Append(aFilterNode.InnerXml.ToString())
		End If

		aConfigXml.Append("</Filters><Sort>")
		aConfigXml.Append("<Argument PropertyKey='")
		aConfigXml.Append(aSearchValue)
		aConfigXml.Append("'/></Sort></Control></DisplayProperty>")

		aConfigXml.Append("</DisplayProperties></ModuleSection>")

		Me.mXMLDoc.LoadFromXML(aConfigXml.ToString())


		'If cXMLDoc.AttributeToString(aXmlNode, "ConfigurableLabel") = "True" Then
		'	CtlDisplayLabel.Value = CtlDisplayLabel.GetLabel(cXMLDoc.AttributeToString(aXmlNode, "DisplayLabel"))
		'Else
		'	CtlDisplayLabel.Value = cXMLDoc.AttributeToString(aXmlNode, "DisplayLabel")
		'End If
		CtlDisplayLabel.Value = ConfigurableText(cXMLDoc.AttributeToString(aXmlNode, "DisplayLabel"))



		btnFind.Set_ServerClick(AddressOf btnFind_Click)
		btnSelect.Set_ServerClick(AddressOf btnSelect_Click)
		btnCancel1.Set_ServerClick(AddressOf btnCancel_Click)
		btnCancel1b.Set_ServerClick(AddressOf btnCancelClose_Click)

		trResults1.Visible = False
		trResults2.Visible = False
		trResults3.Visible = False
		btnCancel1.Visible = False

		trSearch1.Visible = True
		trSearch2.Visible = True
		trSelect.Visible = True
		btnSelect.Visible = False
		spDivider.Visible = False

		'If Request.QueryString("RefreshParentPage") = "True" Then
		'	ParentPageURL = Request.QueryString("ParentPageURL")
		'End If

		If Not Request.QueryString("find") Is Nothing Then
			btnCancel1.Visible = True
			btnCancel1b.Visible = False

			trSearch1.Visible = False
			trSearch2.Visible = False
			trResults1.Visible = True
			trResults2.Visible = True
			trResults3.Visible = False
			trSelect.Visible = True
			spDivider.Visible = True
			btnSelect.Visible = True

			txtSearch.Value = Request.QueryString("find")

			aDisplayPropertyNode = mXMLDoc.DocElement.SelectSingleNode("DisplayProperties/DisplayProperty[@PropertyKey='" + DataObjName + "']")
			aInstNameNode = aDisplayPropertyNode.SelectSingleNode("Control/Filters/Argument[@TypeKey='find']")
			mXMLDoc.AddAttribute(aInstNameNode, "Value", Server.UrlDecode(Request.QueryString("find")))

			ctlInstitutionList.CoreCtl_Configure(aDisplayPropertyNode, New cDataObjectList(WebSession.DataObjectFactory))
			If ctlInstitutionList.Items.Count < 1 Then
				btnSelect.Visible = False
				trResults1.Visible = False
				trResults2.Visible = False
				trResults3.Visible = True
				aXmlNode = DataObjNodeList(0).SelectSingleNode("DisplayProperties/DisplayProperty")
				Dim aNoResultsMessage As String = cXMLDoc.AttributeToString(aXmlNode, "NoResultsMessage")
				If aNoResultsMessage = "" Then
					spnNoResultsMessage.InnerHtml = "No results were found."
				Else
					spnNoResultsMessage.InnerHtml = ConfigurableText(aNoResultsMessage)
				End If
			End If
		End If
	End Sub
	
'-------------------------------------------------------------

	Public Sub btnFind_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		Dim aEncodeString As String
		Dim aURLChar As String
		Dim aURL As String

		'Response.Write("From Find: " + txtSearch.Value)
		Me.Validate()

		'If InStr(1, Request.Url.ToString(), "?") > 0 Then
		'	aURLChar = "&"
		'Else
		'	aURLChar = "?"
		'End If

		'aEncodeString = Server.UrlEncode(txtSearch.Value)

		'If InStr(1, Request.Url.ToString(), "find=") > 0 Then
		'	aURL = Left(Request.Url.ToString(), InStr(1, Request.Url.ToString(), "find=") - 2)
		'Else
		'	aURL = Request.Url.ToString()
		'End If

		'Response.Redirect(aURL & aURLChar & "find=" & aEncodeString)
	End Sub

'-------------------------------------------------------------

	Public Sub btnSelect_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)

		Dim aURLChar As String
		Dim aURL As String
		Dim aSQL As String
		'Dim aDR As IDataReader

		If Request.Form(3) <> "" Then
			InstitutionID = ctlInstitutionList.SelectedValue
			InstitutionName = ctlInstitutionList.SelectedText
			InstitutionName = Replace(InstitutionName,"'","&apos;")
		Else
			trSelect.Visible = False
		End If

		If Request.QueryString("RefreshParentPage") = "True" Then
			'ParentPageURL = cWebLib.AddQuerystringParameter(ParentPageURL, _
			'		Request.QueryString("ValueQueryString"), InstitutionID)
			'ParentPageURL = cWebLib.AddQuerystringParameter(ParentPageURL, _
			'		Request.QueryString("TextQueryString"), InstitutionName)
			spRefreshParentPage.Visible = True
		Else
			spAnchorInstSelect.Visible = True
		End If
	End Sub
'-------------------------------------------------------------

	Public Sub btnCancel_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		Dim aURL As String

		aURL = Request.Url.ToString()
		If InStr(1, aURL, "search=") > 0 Then
			aURL = Left(aURL, InStr(1, aURL, "search=") - 2)
		End If
		If InStr(1, aURL, "find=") > 0 Then
			aURL = Left(aURL, InStr(1, aURL, "find=") - 2)
		End If
		If InStr(1, aURL, "InstID=") > 0 Then
			aURL = Left(aURL, InStr(1, aURL, "InstID=") - 2)
		End If

		Response.Redirect(aURL)
	End Sub

'-------------------------------------------------------------

	Public Sub btnCancelClose_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		spCloseWindow.Visible = True
	End Sub

'----------------------------------------------------------------------------

   Public Sub ValidateLength(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aXmlNode As XmlNode = DataObjNodeList(0).SelectSingleNode("SearchProperties/SearchProperty")
		Dim aLength As Integer = cXMLDoc.AttributeToInt(aXmlNode, "MinLength")
		Dim aEncodeString As String
		Dim aURLChar As String
		Dim aURL As String

		If aLength <> 0 And txtSearch.Value.Length < aLength Then
			aArgs.IsValid = False
			Dim aMsg As String = cXMLDoc.AttributeToString(aXmlNode, "ErrorMessage")

			If aMsg <> "" Then valLength.ErrorMessage = aMsg
		Else
			If InStr(1, Request.Url.ToString(), "?") > 0 Then
				aURLChar = "&"
			Else
				aURLChar = "?"
			End If

			aEncodeString = Server.UrlEncode(txtSearch.Value)

			If InStr(1, Request.Url.ToString(), "find=") > 0 Then
				aURL = Left(Request.Url.ToString(), InStr(1, Request.Url.ToString(), "find=") - 2)
			Else
				aURL = Request.Url.ToString()
			End If

			Response.Redirect(aURL & aURLChar & "find=" & aEncodeString)
		End If

   End Sub

'=============================================================	

End Class
End Namespace