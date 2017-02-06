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
Public MustInherit Class cPanelReviewComments_ReadOnly
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'========================================================================
	
	protected ctlPeerAverage as cLabel
	protected ctlPeerCritiques as cLabel
	protected ctlPrimaryCritique as cLabel
	protected ctlSecondaryCritique as cLabel
	protected ctlReaderCritique as cLabel
	protected ctlPanelComments as cTextArea

'========================================================================

   Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)
         
        dim aGranteeProjectID as String = request.QueryString("GranteeProjectID")
        dim aMinValue as Double
        dim aMaxValue as Double
        dim aMinTotal as Decimal
        dim aMaxTotal as Decimal
        dim aTotal as Double
        dim aMinValueAverage as Decimal
        dim aMaxValueAverage as Decimal
        dim aTotalAverage as Decimal
        dim aWftaReviewDOList as cDataObjectList
        dim aWftaReviewDO as cDataObject
        dim aPrimaryCritique as String
        dim aSecondaryCritque as String
        dim aReaderCritique as String
        dim aPrimaryWftaDOList as cDataObjectList
        dim aWftaDO as cDataObject
        dim aAssignmentID as Integer
        dim aPrimaryLabel as String
        dim aSecondaryLabel as String
        dim aReaderLabel as String
        dim aPrimaryWfTaskDO as cDataObject
		dim aSecondaryWfTaskDO as cDataObject
		dim aReaderWfTaskDO as cDataObject
		dim aRowCount as Decimal = 0
		dim aWftaDOList as cDataObjectList
        
        'get all peer review min/max values
 		aWftaReviewDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentReview", "GranteeProjectID", aGranteeProjectID, "ReviewTaskID", "19")
		aWftaDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "GranteeProjectID", aGranteeProjectID, "WfTaskID", "19")
		if aWftaDOList.Count > 0 then
			for each aWftaDO in aWftaDOList
				aMinValue = aWftaDO.GetPropertyDouble("MinValue")
				aMaxValue = aWftaDO.GetPropertyDouble("MaxValue")
				if aMinValue <> 0.0 Or aMaxValue <> 0.0 then
					aMinTotal += Convert.ToDecimal(aMinValue)
					aMaxTotal += Convert.ToDecimal(aMaxValue)
					aRowCount += 1
				end if
			next
				ctlPeerAverage = CType(Me.FindControl("ctlPeerAverage"), cLabel)
				if aMinTotal <> 0.0 And aMaxTotal <> 0.0 then
					'min value average
					aMinValueAverage = aMinValueAverage.Round(aMinTotal/aRowCount, 1)
					'max value average
					aMaxValueAverage = aMaxValueAverage.Round(aMaxTotal/aRowCount, 1)
					'toal peer average
					aTotalAverage = aTotalAverage.Round(Convert.ToDecimal((aMinValueAverage + aMaxValueAverage)/2.0), 1)
					'display peer group average
					ctlPeerAverage.Value = aTotalAverage.ToString()
				else
					ctlPeerAverage.Value = 0
				end if
		end if
		
		'display peer critiques
		if aWftaReviewDOList.Count > 0 then
			for each aWftaReviewDO in aWftaReviewDOList	
				aPrimaryWfTaskDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWftaReviewDO.GetPropertyInt("WfTaskAssignmentID").ToString())
				aSecondaryWfTaskDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWftaReviewDO.GetPropertyInt("WfTaskAssignmentID").ToString())
				aReaderWfTaskDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWftaReviewDO.GetPropertyInt("WfTaskAssignmentID").ToString())			
				
				if not aReaderWfTaskDO is nothing then
					aWftaDO = aWftaReviewDO.GetRelatedPropertyDataObject("WfTaskAssignment")
					aAssignmentID = aWftaDO.GetPropertyInt("ReviewAssignmentTypeID")
					select case aAssignmentID
						case 1
							ctlPrimaryCritique = CType(Me.FindControl("ctlPrimaryCritique"), cLabel)
							if not aPrimaryWfTaskDO is nothing then 
									aPrimaryLabel = "(P) " + aPrimaryWfTaskDO.GetRelatedPropertyString("WfTaskAssignmentReview.PeerCritique")
									ctlPrimaryCritique.Value = aPrimaryLabel + "<br><br>"
							else
								ctlPrimaryCritique.Visible = False		
							end if
						case 2
							ctlSecondaryCritique = CType(Me.FindControl("ctlSecondaryCritique"), cLabel)
							if not aSecondaryWfTaskDO is nothing then
									aSecondaryLabel = "(S) " + aSecondaryWfTaskDO.GetRelatedPropertyString("WfTaskAssignmentReview.PeerCritique")
									ctlSecondaryCritique.Value = aSecondaryLabel + "<br><br>"
							else
								ctlSecondaryCritique.Visible = False
							end if
						case 3
							ctlReaderCritique = CType(Me.FindControl("ctlReaderCritique"), cLabel)
							if not aReaderWfTaskDO is nothing then
									aReaderLabel = "(R) " + aReaderWfTaskDO.GetRelatedPropertyString("WfTaskAssignmentReview.PeerCritique")
									ctlReaderCritique.Value = aReaderLabel + "<br><br>"
							else
								ctlReaderCritique.Visible = False
						end if
					end select
				end if
			next
		end if
   End Sub	
	
'==============================================================
	
 Public Overrides Sub DataPresenter_SaveDataObjects()

	dim aWfTaskAssignmentID as String = Request.QueryString("WfTaskAssignmentID")
	dim aGranteeProjectID as String = Request.QueryString("GranteeProjectID")
	dim aAppWfTaskAssignmentID as String = Request.QueryString("AppWfTaskAssignmentID")
	dim aWfTaskAssignmentReviewDOList as cDataObjectList
    dim aURL as String = Request.RawUrl.ToString()
    dim aWfTaskAssignmentReviewDO as cDataObject
    dim aWfTaskAssignmentReviewID as Integer
    dim aWftaDO as cDataObject

    aWfTaskAssignmentReviewDOList = CType(DataObjectCollection("WfTaskAssignmentReview"), cDataObjectList)
    ctlPanelComments = CType(Me.FindControl("ctlPanelComments"), cTextArea)
    aWftaDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWfTaskAssignmentID)
    
    if Request.QueryString("WfTaskAssignmentReviewID") = "0" then
		aWfTaskAssignmentReviewDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskAssignmentReview")
		aWfTaskAssignmentReviewDO("WfTaskAssignmentID") = aWfTaskAssignmentID
		aWfTaskAssignmentReviewDO("ReviewTaskID") = aWftaDO.GetPropertyInt("WfTaskID")
		aWfTaskAssignmentReviewDO("GranteeProjectID") = aGranteeProjectID
		aWfTaskAssignmentReviewDO("AppWfTaskAssignmentID") = aAppWfTaskAssignmentID
		aWfTaskAssignmentReviewDO("PanelComments") = ctlPanelComments.Value
		WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssignmentReviewDO)
		aWfTaskAssignmentReviewID = aWfTaskAssignmentReviewDO.GetPropertyInt("WfTaskAssignmentReviewID")
	else			
		if aWfTaskAssignmentReviewDOList.Count > 0 then
			aWfTaskAssignmentReviewDOList(0)("WfTaskAssignmentID") = aWfTaskAssignmentID
			aWfTaskAssignmentReviewDOList(0)("ReviewTaskID") = aWftaDO.GetPropertyInt("WfTaskID")
			aWfTaskAssignmentReviewDOList(0)("GranteeProjectID") = aGranteeProjectID
			aWfTaskAssignmentReviewDOList(0)("AppWfTaskAssignmentID") = aAppWfTaskAssignmentID
			aWfTaskAssignmentReviewDOList(0)("PanelComments") = ctlPanelComments.Value
			WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssignmentReviewDOList(0))	
			aWfTaskAssignmentReviewID = aWfTaskAssignmentReviewDOList(0).GetPropertyInt("WfTaskAssignmentReviewID")				
		end if 
	end if  
	if Request.QueryString("WfTaskAssignmentReviewID") = "0" then
		aURL = cWebLib.RemoveQuerystringParameter(aURL, "WfTaskAssignmentReviewID")
		aURL = cWebLib.AddQuerystringParameter(aURL, "WfTaskAssignmentReviewID", aWfTaskAssignmentReviewID)
	end if			
	Response.Redirect(aURL) 
 End Sub 
 
'========================================================================

End Class
End Namespace