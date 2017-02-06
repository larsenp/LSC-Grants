Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports EasyGrants.Correspondence
Imports System.Xml
Imports Core.Web.User
Imports Core.Web.Navigation.CrumbTrail

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Reviews

	Public MustInherit Class cCommitteesEL
		Inherits Core_Web.Controls.Base.cFilterListDataPresenterCtl

'=============================================================

   Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
		
		If Not IsPostBack Then
			Dim aWfTAListActive As cDataObjectList
			Dim aReviewCommitteeDOList As cDataObjectList
			Dim aReviewCommitteeDO As cDataObject
			Dim ctlList As cDataListCtl
			Dim aDeleteButtonHash As Hashtable
			Dim aDeleteButton As cCSSButton
			Dim aReviewCommitteeID As Integer
	        
			'Hide the delete button for review comittees with active review assignments
			aReviewCommitteeDOList = CType(DataObjectCollection("SubCommitteeList"), cDataObjectList)
			ctlList = FindControl("ctlDataListSubCommittee")
			If Not aReviewCommitteeDOList Is Nothing Then
				aDeleteButtonHash = ctlList.DataListCtl_GetControlCollection("btnDelete")
				For Each aReviewCommitteeDO In aReviewCommitteeDOList
					aReviewCommitteeID = aReviewCommitteeDO.GetPropertyInt("ReviewCommitteeID")
					aDeleteButton = CType(aDeleteButtonHash(aReviewCommitteeID), cCSSButton)
					If Not aDeleteButton Is Nothing
						aWfTAListActive = aReviewCommitteeDO.GetRelatedPropertyDataObjectList("WfTaskAssignmentsActive")
						If aWfTAListActive.Count > 0 Then
							aDeleteButton.Visible = False
						End If
					End If
				Next
			End If
		End If
   End Sub

'=============================================================

	End Class
End Namespace
