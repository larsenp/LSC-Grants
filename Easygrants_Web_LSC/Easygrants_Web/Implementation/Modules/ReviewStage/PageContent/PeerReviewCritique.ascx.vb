Imports System.Diagnostics
Imports System.Web.UI
Imports System.Xml
Imports System.Text
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports Core.Web
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports Core.Web.Navigation
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Web

Namespace Implementation.Modules.ReviewStage.PageContent
Public MustInherit Class cPeerReviewCritique
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'=============================================================

	protected ctlPeerCritique as cTextArea
	
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)	
	End Sub

'=============================================================
	
 Public Overrides Sub DataPresenter_SaveDataObjects()	
	dim aWfTaskAssignmentID as String = Request.QueryString("WfTaskAssignmentID")
	dim aGranteeProjectID as String = Request.QueryString("GranteeProjectID")
	dim aAppWfTaskAssignmentID as String = Request.QueryString("AppWfTaskAssignmentID")
	dim aWfTaskAssignmentReviewDOList as cDataObjectList
    dim aURL as String = Request.RawUrl.ToString()
    dim aURL2 as String = request.Url.ToString()
    dim aWfTaskAssignmentReviewDO as cDataObject
    dim aWfTaskAssignmentReviewID as Integer
    dim aWftaDO as cDataObject

    'aWfTaskAssignmentReviewDOList = CType(DataObjectCollection("WfTaskAssignmentReview"), cDataObjectList)
    ctlPeerCritique = CType(Me.FindControl("ctlPeerCritique"), cTextArea)
    aWftaDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWfTaskAssignmentID)
    aWfTaskAssignmentReviewDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentReview", "WfTaskAssignmentID", aWftaDO.GetPropertyInt("WfTaskAssignmentID"))
    
    if aWfTaskAssignmentReviewDOList.Count = 0 then
		'if Request.QueryString("WfTaskAssignmentReviewID") = "0" then
			aWfTaskAssignmentReviewDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskAssignmentReview")
			aWfTaskAssignmentReviewDO("WfTaskAssignmentID") = aWfTaskAssignmentID
			aWfTaskAssignmentReviewDO("ReviewTaskID") = aWftaDO.GetPropertyInt("WfTaskID")
			aWfTaskAssignmentReviewDO("ReviewCommitteeID") = aWftaDO.GetPropertyInt("ReviewCommitteeID")
			aWfTaskAssignmentReviewDO("ReviewCycleStageID") = aWftaDO.GetPropertyInt("ReviewCycleStageID")
			aWfTaskAssignmentReviewDO("GranteeProjectID") = aGranteeProjectID
			aWfTaskAssignmentReviewDO("AppWfTaskAssignmentID") = aAppWfTaskAssignmentID
			aWfTaskAssignmentReviewDO("PeerCritique") = ctlPeerCritique.Value
			WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssignmentReviewDO)
			aWfTaskAssignmentReviewID = aWfTaskAssignmentReviewDO.GetPropertyInt("WfTaskAssignmentReviewID")
		else			
			'if aWfTaskAssignmentReviewDOList.Count > 0 then
				aWfTaskAssignmentReviewDOList(0)("WfTaskAssignmentID") = aWfTaskAssignmentID
				aWfTaskAssignmentReviewDOList(0)("ReviewTaskID") = aWftaDO.GetPropertyInt("WfTaskID")
				aWfTaskAssignmentReviewDOList(0)("ReviewCommitteeID") = aWftaDO.GetPropertyInt("ReviewCommitteeID")
				aWfTaskAssignmentReviewDOList(0)("ReviewCycleStageID") = aWftaDO.GetPropertyInt("ReviewCycleStageID")
				aWfTaskAssignmentReviewDOList(0)("GranteeProjectID") = aGranteeProjectID
				aWfTaskAssignmentReviewDOList(0)("AppWfTaskAssignmentID") = aAppWfTaskAssignmentID
				aWfTaskAssignmentReviewDOList(0)("PeerCritique") = ctlPeerCritique.Value
				WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssignmentReviewDOList(0))	
				aWfTaskAssignmentReviewID = aWfTaskAssignmentReviewDOList(0).GetPropertyInt("WfTaskAssignmentReviewID")				
			'end if 
		'end if  
	end if
	'if Request.QueryString("WfTaskAssignmentReviewID") = "0" then
	'	aURL = cWebLib.RemoveQuerystringParameter(aURL, "WfTaskAssignmentReviewID")
	'	aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskAssignmentReviewID", aWfTaskAssignmentReviewID)
	'end if
	'Response.Redirect(aURL)


 End Sub 
 
 '=============================================================

	Public Sub Save()
		
		dim aURL as String
		dim aWfTaskAssignmentReviewID as String
		dim aWfTaskAssignmentReviewDOList as cDataObjectList
		dim aWfTaskAssignmentID as String
		
		DataPresenter_SaveDataObjects()
		
		'aWfTaskAssignmentReviewDO = Me.DataObjectCollection("WfTaskAssignmentReview")(0)
		aWfTaskAssignmentID = request.QueryString("WfTaskAssignmentID")
		aWfTaskAssignmentReviewDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentReview", "WfTaskAssignmentID", aWfTaskAssignmentID)
		aURL = Request.RawUrl.ToString()
		if aWfTaskAssignmentReviewDOList.Count > 0 then
			aWfTaskAssignmentReviewID = aWfTaskAssignmentReviewDOList(0).GetPropertyString("WfTaskAssignmentReviewID")	
			if aWfTaskAssignmentReviewID <> "" then
				aURL = cWebLib.RemoveQuerystringParameter(aURL, "WfTaskAssignmentReviewID")
				aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskAssignmentReviewID", aWfTaskAssignmentReviewID)
			end if
		end if
		response.Redirect(aURL)
	End Sub
	
'==   
'=============================================================


End Class
End Namespace
