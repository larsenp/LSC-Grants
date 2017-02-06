Imports System.Web.UI.WebControls
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base

Public MustInherit Class cImageButton
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

    Protected ancButton As ImageButton
    Protected mHref, mTarget As String
    Private mDisplayPropertyNode As XmlNode
    Private mConfirmation As String = ""
    Private mDisableMultipleClicks As Boolean = True

'=============================================================

    Public WriteOnly Property Caption() As String
        Set(ByVal Value As String)
            Dim aImage As New Image
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
                    aURL = WebAppl.Build_RootURL("Core/images/" & aURL & ".jpg")
                End If
                ancButton.ImageUrl = aURL
                ancButton.AlternateText = Value
            End Set
        End Property

'--------------------------------------------------------------

	Public Property Confirmation() As String
		Get
			Return mConfirmation
		End Get		
		Set(ByVal Value As String)
			mConfirmation = Value
		End Set
	End Property

'--------------------------------------------------------------

    Public Property Href() As String
        Get
            Return mHref
        End Get
        Set(ByVal Value As String)
            mHRef = Value
        End Set
    End Property

'--------------------------------------------------------------

    Public Property DisableMultipleClicks() As Boolean
        Get
            Return mDisableMultipleClicks
        End Get
        Set(ByVal Value As Boolean)
            mDisableMultipleClicks = Value
        End Set
    End Property

'--------------------------------------------------------------

    Public Property Target() As String
        Get
            Return mTarget
        End Get
        Set(ByVal Value As String)
            mTarget = Value
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

    Public Sub Set_ServerClick(ByVal aHandler As ImageClickEventHandler)

        AddHandler ancButton.Click, aHandler

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

        'Get and set caption
        Caption = cXMLDoc.AttributeToString(aControlNode, "Image")

        'Get and set confirmation
        If cXMLDoc.AttributeToString(aControlNode, "Confirmation") <> "" Then
            Confirmation = cXMLDoc.AttributeToString(aControlNode, "Confirmation")
        ElseIf cXMLDoc.AttributeToString(aControlNode, "Image") = "Delete" Then
			Confirmation = "Are you sure you want to delete this item?"
        End If

        DisableMultipleClicks = cXMLDoc.AttributeToBool(aControlNode, "DisableMultipleClicks", True)
		Dim aButtonID As String = ""
        If DisableMultipleClicks Then
			aButtonID = Me.UniqueID
        End If
        
		ancButton.Attributes.Add("onclick", "return OnClick('" + aButtonID + "', '" + Confirmation + "');")

        'Get action nodes
        If Not aActionNode Is Nothing Then
			If cXMLDoc.AttributeToBool(aActionNode, "PostBack") Then
				Set_ServerClick(AddressOf Me.EventController.EventController_ControlClicked)
			Else
				Href = cXMLDoc.AttributeToString(aActionNode, "URL")
				Target = cXMLDoc.AttributeToString(aActionNode, "Target")
				ancButton.Attributes.Add("onclick", "return OpenWindow('');")
			End If
		End If

        'Set to false to disable page validation done by .Net when clicked on imagebutton
        ancButton.CausesValidation = cXMLDoc.AttributeToBool(aControlNode, "CausesValidation", False)

        Dim aToolTipText As String
        aToolTipText = cXMLDoc.AttributeToString(aControlNode, "ToolTipText", "")
        If aToolTipText <> "" Then
            ancButton.ToolTip = aToolTipText
        End If
    End Sub

'--------------------------------------------------------------

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
        MyBase.CoreCtl_Load(aSrc, aEvent)
    End Sub

'==============================================================

End Class

End Namespace
