Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Implementation.Modules.TIG_ApplReview.Forms.Open_Repl_WebImpr

Public Class cReviewSummary
	Inherits Core_Web.Controls.Base.cLSCDataPresenterCtl

	Protected Overrides Function DataPresenter_Get_DataObjectList(ByRef aDataObjectElement As XmlElement) As cDataObjectList
		Dim aList As cDataObjectList = MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
		If cXMLDoc.AttributeToString(aDataObjectElement, "Key") = "LscTigReviewOpenRepWebImpr" Then
			'if data object does not have recommended amount, populate from request amount
			If aList(0).GetPropertyInt("RecommendedFundingAmount", System.Int32.MinValue) = System.Int32.MinValue Then
				Dim aTigAppList As cDataObjectList = DataObjectCollection("LscTigApp")
				If aTigAppList.Count > 0 Then
					aList(0)("RecommendedFundingAmount") = aTigAppList(0)("GrantRequest")
				End If
			End If
		End If
		Return aList
	End Function

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		Dim aDisplayPropertyNode As XmlNode = Me.mxmldoc.DocElement.SelectSingleNode("DataObject[@Key='LscTigReviewOpenRepWebImpr']/DisplayProperties/DisplayProperty[@PropertyKey='RecommendedFundingAmount']")
		If Not aDisplayPropertyNode Is Nothing Then
			Dim aList As cDataObjectList = Me.DataObjectCollection("LscTigReviewOpenRepWebImpr")
			'If LscTigReviewOpenRepWebImpr is a new data object, populate the control anyway because the data object value has been set.
			If aList(0).IsNewDataObject Then
				DataPresenter_SetCtlValueFromDataObject(aDisplayPropertyNode, aList(0))
			End If
		End If
	End Sub


End Class
End Namespace