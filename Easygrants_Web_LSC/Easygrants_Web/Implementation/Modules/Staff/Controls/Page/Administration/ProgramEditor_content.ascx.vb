Imports System.Diagnostics
Imports System.Web.UI
Imports System.Xml
Imports System.Text
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Sharepoint


Namespace Easygrants_Web.Modules.Staff.Controls.Page

Public MustInherit Class cProgramEditor_content
	Inherits Core_Web.Controls.Sharepoint.cSharepointLib
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

	Protected ctlProgramAbbr As cTextBox
'=============================================================

	Public ReadOnly Property ProgramID() As String
		Get
            If Not Request.QueryString("ProgramID") Is Nothing Then
                Return Request.QueryString("ProgramID")
            Else
                Return ""
            End If
		End Get
	End Property

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)

		ctlProgramAbbr = Me.FindControl("ctlProgramAbbr")
	End Sub

'=============================================================

 '   Public Overloads Overrides Function EventController_Save() As Boolean
 '  		Dim aURL As String
	'	aURL = Request.QueryString("ReturnURL")
       
 '       MyBase.EventController_Save()

	'	Response.Redirect(aURL)
	'End Function

'=============================================================

	Public Overrides Sub DataPresenter_SaveDataObjects()
		Page.Validate()
		If Page.IsValid Then
			'The rename to be executed when editing the name but not when creating a new one.
			If ProgramID > 0 Then
				'--------------- This Functionality should be executed only when SharePoint is Active. ----------------
				Dim aSPIntegrationDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")(0)
				If Not aSPIntegrationDO Is Nothing Then
					'Here definition key is the Table Name

					Dim aEventTypeID As Integer = 1
					Dim aDefinitionKey As String = "Program"
					Dim aUniqueID As Integer = ProgramID

					Dim aProgramDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("Program", ProgramID)(0)
					Dim aOldFolderName As String = ProgramID & "_" & TruncateSpecialCharacters(aSPIntegrationDO, aProgramDO.GetPropertyString("ShortName"))

					MyBase.DataPresenter_SaveDataObjects()

					Dim aNewFolderName As String = ProgramID & "_" & TruncateSpecialCharacters(aSPIntegrationDO, ctlProgramAbbr.Value)

					'Here we are comparing the Values before save and after save. if they both are different then we need to rename the Folder in sharepoint.
					If aOldFolderName <> aNewFolderName Then
						RenameFolder(aEventTypeID, aDefinitionKey, aUniqueID, aOldFolderName, aNewFolderName, aSPIntegrationDO, aProgramDO)
					End If
					'Here we need to exit because otherwise DataPresenter_SaveDataObject will be executed at the end again
					Exit Sub
				End If
			End If
		End If
		MyBase.DataPresenter_SaveDataObjects()
	End Sub

'=============================================================
End Class

End Namespace 'Easygrants_Web.Modules.Staff.Controls.Page
