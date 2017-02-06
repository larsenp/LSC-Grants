Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User

Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cMedKeywords
	Inherits Core.Web.cCoreCtl
'=============================================================

    Protected tabKeywords As HtmlTable

	Private mDisplayPropertyNode As XmlNode

	'Hashtable to store all checkboxes, keyed on KeywordID
	Private mCheckboxes As Hashtable

	'Hashtable to store "Specify" text boxes appearing next to checkboxes, keyed on KeywordID
	Private mKeywordTextBoxes As Hashtable

	'Hashtable containing hashtables of category-based "Other" text boxes, keyed on KeywordID
	Private mOtherTextBoxHashtables As Hashtable

'=============================================================

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
		Dim aControlNode As XmlNode
		Dim aRelatedDataObjList As cDataObjectList
		Dim aDataObject As cDataObject
		Dim aTR As HtmlTableRow
		Dim aTD As HtmlTableCell
		Dim aChk As CheckBox
		Dim aDescription As String
		Dim aLiteral As HtmlGenericControl
		Dim aText As HtmlInputText
		Dim aKeywordID As Integer
		Dim aCounter As Integer
		Dim aHash As Hashtable

		DisplayPropertyNode = aDisplayPropertyNode
		aControlNode = DisplayPropertyNode.SelectSingleNode("Control")
		mCheckboxes = New Hashtable()
		mKeywordTextBoxes = New Hashtable()
		mOtherTextBoxHashtables = New Hashtable()

		'Get data object list of all available keywords
		aRelatedDataObjList = WebSession.DataObjectFactory.GetDataObjectList(aControlNode)

		For Each aDataObject In aRelatedDataObjList
			aKeywordID = aDataObject("KeywordID")
			If aDataObject("SequenceInCategory") = 0 Then		  'Create checkbox to represent a category
				aTR = New HtmlTableRow()
				aTD = New HtmlTableCell()
				aTD.InnerHtml = "&nbsp;"
				aTR.Cells.Add(aTD)
				tabKeywords.Rows.Add(aTR)
				aTR = New HtmlTableRow()
				tabKeywords.Rows.Add(aTR)
				aTD = New HtmlTableCell()
				aTR.Cells.Add(aTD)
				aTD.ColSpan = 2
				aChk = New CheckBox()
				aDescription = aDataObject("Keyword")
				'Descriptions of category entries in keyword table consist of the category name enclosed in square brackets.
				'We remove the brackets and display just the category name.
				aChk.Text() = "<b>" + aDescription.Substring(1, aDescription.Length - 2) + "</b>"
				aTD.Controls.Add(aChk)
				mCheckboxes.Add(aKeywordID, aChk)
			ElseIf aDataObject.GetPropertyString("Keyword").ToLower() = "other" Then
				aHash = New Hashtable()
				For aCounter = 1 To 4
					aTR = New HtmlTableRow()
					tabKeywords.Rows.Add(aTR)
					aTD = New HtmlTableCell()
					aTR.Cells.Add(aTD)
					aTD.ColSpan = 2
					aLiteral = New HtmlGenericControl()
					aLiteral.InnerHtml = "other:&nbsp;&nbsp;"
					aTD.Controls.Add(aLiteral)
					aText = New HtmlInputText()
					aTD.Controls.Add(aText)
					aHash.Add(aCounter, aText)
				Next
				mOtherTextBoxHashtables.Add(aKeywordID, aHash)
			Else		  'Create checkbox to represent a garden-variety keyword
				aTR = New HtmlTableRow()
				tabKeywords.Rows.Add(aTR)
				aTD = New HtmlTableCell()
				aTR.Cells.Add(aTD)
				aTD.Width = "20"
				aTD = New HtmlTableCell()
				aTR.Cells.Add(aTD)
				aChk = New CheckBox()
				aChk.Text() = aDataObject("Keyword")
				aChk.Attributes.Add("KeywordID", aKeywordID)
				aTD.Controls.Add(aChk)
				mCheckboxes.Add(aKeywordID, aChk)
				If aDataObject("More") Then
					aLiteral = New HtmlGenericControl()
					aLiteral.InnerHtml = "&nbsp;&nbsp;"
					aTD.Controls.Add(aLiteral)
					aText = New HtmlInputText()
					mKeywordTextBoxes.Add(aKeywordID, aText)
					aTD.Controls.Add(aText)
				End If
			End If
		Next

	End Sub

'--------------------------------------------------------------

	Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
		Dim aKeywordsList As cDataObjectList
		Dim aKeywordObj As cDataObject
		'Dim aKeywordTextBox As HtmlInputText
		Dim aCounter As Integer = 1
		Dim aHash As Hashtable
		Dim aText As HtmlInputText

		'Get list of all keywords associated with this workflow task assignment
		aKeywordsList = aDataObject.GetRelatedPropertyDataObjectList("Keywords")
		For Each aKeywordObj In aKeywordsList
			'If the current keyword is "Other", create a text box and display the "other" value.
			'NOTE: this code depends on the proper sorting of the WfTaskAssignmentKeyword data object list, 
			'so that all "other" keywords for a given category are stored together.
			If aKeywordObj.GetRelatedPropertyString("Keyword.Keyword").ToLower = "other" Then
				aHash = mOtherTextBoxHashtables(aKeywordObj("KeywordID"))
				aText = aHash(aCounter)
				aText.Value = aKeywordObj("KeywordOther")
				aCounter += 1
			Else
				aCounter = 1
				CType(mCheckboxes(aKeywordObj("KeywordID")), CheckBox).Checked = True
				If aKeywordObj.GetPropertyString("KeywordOther") <> "" Then
					CType(mKeywordTextBoxes(aKeywordObj("KeywordID")), HtmlInputText).Value = aKeywordObj("KeywordOther")
				End If
			End If
		Next

	End Sub

'--------------------------------------------------------------

	Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
		Dim aKey As Integer
		Dim aSubKey As Integer
		Dim aKeywordsList As cDataObjectList
		Dim aXMLDoc As cXMLDoc
		Dim aNewDataObjectNode As XmlNode
		Dim aNewDataObject As cDataObject
		Dim aHash As Hashtable

		'Delete all existing data for this task assignment
		aKeywordsList = aDataObject.GetRelatedPropertyDataObjectList("Keywords")
		WebSession.DataObjectFactory.DeleteData(aKeywordsList)

		'Insert a new row for each checked checkbox
		For Each aKey In mCheckboxes.Keys
			If mCheckboxes(aKey).Checked Then
				aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignmentKeyword", aNewDataObjectNode)
				aNewDataObject = WebSession.DataObjectFactory.GetNewDataObject(aNewDataObjectNode)
				aNewDataObject("WfTaskAssignmentID") = CType(CType(Page, cModulePage).ModuleUser, cEGUser).WfTaskAssignmentID
				aNewDataObject("KeywordID") = aKey
				aNewDataObject("KeywordOther") = GetKeywordOtherValue(aKey)
				WebSession.DataObjectFactory.SaveDataObject(aNewDataObject)
			End If
		Next

		'Insert a new row for each category-based "other" text box
		For Each aKey In mOtherTextBoxHashtables.Keys
			aHash = mOtherTextBoxHashtables(aKey)
			For Each aSubKey In aHash.Keys
				If aHash(aSubKey).Value <> "" Then
					aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignmentKeyword", aNewDataObjectNode)
					aNewDataObject = WebSession.DataObjectFactory.GetNewDataObject(aNewDataObjectNode)
					aNewDataObject("WfTaskAssignmentID") = CType(CType(Page, cModulePage).ModuleUser, cEGUser).WfTaskAssignmentID
					aNewDataObject("KeywordID") = aKey
					aNewDataObject("KeywordOther") = aHash(aSubKey).Value
					WebSession.DataObjectFactory.SaveDataObject(aNewDataObject)
				End If
			Next
		Next
	End Sub

'--------------------------------------------------------------

	Private Function GetKeywordOtherValue(ByVal aKey As Integer) As Object
		If mKeywordTextBoxes(aKey) Is Nothing Then
			Return System.DBNull.Value
		Else
			Return CType(mKeywordTextBoxes(aKey), HtmlInputText).Value
		End If
	End Function

'=============================================================
End Class
End Namespace