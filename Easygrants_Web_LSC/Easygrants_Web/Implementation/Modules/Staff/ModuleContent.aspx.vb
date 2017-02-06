Imports System.Xml
Imports Core.Util
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Navigation
Imports Core.Web.User
Imports EasyGrants.Web.User
imports Core.Web.Modules

Namespace Easygrants_Web.Modules.Staff

Public Class cStaffModuleContent
	Inherits EasyGrants.Web.cEGPage
			Protected WithEvents CUserCtlLoader1 As Core.Web.SvrCtls.cUserCtlLoader
	
'=============================================================

    Protected ReadOnly Property StaffUser() As cEGStaffUser
        Get
            StaffUser = CType(ModuleUser, cEGStaffUser)
        End Get
    End Property

'=============================================================

    Public Overrides Sub Validate_Navigation()
        MyBase.Validate_Navigation()

        'ModuleUser.MasterNavElement.NavElement_Enable(True, True)
    End Sub

'=============================================================

    Public Overrides Sub CorePage_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
        MyBase.CorePage_Load(aSrc, aEvent)

		'If not ModuleUser.MasterNavElement is Nothing Then
		'	dim aReturnHomeNavElement as cNavElement
		'	aReturnHomeNavElement = ModuleUser.MasterNavElement.Find_ChildElement("ReturnHome")
		
		'	if not aReturnHomeNavElement is Nothing Then
		'		aReturnHomeNavElement.Visible = False
		'		aReturnHomeNavElement.Enabled = False
		'		'aReturnHomeNavElement.SourceFile = WebAppl.Remove_RootFromURL(aModuleState.LastURL)
		'	end if
		'End If

    End Sub

'=============================================================

	Private Sub PopupMessage(ByVal aStr As String)
		Response.Write("<script language='JavaScript'>"+chr(13)+chr(10))
		Response.Write("alert('"+aStr+"');"+chr(13)+chr(10))
		Response.Write("</script>")
	End Sub
	
'=============================================================

    Public Sub LoginAsUser(ByVal aUserName As String)
        Dim aDataObjectNode As XmlNode
        Dim aFiltersNode As XmlNode
        Dim aXmlDoc As cXMLDoc
        Dim aModuleDoc As cXMLDoc
        Dim aUserDO As cDataObject
        Dim aUser As cEGUser

        aXmlDoc = EGSession.DataObjectFactory.CreateDataObjectNode("User", aDataObjectNode, aFiltersNode)
        aFiltersNode.AppendChild(EGSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "UserName", aUserName))

        aUserDO = EGSession.DataObjectFactory.GetDataObject(aDataObjectNode)
        If aUserDO Is Nothing Then
			PopupMessage("This person is not an EasyGrants user.")
            'Me.Redirect()
            Exit Sub
        End If

        If aUserDO.GetPropertyInt("UserTypeID", 0) > 1 Then
			PopupMessage("You are not allowed to log in as another staff or administrative user.")
            'Me.Redirect()
            Exit Sub
		End If

        EGSession.Remove_All_NonStaff_Users()
        aUser = EGSession.EGUser_From_UserDataobject(aUserDO, aModuleDoc)
        If Not aUser Is Nothing Then
            Me.ModulePage_RedirectToModule(aModuleDoc)
        End If
    End Sub

'=============================================================

    Public Sub LoginAsUser_From_WfTA(ByVal aWfTaskAssignment As String)
        Dim aDataObjectNode As XmlNode
        Dim aFiltersNode As XmlNode
        Dim aXmlDoc As cXMLDoc
        Dim aModuleDoc As cXMLDoc
        Dim aUserDO As cDataObject
        Dim aUser As cEGUser
        Dim aUserName As String

        aXmlDoc = EGSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", aDataObjectNode, aFiltersNode)
        aFiltersNode.AppendChild(EGSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskAssignmentID", aWfTaskAssignment))

        aUserDO = EGSession.DataObjectFactory.GetDataObject(aDataObjectNode)
        
        If aUserDO Is Nothing Then
			PopupMessage("This person is not an EasyGrants user.")
            Exit Sub
        End If

        If aUserDO.GetRelatedPropertyInt("Person.User.UserTypeID") > 1 Then
			PopupMessage("You are not allowed to log in as another staff or administrative user.")
            Exit Sub
		End If

        aUserName = aUserDO.GetRelatedPropertyString("Person.User.UserName")
        If aUserName Is Nothing Then
            Me.Redirect()
            Exit Sub
        End If

        LoginAsUser(aUserName)

    End Sub

'-------------------------------------------------------------

    Public Sub LoginAsUser_From_WfTA_AsGPPP(ByVal aWfTaskAssignment As String)
        Dim aDataObjectNode As XmlNode
        Dim aFiltersNode As XmlNode
        Dim aXmlDoc As cXMLDoc
        Dim aModuleDoc As cXMLDoc
        Dim aUserDO As cDataObject
        Dim aUser As cEGUser
        Dim aUserName As String

        aXmlDoc = EGSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", aDataObjectNode, aFiltersNode)
        aFiltersNode.AppendChild(EGSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskAssignmentID", aWfTaskAssignment))

        aUserDO = EGSession.DataObjectFactory.GetDataObject(aDataObjectNode)
        
        If aUserDO Is Nothing Then
			PopupMessage("This person is not an EasyGrants user.")
            Exit Sub
        End If

        If aUserDO.GetRelatedPropertyInt("GranteeProject.PrimaryPerson.User.UserTypeID") > 1 Then
			PopupMessage("You are not allowed to log in as another staff or administrative user.")
            Exit Sub
		End If

        aUserName = aUserDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.User.UserName")
        If aUserName Is Nothing Then
            Me.Redirect()
            Exit Sub
        End If

        LoginAsUser(aUserName)

    End Sub

'-------------------------------------------------------------

    Public Sub LoginAsUser_From_Person(ByVal aPerson As String)
        Dim aDataObjectNode As XmlNode
        Dim aFiltersNode As XmlNode
        Dim aXmlDoc As cXMLDoc
        Dim aModuleDoc As cXMLDoc
        Dim aUserDO As cDataObject
        Dim aUser As cEGUser
        Dim aUserName As String

        aXmlDoc = EGSession.DataObjectFactory.CreateDataObjectNode("Person", aDataObjectNode, aFiltersNode)
        aFiltersNode.AppendChild(EGSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "PersonID", aPerson))

        aUserDO = EGSession.DataObjectFactory.GetDataObject(aDataObjectNode)
        
        If aUserDO Is Nothing Then
			PopupMessage("This person is not an EasyGrants user.")
            Exit Sub
        End If

        If aUserDO.GetRelatedPropertyInt("User.UserTypeID") > 1 Then
			PopupMessage("You are not allowed to log in as another staff or administrative user.")
            Exit Sub
		End If

        aUserName = aUserDO.GetRelatedPropertyString("User.UserName")
        If aUserName Is Nothing Then
            Me.Redirect()
            Exit Sub
        End If

        LoginAsUser(aUserName)

    End Sub

'-------------------------------------------------------------

    Public Sub LoginAsUser_From_Grants(ByVal aGranteeProject As String)
        Dim aDataObjectNode As XmlNode
        Dim aFiltersNode As XmlNode
        Dim aXmlDoc As cXMLDoc
        Dim aModuleDoc As cXMLDoc
        Dim aUserDO As cDataObject
        Dim aUser As cEGUser
        Dim aUserName As String

        aXmlDoc = EGSession.DataObjectFactory.CreateDataObjectNode("GranteeProject", aDataObjectNode, aFiltersNode)
        aFiltersNode.AppendChild(EGSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "GranteeProjectID", aGranteeProject))

        aUserDO = EGSession.DataObjectFactory.GetDataObject(aDataObjectNode)
        
        If aUserDO Is Nothing Then
			PopupMessage("This person is not an EasyGrants user.")
            Exit Sub
        End If

        If aUserDO.GetRelatedPropertyInt("PrimaryPerson.User.UserTypeID") > 1 Then
			PopupMessage("You are not allowed to log in as another staff or administrative users.")
            Exit Sub
		End If

        aUserName = aUserDO.GetRelatedPropertyString("PrimaryPerson.User.UserName")
        If aUserName Is Nothing Then
            Me.Redirect()
            Exit Sub
        End If

        LoginAsUser(aUserName)

    End Sub

'-------------------------------------------------------------

    Public Sub ChangePersonIDOfWFTA(ByVal aWfTaskAssignmentID As String)
        Dim aWFTA As cDataObject
        Dim aUser As cEGUser
        
        aWFTA = EGSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWfTaskAssignmentID)
        aUser = CType(Ctype(Page, cModulePage).ModuleUser, cEGUser)
	    aWFTA("PersonID") = aUser.PersonID
	    me.EGSession.DataObjectFactory.SaveDataObject(aWFTA)
        Me.Redirect()
    End Sub

'=============================================================

		Private Sub InitializeComponent()

		End Sub
End Class 'cStaffModuleContent

End Namespace 'Easygrants_Web.Modules.Staff