Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports EasyGrants.Web.User

Namespace Easygrants_Web.Controls.Base

Public MustInherit Class cOrgSelectPopUpNotInList
	Inherits Core.Web.cCorePage
'=============================================================	

	Protected valReqInst As RequiredFieldValidator
	Protected trInstruction As HtmlTableRow
	Protected tabMain As HtmlTable
	Protected trInstName As HtmlTableRow
	Protected spInstName As HtmlGenericControl
	Protected txtInstID As HtmlInputText
	Protected txtInstName As HtmlInputText
	Protected trSearch1 As HtmlTableRow
	Protected trSearch2 As HtmlTableRow
	Protected txtInstitutionSearch As HtmlInputText
	Protected txtEdLevel As HtmlInputText
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
	Protected ValInstitutionSearch As RequiredFieldValidator
	Protected ValStateother As RequiredFieldValidator
	Protected ValCountryOther As RequiredFieldValidator
	Protected ValTypeOther As RequiredFieldValidator
	Protected valEIN As RegularExpressionValidator
	Protected ValReqEIN As RequiredFieldValidator
	Protected valCusEIN As CustomValidator
	Protected trCity As HtmlTableRow
	Protected trEIN As HtmlTableRow
	Protected trEINInstructions As HtmlTableRow
	Protected trStateInstruction As HtmlTableRow
	Protected txtCityOther As HtmlInputText
	Protected txtEINOther As HtmlInputText
	Protected valReqCityOther As RequiredFieldValidator
	Protected trState As HtmlTableRow
	Protected ctlState As cDropDown
	Protected trCountry As HtmlTableRow
	Protected trType As HtmlTableRow
	Protected ctlCountry As cDropDown
	Protected ctlType As cDropDown
	Protected trSave As HtmlTableRow
	Protected btnSave As cCSSButton
	Protected spDivider1 As HtmlGenericControl
	Protected btnCancel2 As cCSSButton
	Protected spAnchorInstSelect As HtmlGenericControl
	Protected spCloseWindow As HtmlGenericControl
	Protected spnConfigXML As HtmlGenericControl

	Private mInstitutionName As String
	Private mInstitutionID As String
	Private mSQLString As String
	Private mPageURL As String
	Private mXMLDoc As cXMLDoc = New cXMLDoc()

	Private lblValidator2 As Label
	Private lblValidator1 As Label

'=============================================================	

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

'=============================================================	
	Public Overrides Sub CorePage_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		Dim aDisplayPropertyNode As XmlNode
		Dim aInstNameNode As XmlNode
		'Dim aEdLevelNode as XmlNode
		'Dim aEdLevel as String

		Me.mXMLDoc.LoadFromXML(spnConfigXML.InnerText)
 '       ctlState.AGCtl_LoadRows_SQL("select State, StateFullName from ltblStates order by StateFullName")
'        ctlCountry.AGCtl_LoadRows_SQL("select CountryAbbrev, CountryName from v_Countries order by d_order, CountryName")

		btnFind.Set_ServerClick(AddressOf btnFind_Click)
		btnSelect.Set_ServerClick(AddressOf btnSelect_Click)
		btnSave.Set_ServerClick(AddressOf btnSave_Click)
		btnCancel1.Set_ServerClick(AddressOf btnCancel_Click)
		btnCancel1b.Set_ServerClick(AddressOf btnCancelClose_Click)
		btnCancel2.Set_ServerClick(AddressOf btnCancel_Click)

		spInstName.Visible = True

		trResults1.Visible = False
		trResults2.Visible = False
		trOr.Visible = False
		trNewInstName.Visible = False
		trEIN.Visible = False
		trEINInstructions.Visible = False
		trStateInstruction.Visible = False
		trCity.Visible = False
		trState.Visible = False
		trCountry.Visible = False
		trType.Visible = False
		trSave.Visible = False
		btnCancel1.Visible = False

		trSearch1.Visible = True
		trSearch2.Visible = True
		trSelect.Visible = True
		btnSelect.Visible = False
		btnSave.Visible = False
		spDivider.Visible = False
		spDivider1.Visible = False
		trInstruction.Visible = False

		spInstName.InnerText = InstitutionName

		If Not Request.QueryString("find") Is Nothing Then
			btnCancel1.Visible = True
			btnCancel1b.Visible = False
			btnSelect.Visible = True
			trSearch1.Visible = False
			trSearch2.Visible = False
			trResults1.Visible = True
			trResults2.Visible = True
			trInstruction.Visible = False
			trSelect.Visible = True
			btnSave.Visible = True
			trSave.Visible = True
			btnSave.Visible = True
			spDivider.Visible = True
			spDivider1.Visible = True

			txtInstitutionSearch.Value = Request.QueryString("find")
			aDisplayPropertyNode = mXMLDoc.DocElement.SelectSingleNode("DisplayProperties/DisplayProperty[@PropertyKey='Organization']")
			'aInstNameNode = aDisplayPropertyNode.SelectSingleNode("Control/Filters/Argument[@Type='QueryString']")
			aInstNameNode = aDisplayPropertyNode.SelectSingleNode("Control/Filters/Argument[@TypeKey='find']")
			mXMLDoc.AddAttribute(aInstNameNode, "Value", Server.UrlDecode(Request.QueryString("find")))

			'ctlInstitutionList.DisplayNone = True
			ctlInstitutionList.CoreCtl_Configure(aDisplayPropertyNode, New cDataObjectList(WebSession.DataObjectFactory))
			If ctlInstitutionList.Items.Count < 1 Then
				Dim aLI As ListItem
				aLI = New ListItem()
				aLI.Value = ""
				aLI.Text = "<None>"
				If Not ctlInstitutionList.Items.Contains(aLI) Then
					ctlInstitutionList.Items.Add(aLI)
				End If
			End If

			aDisplayPropertyNode = mXMLDoc.DocElement.SelectSingleNode("DisplayProperties/DisplayProperty[@PropertyKey='State']")
			ctlState.CoreCtl_Configure(aDisplayPropertyNode, New cDataObjectList(WebSession.DataObjectFactory))


			aDisplayPropertyNode = mXMLDoc.DocElement.SelectSingleNode("DisplayProperties/DisplayProperty[@PropertyKey='Country']")
			ctlCountry.CoreCtl_Configure(aDisplayPropertyNode, New cDataObjectList(WebSession.DataObjectFactory))

			aDisplayPropertyNode = mXMLDoc.DocElement.SelectSingleNode("DisplayProperties/DisplayProperty[@PropertyKey='OrganizationType']")
			ctlType.CoreCtl_Configure(aDisplayPropertyNode, New cDataObjectList(WebSession.DataObjectFactory))

			trOr.Visible = True
			trNewInstName.Visible = True
			trEIN.Visible = True
			trEINInstructions.Visible = True
			trStateInstruction.Visible = True
			trCity.Visible = True
			trState.Visible = True
			trCountry.Visible = True
			trType.Visible = True
		End If
	End Sub
'-------------------------------------------------------------

	Public Sub btnFind_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		Dim aEncodeString As String
		Dim aURLChar As String
		Dim aURL As String

		ValInstitutionSearch.Enabled = True

		 lblValidator1 = FindControl("lblValidator1")
		lblValidator1.Text = ""

		 ValInstitutionSearch.Validate()
		If Not ValInstitutionSearch.IsValid Then
			lblValidator1.Text = ConfigurableText(ValInstitutionSearch.ErrorMessage)
			Exit Sub
		End If

		'Response.Write("From Find: " + txtInstitutionSearch.Value)

		If InStr(1, Request.Url.ToString(), "?") > 0 Then
			aURLChar = "&"
		Else
			aURLChar = "?"
		End If

		aEncodeString = Server.UrlEncode(txtInstitutionSearch.Value)

		If InStr(1, Request.Url.ToString(), "find=") > 0 Then
			aURL = Left(Request.Url.ToString(), InStr(1, Request.Url.ToString(), "find=") - 2)
		Else
			aURL = Request.Url.ToString()
		End If

		Response.Redirect(aURL & aURLChar & "find=" & aEncodeString)
	End Sub

'-------------------------------------------------------------

	Public Sub btnSelect_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		Dim aURLChar As String
		Dim aURL As String
		Dim aSQL As String
			If ctlInstitutionList.SelectedValue <> "" Then
				'If Request.Form(3) <> "" Then
				InstitutionID = ctlInstitutionList.SelectedValue
				InstitutionName = ctlInstitutionList.SelectedText
				InstitutionName = Replace(InstitutionName, "'", "&apos;")
				spAnchorInstSelect.Visible = True
			Else
				btnSave_Click(aSrc, aArgs)
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

'-------------------------------------------------------------

	Public Sub btnSave_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		'Enable Institution, city, country validators
		valReqInstOther.Enabled = True

		ctlCountry.ValidationText = "You must select a country."

		lblValidator2 = FindControl("lblValidator2")
		lblValidator2.Text = ""

		'Validate control
		valReqInstOther.Validate()
		If Not valReqInstOther.IsValid Then
			lblValidator2.Text = ConfigurableText(lblValidator2.Text + valReqInstOther.ErrorMessage + "<br/>")
		End If

		ValReqEIN.Enabled = True
		ValReqEIN.Validate()
		If Not ValReqEIN.IsValid Then
			lblValidator2.Text = ConfigurableText(lblValidator2.Text + ValReqEIN.ErrorMessage + "<br/>")
		End If

		valReqCityOther.Enabled = True
		valReqCityOther.Validate()
		If Not valReqCityOther.IsValid Then
			lblValidator2.Text = ConfigurableText(lblValidator2.Text + valReqCityOther.ErrorMessage + "<br/>")
		End If

		ValStateother.Enabled = True
		ValStateother.Validate()
		If Not ValStateother.IsValid Then
			lblValidator2.Text = ConfigurableText(lblValidator2.Text + ValStateother.ErrorMessage + "<br/>")
		End If

		ValCountryOther.Enabled = True
		ValCountryOther.Validate()
		If Not ValCountryOther.IsValid Then
			lblValidator2.Text = ConfigurableText(lblValidator2.Text + ValCountryOther.ErrorMessage + "<br/>")
		End If

		ValTypeOther.Enabled = True
		ValTypeOther.Validate()
		If Not ValTypeOther.IsValid Then
			lblValidator2.Text = ConfigurableText(lblValidator2.Text + ValTypeOther.ErrorMessage + "<br/>")
		End If



		valEIN.Enabled = True
		valEIN.Validate()
		If Not valEIN.IsValid Then
			lblValidator2.Text = ConfigurableText(lblValidator2.Text + valEIN.ErrorMessage + "<br/>")
		End If

		valCusEIN.Enabled = True
		valCusEIN.Validate()
		If Not valCusEIN.IsValid Then
			lblValidator2.Text = ConfigurableText(lblValidator2.Text + valCusEIN.ErrorMessage + "<br/>")
		End If

		If lblValidator2.Text <> "" Then
			Exit Sub
		End If

		'Create new Institution data object
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aDataObject As cDataObject
		Dim aAddressDO As cDataObject
		Dim aUserID As Integer
		Dim aEGUser As cEGUser
		   aEGUser = CType(WebSession.User("cEGStaffUser"), cEGUser)
		If aEGUser Is Nothing Then
			aEGUser = CType(WebSession.User("cEGHomeUser"), cEGUser)
		End If
		If Not aEGUser Is Nothing Then
			aUserID = aEGUser.UserID
		End If

		InstitutionName = txtInstitutionOther.Value
		WebSession.DataObjectFactory.CreateDataObjectNode("Organization", aDataObjectNode, aFiltersNode)
		aDataObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
		aDataObject("OrganizationName") = InstitutionName
		aDataObject("CommonOrganizationName") = InstitutionName
		aDataObject("OrganizationTypeID") = Me.ctlType.SelectedValue
		aDataObject("EIN") = txtEINOther.Value
		aDataObject("NotInList") = True
		aDataObject("AvailableInSelector") = False
		aDataObject("CreateDate") = System.DateTime.Now
		aDataObject("CreateUser") = aUserID
		WebSession.DataObjectFactory.SaveDataObject(aDataObject)
		InstitutionID = aDataObject("OrganizationID")

		WebSession.DataObjectFactory.CreateDataObjectNode("Address", aDataObjectNode, aFiltersNode)
		aAddressDO = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
		aAddressDO("EntityID") = InstitutionID
		aAddressDO("EntityTypeID") = 2 'organization
		aAddressDO("Inst") = InstitutionName
		aAddressDO("City") = txtCityOther.Value
		aAddressDO("StateID") = Me.ctlState.SelectedValue
		aAddressDO("CountryID") = Me.ctlCountry.SelectedValue
		aAddressDO("IsPrimary") = True
		aAddressDO("CreateDate") = System.DateTime.Now
		aAddressDO("CreateUser") = aUserID
		WebSession.DataObjectFactory.SaveDataObject(aAddressDO)

		spAnchorInstSelect.Visible = True
	End Sub

	Public Sub ValDoesEINExists(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		aArgs.IsValid = True
		Dim aEIN As String = txtEINOther.Value
		Dim aOrganizationList As cDataObjectList
		Dim aEINCase As String
		'aEINCase = StrConv(aEIN, VbStrConv.ProperCase)
		aEINCase = LCase(aEIN)
		If aEINCase <> "n/a" AndAlso aEINCase <> "na" Then

			aOrganizationList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Organization", "EIN", aEIN)
			If aOrganizationList.Count > 0 Then
				aArgs.IsValid = False
			Else
				aArgs.IsValid = True
			End If
		End If
   End Sub

'=============================================================	

End Class
End Namespace