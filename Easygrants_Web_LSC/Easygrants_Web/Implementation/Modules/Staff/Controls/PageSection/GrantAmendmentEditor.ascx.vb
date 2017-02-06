Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports System.Xml
Imports Core.DataAccess.XMLAccess


Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cGrantAmendmentEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================
	Protected ctlAmendmentAmount As cMoneyTextBox
'=============================================================
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		ctlAmendmentAmount = CType(Me.FindControl("ctlAmendmentAmount"), cMoneyTextBox)
	End Sub

'=============================================================

	Public Overrides Sub DataPresenter_SaveDataObjects()
		Dim aGrantAwardAmendDO As cDataObject = CType(Me.DataObjectCollection("GrantAmendEditorGrantAwardAndAmendment"), cDataObjectList)(0)
		Dim aGPInfoDO As cDataObject = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectInfo", "GranteeProjectID", Me.Request.QueryString("GranteeProjectID"))(0)
		Dim aAmendmentAmount As Double = 0
		Dim aCurrAmendmentAmount As Double = 0

		aAmendmentAmount = aGrantAwardAmendDO.GetPropertyDouble("AmendmentAmount", 0)
		MyBase.DataPresenter_SaveDataObjects()

		'update total award amount for grant 
		'  if amendment amount value changes for edited amendments, add or subtract difference from award amount for edited records.
		'  otherwise just add amendment amount to award amount
		Dim aDataObjectList As cDataObjectList = CType(Me.DataObjectCollection("GrantAmendEditorGrantCalculateAwardAmounts"), cDataObjectList)
		If Request.QueryString("GrantAwardAndAmendmentID") > "0" Then
			If Convert.ToDouble(ctlAmendmentAmount.Value) <> aAmendmentAmount Then
				aCurrAmendmentAmount = Convert.ToDouble(ctlAmendmentAmount.Value) - aAmendmentAmount
			End If
			aGPInfoDO("AwardAmount") = aDataObjectList(0).GetPropertyDouble("AwardAmount", 0) + aCurrAmendmentAmount
		Else
			aGPInfoDO("AwardAmount") = aGPInfoDO.GetPropertyDouble("AwardAmount") + Convert.ToDouble(ctlAmendmentAmount.Value)
		End If
		aGPInfoDO.SaveData()
	End Sub

End Class
End Namespace

