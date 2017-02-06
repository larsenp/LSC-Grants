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
Public MustInherit Class cScoresAndCritiques
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'========================================================================

	protected ctlPeerAverage as cLabel
	protected ctlPeerCritiques as cLabel	
	protected ctlPrimaryCritique as cLabel
	protected ctlSecondaryCritique as cLabel
	protected ctlReaderCritique as cLabel
	protected ctlPanelComments as cTextArea
	Protected tblCloseWindow as HtmlTable
	Protected spnCloseControl as HtmlGenericControl
	Protected tblSubmit As HtmlTable

'========================================================================

   Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
       
        MyBase.CoreCtl_Load(sender, e)
        
        tblCloseWindow.Visible = True
        
        dim aGPReviewDOList as cDataObjectList
        dim aGPReviewDO as cDataObject
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
		dim aSubmittedWftaDOList as cDataObjectList
		dim aReviewers as String = request.QueryString("AllReviewers")
		Dim a1ApplicantPool As StringBuilder = New StringBuilder()
		Dim a2ApplicantPool As StringBuilder = New StringBuilder()
		Dim a3ApplicantPool As StringBuilder = New StringBuilder()
		dim aPeerCritique as String
		dim aStreamLined as String
		dim aReviewRating as Double

       'get all peer review min/max values
		aWftaReviewDO = CType(Me.DataObjectCollection("WfTaskAssignmentReview"), cDataObjectList)(0)
		
		if aReviewers = "True" And not aWftaReviewDO is nothing then
			aWftaDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "GranteeProjectID", aGranteeProjectID, "WfTaskID", aWftaReviewDO("ReviewTaskID"), "ReviewCommitteeID", aWftaReviewDO.GetRelatedPropertyInt("WfTaskAssignment.ReviewCommitteeID"))
		elseif aReviewers = "False" And not aWftaReviewDO is nothing then
			aWftaDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "WfTaskAssignmentID", Request.QueryString("WfTaskAssignmentID"))					
		end if

		'display Primary, Secondary and Reader info if records exist for each reviewer
		if aWftaDOList.Count > 0 then
			for each aWftaDO in aWftaDOList
				aMinValue = aWftaDO.GetPropertyDouble("MinValue")
				aMaxValue = aWftaDO.GetPropertyDouble("MaxValue")
				aReviewRating = aWftaDO.GetPropertyDouble("ReviewRating")
				aPeerCritique = aWftaDO.GetRelatedPropertyString("WfTaskAssignmentReview.PeerCritique")
				aStreamLined = aWftaDO.GetPropertyString("Streamlined")
				if aMinValue <> 0.0 Or aReviewRating <> 0.0 Or aPeerCritique <> "" Or aStreamLined <> "" then
					aAssignmentID = aWftaDO.GetPropertyInt("ReviewAssignmentTypeID")
					select case aAssignmentID
						case 1
							aPrimaryWfTaskDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWftaDO.GetPropertyInt("WfTaskAssignmentID").ToString())	
							if not aPrimaryWfTaskDO is nothing then 
								ctlPrimaryCritique = CType(Me.FindControl("ctlPrimaryCritique"), cLabel)
								if aStreamLined = False And aMinValue <> 0.0 then
									a1ApplicantPool.Append("<b>Primary</b><br><br>")
									a1ApplicantPool.Append("Min: ")
									a1ApplicantPool.Append(aPrimaryWfTaskDO.GetPropertyDouble("MinValue"))
									a1ApplicantPool.Append("<br>")
									a1ApplicantPool.Append("Max: ")
									a1ApplicantPool.Append(aPrimaryWfTaskDO.GetPropertyDouble("MaxValue"))
									a1ApplicantPool.Append("<br>")
									a1ApplicantPool.Append("<br>")
									a1ApplicantPool.Append(aPrimaryWfTaskDO.GetRelatedPropertyString("WfTaskAssignmentReview.PeerCritique"))
									aPrimaryLabel = a1ApplicantPool.ToString()
									ctlPrimaryCritique.Value = aPrimaryLabel + "<br><br>"
								else
									if aMinValue = 0.0 Or aReviewRating = 0.0 then
										a1ApplicantPool.Append("<b>Primary</b><br><br>")
										a1ApplicantPool.Append("Streamlined? ")
										a1ApplicantPool.Append("Yes")
										a1ApplicantPool.Append("<br>")
										a1ApplicantPool.Append("<br>")
										a1ApplicantPool.Append(aPrimaryWfTaskDO.GetRelatedPropertyString("WfTaskAssignmentReview.PeerCritique"))
										aPrimaryLabel = a1ApplicantPool.ToString()
										ctlPrimaryCritique.Value = aPrimaryLabel + "<br><br>"
									end if
								end if
							else
								ctlPrimaryCritique.Visible = False		
							end if
						case 2
							aSecondaryWfTaskDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWftaDO.GetPropertyInt("WfTaskAssignmentID").ToString())
							ctlSecondaryCritique = CType(Me.FindControl("ctlSecondaryCritique"), cLabel)
							if not aSecondaryWfTaskDO is nothing then
								if aStreamLined = False And aMinValue <> 0.0 then
									a2ApplicantPool.Append("<b>Secondary</b><br><br>")
									a2ApplicantPool.Append("Min: ")
									a2ApplicantPool.Append(aSecondaryWfTaskDO.GetPropertyDouble("MinValue"))
									a2ApplicantPool.Append("<br>")
									a2ApplicantPool.Append("Max: ")
									a2ApplicantPool.Append(aSecondaryWfTaskDO.GetPropertyDouble("MaxValue"))
									a2ApplicantPool.Append("<br>")
									a2ApplicantPool.Append("<br>")
									a2ApplicantPool.Append(aSecondaryWfTaskDO.GetRelatedPropertyString("WfTaskAssignmentReview.PeerCritique"))
									aSecondaryLabel = a2ApplicantPool.ToString()
									ctlSecondaryCritique.Value = aSecondaryLabel + "<br><br>"
								else
									if (aMinValue = 0.0 Or aReviewRating = 0.0) then
										a2ApplicantPool.Append("<b>Secondary</b><br><br>")
										a2ApplicantPool.Append("Streamlined? ")
										a2ApplicantPool.Append("Yes")
										a2ApplicantPool.Append("<br>")
										a2ApplicantPool.Append("<br>")
										a2ApplicantPool.Append(aSecondaryWfTaskDO.GetRelatedPropertyString("WfTaskAssignmentReview.PeerCritique"))	
										aSecondaryLabel = a2ApplicantPool.ToString()
										ctlSecondaryCritique.Value = aSecondaryLabel + "<br><br>"
									end if
								end if
							else
								ctlSecondaryCritique.Visible = False
							end if
						case 3
							aReaderWfTaskDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWftaDO.GetPropertyInt("WfTaskAssignmentID").ToString())
							ctlReaderCritique = CType(Me.FindControl("ctlReaderCritique"), cLabel)
							if not aReaderWfTaskDO is nothing then
								if aStreamLined = False And aMinValue <> 0.0 then
									a3ApplicantPool.Append("<b>Reader</b><br><br>")
									a3ApplicantPool.Append("Min: ")
									a3ApplicantPool.Append(aReaderWfTaskDO.GetPropertyDouble("MinValue"))
									a3ApplicantPool.Append("<br>")
									a3ApplicantPool.Append("Max: ")
									a3ApplicantPool.Append(aReaderWfTaskDO.GetPropertyDouble("MaxValue"))
									a3ApplicantPool.Append("<br>")
									a3ApplicantPool.Append("<br>")
									a3ApplicantPool.Append(aReaderWfTaskDO.GetRelatedPropertyString("WfTaskAssignmentReview.PeerCritique"))
									a3ApplicantPool.Append("<br>")
									a3ApplicantPool.Append("<br>")
									aReaderLabel = a3ApplicantPool.ToString()
									ctlReaderCritique.Value = aReaderLabel + "<br><br>"
								else
									if aMinValue = 0.0 Or aReviewRating = 0.0 then
										a3ApplicantPool.Append("<b>Reader</b><br><br>")
										a3ApplicantPool.Append("Streamlined? ")
										a3ApplicantPool.Append("Yes")
										a3ApplicantPool.Append("<br>")
										a3ApplicantPool.Append("<br>")
										a3ApplicantPool.Append(aReaderWfTaskDO.GetRelatedPropertyString("WfTaskAssignmentReview.PeerCritique"))
										a3ApplicantPool.Append("<br>")
										a3ApplicantPool.Append("<br>")
										aReaderLabel = a3ApplicantPool.ToString()
										ctlReaderCritique.Value = aReaderLabel + "<br><br>"
									end if
								end if
							else
								ctlReaderCritique.Visible = False
						end if
					end select
				end if
			next
		end if
   End Sub	
   
'-------------------------------------------------
	
	Public Sub CloseWindow()
		tblCloseWindow.Visible = True
		spnCloseControl.Visible = True
	End Sub	
	
'==============================================================

End Class
End Namespace