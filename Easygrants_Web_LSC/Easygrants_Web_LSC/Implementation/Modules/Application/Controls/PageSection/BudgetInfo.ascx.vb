Imports System.Web.UI.HtmlControls
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User

Namespace Implementation.Modules.Application.Controls.PageSection
	Public Class cBudgetInfo
		Inherits Core_Web.Controls.Base.cDataPresenterCtl

		Private mCategoryTypeID As Integer
		Private mBudgetEditorPageKey As String

		Protected spnAdd As HtmlGenericControl
		Protected spnBudgetInfo As HtmlGenericControl

		  Public Property CategoryTypeID() As Integer
				Get
					 Return mCategoryTypeID
				End Get
				Set(ByVal value As Integer)
					 mCategoryTypeID = value
				End Set
		  End Property

		  Public Property BudgetEditorPageKey() As String
				Get
					 Return mBudgetEditorPageKey
				End Get
				Set(ByVal value As String)
					 mBudgetEditorPageKey = value
				End Set
		  End Property

		  Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
				MyBase.CoreCtl_Load(aSrc, aEvent)

				'Get PageKey corresponding to the budget category type
				Dim aPageKeysList As XmlNodeList = mXMLDoc.DocElement.SelectNodes("BudgetEditorPageKeys/BudgetCategoryType[@ID='" + mCategoryTypeID.ToString() + "']")
				If aPageKeysList.Count > 0 Then
					 Dim aPageKeysElement As XmlElement = aPageKeysList(0)
					 BudgetEditorPageKey = cXMLDoc.AttributeToString(aPageKeysElement, "PageKey")
				End If

				'Show/hide elements based on whether budget data exists
				Dim aBudgetItemList As cDataObjectList = CType(Me.DataObjectCollection("BudgetItem"), cDataObjectList)
				If aBudgetItemList.Count > 0 Then
					spnAdd.Visible = False
				Else
					spnBudgetInfo.Visible = False
				End If
		  End Sub

		Protected Overrides Function DataPresenter_Get_DataObjectList(ByRef aDataObjectElement As XmlElement) As cDataObjectList
			Dim aDOList As cDataObjectList = MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
			Dim aKey As String = aDataObjectElement.Attributes("Key").Value
			If aKey = "BudgetPeriod" Then
				If aDOList.Count = 0 Then
					Dim aXmlDoc As cXMLDoc
					Dim aDataObjectNode, aFiltersNode As XmlNode
					aDataObjectNode = Nothing
					aFiltersNode = Nothing
					aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("LscCopyAppBudgetInfo", aDataObjectNode, aFiltersNode)
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "wf_task_assignment_id", CType(CType(Page, cModulePage).ModuleUser, cEGWfTAUser).WfTaskAssignmentID))
					WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
					Return MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
				End If
			End If
			Return aDOList
		End Function

	 End Class
End Namespace