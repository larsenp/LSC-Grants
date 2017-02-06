Imports System.Web.UI.WebControls
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Workflow

Namespace Core_Web.Controls.Base

Public MustInherit Class cEventRaiser
    Inherits Core.Web.cCoreCtl
'==============================================================

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

	Protected mDisplayPropertyNode as XmlNode
	
	'declare new button
	Protected btnSend As cCSSButton

'-----------------------------------------------------

	Public Overrides Property DisplayPropertyNode as XmlNode
		Set
			mDisplayPropertyNode = value
		End Set		 
		Get
			return mDisplayPropertyNode
		End Get		 
	End Property	
	
'-----------------------------------------------------

	Public ReadOnly Property ParamsNode as XmlNode
		Get
			return DisplayPropertyNode.SelectSingleNode("Control/Parameters")
		End Get		
	End Property	

'-----------------------------------------------------

	protected Function Get_Property_From_ArgumentNode(aProp as String) as String
		Dim aArgNode as XmlNode
		
		aArgNode = cXMLDoc.FindNode(ParamsNode, "Argument", "EventRaiserProperty", aProp)
		if aArgNode is nothing then return ""
		return cXMLDoc.AttributeToString(aArgNode, "Value", "")
	End Function	

'=============================================================

    Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)    
		MyBase.CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)

		DisplayPropertyNode = aDisplayPropertyNode

		Dim aParamsNode As XmlNode

		aParamsNode = ParamsNode
		If Not aParamsNode Is Nothing Then
			EventController.EventController_SetArgumentsInNodeList(aParamsNode)
		End If
		
		'set address for click of new button
		'	* remember to implement a stub for this method
        btnSend.Set_ServerClick(AddressOf DoSend)

    End Sub

'=============================================================

 '   Private Sub DoSend(ByVal aSrc As Object, ByVal aEventArgs As EventArgs)
	'	Dim aEventID As String
	'	Dim aWfTaskAssignmentID As String
	'	Dim aWfPersonID As String
	'	Dim aWfTaskID As String
	'	Dim	aWfTaskRoleID As String
		
	'	aEventID = Get_Property_From_ArgumentNode("EventID")
	'	If aEventID <> "" Then
	'		aWfTaskAssignmentID = Get_Property_From_ArgumentNode("WfTaskAssignmentID")
	'		If aWfTaskAssignmentID <> "" Then
	'			cWfTaskAssignment.RaiseEvent_From_WfTAID(WebSession.DataObjectFactory, aEventID, CInt(aWfTaskAssignmentID))
	'		Else
	'			aWfPersonID = Get_Property_From_ArgumentNode("WfPersonID")
	'			aWfTaskID = Get_Property_From_ArgumentNode("WfTaskID")
	'			aWfTaskRoleID = Get_Property_From_ArgumentNode("WfTaskRoleID")
	'			If aWfPersonID <> "" AND aWfTaskID <> "" AND aWfTaskRoleID <> "" Then
	'				cWfTaskAssignment.RaiseEvent_From_WfPersonTaskRole(WebSession.DataObjectFactory, CInt(aEventID), CInt(aWfPersonID), CInt(aWfTaskID), CInt(aWfTaskRoleID))
	'			End If			
	'		End If		
	'	End If
	'End Sub
	
    Private Sub DoSend(ByVal aSrc As Object, ByVal aEventArgs As EventArgs)
		Dim aEventID As String
		Dim aDODefinitionKey As String
		Dim aPrimaryKey As String
		Dim aDataObject As cDataObject

		Dim aUserID As String
		aUserID = Get_Property_From_ArgumentNode("UserID")
		
		aEventID = Get_Property_From_ArgumentNode("EventID")
		
		dim aCtlNode as XmlNode = DisplayPropertyNode.SelectSingleNode("Control")
		
		if cXmlDoc.AttributeToString(aCtlNode, "Save") = "True" then
			EventController.EventController_Save()
		end if
		
		If aEventID <> "" Then
			aDODefinitionKey = Get_Property_From_ArgumentNode("DODefinitionKey")
			aPrimaryKey = Get_Property_From_ArgumentNode("PrimaryKey")
			If aDODefinitionKey <> "" AND aPrimaryKey <> "" Then
				aDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey(aDODefinitionKey, aPrimaryKey)
				aDataObject.RaiseEvent(aEventID, aUserID)
			End If		
		End If
	End Sub

'==============================================================
End Class  'cEventRaiser

End Namespace 'Core_Web.Controls.Base