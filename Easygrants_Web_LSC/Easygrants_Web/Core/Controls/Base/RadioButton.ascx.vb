Imports System.Xml
Imports Core.Web
Imports Core.Web.SvrCtls
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base


Public MustInherit Class cRadioButton
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
	Protected rdoRadio as HtmlInputRadioButton
    Private mDisplayPropertyNode As XmlNode
	
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

    Public Overridable ReadOnly Property BaseRadioButton() As HtmlInputRadioButton
    Get
        BaseRadioButton = rdoRadio
    End Get
    End Property

'-------------------------------------------------------------

    Public Property Value() As String
        Get
            Value = BaseRadioButton.Value
        End Get
        Set(ByVal Value As String)
            BaseRadioButton.Value = Value
        End Set
    End Property

'-------------------------------------------------------------
    
    Public Sub AddScript(ByVal aEvent As String, ByVal aScriptName As String, ByVal aParameters As String)
        rdoRadio.Attributes.Add(aEvent, "JavaScript: " + aScriptName + "('" + aParameters + "');")
    End Sub

'=============================================================

    Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
            MyBase.CoreCtl_Load(sender, e)
    End Sub

'-------------------------------------------------------------

    Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
    'Populates the drop-down based on an XML Control node

        Dim aControlNode As XmlNode
        Dim aPropertyKey As String
        Dim aMaxLength As Integer
        Dim aSize As Integer
		Dim aRequiredField as Boolean
			
        DisplayPropertyNode = aDisplayPropertyNode
        aControlNode = cXMLDoc.GetControlNode(DisplayPropertyNode)
        Dim aScriptNodes As XmlNodeList = aControlNode.SelectNodes("AddScript")
        Dim aEventName, aScriptName, aParameters As String
        If Not aScriptNodes Is Nothing Then
			Dim aScriptNode As XmlNode
			
			for each aScriptNode in aScriptNodes
				aEventName = cXMLDoc.AttributeToString(aScriptNode, "Event")
				aScriptName = cXMLDoc.AttributeToString(aScriptNode, "Name")
				Dim aParamNodes As XmlNodeList = aScriptNode.SelectNodes("Parameter")
				
				If Not aParamNodes Is Nothing Then
					Dim aParam As XmlNode
					
					for each aParam in aParamNodes
						If cXMLDoc.AttributeToString(aParam, "Key") = "ControlID" Then
							aParameters = aParameters + UniqueID
						Else If cXMLDoc.AttributeToString(aParam, "Key") = "ParentControlID" Then
							aParameters = aParameters + Parent.UniqueID
						Else
							aParameters = aParameters + cXMLDoc.AttributeToString(aParam, "Key") + ","
						End If
						
					Next
					aParameters.Trim(",")
				End If
				AddScript(aEventName, aScriptName, aParameters)
			Next
		End If
    End Sub

'----------------------------------------------------

    Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
        Dim aPropertyKey As String

        aPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey").ToString()
        Value = aDataObject(aPropertyKey).ToString()

    End Sub

'----------------------------------------------------

    Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
	    Dim aColName As String = aDisplayPropertyNode.SelectSingleNode("@PropertyKey").Value
        
        aDataObject(aColName) = Value
    End Sub

'=============================================================

End Class
End Namespace