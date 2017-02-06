Imports Core.DataAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Easygrants_Web.Controls.Base
Imports Core_Web.Controls.Base
Imports EasyGrants.Web


Namespace Easygrants_Web.Modules.Application.Controls.PageSection
	Public MustInherit Class cParticipantOrgEditor
		Inherits Core_Web.Controls.Base.cDataPresenterCtl

		Private BudgetDO As cDataObjectList
		Private mBudgetPeriodsList As cDataObjectList
		Private WfProjectDOL As cDataObjectList

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
		End Sub

		Public Overrides Sub DataPresenter_SaveDataObjects()
			MyBase.DataPresenter_SaveDataObjects()

			BudgetDO = Me.DataObjectCollection("Budget")
			mBudgetPeriodsList = BudgetDO(0).GetRelatedPropertyDataObjectList("BudgetPeriods")
			WfProjectDOL = Me.DataObjectCollection("WfProject")

			Dim aBudgetPeriodDO As cDataObject
			Dim i As Integer = 0
			If Not mBudgetPeriodsList Is Nothing Then
				i = mBudgetPeriodsList.Count
			End If
			For i = (i + 1) To WfProjectDOL(0).GetPropertyInt("AwardTerm", 0)
				aBudgetPeriodDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("BudgetPeriod")
				aBudgetPeriodDO("BudgetID") = BudgetDO(0).GetPropertyInt("BudgetID")
				aBudgetPeriodDO("BudgetPeriodName") = "Budget Period " + i.ToString()
				aBudgetPeriodDO("BudgetPeriodNameID") = i
				aBudgetPeriodDO("BudgetYear") = "Year " + i.ToString()
				aBudgetPeriodDO("BudgetPeriodDescription") = "Budget Period " + i.ToString()
				aBudgetPeriodDO("BudgetPeriodDescriptionID") = i
				aBudgetPeriodDO.SaveData()
			Next
		End Sub
	End Class
End Namespace