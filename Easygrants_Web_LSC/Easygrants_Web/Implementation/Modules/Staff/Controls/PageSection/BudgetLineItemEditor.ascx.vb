Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Easygrants.DataAccess
Imports Easygrants.DataAccess.Report
Imports EasyGrants.Web
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection

Public Class cBudgetLineItemEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

        Protected ctlLineItemName As cTextBox
        Protected ctlSortOrder As cTextBox
	 Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
            ctlLineItemName = CType(Me.FindControl("ctlLineItemName"), cTextBox)
            ctlSortOrder = CType(Me.FindControl("ctlSortOrder"), cTextBox)

	End Sub

	Public Sub valLineItemName(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
            If ctlLineItemName.Value <> "" Then 'And Request.QueryString("BudgetLineItemID") = 0 Then
                Dim aBudgetCategoryDOList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetCategory", "ProjectID", Request.QueryString("WfProjectID"), "Description", ctlLineItemName.Value, "ParentID", Request.QueryString("BudgetCategoryID"))
                If aBudgetCategoryDOList.Count > 0 Then
                    If CInt(Request.QueryString("BudgetLineItemID")) <> aBudgetCategoryDOList(0).GetRelatedPropertyInt("BudgetCategoryID") Then
                        aArgs.IsValid = False
                        Exit Sub
                    End If
                End If
            End If
            aArgs.IsValid = True
        End Sub
        Public Sub valUniqueLineItemSort(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
            If ctlSortOrder.Value <> "" Then
                Dim aBudgetCategoryDOList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetCategory", "ProjectID", Request.QueryString("WfProjectID"), "SortOrder", ctlSortOrder.Value, "ParentID", Request.QueryString("BudgetCategoryID"))
                If aBudgetCategoryDOList.Count > 0 Then
                    If Not aBudgetCategoryDOList(0).GetPropertyValue("SortOrder") Is System.DBNull.Value Then
                        If CInt(Request.QueryString("BudgetLineItemID")) <> aBudgetCategoryDOList(0).GetRelatedPropertyInt("BudgetCategoryID") Then
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