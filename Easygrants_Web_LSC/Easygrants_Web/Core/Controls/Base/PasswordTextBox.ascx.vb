Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Web.UI

Namespace Core_Web.Controls.Base

<ValidationPropertyAttribute("Password")> Public MustInherit Class cPasswordTextBox
    Inherits Core_Web.Controls.Base.cTextBox


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

    Protected txtPassword As HtmlInputText
    Protected valReqPassword As RequiredFieldValidator
	Protected valPassword As CustomValidator

	Private mDisplayPropertyNode As XmlNode

'=============================================================

    Public ReadOnly Property Password() As String
      Get
         Return txtPassword.Value.ToString()
      End Get

   End Property

'=============================================================
    Public Overrides ReadOnly Property BaseTextBox() As HtmlInputText
    Get
        BaseTextBox = txtPassword
    End Get
    End Property

'-------------------------------------------------------------

    Public Overrides ReadOnly Property RequiredFieldValidator() As RequiredFieldValidator
    Get
        Return valReqPassword
    End Get
    End Property

'-------------------------------------------------------------

    Public Overrides WriteOnly Property ValidateFieldName() As String
        Set(ByVal Value As String)
            valReqPassword.ErrorMessage = Value
        End Set
    End Property
'=============================================================

    Public Overrides ReadOnly Property ControlToValidate() As HtmlControl
    Get
        Return txtPassword
    End Get
    End Property

'-------------------------------------------------------------

    Public Overrides ReadOnly Property ControlToCompare() As HtmlControl
    Get
        Return txtPassword
    End Get
    End Property


'=============================================================

    Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)
        
		'BaseTextBox.Attributes.Add("onkeyup", "next('" + ID + "')")
    End Sub

'-------------------------------------------------------------

    Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
        MyBase.CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)
        
        mDisplayPropertyNode = aDisplayPropertyNode
    End Sub

'----------------------------------------------------------------------------

   Public Sub ValidatePassword(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aControlNode As XmlNode = cXMLDoc.GetControlNode(mDisplayPropertyNode)
		
		if cXMLDoc.AttributeToString(aControlNode, "NoSpace") = "True" then
			if txtPassword.Value.ToString().IndexOf(" ") <> -1 then
				aArgs.IsValid = False
				dim aMsg as String = cXMLDoc.AttributeToString(aControlNode, "NoSpaceMessage")
				
				if aMsg <> "" then valPassword.ErrorMessage = aMsg
			end if
		end if
		
   End Sub

'=============================================================

End Class
End Namespace
