Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base

Public MustInherit Class cOrgSelectPopUp
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

    Private mInstitutionName As String
    Private mInstitutionID As String
    Private mSQLString As String
    Private mPageURL As String
    Private mXMLDoc As cXMLDoc = New cXMLDoc()

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
		Dim aEdLevelNode as XmlNode
		Dim aEdLevel as String
		
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
        trCity.Visible = False
        trState.Visible = False
        trCountry.Visible = False
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
			if ((Request.QueryString("EdType") = "3") or (Request.QueryString("EdType") = "4") or (Request.QueryString("EdType") = "6")) Then
				txtEdLevel.Value = "1"
			End If			
            aDisplayPropertyNode = mXMLDoc.DocElement.SelectSingleNode("DisplayProperties/DisplayProperty[@PropertyKey='Organization']")
            'aInstNameNode = aDisplayPropertyNode.SelectSingleNode("Control/Filters/Argument[@Type='QueryString']")
            aInstNameNode = aDisplayPropertyNode.SelectSingleNode("Control/Filters/Argument[@TypeKey='find']")
            mXMLDoc.AddAttribute(aInstNameNode, "Value", Server.UrlDecode(Request.QueryString("find")))
            aEdLevelNode = aDisplayPropertyNode.SelectSingleNode("Control/Filters/Argument[@TypeKey='edlevel']")
            if ((Server.UrlDecode(Request.QueryString("EdType")) = "3") or (Server.UrlDecode(Request.QueryString("EdType")) = "4") or (Server.UrlDecode(Request.QueryString("EdType")) = "6")) Then
				aEdLevel = "1"
			Else
				aEdLevel = "0"
			End If            
            mXMLDoc.AddAttribute(aEdLevelNode, "Value", aEdLevel)
            

            ctlInstitutionList.DisplayNone = True
            ctlInstitutionList.CoreCtl_Configure(aDisplayPropertyNode, New cDataObjectList(WebSession.DataObjectFactory))

            aDisplayPropertyNode = mXMLDoc.DocElement.SelectSingleNode("DisplayProperties/DisplayProperty[@PropertyKey='State']")
            ctlState.CoreCtl_Configure(aDisplayPropertyNode, New cDataObjectList(WebSession.DataObjectFactory))

            aDisplayPropertyNode = mXMLDoc.DocElement.SelectSingleNode("DisplayProperties/DisplayProperty[@PropertyKey='Country']")
            ctlCountry.CoreCtl_Configure(aDisplayPropertyNode, New cDataObjectList(WebSession.DataObjectFactory))

            trOr.Visible = True
            trNewInstName.Visible = True
            trCity.Visible = True
            trState.Visible = True
            trCountry.Visible = True
        End If
    End Sub
'-------------------------------------------------------------

    Public Sub btnFind_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
        Dim aEncodeString As String
        Dim aURLChar As String
        Dim aURL As String

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
        Dim aDR As IDataReader

        If Request.Form(3) <> "" Then
            InstitutionID = ctlInstitutionList.SelectedValue
            InstitutionName = ctlInstitutionList.SelectedText
        Else

            'Enable Institution, city, country validators
            valReqInstOther.Enabled = True
            valReqCityOther.Enabled = True
            ctlCountry.ValidationText = "You must select a country."

            'Validate control
            valReqInstOther.Validate()
            valReqCityOther.Validate()

            'If Page.IsValid = false then
            If Not (valReqInstOther.IsValid And valReqCityOther.IsValid) Then
                Exit Sub
            End If
            
            InstitutionName = txtInstitutionOther.Value
        End If

        spAnchorInstSelect.Visible = True
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
        'Create new Institution data object
        Dim aDataObjectNode As XmlNode
        Dim aFiltersNode As XmlNode
        Dim aDataObject As cDataObject

        InstitutionName = txtInstitutionOther.Value
        WebSession.DataObjectFactory.CreateDataObjectNode("Organization", aDataObjectNode, aFiltersNode)
        aDataObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)

        'Set name, city, state
        aDataObject("OrganizationName") = InstitutionName
        aDataObject("City") = txtCityOther.Value
        aDataObject("StateProvID") = Me.ctlState.SelectedValue
        aDataObject("CountryID") = Me.ctlCountry.SelectedValue
        'Save data object
        WebSession.DataObjectFactory.SaveDataObject(aDataObject)
        InstitutionID = aDataObject("OrganizationID")
        spAnchorInstSelect.Visible = True
    End Sub

'=============================================================	

End Class
End Namespace