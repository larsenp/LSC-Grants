Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base
Public MustInherit Class cAbstractLinkButton
    Inherits Core.Web.cCoreCtl
    
	Private mDisplayPropertyNode As XmlNode
	Private mControlNode As XmlNode
	Private mToolTipPropertyKey As String
	Private mCaptionKey As String
	Private mPropertyKey As String
	
	MustOverride Public WriteOnly Property Caption() As String
	
	Public Property CaptionKey As String
		Get
			Return mCaptionKey
		End Get
		Set
			mCaptionKey = Value
		End Set
	End Property

	Public Property PropertyKey As String
		Get
			Return mPropertyKey
		End Get
		Set
			mPropertyKey = Value
		End Set
	End Property
	
	MustOverride Public Property Href() As String
	
	MustOverride Public Property Target() As String
	
	Public Overrides Property DisplayPropertyNode() As XmlNode
		Get
			Return mDisplayPropertyNode
		End Get
		Set(ByVal Value As XmlNode)
			mDisplayPropertyNode = Value
		End Set
	End Property
	
	Public Overridable ReadOnly Property ControlNode() As XmlNode
		Get
			Return cXMLDoc.GetControlNode(DisplayPropertyNode)
		End Get
	End Property

	MustOverride Public WriteOnly Property Confirmation() As String
	
	MustOverride Public Property ToolTip As String
	
	Public Property ToolTipPropertyKey As String
		Get
			Return mToolTipPropertyKey
		End Get
		Set
			mToolTipPropertyKey = Value
		End Set
	End Property

	Public Overridable Sub Set_ServerClick(ByVal aHandler As EventHandler)
	End Sub
	
	Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
        MyBase.CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)
        If Not Visible Then Exit Sub
        DisplayPropertyNode = aDisplayPropertyNode
        ConfigureCaption()
        ConfigureAction()
        ConfigureConfirmation()
		ConfigureToolTipText()
		ConfigureToolTipPropertyKey()
		ConfigureCaptionKey()
		ConfigurePropertyKey()
	End Sub
	
	Public Overridable Sub ConfigureCaption()
        Caption = cXMLDoc.AttributeToString(ControlNode, "Caption")
	End Sub

	Public Overridable Sub ConfigureCaptionKey()
        CaptionKey = cXMLDoc.AttributeToString(ControlNode, "CaptionKey")
	End Sub
	
	Public Overridable Sub ConfigurePropertyKey()
        PropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey")
	End Sub
	
	Public Overridable Sub ConfigureAction()
        Dim aActionNode As XmlNode = cXMLDoc.GetActionNode(DisplayPropertyNode)
		If cXMLDoc.AttributeToBool(aActionNode, "PostBack") Then
			Set_ServerClick(AddressOf Me.EventController.EventController_ControlClicked)
		Else
			Href = cXMLDoc.AttributeToString(aActionNode, "URL")
			Target = cXMLDoc.AttributeToString(aActionNode, "Target")
		End If
	End Sub
	
	Public Overridable Sub ConfigureConfirmation()
		Dim aConfirmation As String = cXMLDoc.AttributeToString(ControlNode, "Confirmation", "")
		If aConfirmation <>  "" Then
			Confirmation = aConfirmation
		End If
	End Sub
	
	Public Overridable Sub ConfigureToolTipText()
        Dim aToolTipText As String
        aToolTipText = cXMLDoc.AttributeToString(ControlNode, "ToolTipText", "")
        If aToolTipText <> "" Then
	        ToolTip = aToolTipText
		End If
	End Sub
	
	Public Overridable Sub ConfigureToolTipPropertyKey()
        Dim aToolTipPropertyKey As String
        aToolTipPropertyKey = cXMLDoc.AttributeToString(ControlNode, "ToolTipPropertyKey", "")
        If aToolTipPropertyKey <> "" Then
	        ToolTipPropertyKey = aToolTipPropertyKey
		End If
	End Sub
	
    Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
		SetCaptionFromData(aDataObject)
		SetHrefFromData(aDataObject)
		SetToolTipFromData(aDataObject)
 
    End Sub
    
    Public Overridable Sub SetCaptionFromData(ByVal aDataObject As cDataObject)
		If CaptionKey <> "" Then
			Caption = aDataObject.GetRelatedPropertyString(CaptionKey)
		Else If cXMLDoc.AttributeToString(ControlNode, "Caption") = "" And PropertyKey <> "" Then
			Caption = aDataObject.GetRelatedPropertyString(PropertyKey)
		End If
    End Sub
    
    Public Overridable Sub SetHrefFromData(ByVal aDataObject As cDataObject)
		Dim aFile As Boolean = False
        If PropertyKey <> "" Then
			Dim aLink As String = aDataObject.GetRelatedPropertyString(PropertyKey)
            if Href = "Web" then
				if aLink.IndexOf("://") = -1 then
					Href = "http://" + aLink
				else
					Href = aLink
				end if
			Else If Href = "WebRelative" Then
				Href = aLink
			Else If Href = "LocalPDF" Then
				Href = WebAppl.LocalPDFUrl + aLink
			else if Href = "Email" then
				Href = "mailto:" + alink
			else if Href = "File" then
				aFile = True
				if aLink.IndexOf(":///") = -1 then
					Href = "file:///" + aLink
				else
					Href = aLink
				end if
			End If            
        End If
        
        If Not aFile then
			Href = Server.HTMLEncode(Href)
		End If
    End Sub
    
    Public Overridable Sub SetToolTipFromData(ByVal aDataObject As cDataObject)
		If ToolTipPropertyKey <> "" Then
			Dim aToolTip As String
	        aToolTip = aDataObject.GetRelatedPropertyString(ToolTipPropertyKey)
			If aToolTip <> ""
				 ToolTip = aToolTip
			End If
		End If
    End Sub
	
End Class
End Namespace    
