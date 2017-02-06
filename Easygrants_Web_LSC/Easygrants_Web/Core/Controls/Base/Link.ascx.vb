Imports System.Web.UI.WebControls
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base

Public MustInherit Class cLink
    Inherits Core.Web.cCoreCtl
'=============================================================

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
    Private mActive As Boolean

'=============================================================

    Public WriteOnly Property Caption() As String
        Set(ByVal Value As String)       
			ancLink.InnerHtml = ConfigurableText(Value)
        End Set
    End Property

'--------------------------------------------------------------
Public Property CausesValidation() As Boolean
		Get
		  Return ancLink.CausesValidation
		End Get
		Set(ByVal Value As Boolean)
		  ancLink.CausesValidation = Value
		End Set
	End Property

    Public Property Href() As String
        Get
            Href = ancLink.HRef
        End Get
        Set(ByVal Value As String)
            ancLink.HRef = Value
        End Set
    End Property

'--------------------------------------------------------------

    Public Property Target() As String
        Get
            Target = ancLink.Target
        End Get
        Set(ByVal Value As String)
            ancLink.Target = Value
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

    Public Property Active() As Boolean
		Get
			Active = mActive
		End Get
		Set(ByVal Value As Boolean)
			mActive = Value
		End Set
    End Property

'=============================================================

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
        Dim aActiveArgumentNodeList As XmlNodeList = aControlNode.SelectNodes("Active/Argument")
        Dim aActiveArgumentNode As XmlNode
        Dim aNodeResult As Boolean
        Dim aOperator As String
        Dim aActionNode As XmlNode = cXMLDoc.GetActionNode(aDisplayPropertyNode)

        MyBase.CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)
        If Not Visible Then Exit Sub

        'Set DisplayPropertyNode property
        DisplayPropertyNode = aDisplayPropertyNode

        'Get and set caption
        Caption = cXMLDoc.AttributeToString(aControlNode, "Caption")
		Target = cXMLDoc.AttributeToString(aActionNode, "Target")
		CausesValidation = cXMLDoc.AttributeToBool(aControlNode, "CausesValidation", False)

		'Determine whether link will be active
		Active = True
		EventController.EventController_SetArgumentsInNodeList(aActiveArgumentNodeList)
		For Each aActiveArgumentNode In aActiveArgumentNodeList
			aNodeResult = cXMLDoc.AttributeToBool(aActiveArgumentNode, "Value", True)
			Select Case cXMLDoc.AttributeToString(aActiveArgumentNode, "Bool", "And")
				Case "And"
					Active = Active And aNodeResult
				Case "Or"
					Active = Active Or aNodeResult
			End Select
		Next

		'If active, set action for link
		If Active Then
			If cXMLDoc.AttributeToBool(aActionNode, "PostBack") = True Then
				Set_ServerClick(AddressOf Me.EventController.EventController_ControlClicked)
			Else
				Href = cXMLDoc.AttributeToString(aActionNode, "URL")
			End If
		End If
		
	End Sub

'----------------------------------------------------

    Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
        Dim aPropertyKey, aCaptionKey As String
        Dim aLink As String
		Dim aControlNode as XmlNode = cxmldoc.GetControlNode(DisplayPropertyNode)
		Dim aActionNode As XmlNode = cXMLDoc.GetActionNode(DisplayPropertyNode)
		Dim aURL = cXMLDoc.AttributeToString(aActionNode, "URL")
		
        aPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey").ToString()
        aCaptionKey = cXMLDoc.AttributeToString(aControlNode, "CaptionKey").ToString()
		
        If aPropertyKey <> "" Then
			aLink = aDataObject.GetRelatedPropertyString(aPropertyKey)
			If aCaptionKey <> "" Then
				Caption = aDataObject.GetRelatedPropertyString(aCaptionKey)
			Else If cXMLDoc.AttributeToString(aControlNode, "Caption") = "" Then
				Caption = aLink
			End If
            
            if aURL = "Web" then
				if aLink.IndexOf("://") = -1 then
					Href = "http://" + aLink
				else
					Href = aLink
				end if
			Else If aURL = "WebRelative" Then
				Href = aLink
			Else If aURL = "LocalPDF" Then
				Href = WebAppl.LocalPDFUrl + aLink
			else if aURL = "Email" then
				Href = "mailto:" + alink
			else if aURL = "File" then
				if aLink.IndexOf(":///") = -1 then
					Href = "file:///" + aLink
				else
					Href = aLink
				end if
			End If            
        End If
        
        If Not aURL = "File" then
			Href = Server.HTMLEncode(Href)
		End If
		
        Dim aToolTipProperyKey As String
        aToolTipProperyKey = cXMLDoc.AttributeToString(aControlNode, "ToolTipPropertyKey", "")
		If aToolTipProperyKey <> "" Then
			Dim aToolTip As String
	        aToolTip = aDataObject.GetRelatedPropertyString(aToolTipProperyKey)
			If aToolTip <> ""
				ancLink.Title = aToolTip
			End If
		End If
 
        Dim aToolTipText As String
        aToolTipText = cXMLDoc.AttributeToString(aControlNode, "ToolTipText", "")
        If aToolTipText <> "" Then
	        ancLink.Title = aToolTipText
		End If
      
    End Sub

'==============================================================
End Class  'cLink

End Namespace 'Core_Web.Controls.Base