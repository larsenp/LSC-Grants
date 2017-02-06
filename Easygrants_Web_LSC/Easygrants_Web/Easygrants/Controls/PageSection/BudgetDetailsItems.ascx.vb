Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.Web.Modules
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports Core.Web
Imports System.web.UI.HtmlControls

Namespace Easygrants_Web.Controls.PageSection
Public Class cBudgetDetailsItems
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'============================================================= 

		Private mBudget As cBudget
		Private mBudgetPeriodDO As cBudgetPeriod
		Private mBudgetItemList As cDataObjectList
		Private ctlDescription As cTextBox
		Private ctlUnits As cTextBox
		Private ctlUnitCost As cTextBox
		Private ctlTotal As cLabel
		Private ctlTotAmount As cLabel
		'Private ctlDetails As cTextArea
		Protected spnValidator As HtmlGenericControl
		Protected ctlBudgetCategoryID As cLabel
		Protected ctlGuideline As cLink

		Protected ctlGuideLineDesc As cLabel
		Protected ctlIsExternal As cLabel
		Protected spnGuideLineDesc As HtmlGenericControl
		Protected spnIsExternal As HtmlGenericControl
	
'=============================================================
	 Public ReadOnly Property BudgetItemID() As String
		Get
			If Not Request.QueryString("BudgetItemID") Is Nothing Then
				Return Request.QueryString("BudgetItemID")
			Else
				Return "0"
			End If
		End Get
	End Property
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			ctlDescription = Me.FindControl("ctlDescription")
			ctlUnits = Me.FindControl("ctlUnits")
			ctlUnitCost = Me.FindControl("ctlUnitCost")
			ctlTotal = Me.FindControl("ctlTotal")
			'ctlDetails = Me.FindControl("ctlDetails")
			ctlTotAmount = Me.FindControl("ctlTotAmount")
			ctlBudgetCategoryID = Me.FindControl("ctlBudgetCategoryID")
			mBudgetPeriodDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetPeriod", "BudgetID", BudgetID)(0)
			'Me.DataObjectCollection.Add("BudgetPeriod", mBudgetPeriodDO)

			ctlGuideLineDesc = Me.FindControl("ctlGuideLineDesc")
			ctlIsExternal = Me.FindControl("ctlIsExternal")
			spnGuideLineDesc.Visible = False
			spnIsExternal.Visible = False

	End Sub
	Public Overrides Sub CoreCtl_SetValues()
	
			MyBase.CoreCtl_SetValues()

			If BudgetItemID > 0 Then
			mBudgetItemList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetItem", "BudgetItemID", BudgetItemID, "BudgetPeriodID", mBudgetPeriodDO.GetPropertyString("BudgetPeriodID", ""))
			If mBudgetItemList.Count > 0 Then
				If mBudgetItemList(0).GetPropertyInt("BudgetCategoryID", 0) = ctlBudgetCategoryID.Value Then
					ctlDescription.Value = mBudgetItemList(0)("Description")
					ctlUnits.Value = mBudgetItemList(0)("NoOfUnits")
					ctlUnitCost.Value = Format(mBudgetItemList(0)("UnitCost"), "#.##")
					ctlTotal.Value = Format(mBudgetItemList(0)("Amount"), "#,##0.00")
					'ctlDetails.Value = mBudgetItemList(0)("Notes")
				End If
			End If
		End If

		If Not mBudgetPeriodDO Is Nothing Then
			Dim Total As Decimal = 0
			mBudgetItemList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetItem", "BudgetPeriodID", mBudgetPeriodDO.GetPropertyString("BudgetPeriodID", ""), "BudgetCategoryID", ctlBudgetCategoryID.Value)
			For Each mBudgetItemDo As cDataObject In mBudgetItemList
				Total += mBudgetItemDo.GetPropertyDouble("Amount", 0)
			Next
			ctlTotAmount.Value = Format(Total, "#,##0.00")
			ctlBudgetCategoryID.Visible = False

		End If
	End Sub
'=============================================================

	
	Public Sub AddBudgetItem(ByVal PageKey As String, ByVal BudgetPeriodID As String, ByVal ReturnURL As String)
			spnValidator.InnerHtml = ""
			If ctlDescription.Value.Trim = "" Then
				spnValidator.InnerHtml += "Description is required. <br>"
			End If
			If ctlUnits.Value.Trim = "" Then
				spnValidator.InnerHtml += "# of Units is required. <br>"
			End If
			If ctlUnitCost.Value.Trim = "" Then
				spnValidator.InnerHtml += "Per Unit Cost is required. <br>"
			End If
			If spnValidator.InnerHtml.Trim.Length > 0 Then
				Exit Sub
			End If


			Dim mBudgetItemDo As cBudgetItem
			If BudgetItemID > 0 Then
				mBudgetItemList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetItem", "BudgetItemID", BudgetItemID, "BudgetPeriodID", mBudgetPeriodDO.GetPropertyString("BudgetPeriodID", ""))
				If mBudgetItemList.Count > 0 Then
					mBudgetItemDo = mBudgetItemList(0)
				Else
					Exit Sub
				End If
			Else
				mBudgetItemDo = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("BudgetItem")
			End If

			mBudgetItemDo("BudgetCategoryID") = ctlBudgetCategoryID.Value
			mBudgetItemDo("BudgetPeriodID") = mBudgetPeriodDO.GetPropertyInt("BudgetPeriodID")
			mBudgetItemDo("Description") = ctlDescription.Value
			mBudgetItemDo("NoOfUnits") = ctlUnits.Value
			mBudgetItemDo("UnitCost") = ctlUnitCost.Value
			'Here Format has been added bcoz when user enters 2.4 as unit and 345.21 as unit Cost , the total will come upto 1044.504. but we need to store upto 2 values as we are displaying only upto 2 values , if we store more then 2 values we are getting issues with calculations
			mBudgetItemDo("Amount") = Format(ctlUnits.Value * ctlUnitCost.Value, "#.00")
			'mBudgetItemDo("Notes") = ctlDetails.Value
			mBudgetItemDo.SaveData()
			UpdateTotalBudget()


			EventController_NavigateToModulePageKey(PageKey, "BudgetID=" + BudgetID.ToString(), "GranteeProjectID=" + GranteeProjectID.ToString(), "BudgetPeriodID=" + BudgetPeriodID.ToString(), "ReturnURL=" + ReturnURL.ToString)

	End Sub
	Private Sub UpdateTotalBudget()
		Dim Total As Decimal = 0
		Dim aUser As cEGUser
		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		mBudgetItemList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetItem", "BudgetPeriodID", mBudgetPeriodDO.GetPropertyString("BudgetPeriodID"))
		For Each mBudgetItemDo As cDataObject In mBudgetItemList
			Total += mBudgetItemDo.GetPropertyDouble("Amount", 0)
		Next
		mBudget = Me.DataObjectCollection("Budget")(0)
		mBudget("Total") = Total
		mBudget("ModifyUser") = aUser.UserID
		mBudget("ModifyDate") = Now()
		mBudget.SaveData()

		mBudgetPeriodDO("Total") = Total
		mBudgetPeriodDO.SaveData()
	End Sub

	Public Sub DeleteBudgetItem(ByVal BudgetItemID As String)
		WebSession.DataObjectFactory.DeleteData("BudgetItem", BudgetItemID)
		UpdateTotalBudget()
		CorePage.Redirect()
	End Sub

	Protected Overrides Sub OnPreRender(ByVal e As EventArgs)
		MyBase.OnPreRender(e)
		Dim aBuildUrl As String
		ctlGuideline = Me.FindControl("ctlGuideline")
		Dim astring As String = ctlGuideLineDesc.Value
		Dim aBol As Boolean = ctlIsExternal.Value

		If astring.Trim.ToString <> "" Then
			If aBol = True Then
				aBuildUrl = astring
			Else
				aBuildUrl = WebAppl.Build_RootURL(astring)
				ctlGuideline.Href = aBuildUrl
			End If
		End If
	End Sub

'=============================================================
	End Class 'cAddressEditor
End Namespace
