Imports System.Xml
Imports Core.Web
'Imports Core.Web.SvrCtls
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Web.UI.WebControls

Namespace Core_Web.Controls.Base

'commented for source control: 01


Public MustInherit Class cCheckBox
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
	Protected chkCheckBox As CheckBox	' HtmlInputCheckBox
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

	Public Overridable ReadOnly Property BaseCheckButton() As CheckBox
	Get
		BaseCheckButton = chkCheckBox
	End Get
	End Property

'-------------------------------------------------------------

	Public Property Value() As Boolean
		Get
		   Value = chkCheckBox.Checked
		End Get
		Set(ByVal Value As Boolean)
		  chkCheckBox.Checked = Value
		End Set

	End Property
'--------------------------------------------------------------

	Public Sub Set_ServerClick(ByVal aHandler As EventHandler)
		chkCheckBox.AutoPostBack = True
		AddHandler chkCheckBox.CheckedChanged, aHandler
	End Sub

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
			MyBase.CoreCtl_Load(sender, e)
	End Sub

'-------------------------------------------------------------

	Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
	'Populates the checkbox based on an XML Control node

		Dim aControlNode As XmlNode
		Dim aPropertyKey As String
		Dim aRequiredField As Boolean
		Dim aActionNode As XmlNode
		Dim aSelected As Boolean

		DisplayPropertyNode = aDisplayPropertyNode
		aControlNode = cXMLDoc.GetControlNode(DisplayPropertyNode)
		aSelected = cXMLDoc.AttributeToBool(aControlNode, "Selected", False)
		If aSelected Then
			Value = True
		End If
		aActionNode = cXMLDoc.GetActionNode(aDisplayPropertyNode)

		If Not aActionNode Is Nothing Then
		    If cXMLDoc.AttributeToBool(aActionNode, "PostBack") Then
		        'chkCheckBox.AutoPostBack = True
		        'chkCheckBox.Checked = True
		        chkCheckBox.EnableViewState = True
		        Set_ServerClick(AddressOf Me.EventController.EventController_ControlClicked)
		    End If
		End If
	End Sub

'----------------------------------------------------

	Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
		Dim aPropertyKey As String
        Dim aPropertyValue As Boolean

		aPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey").ToString()
        aPropertyValue = aDataObject.GetRelatedPropertyBool(aPropertyKey)

        If aPropertyValue Then
            chkCheckBox.Checked = True
        Else
            chkCheckBox.Checked = False
        End If
	End Sub

'----------------------------------------------------

	Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
		Dim aColName As String = aDisplayPropertyNode.SelectSingleNode("@PropertyKey").Value

		if aColName = "" then
			aDataObject.Checked = Value
		else
			aDataObject(aColName) = Value
		end if
	End Sub

'=============================================================

End Class
End Namespace