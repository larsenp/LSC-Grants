Imports System.Web.UI.WebControls
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base

Public MustInherit Class cButton
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

    Protected ancButton As HtmlAnchor

	Private mDisplayPropertyNode As XmlNode
	Protected mImageAlternateText As String

'=============================================================
	Public Property ImageAlternateText() As String
		Get
			Return mImageAlternateText
		End Get
		Set(ByVal Value As String)
			mImageAlternateText = Value
		End Set
	End Property
'--------------------------------------------------------------

	Public WriteOnly Property Caption() As String
		Set(ByVal Value As String)
			Dim aImage As New Image()
			Dim aURL As String

                aURL = Value
                If aURL Like "*.gif" Then
                    aURL = Replace(aURL, " ", "_")
                    aURL = Replace(aURL, ">", "")
                    aURL = Replace(aURL, "<", "")
                    aURL = Replace(aURL, "-", "_")
                    aURL = WebAppl.Build_RootURL("Core/images/" & aURL)
                Else
                    aURL = Replace(aURL, " ", "_")
                    aURL = Replace(aURL, ">", "")
                    aURL = Replace(aURL, "<", "")
                    aURL = Replace(aURL, ".", "_")
                    aURL = Replace(aURL, "-", "_")
                    'aURL = "/images/" & aURL & ".jpg"
                    aURL = WebAppl.Build_RootURL("Core/images/" & aURL & ".jpg")
                End If
                If ImageAlternateText = "" Then
                    aImage.AlternateText = Value
                Else
                    aImage.AlternateText = ImageAlternateText
                End If
                aImage.ImageUrl = aURL
                'aImage.Height = 20
                'aImage.BorderWidth = 0
                ancButton.Controls.Add(aImage)
                'ancButton.InnerHtml = "&nbsp;&nbsp;" & value & "&nbsp;&nbsp;"
			End Set
		End Property

'--------------------------------------------------------------

	Public WriteOnly Property Confirmation() As String
		Set(ByVal Value As String)
			ancButton.Attributes.Add("onclick", "return confirm('" + ConfigurableText(Value) + "');")
		End Set
	End Property

'--------------------------------------------------------------

	Public Property Href() As String
		Get
			Href = ancButton.HRef
		End Get
		Set(ByVal Value As String)
			ancButton.HRef = Value
		End Set
	End Property

'--------------------------------------------------------------

	Public Property Target() As String
		Get
			Target = ancButton.Target
		End Get
		Set(ByVal Value As String)
			ancButton.Target = Value
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

	Public Property CausesValidation() As Boolean
        Get
          Return ancButton.CausesValidation
        End Get
        Set(ByVal Value As Boolean)
          ancButton.CausesValidation = Value
        End Set
    End Property

	Public Sub Set_ServerClick(ByVal aHandler As EventHandler)

		AddHandler ancButton.ServerClick, aHandler

	End Sub

'--------------------------------------------------------------

	Public Sub Add_Attribute(ByVal aKey As String, ByVal aValue As String)
		' To add attributes, the button must be added to a table or span first.
		ancButton.Attributes.Add(aKey, aValue)

	End Sub

'--------------------------------------------------------------

	Public Function Get_Attribute(ByVal aKey As String) As String

		Get_Attribute = ancButton.Attributes(aKey)

	End Function

'--------------------------------------------------------------

	Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
		MyBase.CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)
		If Not Visible Then Exit Sub

		Dim aControlNode As XmlNode = cXMLDoc.GetControlNode(aDisplayPropertyNode)
		Dim aActionNode As XmlNode = cXMLDoc.GetActionNode(aDisplayPropertyNode)

		'Set DisplayPropertyNode property
		DisplayPropertyNode = aDisplayPropertyNode

		'Get and set image alternate text
		ImageAlternateText = cXMLDoc.AttributeToString(aControlNode, "ImageAlternateText")

		'Get and set caption
		Caption = cXMLDoc.AttributeToString(aControlNode, "Image")

		'Get and set confirmation
		If cXMLDoc.AttributeToString(aControlNode, "Confirmation") <> "" Then
			Confirmation = cXMLDoc.AttributeToString(aControlNode, "Confirmation")
		ElseIf cXMLDoc.AttributeToString(aControlNode, "Image") = "Delete" Then
			Confirmation = "Are you sure you want to delete this item?"
		End If

		'Get action nodes
		If cXMLDoc.AttributeToBool(aActionNode, "PostBack") Then
			Set_ServerClick(AddressOf Me.EventController.EventController_ControlClicked)
		Else
			Href = cXMLDoc.AttributeToString(aActionNode, "URL")
			Target = cXMLDoc.AttributeToString(aActionNode, "Target")
		End If

		'Set event handler
		ancButton.CausesValidation = cXMLDoc.AttributeToBool(aControlNode, "CausesValidation", False)

	End Sub

'--------------------------------------------------------------

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub

'--------------------------------------------------------------

    Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
        Dim aPropertyKey As String
        Dim aLink As String
        Dim aToolTipProperyKey As String
        Dim aToolTipText As String
        Dim aControlNode As XmlNode = cxmldoc.GetControlNode(DisplayPropertyNode)
        Dim aActionNode As XmlNode = cXMLDoc.GetActionNode(DisplayPropertyNode)
        Dim aURL = cXMLDoc.AttributeToString(aActionNode, "URL")

        aPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey").ToString()

        If aPropertyKey <> "" Then
            aLink = aDataObject.GetRelatedPropertyString(aPropertyKey)

            If aURL = "Web" Then
                If aLink.IndexOf("://") = -1 Then
                    Href = "http://" + aLink
                Else
                    Href = aLink
                End If
            ElseIf aURL = "WebRelative" Then
                Href = aLink
            ElseIf aURL = "LocalPDF" Then
                Href = WebAppl.LocalPDFUrl + aLink
            ElseIf aURL = "Email" Then
                Href = "mailto:" + aLink
            ElseIf aURL = "File" Then
                If aLink.IndexOf(":///") = -1 Then
                    Href = "file:///" + aLink
                Else
                    Href = aLink
                End If
            End If
        End If

        If Not aURL = "File" Then
            Href = Server.HtmlEncode(Href)
        End If

        aToolTipProperyKey = cXMLDoc.AttributeToString(aControlNode, "ToolTipPropertyKey", "")
        If aToolTipProperyKey <> "" Then
            Dim aToolTip As String
            aToolTip = aDataObject.GetRelatedPropertyString(aToolTipProperyKey)
            If aToolTip <> "" Then
                ancLink.Title = aToolTip
            End If
        End If

        aToolTipText = cXMLDoc.AttributeToString(aControlNode, "ToolTipText", "")
        If aToolTipText <> "" Then
            ancLink.Title = aToolTipText
        End If

    End Sub

    Public Property Disabled() As Boolean
	    Get
		    Disabled = ancButton.Disabled
	    End Get
	    Set(ByVal Value As Boolean)
		    ancButton.Disabled = Value
	    End Set
    End Property

'==============================================================

End Class

End Namespace