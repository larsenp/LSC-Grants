Imports System.Xml
Imports Core.Web
Imports Core.Web.SvrCtls
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base


Public MustInherit Class cLabel
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

    Protected spnLabel As HtmlGenericControl

	Private mDisplayPropertyNode As XmlNode
	Private aNegativeNumberFormat As XmlNode
	Private aConfigurableLabel As Boolean = False
'=============================================================

    Public Overrides Property DisplayPropertyNode() As XmlNode
        Get
            DisplayPropertyNode = mDisplayPropertyNode
        End Get
        Set(ByVal Value As XmlNode)
            mDisplayPropertyNode = Value
        End Set
    End Property

'-------------------------------------------------------------

    Public Property Value() As String
        Get
            Value = spnLabel.InnerHtml
        End Get
		Set(ByVal Value As String)
			If ConfigurableLabel = True Then
				spnLabel.InnerHtml = ConfigurableText(Value.Replace(vbCrLf, "<br>"))
			Else
				spnLabel.InnerHtml = Value.Replace(vbCrLf, "<br>")
			End If
		End Set
	End Property

	Public Property ConfigurableLabel() As Boolean
		Get
			Return aConfigurableLabel
		End Get
		Set(ByVal Value As Boolean)
			aConfigurableLabel = Value
		End Set
	End Property

'=============================================================

    Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
            MyBase.CoreCtl_Load(sender, e)
    End Sub

'-------------------------------------------------------------

    Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
        MyBase.CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)
        If Not Visible Then Exit Sub

        Dim aControlNode As XmlNode
        Dim aPropertyKey As String
        Dim aLabelText As String

        DisplayPropertyNode = aDisplayPropertyNode
        aControlNode = cXMLDoc.GetControlNode(DisplayPropertyNode)
		ConfigurableLabel = cXMLDoc.AttributeToBool(aControlNode, "ConfigurableLabel", False)

        aLabelText = cXMLDoc.AttributeToString(aControlNode, "LabelText")
        If aLabelText <> "" Then
            Value = aLabelText
        End If
    End Sub

'----------------------------------------------------

    Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
        Dim aPropertyKey As String

        aPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey").ToString()
        
        dim aFormat as String = cXMLDoc.AttributeToString(DisplayPropertyNode, "DateFormat")
        Dim aIfBlank As String = cXMLDoc.AttributeToString(DisplayPropertyNode, "IfBlank")
		Dim aEncode As Boolean = cXMLDoc.AttributeToBool(DisplayPropertyNode, "HtmlEncode", True)
        If aDataObject.GetRelatedPropertyString(aPropertyKey) = "" And aIfBlank <> "" Then
			Value = aIfBlank
        Else
			Dim aValue As String
			if aFormat = "" then
				aFormat = cXMLDoc.AttributeToString(DisplayPropertyNode, "Format")
				if aFormat = "" then
					aValue = aDataObject.GetRelatedPropertyString(aPropertyKey)
				else
					aValue = aDataObject.GetRelatedPropertyFormattedString(aPropertyKey, aFormat)
				end if
			else
				aValue = Format(ctype(aDataObject.GetRelatedPropertyValue(aPropertyKey), Date), aFormat)
			end if
			If aEncode Then
				Value = Server.HtmlEncode(aValue)
			Else
				Value = aValue
			End If

			aNegativeNumberFormat = DisplayPropertyNode.SelectSingleNode("NegativeNumberFormat")
			If Not aNegativeNumberFormat Is Nothing AndAlso aDataObject.GetRelatedPropertyString(aPropertyKey) < "0" AndAlso aNegativeNumberFormat.InnerXml.Contains("~") Then
				Value = aNegativeNumberFormat.InnerXml.Replace("~", Value)
			End If
		End If
    End Sub

'----------------------------------------------------

    Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
        Dim aColName As String = aDisplayPropertyNode.SelectSingleNode("@PropertyKey").Value

        aDataObject(aColName) = Value
    End Sub

'=============================================================

End Class
End Namespace