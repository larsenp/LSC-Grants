Imports Core_Web.Controls.Base
Imports Core.DataAccess
Imports System.Xml
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User


Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cGrantAward
	Inherits Easygrants_Web.Modules.Staff.Controls.PageSection.cGrantAwardImpl
'=============================================================
	Protected trAdd As HtmlTableRow
	Protected PnlAmendments As Panel
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Dim aGrantAwardAndAmendmentList As cDataObjectList = CType(Me.DataObjectCollection("GrantDetailsGrantAward"), cDataObjectList)
		If aGrantAwardAndAmendmentList.Count > 0 Then
			trAdd.Visible = False
		Else
			PnlAmendments.Visible = False
		End If
	End Sub

	Public Sub Delete(ByVal aGrantAwardAndAmendmentID As String)
		Dim aGrantAwardAmendList As cDataObjectList = CType(Me.DataObjectCollection("GrantDetailsCalculateAwardAmounts"), cDataObjectList)
		Dim aGPInfoDO As cDataObject = aGrantAwardAmendList(0).GetRelatedPropertyDataObject("GranteeProjectInfo")
		Dim aAmendedAmount As Double = Me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GrantAwardAndAmendment", aGrantAwardAndAmendmentID).GetPropertyDouble("AmendmentAmount")
		Dim aGrantAwardAmendDO As cDataObject

		aGPInfoDO("AwardAmount") = aGPInfoDO("AwardAmount") - aAmendedAmount
		aGPInfoDO.SaveData()

		aGrantAwardAmendDO = Me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GrantAwardAndAmendment", aGrantAwardAndAmendmentID)
		Me.WebSession.DataObjectFactory.DeleteData(aGrantAwardAmendDO)
		CorePage.Redirect()
	End Sub
'=============================================================


End Class
End Namespace
