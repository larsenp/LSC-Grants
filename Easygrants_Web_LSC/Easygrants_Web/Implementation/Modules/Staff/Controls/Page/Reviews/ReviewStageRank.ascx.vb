Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.Page.Reviews

Public MustInherit Class cReviewStageRank
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlList as cDataListCtl

    Protected Overrides Sub ProcessSorts(ByRef aDataObjectElement As XmlElement)
        Dim aKey As String

		aKey = cXMLDoc.AttributeToString(aDataObjectElement, "Key", "")
        select case aKey
            case "Apps"
                'check property to see what we should sory by
                'add property to this control: AppsListSoryKey
                mybase.ProcessSorts(aDataObjectElement)
            case else
                mybase.ProcessSorts(aDataObjectElement)
        End Select
    End Sub
 
	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)

		If Not IsPostBack Then
			Dim ctlList As cDataListCtl
			Dim aCheckboxHash As Hashtable
			Dim myEnumerator As IDictionaryEnumerator
			Dim aChk As cCheckBox
			Dim aSelected As String
			Dim aIndex As Integer
			Dim aID As Integer

			ctlList = FindControl("ctlList")
			aCheckboxHash = ctlList.DataListCtl_GetControlCollection("chkFlag")
			aSelected = Request.QueryString("Selected")
			If Not aSelected Is Nothing AndAlso Not aCheckboxHash Is Nothing Then
				myEnumerator = aCheckboxHash.GetEnumerator()
				While myEnumerator.MoveNext()
					aChk = CType(myEnumerator.Value, cCheckBox)
					aChk.BaseCheckButton.Checked = False
				End While
				If aSelected <> "None" Then
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
			End If
		End If
	End Sub

	Public Sub CalculateScoresAndRank()
		Dim ctlList As cDataListCtl
        Dim aCheckboxHash As Hashtable
        Dim aCheckbox As cCheckBox
        Dim aDOList As cDataObjectList
        Dim aDO As cDataObject
        
        ctlList = FindControl("ctlList")
        aDOList = CType(DataObjectCollection("Apps"), cDataObjectList) 'needs to be configured
        aCheckboxHash = ctlList.DataListCtl_GetControlCollection("chkFlag")
        
        For Each aDO In aDOList
			aCheckbox = CType(aCheckboxHash(aDO.GetPropertyInt("GranteeProjectReviewStageID")), cCheckBox)
            aDO("FlagForAction") = aCheckbox.Value
		Next
        
        me.WebSession.DataObjectFactory.SaveDataObject(aDOList)
        
		me.WebSession.DataObjectFactory.SaveDataObject(CType(DataObjectCollection("Apps"), cDataObjectList))
		dim aRequest as cDataObject = websession.DataObjectFactory.CreateNewDataObjectFromKey("DataCommandRequest")
		aRequest("DataCommandXml") = "<DataCommand Key='CalculateScoresAndRank' DataCommandDefinitionKey='CalculateScoresAndRank'><Parameters><Argument Type='QueryString' TypeKey='ReviewCycleStageID' ParameterKey='ReviewCycleStageID' Value='" _
			+ Request.QueryString("ReviewCycleStageID") + "' /></Parameters></DataCommand>"
		aRequest("DataCommandKey") = "CalculateScoresAndRank"
		aRequest("Status") = 0
		aRequest("CreateDate") = System.DateTime.Now
		aRequest("CreateUser") = CType(CType(Page, cModulePage).ModuleUser, cEGUser).UserID
		aRequest("ReviewCycleStageID") = Request.QueryString("ReviewCycleStageID")
		aRequest.SaveData()
		Refresh("Go")
	End Sub
	
	Public Sub CalculateScoresOrRank(ByVal aDataCommandDefinitionKey As String)
		Dim ctlList As cDataListCtl
        Dim aCheckboxHash As Hashtable
        Dim aCheckbox As cCheckBox
        Dim aDOList As cDataObjectList
        Dim aDO As cDataObject
        
        ctlList = FindControl("ctlList")
        aDOList = CType(DataObjectCollection("Apps"), cDataObjectList) 'needs to be configured
        aCheckboxHash = ctlList.DataListCtl_GetControlCollection("chkFlag")
        
        For Each aDO In aDOList
			aCheckbox = CType(aCheckboxHash(aDO.GetPropertyInt("GranteeProjectReviewStageID")), cCheckBox)
            aDO("FlagForAction") = aCheckbox.Value
		Next
        
        me.WebSession.DataObjectFactory.SaveDataObject(aDOList)
        
		me.WebSession.DataObjectFactory.SaveDataObject(CType(DataObjectCollection("Apps"), cDataObjectList))
		dim aRequest as cDataObject = websession.DataObjectFactory.CreateNewDataObjectFromKey("DataCommandRequest")
		aRequest("DataCommandXml") = "<DataCommand Key='" + aDataCommandDefinitionKey + "' DataCommandDefinitionKey='" + aDataCommandDefinitionKey + _
			"'><Parameters><Argument Type='QueryString' TypeKey='ReviewCycleStageID' ParameterKey='ReviewCycleStageID' Value='" _
			+ Request.QueryString("ReviewCycleStageID") + "' /></Parameters></DataCommand>"
		aRequest("DataCommandKey") = aDataCommandDefinitionKey
		aRequest("Status") = 0
		aRequest("CreateDate") = System.DateTime.Now
		aRequest("CreateUser") = CType(CType(Page, cModulePage).ModuleUser, cEGUser).UserID
		aRequest("ReviewCycleStageID") = Request.QueryString("ReviewCycleStageID")
		aRequest.SaveData()
		Refresh("Go")
	End Sub

    Public Sub CheckClearAll(ByVal aAction As String)
		Dim aCheckboxHash As Hashtable
		Dim aCheckbox As cCheckBox
        Dim ctlList As cDataListCtl
        
        ctlList = FindControl("ctlList")
		aCheckboxHash = ctlList.DataListCtl_GetControlCollection("chkFlag")
		If Not aCheckboxHash Is Nothing Then
			Dim myEnumerator As IDictionaryEnumerator = aCheckboxHash.GetEnumerator()
			While myEnumerator.MoveNext()
				aCheckbox = CType(myEnumerator.Value, cCheckBox)
				If aAction.ToLower = "check" Then
					aCheckbox.BaseCheckButton.Checked = True
				Else If aAction.ToLower = "clear" Then
					aCheckbox.BaseCheckButton.Checked = False
				End If
			End While
        End If
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
		aDOList = CType(DataObjectCollection("Apps"), cDataObjectList)
		For Each aDO In aDOList
			aChk = CType(aCheckboxHash(aDO.GetPropertyInt("GranteeProjectReviewStageID")), cCheckBox)
			If (Not aChk Is Nothing) And (aChk.BaseCheckButton.Checked) Then
				aSelected += aDO.GetPropertyString("GranteeProjectReviewStageID") + ","
			End If
		Next
		If aSelected.Length > 0 Then
			aSelected = aSelected.Substring(0, aSelected.Length - 1)
		End If
		
		aURL = Request.RawUrl
		If aSelected = "" Then
			aURL = cWebLib.AddQuerystringParameter(aURL, "Selected", "None")
		Else
			aURL = cWebLib.AddQuerystringParameter(aURL, "Selected", aSelected)
		End If		
		aURL += "&#" + aAnchor
		Response.Redirect(aURL)
	End Sub

End Class
End Namespace
