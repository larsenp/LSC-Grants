Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User

Namespace Easygrants_Web.Controls.Base

Public MustInherit Class cAnswerList
	Inherits Core.Web.cCoreCtl

'=============================================================
	Protected tabAnswerList As HtmlTable
	Protected valCusGeneral As CustomValidator
	Protected valCusRequired As CustomValidator
'-------------------------------------------------------------
	Private mRequired As Boolean
	Private mQuestionID As Integer
	Private mQuestionAbbr As String
	Private mDisplayPropertyNode As XmlNode
	Private mCheckBoxes As Hashtable = New Hashtable()
	Private mTextBoxes As Hashtable = New Hashtable()
'=============================================================
	Public Property RequiredField() As Boolean
	Get
		RequiredField = valCusRequired.Visible
	End Get
	Set(ByVal Value As Boolean)
		valCusRequired.Visible = Value
	End Set
	End Property
'----------------------------------------------------
	Public Property QuestionID() As Integer
	Get
		QuestionID = mQuestionID
	End Get
	Set(ByVal Value As Integer)
		mQuestionID = Value
	End Set
	End Property
'----------------------------------------------------
	Public Property QuestionAbbr() As String
	Get
		QuestionAbbr = mQuestionAbbr
	End Get
	Set(ByVal Value As String)
		mQuestionAbbr = Value
	End Set
	End Property
'----------------------------------------------------

	Public Overrides Property DisplayPropertyNode() As XmlNode
		Get
			DisplayPropertyNode = mDisplayPropertyNode
		End Get
		Set(ByVal Value As XmlNode)
			mDisplayPropertyNode = Value
		End Set
	End Property
'=============================================================

	Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
		Dim aDataObject As cDataObject
		Dim aTR As HtmlTableRow
		Dim aTD As HtmlTableCell
		Dim aFirst As Boolean = True
		Dim aControlNode As XmlNode
		'Dim aFilterNode As XmlNode
		Dim aQuestionDO As cDataObject
		Dim aConfigureDOL As cDataObjectList
		Dim aID As Integer
		Dim aChk As CheckBox
		Dim aLiteral As HtmlGenericControl
		Dim aText As HtmlInputText

		DisplayPropertyNode = aDisplayPropertyNode
		aControlNode = DisplayPropertyNode.SelectSingleNode("Control")
		QuestionID = cXMLDoc.AttributeToInt(aControlNode, "QuestionID")
		RequiredField = cXMLDoc.AttributeToBool(aControlNode, "RequiredField")
		aQuestionDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("ReferenceQuestion", QuestionID)
		QuestionAbbr = aQuestionDO.GetPropertyString("ReferenceQuestion_Abbr")
		valCusGeneral.ErrorMessage = "Question '" + QuestionAbbr + "': " + valCusGeneral.ErrorMessage
		If RequiredField Then
			valCusRequired.ErrorMessage = "Question '" + QuestionAbbr + "': " + valCusRequired.ErrorMessage
		End If
		aConfigureDOL = aQuestionDO.GetRelatedPropertyDataObjectList("Answers")

		For Each aDataObject In aConfigureDOL
			aID = aDataObject("ReferenceAnswerID")
			aTR = New HtmlTableRow()
			tabAnswerList.Rows.Add(aTR)
			aTD = New HtmlTableCell()
			aTR.Cells.Add(aTD)
			If aFirst Then
				aTD.InnerHtml = aDataObject.GetRelatedPropertyString("Question.Question")
				If RequiredField Then
					aTD.InnerHtml += kDenoteRequiredField
				End If
				aFirst = False
			Else
				aTD.InnerHtml = "&nbsp;"
			End If
			aTD = New HtmlTableCell()
			aTR.Cells.Add(aTD)
			aChk = New CheckBox()
			aChk.Text = aDataObject.GetPropertyString("Answer")
			aTD.Controls.Add(aChk)
			mCheckBoxes.Add(aID, aChk)
			If aDataObject("Specify") Then
				aLiteral = New HtmlGenericControl()
				aLiteral.InnerHtml = "&nbsp;&nbsp;"
				aTD.Controls.Add(aLiteral)
				aText = New HtmlInputText()
				aTD.Controls.Add(aText)
				mTextBoxes.Add(aID, aText)
			End If
		Next
	End Sub
'-------------------------------------------------------------

	Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
		Dim aAnswerDOL As cDataObjectList
		Dim aAnswerDO As cDataObject
		Dim aChk As CheckBox
		Dim aTxt As HtmlInputText

		aAnswerDOL = GetAnswerDataObjectList(aDataObject)
		For Each aAnswerDO In aAnswerDOL
			aChk = CType(mCheckBoxes(aAnswerDO("AnswerID")), CheckBox)
			aChk.Checked = True
			If aAnswerDO.GetRelatedPropertyValue("Answer.Specify") Then
				aTxt = CType(mTextBoxes(aAnswerDO("AnswerID")), HtmlInputText)
				aTxt.Value = aAnswerDO.GetPropertyString("Other")
			End If
		Next
	End Sub
'--------------------------------------------------------------

	Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
		Dim aAnswerDOL As cDataObjectList
		Dim aKey As Integer
		Dim aXMLDoc As cXMLDoc
		Dim aNewDataObjectNode As XmlNode
		Dim aNewDataObject As cDataObject

		'Delete all existing data for this question
		aAnswerDOL = GetAnswerDataObjectList(aDataObject)
		WebSession.DataObjectFactory.DeleteData(aAnswerDOL)

		'Insert a new row for each checked checkbox
		For Each aKey In mCheckBoxes.Keys
			If mCheckBoxes(aKey).Checked Then
				aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignmentReferenceAnswer", aNewDataObjectNode)
				aNewDataObject = WebSession.DataObjectFactory.GetNewDataObject(aNewDataObjectNode)
				aNewDataObject("WfTaskAssignmentID") = CType(CType(Page, cModulePage).ModuleUser, cEGUser).WfTaskAssignmentID
				aNewDataObject("AnswerID") = aKey
				aNewDataObject("Other") = GetOtherValue(aKey)
				WebSession.DataObjectFactory.SaveDataObject(aNewDataObject)
			End If
		Next
	End Sub

'--------------------------------------------------------------

	Private Function GetAnswerDataObjectList(ByVal aDataObject As cDataObject) As cDataObjectList
		Dim aWfTaskAssignmentID As Integer
		Dim aXMLDoc As cXMLDoc
		Dim aAnswerDONode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aArgumentNode As XmlNode

		aWfTaskAssignmentID = aDataObject.GetPropertyInt("WfTaskAssignmentID")
		aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignmentReferenceAnswer", aAnswerDONode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "WfTaskAssignmentID", aWfTaskAssignmentID))
		aArgumentNode = WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "QuestionID", QuestionID)
		aArgumentNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "Answer"))
		aFiltersNode.AppendChild(aArgumentNode)
		Return (WebSession.DataObjectFactory.GetDataObjectList(aAnswerDONode))

	End Function
'--------------------------------------------------------------

	Private Function GetOtherValue(ByVal aKey As Integer) As Object
		If mTextBoxes(aKey) Is Nothing Then
			Return System.DBNull.Value
		Else
			Return GetTextBox(aKey).Value
		End If
	End Function

'--------------------------------------------------------------

   Public Sub ValidateAnswerList(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aKey As Integer

		'If a checkbox is checked and the corresponding text box is empty, the page is invalid.
		For Each aKey In mTextBoxes.Keys 'Need to loop only through those items that have text boxes
			If GetCheckBox(aKey).Checked And GetTextBox(aKey).Value = "" Then
				aArgs.IsValid = False
			End If
		Next
   End Sub
'--------------------------------------------------------------

   Public Sub ValidateAnswerListRequired(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aKey As Integer

		'If no check box is checked, page is invalid.
		For Each aKey In mCheckBoxes.Keys
			If GetCheckBox(aKey).Checked Then Exit Sub
		Next
		aArgs.IsValid = False
   End Sub
'--------------------------------------------------------------

	Private Function GetTextBox(ByVal aKey As Integer) As HtmlInputText
		Return CType(mTextBoxes(aKey), HtmlInputText)
	End Function
'--------------------------------------------------------------

	Private Function GetCheckBox(ByVal aKey As Integer) As CheckBox
		Return CType(mCheckBoxes(aKey), CheckBox)
	End Function
'=============================================================
End Class
End Namespace