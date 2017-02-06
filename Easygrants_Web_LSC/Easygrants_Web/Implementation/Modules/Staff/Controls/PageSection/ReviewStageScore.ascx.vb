Imports Core.Web
Imports Core_Web.Controls.Base
Imports Core.DataAccess
Imports EasyGrants.Web.User
Imports Core.Web.Modules
Imports System.Collections

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cReviewStageScore
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlNewWindowOpener As cNewWindowOpener

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub

	Public Sub VarianceReport(aReviewCommitteeID As String, aReviewCycleStageID As String, aReviewCycleID As String)
		Dim aHref As String
		Dim aUser As cEGUser
        dim aWftaDOList as cDataObjectList
        dim aWftaDO as cDataObject
        dim aMax as Decimal = 0
        dim aReviewRating as Decimal
        dim aMaxReviewRating as Decimal = 0

		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
        
		dim aGPRevStageDOList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectReviewStage", "ReviewCommitteeID", _
		    aReviewCommitteeID, "ReviewCycleStageID", aReviewCycleStageID)
        if aGPRevStageDOList.Count > 0 then
            dim aGPRevStageDO as cDataObject
            for each aGPRevStageDO in aGPRevStageDOList
                if aGPRevStageDO.GetPropertyDecimal("Variance") >= 2 then
                    aWftaDOList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "GranteeProjectID", _
                        aGPRevStageDO.GetPropertyInt("GranteeProjectID", 0).ToString(), "ReviewCycleStageID", aReviewCycleStageID)
                    if aWftaDOList.Count > 0 then
                        dim aMin as Decimal = 0
                        dim aInitialWftaID as Integer
                        dim aCount as Integer = 0 
                        for each aWftaDO in aWftaDOList       
                            dim aVariance as Decimal = 0   
							'aReviewRating = aWftaDO.GetPropertyValue("ReviewRating")
							aReviewRating = aWftaDO.GetPropertyDecimal("ReviewRating", 0)
                            if (aReviewRating > aMaxReviewRating) then
                                aMaxReviewRating = aReviewRating
                            End If
                        Next
                    End If
                    if aWftaDOList.Count > 0 then
                        for each aWftaDO in aWftaDOList
							If (aMaxReviewRating - aWftaDO.GetPropertyDecimal("ReviewRating", 0) >= 2) Or (aMaxReviewRating = aWftaDO.GetPropertyDecimal("ReviewRating", 0)) Then
								aWftaDO("IsVarianceReviewer") = True
								aWftaDO.SaveData()
							End If
                        Next
                    end if
                end if
            next
        End If

        aHref = me.Request.RawUrl()
		aHref = aHref.Substring(0, aHref.IndexOf("&"))
		aHref = cWebLib.AddQuerystringParameter(aHref, "Page", "VarianceReport") 
		aHref = cWebLib.AddQuerystringParameter(aHref, "ReviewCommitteeID", aReviewCommitteeID) 
		aHref = cWebLib.AddQuerystringParameter(aHref, "ReviewCycleStageID", aReviewCycleStageID) 
		aHref = cWebLib.AddQuerystringParameter(aHref, "ReviewCycleID", aReviewCycleID) 
		aHref = cWebLib.AddQuerystringParameter(aHref, "PageFrame", "Print") 
		
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub	

	Public Sub ViewHistory(aPage As String, aReviewCycleStageID As String, aReviewCycleID As String)
		Dim aHref As String
		aHref = Request.RawUrl()
		aHref = aHref.Substring(0, aHref.IndexOf("&"))
		aHref = cWebLib.AddQuerystringParameter(aHref, "Page", aPage)
		aHref = cWebLib.AddQuerystringParameter(aHref, "ReviewCycleStageID", aReviewCycleStageID) 
		aHref = cWebLib.AddQuerystringParameter(aHref, "ReviewCycleID", aReviewCycleID) 
		aHref = cWebLib.AddQuerystringParameter(aHref, "PageFrame", "Print") 
		
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub	

End Class
End Namespace