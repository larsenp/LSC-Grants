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

Namespace Easygrants_Web.Implementation.Modules.ReviewStage.PageContent
Public MustInherit Class cSelectPref_SubmittedContent
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
	protected ctlOptions as cRadioButtonList
	protected valConflictType as CustomValidator

'========================================================================

   Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)    
   End Sub	
   
 '==============================================================

	Public Sub ViewProjectSummary(ByVal aWfTaskAssignmentID As String, ByVal aGranteeProjectID As String)
		Dim aHref As String

		aHref = WebAppl.Build_RootURL("EasyGrants/Controls/PageSection/pgViewProjectSummary.aspx")
		aHref = cWebLib.AddQuerystringParameter(aHref, "WfTaskAssignmentID", aWfTaskAssignmentID)
		aHref = cWebLib.AddQuerystringParameter(aHref, "GranteeProjectID", aGranteeProjectID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub
	  
'=============================================================

End Class
End Namespace