Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core.Web.Modules

Namespace Core_Web.Controls.Base

    <ValidationPropertyAttribute("ObjSelectLauncher")> Public MustInherit Class cPopUpSelectorLauncher2
        Inherits Core.Web.cCoreCtl
        'DIFFERENCES BETWEEN SUBCLASS AND SHARED CONTROL
        '1. Dynamic population of filter values (to be proposed for inclusion in shared control) PL 9/29/2005
        'This control is a copy. It needs to be properly subclassed, or the shared control needs to be reintegrated
        'into this project. PL 9/29/2005

        '=============================================================	
		Protected txtObjName As HtmlInputText
        Protected hdnObjID As HtmlInputHidden
        Protected hdnpopup_1 As HtmlInputHidden
        Protected valRequiredField As CustomValidator
        Protected mURL As String = "Core/Controls/Base/PopUpSelector2.aspx"
        Protected spnConfigXML As HtmlGenericControl
        Protected spnSelect As HtmlGenericControl
        Protected mLabel As String
        Protected spnClear As HtmlContainerControl

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
        Private mWidth As Integer = 470
        Private mHeight As Integer = 250
        Private mClearLink As Boolean = False
		Private mReturnURLQueryString as String
		Private mButtonText as String
		
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

        '-------------------------------------------------------------	

        Public ReadOnly Property QueryID() As String
            Get
                Dim aOrigin As String = Request.QueryString("Origin")

                If aOrigin <> "" Then Return aOrigin

                Return Origin
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
                'Return txtObjName.Value.ToString()
				Return txtObjName.Value
            End Get

        End Property

        '----------------------------------------------------

        Public Property RefreshParentPage() As String
            Get
                RefreshParentPage = mRefreshParentPage
            End Get
            Set(ByVal Value As String)
                mRefreshParentPage = Value
            End Set
        End Property


		'----------------------------------------------------

          Public Property ValueQueryString() As String
            Get
                ValueQueryString = mValueQueryString
            End Get
            Set(ByVal Value As String)
                mValueQueryString = Value
            End Set
        End Property

		'----------------------------------------------------

        Public Property ReturnURLQueryString() As String
            Get
                ReturnURLQueryString = mReturnURLQueryString
            End Get
            Set(ByVal Value As String)
                mReturnURLQueryString = Value
            End Set
        End Property
        
        '----------------------------------------------------

        Public Property TextQueryString() As String
            Get
                TextQueryString = mTextQueryString
            End Get
            Set(ByVal Value As String)
                mTextQueryString = Value
            End Set
        End Property

        '=============================================================	

        Public Property ObjName() As String
            Get

				Return txtObjName.Value

            End Get
            Set(ByVal Value As String)
                If Value = "" Then
					txtObjName.Value = "None"
                Else
					txtObjName.Value = Value
                End If

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
        Public Property ClearLink() As Boolean
            Get
                Return mClearLink
            End Get
            Set(ByVal Value As Boolean)
                mClearLink = Value
            End Set
        End Property
        '-------------------------------------------------------------

        Public Overrides Property DisplayPropertyNode() As XmlNode
            Get
                DisplayPropertyNode = mDisplayPropertyNode
            End Get
            Set(ByVal Value As XmlNode)
                mDisplayPropertyNode = Value
            End Set
        End Property

        '-------------------------------------------------------------

        Public Overridable ReadOnly Property CustomValidator() As CustomValidator
            Get
                Return valRequiredField
            End Get
        End Property

        '-------------------------------------------------------------

        Public ReadOnly Property ControlNode() As XmlNode
            Get
                ControlNode = DisplayPropertyNode.SelectSingleNode("Control")
            End Get
        End Property

        '------------------------------------------------------------- 

        Public Property Label() As String
            Get
                Label = mLabel
            End Get
            Set(ByVal Value As String)
                mLabel = Value
            End Set
        End Property
        
        '------------------------------------------------------------- 

        Public Property ButtonText() As String
            Get
                ButtonText = mButtonText
            End Get
            Set(ByVal Value As String)
                mButtonText = Value
            End Set
        End Property

        '----------------------------------------------------

        Public Property RequiredField() As Boolean
            Get
                RequiredField = CustomValidator.Enabled
            End Get
            Set(ByVal Value As Boolean)
                CustomValidator.Enabled = Value
            End Set
        End Property

        '=============================================================

        Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            MyBase.CoreCtl_Load(aSrc, aEvent)

			'CorePage.CorePage_RegisterScriptBlock(WebAppl.Build_RootURL("Core/Includes/PopUpSelector.js"), _
			'        "PopUpSelector")

            if ObjID = "" then
                ObjName = ""
            End If

        End Sub

        '--------------------------------------------------------------

        Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
            Dim aControlNode As XmlNode
            Dim aXmlNodeList As XmlNodeList
            Dim aXmlNode As XmlNode
            Dim aReadOnly As String
            Dim aLabelText As String
            aControlNode = cXMLDoc.GetControlNode(aDisplayPropertyNode)
            DisplayPropertyNode = aDisplayPropertyNode
            RequiredField = cXMLDoc.AttributeToBool(aControlNode, "RequiredField", False)
            valRequiredField.ErrorMessage = cXMLDoc.AttributeToString(aControlNode, "ErrorMessage", "You must enter an ObjectID")

            aLabelText = cXMLDoc.AttributeToString(aControlNode, "LabelText")
            If aLabelText <> "" Then
				Label = ConfigurableText(aLabelText) + ":"
            End If
            ButtonText = cXMLDoc.AttributeToString(aControlNode, "ButtonText", "Select")
            ClearLink = cXMLDoc.AttributeToBool(aControlNode, "ClearLink", False)
            If ClearLink = True Then
                spnClear.Visible = True
            End If
            aXmlNodeList = aDisplayPropertyNode.OwnerDocument.GetElementsByTagName("UserCtlLoader")
            aXmlNodeList = aXmlNodeList(0).SelectNodes(ID + "/DataObject")

            'Added 9/29/2005 to allow dynamic retrieval of filter values. Need to present to tech lead
            'group for inclusion in shared control
            Dim aDataObjectNode As XmlNode
            For Each aDataObjectNode In aXmlNodeList
                Dim aFilterArgsList As XmlNodeList = aDataObjectNode.SelectNodes("Filters/Argument")
                Me.EventController.EventController_SetArgumentsInNodeList(aFilterArgsList)
            Next
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
                If Me.ReturnURLQueryString = "True" Then
                    URL = cWebLib.AddQuerystringParameter(URL, "ReturnURLQueryString", ReturnURLQueryString)
                End If

            End If
            aReadOnly = cXMLDoc.AttributeToString(DisplayPropertyNode, "ReadOnly")

            If aReadOnly = "QueryID" And QueryID = DataObjName Then
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
            If ObjID = "" Then
                aDataObject(aDisplayPropertyKey) = System.DBNull.Value
            Else
                aDataObject(aDisplayPropertyKey) = ObjID
            End If

        End Sub

        '----------------------------------------------------

        Public Sub ValidateRequiredField(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
            aArgs.IsValid = True
            If ObjID = "" Then
                aArgs.IsValid = False
                Exit Sub
            End If
        End Sub
        '=============================================================	

    End Class
End Namespace