Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports Easygrants.Web.User
Imports System.Xml
Imports Core.DataAccess.XMLAccess
Imports Core.Web

Namespace Implementation.Modules.Application.Controls.PageSection

Public Class cSoftwareGrid
		Inherits Core_Web.Controls.Base.cDataPresenterCtl

Protected mCategoriesDOList As cDataObjectList 'the list containing the header categories 
Protected mCategoriesChildProperty As String	'the related property of the rows data object list that retrieves the parent type or category ID
Protected tblGrid As HtmlTable
		'Protected mGranteeProjectID As Integer
		Protected mOrganizationDOList As cDataObject
		Protected mTimePeriodDOList As cDataObject

		Protected mOrganizationID As Integer
		Protected mTimePeriodID As Integer

Protected mWfTaskAssignmentID As Integer

Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		mCategoriesDOList = DataObjectCollection("LscSoftwareType")
		mCategoriesChildProperty = "LscSoftwareProducts"
		Dim aRightMost As Integer = 1
		mWfTaskAssignmentID = CType(CType(Page, cModulePage).ModuleUser, cEGWfTAUser).WfTaskAssignmentID
			mOrganizationDOList = DataObjectCollection("GranteeProject")(0)
			mTimePeriodDOList = DataObjectCollection("WfTACompetitionYear")(0)

			mOrganizationID = mOrganizationDOList.GetPropertyInt("PrimaryOrganizationID")
			mTimePeriodID = mTimePeriodDOList.GetPropertyInt("TimePeriodID")

		BuildGrid(mCategoriesDOList, 1, aRightMost)

End Sub

Public Overridable Sub BuildGrid(ByVal aCategoriesDOList As cDataObjectList, _
									ByVal aIndent As Integer, ByRef aRightMost As Integer)
		Dim aCategoryDO As cDataObject
		Dim aSortedList As SortedList = New SortedList()
		Dim aTypeID As Integer = 0
		Dim aRowsDOList As cDataObjectList
		Dim aRowDO As cDataObject
		Dim aTR As HtmlTableRow
            Dim aXMLDoc As cXMLDoc 'Added 
            Dim aDOEl As XmlElement 'Added
            Dim aFiltersEl As XmlElement 'Added
            Dim aSortEl As XmlElement


		If aCategoriesDOList Is Nothing Then Exit Sub
		If aCategoriesDOList.Count = 0 Then Exit Sub

		'For Each aCategoryDO In aCategoriesDOList
		'	aSortedList.Add(aCategoryDO("SortOrder"), aCategoryDO)
		'Next

		BuildHeader(tblGrid)
		For Each aCategoryDO In aCategoriesDOList
			'If aCategoryDO("EndDate") Is System.DBNull.Value OrElse aCategoryDO("EndDate") > DateTime.Now() Then
				aTR = BuildSubhead(tblGrid, aCategoryDO)
                'aRowsDOList = aCategoryDO.GetRelatedPropertyDataObjectList(mCategoriesChildProperty) - Commented
                aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("LscSoftwareProduct", aDOEl, aFiltersEl)

                aFiltersEl.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "LscSoftwareTypeID", aCategoryDO.GetPropertyInt("LscSoftwareTypeID")))
                aSortEl = aXMLDoc.CreateSortNode()
                aSortEl.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "SortOrder", " "))
                aDOEl.AppendChild(aSortEl)
                aRowsDOList = WebSession.DataObjectFactory.GetDataObjectList(aDOEl)



				For Each aRowDO In aRowsDOList
					If aRowDO("EndDate") Is System.DBNull.Value OrElse aRowDO("EndDate") > DateTime.Now() Then
						aTR = BuildDetailRow(tblGrid, aRowDO)
					End If
				Next
				aTR = BuildSubtotalRow(tblGrid, aCategoryDO)
			'End If
		Next
		aTR = BuildTotalRow(tblGrid)

End Sub

Public Function BuildHeader(ByVal aTable As HtmlTable) As HtmlTableRow
	Return CType(Nothing, HtmlTableRow)
End Function

Public Function BuildTotalRow(ByVal aTable As HtmlTable) As HtmlTableRow
	Return CType(Nothing, HtmlTableRow)
End Function

Public Function BuildSubhead(ByVal aTable As HtmlTable, ByVal aCategoryDO As cDataObject) As HtmlTableRow
	Dim aTR As New HtmlTableRow
	Dim aTD As New HtmlTableCell

	'Separator row
	aTD.Attributes.Add("class", "SeparatorHdg")
	aTD.InnerHtml = aCategoryDO.GetPropertyString("Description")
	aTD.ColSpan = 7
	aTR.Cells.Add(aTD)
	aTable.Rows.Add(aTR)

	'Column header row
	aTR = New HtmlTableRow
	aTD = New HtmlTableCell
	aTD.InnerHtml = "&nbsp;"
	aTD.ColSpan = 4
			'aTR.Cells.Add(aTD)
			'aTD = New HtmlTableCell
			'aTD.ColSpan = 2
			'aTD.InnerHtml = "<b>Version</b>"
	aTR.Cells.Add(aTD)
	aTD = New HtmlTableCell
	aTD.ColSpan = 2
	aTD.InnerHtml = "<b>Percentage Staff</b>"
	aTR.Cells.Add(aTD)
	aTable.Rows.Add(aTR)

	Return aTR

End Function

Public Function BuildSubtotalRow(ByVal aTable As HtmlTable, ByVal aCategoryDO As cDataObject) As HtmlTableRow
	Return CType(Nothing, HtmlTableRow)

End Function

Public Function BuildDetailRow(ByVal aTable As HtmlTable, ByVal aRowDO As cDataObject) As HtmlTableRow
	Dim aTR As New HtmlTableRow
	Dim aTD1 As HtmlTableCell
	Dim aTD2 As HtmlTableCell
	Dim aTD3 As HtmlTableCell
	Dim aTD4 As HtmlTableCell
	Dim aTD5 As HtmlTableCell
	Dim aTD6 As HtmlTableCell
	Dim aTD7 As HtmlTableCell
	Dim aTD8 As HtmlTableCell
	Dim aDetailDOList As cDataObjectList
	Dim aDetailDO As cDataObject
	Dim aPopulate As Boolean = False

	Dim aRowIndexID As Integer = aRowDO.GetPropertyInt("LscSoftwareProductID")

			'aDetailDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscSoftware", "WfTaskAssignmentID", mWfTaskAssignmentID.ToString, _
			'"LscSoftwareProductID", aRowIndexID.ToString())
			aDetailDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscSoftware", "OrganizationID", mOrganizationID.ToString, "TimePeriodID", mTimePeriodID.ToString, _
			  "LscSoftwareProductID", aRowIndexID.ToString())
	If aDetailDOList.Count > 0 Then
		aDetailDO = aDetailDOList(0)
		aPopulate = True
	End If

	'Spacer
	aTD1 = New HtmlTableCell
	aTD1.Width = "5%"
	aTD1.InnerHtml = "&nbsp;"
	aTR.Cells.Add(aTD1)

	'Checkbox
	aTD2 = New HtmlTableCell
	aTD2.Width = "5%"
	Dim aChk As cCheckBox
	aChk = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cCheckBox']").Attributes("ControlFile").Value), cCheckBox)
	If aPopulate Then
		If aDetailDO.GetPropertyBool("InUse", False) Then aChk.BaseCheckButton.Checked = True
	End If
	aChk.ID = aRowIndexID.ToString + "_InUse"
	aTD2.Controls.Add(aChk)
	aTR.Cells.Add(aTD2)

	'Software product name
	aTD3 = New HtmlTableCell
	aTD3.InnerHtml = aRowDO.GetPropertyString("Description")
	aTR.Cells.Add(aTD3)

	'Spacer
	aTD4 = New HtmlTableCell
	aTD4.Width = "5%"
	aTD4.InnerHtml = "&nbsp;"
	aTR.Cells.Add(aTD4)

	'Version text box
			'aTD5 = New HtmlTableCell
			'Dim aVersionTB As cTextBox
			'aVersionTB = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cTextBox']").Attributes("ControlFile").Value), cTextBox)
			'If aPopulate Then
			'	aVersionTB.Value = aDetailDO.GetPropertyString("Version")
			'End If
			'aVersionTB.MaxLength = 50
			'aVersionTB.ID = aRowIndexID.ToString + "_Version"
			'aTD5.Controls.Add(aVersionTB)
			'aTR.Cells.Add(aTD5)

	'Spacer
			'aTD6 = New HtmlTableCell
			'aTD6.Width = "5%"
			'aTD6.InnerHtml = "&nbsp;"
			'aTR.Cells.Add(aTD6)

	'Percent staff text box
	aTD7 = New HtmlTableCell
	Dim aPercentTB As cMoneyTextBox
	aPercentTB = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cMoneyTextBox']").Attributes("ControlFile").Value), cMoneyTextBox)
	aPercentTB.BaseTextBox.Style.Add("text-align", "right")
	aPercentTB.MaxInputDecimalPlaces = 0
	aPercentTB.RegExErrorMessage = "Percentage Staff, where provided, must be a whole number between 0 and 100."
	aPercentTB.DecimalErrorMessage = "Percentage Staff, where provided, must be a whole number between 0 and 100."
	aPercentTB.MaxLength = 3
	aPercentTB.DecimalErrorMessage = """Percentage staff"" must be a whole number."
	aPercentTB.RegExErrorMessage = """Percentage staff"" must be a whole number."
	If aPopulate Then
		If Not aDetailDO("PercentStaff") Is System.DBNull.Value Then
			aPercentTB.Value = aDetailDO.GetPropertyInt("PercentStaff")
		End If
	End If
	aPercentTB.ID = aRowIndexID.ToString + "_Percent"
	aTD7.Controls.Add(aPercentTB)
	Dim aVal As RangeValidator
	aVal = New RangeValidator
	aVal.ControlToValidate = aPercentTB.ID
	aVal.Type = ValidationDataType.Integer
	aVal.MaximumValue = 100
	aVal.MinimumValue = 0
	aVal.ErrorMessage = "Percentage Staff, where provided, must be a whole number between 0 and 100."
	aVal.Display = ValidatorDisplay.None
	aTD7.Controls.Add(aVal)
	aTR.Cells.Add(aTD7)

	aTable.Rows.Add(aTR)
	Return aTR

End Function

	Public Overrides Sub DataPresenter_SaveDataObjects()
	Dim aCategoryDO As cDataObject
	Dim aRowsDOList As cDataObjectList
	Dim aRowDO As cDataObject

	For Each aCategoryDO In mCategoriesDOList
		aRowsDOList = aCategoryDO.GetRelatedPropertyDataObjectList(mCategoriesChildProperty)
		For Each aRowDO In aRowsDOList
			If aRowDO("EndDate") Is System.DBNull.Value OrElse aRowDO("EndDate") > DateTime.Now() Then
				SaveRow(aRowDO)
			End If
		Next aRowDO
	Next aCategoryDO


	End Sub

Public Sub SaveRow(ByVal aRowDO As cDataObject)
	Dim aDetailDOList As cDataObjectList
	Dim aDetailDO As cDataObject
	Dim aDataExists As Boolean
	Dim aValuesExist As Boolean
	Dim aChk As cCheckBox
	Dim aVersionTB As cTextBox
	Dim aPercentTB As cMoneyTextBox
	Dim aRowIndexID As Integer

	'Check for existing data
	aRowIndexID = aRowDO.GetPropertyInt("LscSoftwareProductID")
	aDataExists = False
			'aDetailDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscSoftware", "WfTaskAssignmentID", mWfTaskAssignmentID.ToString, _
			'"LscSoftwareProductID", aRowIndexID)
			aDetailDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscSoftware", "OrganizationID", mOrganizationID.ToString, "TimePeriodID", mTimePeriodID.ToString, _
  "LscSoftwareProductID", aRowIndexID)
	If aDetailDOList.Count > 0 Then
		aDetailDO = aDetailDOList(0)
		aDataExists = True
	End If
	'Collect values from data collection controls
	aChk = CType(Me.FindControl(aRowIndexID.ToString + "_InUse"), cCheckBox)
			'aVersionTB = CType(Me.FindControl(aRowIndexID.ToString + "_Version"), cTextBox)
	aPercentTB = CType(Me.FindControl(aRowIndexID.ToString + "_Percent"), cMoneyTextBox)
			'If Not aChk.Value = True And aVersionTB.Value = "" And aPercentTB.Value = "" Then
			If Not aChk.Value = True And aPercentTB.Value = "" Then
				aValuesExist = False
			Else
				aValuesExist = True
			End If

			If aValuesExist Then
				If Not aDataExists Then
					'If values exist and data does not exist, create new data object and save
					aDetailDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("LscSoftware")
					aDetailDO("LscSoftwareProductID") = aRowIndexID
					'aDetailDO("WfTaskAssignmentID") = mWfTaskAssignmentID
					aDetailDO("OrganizationID") = mOrganizationID
					aDetailDO("TimePeriodID") = mTimePeriodID
				End If
				'If values exist and data exists, save data
				aDetailDO("InUse") = aChk.Value
				'aDetailDO("Version") = aVersionTB.Value
				aDetailDO("PercentStaff") = aPercentTB.Value
				aDetailDO.SaveData()
			Else
				'If values do not exist and data exists, delete data
				WebSession.DataObjectFactory.DeleteData(aDetailDO)
				'If values do not exist and data does not exist, do nothing
			End If


		End Sub
End Class

End Namespace
