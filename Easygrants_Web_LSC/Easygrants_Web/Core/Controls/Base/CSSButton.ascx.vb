Imports System.Web.UI.WebControls
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules

Namespace Core_Web.Controls.Base

    Public Class cCSSButton
        Inherits Core_Web.Controls.Base.cLinkButton

        Protected ancButton As HtmlAnchor
        Protected inProcButton As HtmlAnchor
		Protected mConfirmation As String = ""
		Private mDisableControl As String = "True"


        Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
            MyBase.CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)
			If Not Visible Then Exit Sub
			Dim aControlNode As XmlNode = cXMLDoc.GetControlNode(aDisplayPropertyNode)
			If cXMLDoc.AttributeToString(aControlNode, "AlternateCaption") <> "" Then
				AlternateCaption = cXMLDoc.AttributeToString(ControlNode, "AlternateCaption")
			Else
				AlternateCaption = ancButton.InnerText
			End If
			ancButton.CausesValidation = cXMLDoc.AttributeToBool(aControlNode, "CausesValidation", False)
			Dim aButtonID As String = ""
			aButtonID = Me.ClientID
			If cXMLDoc.AttributeToString(aControlNode, "Confirmation") <> "" Then
				Confirmation = cXMLDoc.AttributeToString(aControlNode, "Confirmation")
			End If
			If cXMLDoc.AttributeToString(aControlNode, "DisableControl") <> "" Then
				DisableControl = cXMLDoc.AttributeToString(aControlNode, "DisableControl")
			End If
			ancButton.Attributes.Add("onclick", "return OnClick('" + aButtonID + "', '" + Confirmation + "', '" + DisableControl + "');")
			If (GoToNextPage = True) Then
				RemoveHandler ancButton.ServerClick, AddressOf EventController.EventController_ControlClicked
				Set_ServerClick(AddressOf GoToNextNav)
			End If
		End Sub

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			'CorePage.CorePage_RegisterScriptBlock(WebAppl.Build_RootURL("Core/Includes/CSSButton.js"), _
			'							"CSSButton")
			'If Not WebSession.HasAdminUser Then
			'	Dim aModuleName As String = CType(WebSession.CurrentPage, cModulePage).CurrentModuleName 
			'	If Caption = "Disconnect" Then
			'		ancButton.Disabled = True
			'	Else If Caption = "Delete" Then
			'		ancButton.Visible = False
			'	End If
			'End If
		End Sub



		Public Overrides Property Caption() As String
			Get
				Return ancButton.InnerText
			End Get
			Set(ByVal Value As String)
				ancButton.InnerText = Value
				'ancButton.Controls.Add(ancImg)
			End Set
		End Property

		Public WriteOnly Property AlternateCaption() As String
			Set(ByVal Value As String)
				inProcButton.InnerText = Value
				'ancButton.Controls.Add(ancImg)
			End Set
		End Property

		Public Overrides Property Confirmation() As String
			Get
				Return mConfirmation
			End Get
			Set(ByVal Value As String)
				mConfirmation = Value
			End Set
		End Property

		Public Overrides Property Href() As String
			Get
				Return ancButton.HRef
			End Get
			Set(ByVal Value As String)
				ancButton.HRef = Value
			End Set
		End Property

		Public Overrides Sub Set_ServerClick(ByVal aHandler As System.EventHandler)
			AddHandler ancButton.ServerClick, aHandler
		End Sub

		Public Overrides Property Target() As String
			Get
				Return ancButton.Target
			End Get
			Set(ByVal Value As String)
				ancButton.Target = Value
			End Set
		End Property

		Public Overrides Property ToolTip() As String
			Get
				Return ancButton.Title
			End Get
			Set(ByVal Value As String)
				ancButton.Title = Value
			End Set
		End Property

		Public Property CausesValidation() As Boolean
			Get
				Return ancButton.CausesValidation
			End Get
			Set(ByVal Value As Boolean)
				ancButton.CausesValidation = Value
			End Set
		End Property

		Public Property DisableControl() As String
			Get
				Return mDisableControl
			End Get
			Set(ByVal Value As String)
				mDisableControl = Value
			End Set
		End Property


		'Public ReadOnly Property ButtonClientID() As String
		'    Get
		'        Return Me.ClientID
		'    End Get
		'End Property

		Public Sub Add_Attribute(ByVal aKey As String, ByVal aValue As String)
			' To add attributes, the button must be added to a table or span first.
			ancButton.Attributes.Add(aKey, aValue)

		End Sub

		'--------------------------------------------------------------

		Public Function Get_Attribute(ByVal aKey As String) As String

			Get_Attribute = ancButton.Attributes(aKey)

		End Function


		Public ReadOnly Property ButtonClientID() As String
			Get
				Return Me.ClientID
			End Get
		End Property

		Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
			MyBase.CoreCtl_SetCtlValueFromDataObject(aDataObject)
			Dim aCaptionKey As String = cXMLDoc.AttributeToString(ControlNode, "CaptionKey")
			If aCaptionKey <> "" Then
				AlternateCaption = aDataObject.GetRelatedPropertyString(aCaptionKey)
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

	End Class

End Namespace