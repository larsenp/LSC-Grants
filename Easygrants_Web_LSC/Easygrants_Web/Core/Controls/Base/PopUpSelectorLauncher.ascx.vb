Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core.Web.Modules

Namespace Core_Web.Controls.Base

<ValidationPropertyAttribute("ObjSelectLauncher")> Public MustInherit Class cPopUpSelectorLauncher
    Inherits Core.Web.cCoreCtl
'=============================================================	
    Protected txtObjName As HtmlInputText
    Protected hdnObjID As HtmlInputHidden	
    Protected hdnpopup_1 As HtmlInputHidden	
    Protected valReqText As RequiredFieldValidator
	Protected mURL As String = "Core/Controls/Base/PopUpSelector.aspx"
	Protected spnConfigXML As HtmlGenericControl
	Protected spnSelect As HtmlGenericControl

    Private mDisplayPropertyNode As XmlNode
	Private mOrigin As String
	Private mDataObjName As String
	Private mDataObjID As String
	Private mDataObjIDValue As String
	Private mDisplayValue As String
	Private mXMLDoc As cXMLDoc = New cXMLDoc()
    Private mRefreshParentPage As String
    Private mValueQueryString As String
    Private mTextQueryString As String
	Private mWidth As integer = 470
	Private mHeight As integer = 210
	Private mTop As integer = 100
	Private mLeft As integer = 400

'=============================================================

    Public Property Width() As Integer
    Get
        Return mWidth
    End Get
    Set(ByVal Value As Integer)
        mWidth = Value
    End Set
    End Property

'-------------------------------------------------------------	

    Public Property Height() As Integer
    Get
        Return mHeight
    End Get
    Set(ByVal Value As Integer)
        mHeight = Value
    End Set
    End Property

    Public Property Top() As Integer
    Get
        Return mTop
    End Get
    Set(ByVal Value As Integer)
        mTop = Value
    End Set
    End Property

    Public Property Left() As Integer
    Get
        Return mLeft
    End Get
    Set(ByVal Value As Integer)
        mLeft = Value
    End Set
    End Property

'-------------------------------------------------------------	

    Public ReadOnly Property QueryID() As String
		Get
			dim aOrigin as String = request.QueryString("Origin")
			
			if aOrigin <> "" then return aOrigin
			
			return Origin
		End Get
    End Property

'-------------------------------------------------------------	

    Public Property Origin() As String
    Get
        Return mOrigin
    End Get
    Set(ByVal Value As String)
        mOrigin = Value
    End Set
    End Property

'-------------------------------------------------------------	

    Public Property DataObjName() As String
    Get
        Return mDataObjName
    End Get
    Set(ByVal Value As String)
        mDataObjName = Value
    End Set
    End Property

'-------------------------------------------------------------	

    Public Property DataObjID() As String
    Get
        Return mDataObjID
    End Get
    Set(ByVal Value As String)
        mDataObjID = Value
    End Set
    End Property

'-------------------------------------------------------------	

    Public Property DataObjIDValue() As String
    Get
        Return mDataObjIDValue
    End Get
    Set(ByVal Value As String)
        mDataObjIDValue = Value
    End Set
    End Property

'-------------------------------------------------------------	

    Public Property DisplayValue() As String
    Get
        Return mDisplayValue
    End Get
    Set(ByVal Value As String)
        mDisplayValue = Value
    End Set
    End Property

'-------------------------------------------------------------	

    Public Property URL() As String
    Get
        Return mURL
    End Get
    Set(ByVal Value As String)
        mURL = Value
    End Set
    End Property

'-------------------------------------------------------------	

    Public ReadOnly Property ObjSelectLauncher() As String
      Get
         Return txtObjName.Value.ToString()
      End Get

   End Property
   	

'----------------------------------------------------

	Public Property RefreshParentPage() as String
		Get
			RefreshParentPage = mRefreshParentPage
		End Get
		Set
			mRefreshParentPage = Value
		End Set
	End Property
	
'----------------------------------------------------

	Public Property ValueQueryString() as String
		Get
			ValueQueryString = mValueQueryString
		End Get
		Set
			mValueQueryString = Value
		End Set
	End Property
	
'----------------------------------------------------

	Public Property TextQueryString() as String
		Get
			TextQueryString = mTextQueryString
		End Get
		Set
			mTextQueryString = Value
		End Set
	End Property
	
'=============================================================	

    Public Property ObjName() As String
    Get
        Return txtObjName.Value
    End Get
    Set(ByVal Value As String)
        txtObjName.Value = Value
    End Set
    End Property

'-------------------------------------------------------------	

    Public Property ObjID() As String
    Get
        Return hdnObjID.Value
    End Get
    Set(ByVal Value As String)
        hdnObjID.Value = Value
    End Set
    End Property

'----------------------------------------------------

    Public Overrides Property DisplayPropertyNode() As XmlNode
        Get
            DisplayPropertyNode = mDisplayPropertyNode
        End Get
        Set(ByVal Value As XmlNode)
            mDisplayPropertyNode = Value
        End Set
    End Property

'-------------------------------------------------------------

    Public Overridable ReadOnly Property RequiredFieldValidator() As RequiredFieldValidator
    Get
        Return valReqText
    End Get
    End Property

'-------------------------------------------------------------

    Public ReadOnly Property ControlNode() As XmlNode
    Get
        ControlNode = DisplayPropertyNode.SelectSingleNode("Control")
    End Get
    End Property

 '-------------------------------------------------------------  

    Public Overridable WriteOnly Property ValidateFieldName() As String
        Set(ByVal Value As String)
            RequiredFieldValidator.ErrorMessage =  Value
        End Set
    End Property

'-------------------------------------------------------------

    Public Property RequiredField() As Boolean
        Get
            RequiredField = RequiredFieldValidator.Enabled
        End Get
        Set(ByVal Value As Boolean)
                RequiredFieldValidator.Enabled = Value
        End Set
    End Property

'=============================================================

   Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		'CorePage.CorePage_RegisterScriptBlock(WebAppl.Build_RootURL("Core/Includes/PopUpSelector.js"), _
		'								"PopUpSelector")
		
  End Sub

'--------------------------------------------------------------

    Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
		Dim aControlNode As XmlNode
        Dim aXmlNodeList As XmlNodeList
		Dim aXmlNode As XmlNode
		dim aReadOnly as String
		
		aControlNode = cXMLDoc.GetControlNode(aDisplayPropertyNode)
        DisplayPropertyNode = aDisplayPropertyNode        
		RequiredField = cXMLDoc.AttributeToBool(aControlNode, "RequiredField")
		valReqText.ErrorMessage = cXMLDoc.AttributeToString(aControlNode, "ErrorMessage")
		
		aXmlNodeList = aDisplayPropertyNode.OwnerDocument.GetElementsByTagName("UserCtlLoader")
 		aXmlNodeList = aXmlNodeList(0).SelectNodes(ID + "/DataObject")
        mDataObjID = cXMLDoc.AttributeToString(aXmlNodeList(0), "Key")
        mDataObjName = cXMLDoc.AttributeToString(aXmlNodeList(0), "DataObjectDefinitionKey")
        aXmlNode = aXmlNodeList(0).SelectSingleNode("DisplayProperties/DisplayProperty")
		mDisplayValue = cXMLDoc.AttributeToString(aXmlNode, "DisplayValue")
		
		Session(ID) = aXmlNodeList
		
		URL = cWebLib.AddQuerystringParameter(URL, "CtlID", ID)
		
		URL = cWebLib.AddQuerystringParameter(URL, "DataObjName", DataObjName)
		URL = cWebLib.AddQuerystringParameter(URL, "DataObjID", DataObjID)
		URL = cWebLib.AddQuerystringParameter(URL, "DisplayValue", DisplayValue)
		If Me.RefreshParentPage = "True" Then
			URL = cWebLib.AddQuerystringParameter(URL, "RefreshParentPage", "True")
			'URL = cWebLib.AddQuerystringParameter(URL, "ParentPageURL", Request.Url.PathAndQuery, Server)
			URL = cWebLib.AddQuerystringParameter(URL, "TextQueryString", TextQueryString)
			URL = cWebLib.AddQuerystringParameter(URL, "ValueQueryString", ValueQueryString)
		End If
		aReadOnly = cXMLDoc.AttributeToString(DisplayPropertyNode, "ReadOnly")
		
		if aReadOnly = "QueryID" and QueryID = DataObjName then
			spnSelect.Visible = False
		End If		
        
    End Sub

'-------------------------------------------------------------	

    Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
        Dim aDisplayPropertyKey As String
        Dim aPropertyValue As String

        aDisplayPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey")
        aPropertyValue = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyValue")
        ObjName = aDataObject.GetRelatedPropertyString(aPropertyValue)
        ObjID = aDataObject.GetRelatedPropertyString(aDisplayPropertyKey)
        
    End Sub

'-------------------------------------------------------------	

    Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
        Dim aDisplayPropertyKey As String
        
        aDisplayPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey")
        aDataObject(aDisplayPropertyKey) = ObjID

    End Sub
'=============================================================	

End Class
End Namespace