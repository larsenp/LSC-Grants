Imports System.Web.UI.WebControls
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports System.Text.RegularExpressions

Namespace Core_Web.Controls.Base

Public MustInherit Class cTextPopUp
    Inherits Core.Web.cCoreCtl

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

'=============================================================

    Protected ancLink As HtmlAnchor
    Private mDisplayPropertyNode As XmlNode
    Protected mHeight As Integer
    Protected mWidth As Integer
    Protected mImgSrc As String
    Protected mPopUpTitle As String
	'Protected spnStyles As HtmlGenericControl

'=============================================================

    Public Property Height() As Integer
		Get
			Return mHeight
		End Get
        Set(ByVal Value As Integer)
            mHeight = Value
        End Set
    End Property

'--------------------------------------------------------------

	Public Writeonly Property PopUpTitle() As String
		Set(ByVal Value As String)
			mPopUpTitle = Value
		End Set
	End Property
	
'--------------------------------------------------------------

	Public Property Width() As Integer
        Get
			Return mWidth
		End Get
        Set(ByVal Value As Integer)
            mWidth = Value
        End Set
    End Property

'--------------------------------------------------------------

	Public WriteOnly Property Caption() As String
        Set(ByVal Value As String)
            ancLink.InnerHtml = Value
        End Set
    End Property

'--------------------------------------------------------------

    Public Overrides Property DisplayPropertyNode() As XmlNode
    Get
        Return mDisplayPropertyNode
    End Get
    Set(ByVal Value As XmlNode)
        mDisplayPropertyNode = Value
    End Set
    End Property

'--------------------------------------------------------------

    Public WriteOnly Property PopUpText() As String
        Set(ByVal Value As String)
            'ancLink.Attributes.Add("onclick", "return writeToPopUpWindow('" + value + "');")
            ancLink.Attributes.Add("href", "JavaScript: writeToPopUpWindow('" + Value + "');")
        End Set
    End Property

'--------------------------------------------------------------

    Public WriteOnly Property ImgSrc() As String
        Set(ByVal Value As String)
            'Dim aURL As String
            '    aURL = Value
            '    If aURL Like "*.gif" Then
            '        aURL = Replace(aURL, " ", "_")
            '        aURL = Replace(aURL, ">", "")
            '        aURL = Replace(aURL, "<", "")
            '        aURL = Replace(aURL, "-", "_")
            '        aURL = WebAppl.Build_RootURL("Core/images/" & aURL)
            '    Else
            '        aURL = Replace(aURL, " ", "_")
            '        aURL = Replace(aURL, ">", "")
            '        aURL = Replace(aURL, "<", "")
            '        aURL = Replace(aURL, ".", "_")
            '        aURL = Replace(aURL, "-", "_")
            '        aURL = WebAppl.Build_RootURL("Core/images/" & aURL & ".jpg")
            '    End If
                mImgSrc = Value
        End Set
    End Property

'--------------------------------------------------------------    

    Public Sub Set_ServerClick(ByVal aHandler As EventHandler)
        AddHandler ancLink.ServerClick, aHandler
    End Sub

'--------------------------------------------------------------

    Public Sub Add_Attribute(ByVal aKey As String, ByVal aValue As String)
        ' To add attributes, the button must be added to a table or span first.
        ancLink.Attributes.Add(aKey, aValue)
    End Sub

'--------------------------------------------------------------

    Public Function Get_Attribute(ByVal aKey As String) As String
        Get_Attribute = ancLink.Attributes(aKey)
    End Function

'--------------------------------------------------------------

    Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
        Dim aControlNode As XmlNode = cXMLDoc.GetControlNode(aDisplayPropertyNode)
        Dim aText As String

        MyBase.CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)
        If Not Visible Then Exit Sub

        'Set DisplayPropertyNode property
        DisplayPropertyNode = aDisplayPropertyNode

        'Get and set caption, height, width, image source
        PopUpTitle = cXMLDoc.AttributeToString(aControlNode, "PopUpTitle","Options")
        Caption = cXMLDoc.AttributeToString(aControlNode, "Caption", "More...")
        Height = cXMLDoc.AttributeToInt(aControlNode, "Height", 200)
        Width = cXMLDoc.AttributeToInt(aControlNode, "Width", 400)
        ImgSrc = cXMLDoc.AttributeToString(aControlNode, "PopUpCloseImage", "Close Window")

        'Set_ServerClick(AddressOf Me.EventController.EventController_ControlClicked)

        Dim aInstructionHtmlNode As XmlNode = aControlNode.SelectSingleNode("InstructionHtml")
        If Not aInstructionHtmlNode Is Nothing Then
            aText = Regex.Replace(aInstructionHtmlNode.InnerXml.Trim, "\n|\r|\n\r", "")
            PopUpText = aText
        Else
            PopUpText = "More"
        End If
		'CorePage.CorePage_LoadStyles(spnStyles)
    End Sub

'----------------------------------------------------
    Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
        Dim aPropertyKey As String
        aPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey").ToString()
        If aPropertyKey <> "" Then
            Caption = aDataObject.GetRelatedPropertyString(aPropertyKey)
        End If
    End Sub

'==============================================================

End Class  'cTextPopUp

End Namespace 'Core_Web.Controls.Base