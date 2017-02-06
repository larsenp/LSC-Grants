Imports System.Diagnostics
Imports System.Web.UI
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Workflow
Imports Easygrants_Web.Controls.Base

Public MustInherit Class ReviewerConflict
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
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

    Protected mDisplayText As String
    Protected mOutputDefinitionID As Integer

'-------------------------------------------------------------

	Public Property DisplayText() As String
		Get
			Return mDisplayText
		End Get
		Set(ByVal Value As String)
			mDisplayText = Value
		End Set
	End Property

'-------------------------------------------------------------

	Public Property OutputDefinitionID() As Integer
		Get
			Return mOutputDefinitionID
		End Get
		Set(ByVal Value As Integer)
			mOutputDefinitionID = Value
		End Set
	End Property

'-------------------------------------------------------------

	Public Sub Submit(ByVal aPageKey As String)
		MyBase.DataPresenter_SaveDataObjects()
	
		dim aWFTA as cDataObject = me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", _
			request.QueryString("WfTaskAssignmentID"))
		aWFTA("WfTaskStatusID") = 2
		me.WebSession.DataObjectFactory.SaveDataObject(aWFTA)
		
		dim	aUser as cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		    
		Try
			'dim aUserObj as cDataObject = me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("User", aUser.UserID)
			aWFTA.RaiseEvent(17, aUser.UserID)
		Catch
		End Try
			
		EventController_NavigateToModulePageKey(aPageKey)

	End Sub

'=============================================================
End Class
