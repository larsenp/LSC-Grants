Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web
Imports EasyGrants.Web.Modules
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports Core.Web

Namespace Easygrants_Web.Implementation.Modules.Application.Controls.Page
Public MustInherit Class cSurvey
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

'========================================================================
	Protected tblSurveyQuestions As HtmlTable

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
		BuildSurveyQuestionsTable()
	End Sub

	Private Sub BuildSurveyQuestionsTable()
		Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		Dim aFiltersNode As XmlNode = Nothing
		Dim aDataObjectNode As XmlNode = Nothing
		Dim aSortNode As XmlNode = Nothing
		Dim aXmlDoc As cXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("SurveyQuestion", aDataObjectNode, aFiltersNode)
		aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode)
		aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "SortOrder", ""))
		Dim aSurveyQuestionsDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
		Dim aSurveyQuestionsDO As cDataObject
		For Each aSurveyQuestionsDO In aSurveyQuestionsDOL
			Dim aSurveyQuestionTR As HtmlTableRow = New HtmlTableRow
			Dim aSurveyQuestionTD As HtmlTableCell = New HtmlTableCell
			Dim aSurveyAnswerTR As HtmlTableRow = New HtmlTableRow
			Dim aSurveyAnswerTD As HtmlTableCell = New HtmlTableCell
			aSurveyQuestionTD.InnerHtml = aSurveyQuestionsDO.GetPropertyString("SortOrder") + ". " + aSurveyQuestionsDO.GetPropertyString("Description")
			aSurveyQuestionTR.Cells.Add(aSurveyQuestionTD)
			tblSurveyQuestions.Rows.Add(aSurveyQuestionTR)
			Dim aDataType As String = aSurveyQuestionsDO.GetPropertyString("DataType", "String")
			Dim aAnswerControlID As String = aUser.WfTaskAssignmentID.ToString + "_" + aSurveyQuestionsDO.GetPropertyString("SurveyQuestionID").ToString
			Dim aAnswerValue As String = ""
			Dim aWfTaskAssignmentSurveyDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentSurvey", "WfTaskAssignmentID", aUser.WfTaskAssignmentID.ToString, "QuestionID", aSurveyQuestionsDO.GetPropertyString("SurveyQuestionID"))
			If aWfTaskAssignmentSurveyDOL.Count > 0 Then
				aAnswerValue = aWfTaskAssignmentSurveyDOL(0).GetPropertyString("Answer", "")
			End If
			If aDataType = "String" Then
				Dim aAnswerTextArea As cTextArea
				aAnswerTextArea = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cTextArea']").Attributes("ControlFile").Value), cTextArea)
				aAnswerTextArea.Rows = 5
				aAnswerTextArea.Cols = 100
				aAnswerTextArea.TooLongMessage = "Limit your answer to question " + aSurveyQuestionsDO.GetPropertyString("SortOrder") + " to 5000 characters."
				aAnswerTextArea.MaxLength = 5000
				aAnswerTextArea.Value = aAnswerValue
				aAnswerTextArea.ID = aAnswerControlID
				aSurveyAnswerTD.Controls.Add(aAnswerTextArea)
			ElseIf aDataType = "Integer" Then
				Dim aAnswerTextBox As cTextBox
				aAnswerTextBox = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cTextBox']").Attributes("ControlFile").Value), cTextBox)
				aAnswerTextBox.Size = 2
				aAnswerTextBox.MaxLength = 2
				aAnswerTextBox.AllowNumbersOnly = True
				aAnswerTextBox.Value = aAnswerValue
				aAnswerTextBox.ID = aAnswerControlID
				aSurveyAnswerTD.Controls.Add(aAnswerTextBox)
			End If
			aSurveyAnswerTR.Cells.Add(aSurveyAnswerTD)
			tblSurveyQuestions.Rows.Add(aSurveyAnswerTR)
			Dim aEmptyTR As HtmlTableRow = New HtmlTableRow()
			Dim aEmptyTD As HtmlTableCell = New HtmlTableCell()
			aEmptyTD.InnerHtml = "&nbsp"
			aEmptyTR.Cells.Add(aEmptyTD)
			tblSurveyQuestions.Rows.Add(aEmptyTR)
		Next
	End Sub

	Public Overrides Sub DataPresenter_SaveDataObjects()
		Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		'Dim aWfTaskAssignmentSurveyDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentSurvey", "WfTaskAssignmentID", aUser.WfTaskAssignmentID.ToString)(0)
		Dim aFiltersNode As XmlNode = Nothing
		Dim aDataObjectNode As XmlNode = Nothing
		Dim aSortNode As XmlNode = Nothing
		Dim aXmlDoc As cXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("SurveyQuestion", aDataObjectNode, aFiltersNode)
		aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode)
		aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "SortOrder", ""))
		Dim aSurveyQuestionDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
		Dim aSurveyQuestionDO As cDataObject
		Dim aCommentsText As String
		For Each aSurveyQuestionDO In aSurveyQuestionDOL
			Dim aAnswerControlID As String = aUser.WfTaskAssignmentID.ToString + "_" + aSurveyQuestionDO.GetPropertyString("SurveyQuestionID").ToString
			Dim aWfTaskAssignmentSurveyDO As cDataObject
			Dim aWfTaskAssignmentSurveyDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentSurvey", "WfTaskAssignmentID", aUser.WfTaskAssignmentID.ToString, "QuestionID", aSurveyQuestionDO.GetPropertyString("SurveyQuestionID"))
			aCommentsText = Request.Form.Item("mPageFrameCtl:ctlPageContent:" + aAnswerControlID + ":txtText")
			If aWfTaskAssignmentSurveyDOL.Count > 0 Then
				aWfTaskAssignmentSurveyDO = aWfTaskAssignmentSurveyDOL(0)
				aWfTaskAssignmentSurveyDO("Answer") = aCommentsText
			Else
				aWfTaskAssignmentSurveyDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskAssignmentSurvey")
				aWfTaskAssignmentSurveyDO("WfTaskAssignmentID") = aUser.WfTaskAssignmentID
				aWfTaskAssignmentSurveyDO("Answer") = aCommentsText
				aWfTaskAssignmentSurveyDO("QuestionID") = aSurveyQuestionDO.GetPropertyInt("SurveyQuestionID")
			End If
			aWfTaskAssignmentSurveyDO.SaveData()
		Next
	End Sub

End Class
End Namespace