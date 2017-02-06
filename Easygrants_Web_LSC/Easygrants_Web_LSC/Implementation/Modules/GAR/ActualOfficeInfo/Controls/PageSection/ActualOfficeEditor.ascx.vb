Imports System.Web.UI.WebControls
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base


Namespace Implementation.Modules.GAR.ActualOfficeInfo.Controls.PageSection
	Public Class cActualOfficeEditor
        'Inherits Core_Web.Controls.Base.cDataPresenterCtl
		Inherits Easygrants_Web.Controls.Base.cWfTADataPresenterCtl

		Protected txtOpenDate As cDateTextBox

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			txtOpenDate = GetControl("txtOpenDate")
		End Sub

		Protected Overrides Sub DataPresenter_SetDataObjectValuesFromCtls(ByRef aDataObjectList As cDataObjectList, ByVal aDataObjectElement As XmlNode)
			MyBase.DataPresenter_SetDataObjectValuesFromCtls(aDataObjectList, aDataObjectElement)
			If aDataObjectElement.Attributes("Key").Value = "LscOffice" Then
				If Me.Request.QueryString("LscOfficeID") = "0" Then
					If aDataObjectList.Count > 0 Then
						SetOffID(aDataObjectList(0))
					End If
				End If
			End If
		End Sub

		Protected Sub SetOffID(ByVal aDataObject As cDataObject)
			Dim aOrgID As Integer = aDataObject.GetPropertyInt("OrganizationID")
			Dim aOffTypeID As Integer = aDataObject.GetPropertyInt("OffTypeID")
			Dim aDataObjectNode, aFiltersNode, aSortNode, aSortArgNode As XmlNode
			Dim aOffIDInt As Integer
			Dim aOffID As String

			If aDataObject.GetPropertyInt("OffTypeID") = 1 Then
				aDataObject("OffID") = "00"
			Else
				Dim aXmlDoc As cXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("LscOffice", aDataObjectNode, aFiltersNode)
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "OrganizationID", aOrgID))
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "OffTypeID", aOffTypeID))
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "OffID", "", "And", "NotEqual"))
				aSortNode = aXmlDoc.XMLDocument.CreateElement("Sort")
				aDataObjectNode.AppendChild(aSortNode)
				aSortArgNode = aXmlDoc.XMLDocument.CreateElement("Argument")
				aSortNode.AppendChild(aSortArgNode)
				cXMLDoc.AddAttribute_ToNode(aSortArgNode, "PropertyKey", "OffID")
				cXMLDoc.AddAttribute_ToNode(aSortArgNode, "Direction", "Descending")
				Dim aOffIDList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
				If aOffIDList.Count = 0 Then
					aOffIDInt = 1
				Else
					Try
						aOffIDInt = CType(aOffIDList(0).GetPropertyString("OffID"), Integer) + 1
					Catch
						aOffIDInt = 1
					End Try
				End If
				If aOffIDInt < 10 Then
					aOffID = "0" + aOffIDInt.ToString()
				Else
					aOffID = aOffIDInt.ToString()
				End If
				aDataObject("OffID") = aOffID
			End If

		End Sub
		Public Sub ValidateOpenDate(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
			aArgs.IsValid = True

			'If this is not a new record, no validation is needed.
			If Request.QueryString("LscOfficeID") <> "0" Then Return

			If Me.txtOpenDate.TextBox = "" Then
				aArgs.IsValid = False
			End If
		End Sub
	End Class
End Namespace
