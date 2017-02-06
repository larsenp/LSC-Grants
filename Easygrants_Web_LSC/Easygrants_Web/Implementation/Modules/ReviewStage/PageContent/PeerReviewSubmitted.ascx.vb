Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web
Imports EasyGrants.Web.Modules
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports Core.Web
Imports System.Text

Namespace Implementation.Modules.ReviewStage.PageContent
Public MustInherit Class cPeerReviewSubmitted
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'========================================================================

	protected spnSave as HtmlGenericControl
	protected tblSubmit as HtmlTable
	Protected ctlNewWindowOpener As cNewWindowOpener
	protected valMinValue as CustomValidator
	protected valMaxValue as CustomValidator
	protected valStreamlined as CustomValidator
	protected ctlMinValue as cMoneyTextBox
	protected ctlMaxValue as cMoneyTextBox
	protected ctlList as cDataListCtl
	Protected btnEditComment As cCSSButton
	Protected btnEditComment2 As cCSSButton
	protected valApplicants as CustomValidator
	
'========================================================================

	Public ReadOnly Property EGSession As cEGSession
			Get
				Return Websession
			End Get
	End Property

'========================================================================

   Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)    
         
        dim aWfTaskAssignmentID as String
        dim aWftaDO as cDataObject
        
        Dim aUser As cEGUser
		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		aWfTaskAssignmentID = aUser.WfTaskAssignmentID
               
        CType(EGSession, cEGSession).RedirectToModule("ReviewStage", "PeerReviewSubmittedModuleConfig", "Main", aWfTaskAssignmentID)   
          
   End Sub	
   
'========================================================================

End Class
End Namespace
