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
Public MustInherit Class cViewRankMain
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'========================================================================
	
	protected ctlPeerAverage as cLabel
	protected ctlPeerCritiques as cLabel
	protected ctlPrimaryCritique as cLabel
	protected ctlSecondaryCritique as cLabel
	protected ctlReaderCritique as cLabel
	protected ctlPanelComments as cTextArea
	
	protected ctlViewRank as cLabel
	protected tdCommitteeLabel as cLabel
	protected ctlHeader as cLabel

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
		dim aGPReviewStageDOList as cDataObjectList
		dim aGPReviewStageDO as cDataObject
		dim aReviewTaskID as Integer
		dim aReviewCommitteeID as Integer
		dim aReviewCycleStageID as Integer
		dim aReviewCommitteeName as String
		dim aReviewCommitteePool As StringBuilder = New StringBuilder()
		dim aCommitteeLabel as String
		dim aAverageRating as Decimal
		dim aPercentRank as Decimal
		dim aCritiqueLabel as String
		dim aViewRankPool As StringBuilder = New StringBuilder()
		dim aReaderPool As StringBuilder = New StringBuilder() 
        dim aSecondaryPool As StringBuilder = New StringBuilder() 
        dim aPrimaryPool As StringBuilder = New StringBuilder() 
        Dim aSortedList As SortedList = New SortedList()
        dim aViewRankLabel as String
        Dim aXmlDoc as cXMLDoc 
		Dim aFiltersNode as XmlNode 
		Dim aDataObjectNode as XmlNode
		Dim aSortNode as XmlNode
		Dim aArgNode as XmlNode
        
 		aGPReviewStageDOList = CType(DataObjectCollection("GranteeProjectReviewStages"), cDataObjectList)
				
		if aGPReviewStageDOList.Count > 0 then
			for each aGPReviewStageDO in aGPReviewStageDOList	
				aGranteeProjectID = aGPReviewStageDO.GetPropertyInt("GranteeProjectID")
				aReviewTaskID = aGPReviewStageDO.GetPropertyInt("ReviewTaskID")
				aReviewCommitteeID = aGPReviewStageDO.GetPropertyInt("ReviewCommitteeID")
				aReviewCycleStageID = aGPReviewStageDO.GetPropertyInt("ReviewCycleStageID")
				
				aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignmentReview", aDataObjectNode, aFiltersNode)
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "GranteeProjectID", aGranteeProjectID))
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewTaskID", aReviewTaskID))
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewCommitteeID", aReviewCommitteeID))
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewCycleStageID", aReviewCycleStageID))
				'sort the list
				aSortNode = aXmlDoc.CreateSortNode()
				aDataObjectNode.AppendChild(aSortNode)
				aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "", "ReviewAssignmentTypeID", "")
				aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "WfTaskAssignment", aArgNode))
				aWftaReviewDOList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
								
				if aWftaReviewDOList.Count > 0 then
					aReviewCommitteeName = aWftaReviewDOList(0).GetRelatedPropertyString("ReviewCommittee.ReviewCommitteeDescription")
					aAverageRating = aGPReviewStageDO.GetPropertyDouble("AverageRating")
					aPercentRank = aGPReviewStageDO.GetPropertyDouble("PercentRank")
					ctlViewRank = CType(Me.FindControl("ctlViewRank"), cLabel)	
					ctlHeader = CType(Me.FindControl("ctlHeader"), cLabel)				
					'displays Ranks, Scores and Critiques for each Committee
					'Header row
					aReviewCommitteePool.Append("<tr><td colspan='2' width='15%'><b>Committee</b></td>")
					aReviewCommitteePool.Append("<td>")
					aReviewCommitteePool.Append(aReviewCommitteeName)
					aReviewCommitteePool.Append("</td></tr>")
					aReviewCommitteePool.Append("<tr><td>&nbsp;</td></tr>")
					aReviewCommitteePool.Append("<tr><td><b>Rank</b></td>")
					aReviewCommitteePool.Append("<td><b>Score</b></td>")
					aReviewCommitteePool.Append("<td><b>Critique</b></td></tr>")
					aReviewCommitteePool.Append("<tr><td colspan='4'><hr align='left' width='70%'></td></tr>")
					'percent/score row
					aReviewCommitteePool.Append("<tr><td>")
					aReviewCommitteePool.Append(aPercentRank.Round(aPercentRank, 0))
					aReviewCommitteePool.Append("%</td>")
					aReviewCommitteePool.Append("<td>")
					aReviewCommitteePool.Append(aAverageRating.Round(aAverageRating, 1))
					aReviewCommitteePool.Append("</td>")
					
					'critiques for each assignment
					for each aWftaReviewDO in aWftaReviewDOList	
						aAssignmentID = aWftaReviewDO.GetRelatedPropertyInt("WfTaskAssignment.ReviewAssignmentTypeID")
						select case aAssignmentID
							case 1
								aPrimaryWfTaskDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWftaReviewDO.GetPropertyInt("WfTaskAssignmentID").ToString())	
								if not aPrimaryWfTaskDO is nothing then 
									aReviewCommitteePool.Append("<td>")
									aReviewCommitteePool.Append("(1)&nbsp;&nbsp;")
									aReviewCommitteePool.Append(aPrimaryWfTaskDO.GetRelatedPropertyString("WfTaskAssignmentReview.PublicCritique"))
									aReviewCommitteePool.Append("</td></tr>")
									aReviewCommitteePool.Append("<tr><td>&nbsp;</td></tr>")
								end if
							case 2
							aSecondaryWfTaskDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWftaReviewDO.GetPropertyInt("WfTaskAssignmentID").ToString())	
								if not aSecondaryWfTaskDO is nothing then 
									ctlSecondaryCritique = CType(Me.FindControl("ctlSecondaryCritique"), cLabel)
									aReviewCommitteePool.Append("<tr><td colspan='2' width='15%'>&nbsp;</td>")
									aReviewCommitteePool.Append("<td>")
									aReviewCommitteePool.Append("(2)&nbsp;&nbsp;")
									aReviewCommitteePool.Append(aSecondaryWfTaskDO.GetRelatedPropertyString("WfTaskAssignmentReview.PublicCritique"))
									aReviewCommitteePool.Append("</td></tr>")
									aReviewCommitteePool.Append("<tr><td>&nbsp;</td></tr>")
								else
									ctlSecondaryCritique.Visible = False
								end if
							case 3
							
							aReaderWfTaskDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWftaReviewDO.GetPropertyInt("WfTaskAssignmentID").ToString())	
								if not aReaderWfTaskDO is nothing then 
									aReviewCommitteePool.Append("<tr><td colspan='2' width='15%'>&nbsp;</td>")
									aReviewCommitteePool.Append("<td>")
									aReviewCommitteePool.Append("(3)&nbsp;&nbsp;")
									aReviewCommitteePool.Append(aReaderWfTaskDO.GetRelatedPropertyString("WfTaskAssignmentReview.PublicCritique"))
									aReviewCommitteePool.Append("</td></tr>")
									aReviewCommitteePool.Append("<tr><td>&nbsp;</td></tr>")
								end if
						end select							
					next
					'creates row between Committee sections
					aReviewCommitteePool.Append("<tr><td>&nbsp;</td></tr>")	
				end if
				'displays Committee(s) ranks, scores and critiques	
				aCommitteeLabel = aReviewCommitteePool.ToString()
				ctlHeader.Value = aCommitteeLabel + "<br><br>"				
			next
		end if
   End Sub		

'========================================================================

End Class
End Namespace