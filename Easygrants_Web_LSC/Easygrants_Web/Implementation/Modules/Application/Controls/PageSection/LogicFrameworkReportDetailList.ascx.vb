Imports System.Diagnostics
Imports System.Web.UI
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core.Web
Imports Easygrants.DataAccess.Budget

Namespace Implementation.Modules.Application.Controls.PageSection
Public MustInherit Class cLogicFrameworkReportDetailList
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

	Protected TblOutcomes As HtmlTable
	Protected TblThreats As HtmlTable
	Protected ctlRowNumber As cLabel
	Protected spnRowNumber As HtmlGenericControl

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		ctlRowNumber = Me.FindControl("ctlRowNumber")
	End Sub

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		CreateOutcomesTable()
		CreateThreatsTable()
		Dim SplitControlID As String() = Me.ID.Split("_")
		If SplitControlID.Length > 0 Then
			If IsNumeric(SplitControlID(SplitControlID.Length - 1)) Then
				spnRowNumber.InnerHtml = SplitControlID(SplitControlID.Length - 1) + 1
			End If
		End If
	End Sub

	Private Sub CreateOutcomesTable()
		Dim aTR As HtmlTableRow
		Dim aTD As HtmlTableCell
		Dim aNFWFGranteeProjectLogicFrameworkIndicatorsDOL As cDataObjectList = Me.DataObjectCollection("GranteeProjectLogicFrameworkIndicators")
		For Each aDO As cDataObject In aNFWFGranteeProjectLogicFrameworkIndicatorsDOL
			aTR = New HtmlTableRow

			aTD = New HtmlTableCell
			aTD.Align = "center"
			aTD.InnerHtml = aDO.GetRelatedPropertyString("NFWFIndicatorsTypeDesc")
			aTR.Cells.Add(aTD)

			aTD = New HtmlTableCell
			aTD.Align = "center"
			aTD.InnerHtml = aDO.GetPropertyString("Baseline")
			aTR.Cells.Add(aTD)

			aTD = New HtmlTableCell
			aTD.Align = "center"
			aTD.InnerHtml = aDO.GetPropertyString("Grantcompletion")
			aTR.Cells.Add(aTD)

			aTD = New HtmlTableCell
			aTD.Align = "center"
			aTD.InnerHtml = aDO.GetPropertyString("LongTerm")
			aTR.Cells.Add(aTD)

			aTD = New HtmlTableCell
			aTD.Align = "center"
			aTD.InnerHtml = aDO.GetPropertyString("YearLongTerm")
			aTR.Cells.Add(aTD)

			TblOutcomes.Rows.Add(aTR)
		Next
	End Sub

	Private Sub CreateThreatsTable()
		Dim aTR As HtmlTableRow
		Dim aTD As HtmlTableCell
		Dim aNFWFGranteeProjectLogicFrameworkIndicatorsThreatsDOL As cDataObjectList = Me.DataObjectCollection("NFWFGranteeProjectLogicFrameworkIndicatorsThreats")
		For Each aDO As cDataObject In aNFWFGranteeProjectLogicFrameworkIndicatorsThreatsDOL
			aTR = New HtmlTableRow

			aTD = New HtmlTableCell
			aTD.InnerHtml = aDO.GetPropertyString("ID")
			aTD.Align = "center"
			aTR.Cells.Add(aTD)

			aTD = New HtmlTableCell
			aTD.Align = "center"
			aTD.InnerHtml = aDO.GetRelatedPropertyString("NFWFIndicatorsTypeDesc")
			aTR.Cells.Add(aTD)

			aTD = New HtmlTableCell
			aTD.Align = "center"
			aTD.InnerHtml = aDO.GetPropertyString("Baseline")
			aTR.Cells.Add(aTD)

			aTD = New HtmlTableCell
			aTD.Align = "center"
			aTD.InnerHtml = aDO.GetPropertyString("Grantcompletion")
			aTR.Cells.Add(aTD)

			aTD = New HtmlTableCell
			aTD.Align = "center"
			aTD.InnerHtml = aDO.GetPropertyString("LongTerm")
			aTR.Cells.Add(aTD)

			aTD = New HtmlTableCell
			aTD.Align = "center"
			aTD.InnerHtml = aDO.GetPropertyString("YearLongTerm")
			aTR.Cells.Add(aTD)

			TblThreats.Rows.Add(aTR)
		Next
	End Sub
End Class
End Namespace

