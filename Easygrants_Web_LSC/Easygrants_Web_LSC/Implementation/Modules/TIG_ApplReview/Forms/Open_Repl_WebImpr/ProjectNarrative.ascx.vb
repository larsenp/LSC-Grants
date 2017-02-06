Imports System.Web.UI.HtmlControls
Imports Core.DataAccess

Namespace Implementation.Modules.TIG_ApplReview.Forms.Open_Repl_WebImpr

Public Class cProjectNarrative
	Inherits Core_Web.Controls.Base.cLSCDataPresenterCtl

	Protected trReplHowReplicates As HtmlTableRow
	Protected trReplHowImproves As HtmlTableRow
	Protected trReplAdvantageOverExisting As HtmlTableRow
	Protected trReplEase As HtmlTableRow

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Dim aLscGranteeProjectTig As cDataObjectList = DataObjectCollection("LscGranteeProjectTig")
		Select Case aLscGranteeProjectTig(0).GetPropertyInt("TigGrantTypeID")
			Case 6 'Innovations and Improvements
				trReplHowReplicates.Visible = False
				trReplHowImproves.Visible = False
			Case 19 'Replication
				trReplAdvantageOverExisting.Visible = False
				trReplEase.Visible = False
		End Select
	End Sub

End Class

End Namespace
