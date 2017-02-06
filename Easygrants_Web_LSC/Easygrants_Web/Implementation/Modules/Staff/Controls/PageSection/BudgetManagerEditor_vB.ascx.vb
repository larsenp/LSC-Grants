Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Easygrants.DataAccess
Imports Easygrants.DataAccess.Report
Imports EasyGrants.Web
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection

Public Class cBudgetManagerEditor_vB
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

        Protected ctlBudgetCategoryName As cTextBox
        Protected ctlBudgetCategorySort As cTextBox

	 Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)

		ctlBudgetCategoryName = CType(Me.FindControl("ctlBudgetCategoryName"), cTextBox)
            ctlBudgetCategorySort = CType(Me.FindControl("ctlBudgetCategorySort"), cTextBox)
	End Sub

	Public Sub valUniqueBudgetCategory(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		If ctlBudgetCategoryName.Value <> "" And Request.QueryString("BudgetCategoryID") = 0 Then
			Dim aBudgetCategoryDOList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetCategory", "ProjectID", Request.QueryString("WfProjectID"), "Description", ctlBudgetCategoryName.Value)
			If aBudgetCategoryDOList.Count > 0 Then
				aArgs.IsValid = False
				Exit Sub
			End If
		End If
		aArgs.IsValid = True
   End Sub

        Public Sub valUniqueBudgetCategorySort(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
            If ctlBudgetCategorySort.Value <> "" Then
                Dim aBudgetCategoryDOTotal As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetCategory", "ProjectID", Request.QueryString("WfProjectID"), "Description", "Total")
                Dim cntParentId As Integer
                If aBudgetCategoryDOTotal.Count > 0 Then
                    cntParentId = aBudgetCategoryDOTotal(0).GetRelatedPropertyInt("BudgetCategoryID")
                Else
                    cntParentId = 0
                End If

                Dim aBudgetCategoryDOList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetCategory", "ProjectID", Request.QueryString("WfProjectID"), "SortOrder", ctlBudgetCategorySort.Value, "ParentID", cntParentId)
                If aBudgetCategoryDOList.Count > 0 Then
                    If Not aBudgetCategoryDOList(0).GetPropertyValue("SortOrder") Is System.DBNull.Value Then
                        If CInt(Request.QueryString("BudgetCategoryID")) <> aBudgetCategoryDOList(0).GetRelatedPropertyInt("BudgetCategoryID") Then
                            aArgs.IsValid = False
                            Exit Sub
                        End If
                    End If
                End If
            End If
            aArgs.IsValid = True
        End Sub
End Class
End Namespace