Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public MustInherit Class cRatingsByRev
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected spnCount As HtmlGenericControl

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		Dim ctlList As cDataListCtl
		Dim aCheckboxHash As Hashtable
		Dim aChk As cCheckBox
		Dim aSelected As String
		Dim aIndex As Integer
		Dim aID As Integer

		ctlList = FindControl("ctlList")
		aCheckboxHash = ctlList.DataListCtl_GetControlCollection("chkFlag")
		aSelected = Request.QueryString("Selected")
		If Not aSelected Is Nothing Then
			While aSelected <> ""
				aIndex = aSelected.IndexOf(",")
				If aIndex > -1 Then
					aID = Integer.Parse(aSelected.Substring(0, aIndex))
					aSelected = aSelected.Substring(aIndex + 1)
				Else
					aID = Integer.Parse(aSelected)
					aSelected = ""
				End If				
				aChk = CType(aCheckboxHash(aID), cCheckBox)
				If Not aChk Is Nothing Then
					aChk.BaseCheckButton.Checked = True
				End If
			End While
		End If
		
		spnCount.InnerText = CType(DataObjectCollection("WfTaskAssignment"), cDataObjectList).Count
	End Sub
	
	Public Overrides Sub LoadConfigXML()
		Me.mXMLDoc.LoadFromXML(spnConfigXML.InnerText)
        
		if me.Request.QueryString("ID") = "" then
			dim aNode as XmlNode = cXMLDoc.FindNode(mXMLDoc.DocElement.SelectSingleNode("DataObject/Filters"), "Argument", "TypeKey", "ID")
			me.mXMLDoc.DocElement.SelectSingleNode("DataObject/Filters").RemoveChild(aNode)
		End If		
    End Sub
    
	Public Sub CheckClearAll(ByVal aAction As String)
		Dim aCheckboxHash As Hashtable
		Dim aCheckbox As cCheckBox
		Dim ctlList As cDataListCtl

		ctlList = FindControl("ctlList")
		aCheckboxHash = ctlList.DataListCtl_GetControlCollection("chkFlag")

		Dim myEnumerator As IDictionaryEnumerator = aCheckboxHash.GetEnumerator()
		While myEnumerator.MoveNext()
			aCheckbox = CType(myEnumerator.Value, cCheckBox)
			If aAction.ToLower = "check" Then
				aCheckbox.BaseCheckButton.Checked = True
			ElseIf aAction.ToLower = "clear" Then
				aCheckbox.BaseCheckButton.Checked = False
			End If
		End While
		Refresh("CheckClearAll")
	End Sub

	Public Sub UpdateStatus(ByVal aStatusStr As String)
		Dim aStatus As Integer
		Dim aRatingsDOList As cDataObjectList
		Dim aRatingsDO As cDataObject
		Dim aCheckboxHash As Hashtable
		Dim aChk As cCheckBox
		Dim ctlList As cDataListCtl
		Dim aDate As Date

		aStatus = Convert.ToInt32(aStatusStr)
		aRatingsDOList = CType(DataObjectCollection("WfTaskAssignment"), cDataObjectList)
		ctlList = FindControl("ctlList")
		aCheckboxHash = ctlList.DataListCtl_GetControlCollection("chkFlag")
		aDate = System.DateTime.Now
		For Each aRatingsDO In aRatingsDOList
			aChk = CType(aCheckboxHash(aRatingsDO.GetPropertyInt("WfTaskAssignmentID")), cCheckBox)
			If aChk.BaseCheckButton.Checked Then
				aRatingsDO("WfTaskStatusID") = aStatus
				aRatingsDO("SubmittedDate") = aDate
				aRatingsDO.SaveData()
			End If
		Next
		Refresh("Go")
	End Sub

	Public Sub Refresh(aAnchor As String)
		Dim aURL As String
		Dim ctlList As cDataListCtl
		Dim aCheckboxHash As Hashtable
		Dim aDOList As cDataObjectList
		Dim aDO As cDataObject
		Dim aChk As cCheckBox
		Dim aSelected As String

		ctlList = FindControl("ctlList")
		aCheckboxHash = ctlList.DataListCtl_GetControlCollection("chkFlag")
		aSelected = ""
		aDOList = CType(DataObjectCollection("WfTaskAssignment"), cDataObjectList)
		For Each aDO In aDOList
			aChk = CType(aCheckboxHash(aDO.GetPropertyInt("WfTaskAssignmentID")), cCheckBox)
			If (Not aChk Is Nothing) And (aChk.BaseCheckButton.Checked) Then
				aSelected += aDO.GetPropertyString("WfTaskAssignmentID") + ","
			End If
		Next
		If aSelected.Length > 0 Then
			aSelected = aSelected.Substring(0, aSelected.Length - 1)
		End If
		
		aURL = Request.RawUrl
		If aSelected = "" Then
			aURL = cWebLib.RemoveQuerystringParameter(aURL, "Selected")
		Else
			aURL = cWebLib.AddQuerystringParameter(aURL, "Selected", aSelected)
		End If		
		aURL += "&#" + aAnchor
		Response.Redirect(aURL)
	End Sub

End Class
End Namespace
