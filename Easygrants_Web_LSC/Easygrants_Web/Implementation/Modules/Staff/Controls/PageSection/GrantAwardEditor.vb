Imports Core_Web.Controls.Base
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports Core.Web.Modules
Imports Core.Web
Imports EasyGrants.Web.Modules


Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cGrantAwardEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================
	Protected ctlAwardDate As cDateTextBox
	Protected ctlAwardAmount As cMoneyTextBox
'=============================================================
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		ctlAwardAmount = Me.FindControl("ctlAwardAmount")
		ctlAwardDate = CType(Me.FindControl("ctlAwardDate"), cDateTextBox)
	End Sub

	Public Overrides Sub DataPresenter_SaveDataObjects()
		MyBase.DataPresenter_SaveDataObjects()
		Dim aXmlDoc As cXMLDoc = Nothing
		Dim aFiltersNode As XmlNode = Nothing
		Dim aDataObjectNode As XmlNode = Nothing
		Dim aTotalAmount As Integer
		Dim aTotalAmendmentAmount As Integer

		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("GrantAwardAndAmendment", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "GranteeProjectID", Me.Request.QueryString("GranteeProjectID")))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "AmendmentAmount", "null", "And", "NotEqual"))
		Dim aDOList As cDataobjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
		If Request.QueryString("GrantAwardAndAmendmentID") = 0 Then
			Dim aGPDO As cDataObject
			aGPDO = CType(DataObjectCollection("GrantAwardEditorGranteeProject"), cDataObjectList)(0)
			aGPDO("GrantAwardDate") = ctlAwardDate.DateString
			aGPDO.SaveData()

			Dim aGPIDO As cDataObject
			aGPIDO = CType(DataObjectCollection("GrantAwardEditorGranteeProjectInfo"), cDataObjectList)(0)
			aGPIDO("AwardAmount") = ctlAwardAmount.Value
			aGPIDO.SaveData()
		ElseIf aDOList.Count = 0 Then	' check for the amendment amount if null then do the same logic as add
			Dim aGPDO As cDataObject
			aGPDO = CType(DataObjectCollection("GrantAwardEditorGranteeProject"), cDataObjectList)(0)
			aGPDO("GrantAwardDate") = ctlAwardDate.DateString
			aGPDO.SaveData()

			Dim aGPIDO As cDataObject
			aGPIDO = CType(DataObjectCollection("GrantAwardEditorGranteeProjectInfo"), cDataObjectList)(0)
			aGPIDO("AwardAmount") = ctlAwardAmount.Value
			aGPIDO.SaveData()
		Else
			 ' if the amendment amount is present take the calculation from the amendment list "AwaRD amount" to the baseline award amount
			Dim aGPInfoDO As cDataObject = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectInfo", "GranteeProjectID", Me.Request.QueryString("GranteeProjectID"))(0)
			Dim aDataObjectList As cDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("GrantAwardAndAmendment", "GranteeProjectID", Me.Request.QueryString("GranteeProjectID"))
			Dim aDataObject As cDataObject
			For Each aDataObject In aDataObjectList
				aTotalAmount = aTotalAmount + aDataObject.GetPropertyInt("InitialAwardAmount", 0)
				aTotalAmendmentAmount = aTotalAmendmentAmount + aDataObject.GetPropertyInt("AmendmentAmount", 0)
			Next
			aGPInfoDO("AwardAmount") = aTotalAmount + aTotalAmendmentAmount
			aGPInfoDO.SaveData()
			Dim aGPDO As cDataObject
			aGPDO = CType(DataObjectCollection("GrantAwardEditorGranteeProject"), cDataObjectList)(0)
			aGPDO("GrantAwardDate") = ctlAwardDate.DateString
			aGPDO.SaveData()
		End If

	End Sub



'=============================================================


End Class
End Namespace

