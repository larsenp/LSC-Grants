Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Easygrants.DataAccess
Imports Easygrants.DataAccess.Report
Imports EasyGrants.Web
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection

Public Class cBudgetManagerEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlBudgetCategoryName As cTextBox
	Protected ctlBudgetCategorySort As cTextBox

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)

		ctlBudgetCategoryName = CType(Me.FindControl("ctlBudgetCategoryName"), cTextBox)
		ctlBudgetCategorySort = CType(Me.FindControl("ctlBudgetCategorySort"), cTextBox)

	End Sub

	Public Sub valUniqueBudgetCategory(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		If ctlBudgetCategoryName.Value <> "" Then 'And Request.QueryString("BudgetCategoryID") = 0 Then
			Dim aBudgetCategoryDOList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetCategory", "ProjectID", Request.QueryString("WfProjectID"), "Description", ctlBudgetCategoryName.Value)
			If aBudgetCategoryDOList.Count > 0 Then
				If CInt(Request.QueryString("BudgetCategoryID")) <> aBudgetCategoryDOList(0).GetRelatedPropertyInt("BudgetCategoryID") Then
					aArgs.IsValid = False
					Exit Sub
				End If
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

	Public Overrides Sub DataPresenter_SaveDataObjects()
		MyBase.DataPresenter_SaveDataObjects()
		Dim aBudgetCategoryDO As cDataObject = CType(DataObjectCollection("BudgetCategory"), cDataObjectList)(0)
		'If IsIndirectCost is set to True, set it to False for all other Project Categories.
		Dim aFiltersNode As XmlNode = Nothing
		Dim aDataObjectNode As XmlNode = Nothing
		Dim aXmlDoc As cXMLDoc = Nothing
		Dim aSortNode As XmlNode = Nothing
		Dim aDOL As cDataObjectList
		Dim aDO As cDataObject
		If aBudgetCategoryDO.GetRelatedPropertyBool("IsIndirectCost", False) = True Then
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("BudgetCategory", aDataObjectNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ProjectID", aBudgetCategoryDO.GetRelatedPropertyString("ProjectID")))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "IsIndirectCost", "True"))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, "("))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "BudgetCategoryID", aBudgetCategoryDO.GetPropertyString("BudgetCategoryID"), "", "NotEqual"))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ParentID", aBudgetCategoryDO.GetPropertyString("BudgetCategoryID"), "Or"))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, ")", ""))
			aDOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
			For Each aDO In aDOL
				aDO("IsIndirectCost") = False
				aDO.SaveData()
			Next
		End If
		'Update IsIndirectCost of all line items to that of the Category
		Dim aLineItemDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetCategory", "ParentID", aBudgetCategoryDO.GetPropertyString("BudgetCategoryID"))
		Dim aLineItemDO As cDataObject
		For Each aLineItemDO In aLineItemDOL
			aLineItemDO("IsIndirectCost") = aBudgetCategoryDO.GetRelatedPropertyBool("IsIndirectCost", False)
			aLineItemDO.SaveData()
		Next
	End Sub

End Class
End Namespace