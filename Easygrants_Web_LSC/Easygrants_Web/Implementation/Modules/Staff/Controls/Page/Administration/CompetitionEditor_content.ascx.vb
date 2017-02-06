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
Imports System.Net
Imports Core_Web.Controls.Sharepoint

Namespace Easygrants_Web.Modules.Staff.Controls.Page

Public MustInherit Class cCompetitionEditor_content
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

	Protected ctlFOAbbr As cTextBox
'=============================================================

	Public ReadOnly Property CompetitionID() As String
		Get
            If Not Request.QueryString("CompetitionID") Is Nothing Then
                Return Request.QueryString("CompetitionID")
            Else
                Return ""
            End If
		End Get
	End Property

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)

		ctlFOAbbr = Me.FindControl("ctlFOAbbr")
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
			If CompetitionID > 0 Then
				'--------------- This Functionality should be executed only when SharePoint is Active. ----------------
				Dim aSPIntegrationDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")(0)
				If Not aSPIntegrationDO Is Nothing Then
					'Here definition key is the Table Name

					Dim aEventTypeID As Integer = 2
					Dim aDefinitionKey As String = "Competition"
					Dim aUniqueID As Integer = CompetitionID

					Dim aCompetitionDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("Competition", CompetitionID)(0)
					Dim aOldFolderName As String = CompetitionID & "_" & TruncateSpecialCharacters(aSPIntegrationDO, aCompetitionDO.GetPropertyString("ShortName"))

					MyBase.DataPresenter_SaveDataObjects()

					Dim aNewFolderName As String = CompetitionID & "_" & TruncateSpecialCharacters(aSPIntegrationDO, ctlFOAbbr.Value)

					'Here we are comparing the Values before save and after save. if they both are different then we need to rename the Folder in sharepoint.
					If aOldFolderName <> aNewFolderName Then
						RenameFolder(aEventTypeID, aDefinitionKey, aUniqueID, aOldFolderName, aNewFolderName, aSPIntegrationDO, aCompetitionDO)
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
