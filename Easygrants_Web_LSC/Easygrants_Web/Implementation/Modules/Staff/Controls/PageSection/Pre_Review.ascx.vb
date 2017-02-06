Imports Core.DataAccess
Imports Core.Web
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.PageSection
Public MustInherit Class cPre_Review
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlConflictProcess As cDropDownText
	Protected lnkViewResults As cLink
	Protected lnkViewMatches As cLink
    Protected ctlViewResults As cNewWindowOpener
	Protected ctlNewWindowOpener As cNewWindowOpener

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		ctlConflictProcess = CType(Me.FindControl("ctlConflictProcess"), cDropDownText)
		lnkViewResults.Set_ServerClick(AddressOf lnkViewResults_Click)
		lnkViewMatches.Set_ServerClick(AddressOf lnkViewMatches_Click)
	End Sub
	
    Public Sub lnkViewResults_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		Dim aHref As String
		dim aRevComList as cDataObjectList
		dim aRevCommID as Integer
		aRevComList = CType(me.DataObjectCollection("ReviewCycleCommittee"), cDataObjectList)
		if aRevComList.Count > 0 then
			aRevCommID = aRevComList(0).GetPropertyInt("ReviewCommitteeID", 0)
		end if
		
		aHref = Request.RawUrl()
		aHref = cWebLib.AddQuerystringParameter(aHref, "Page", "Conflict") 
		aHref = cWebLib.AddQuerystringParameter(aHref, "ReviewCommitteeID", aRevCommID)
		aHref = cWebLib.AddQuerystringParameter(aHref, "PageFrame", "Print") 
		
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
    End Sub

    Public Sub lnkViewMatches_Click(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		Dim aHref As String
		dim aRevComList as cDataObjectList
		dim aRevCommID as Integer
		aRevComList = CType(me.DataObjectCollection("ReviewCycleCommittee"), cDataObjectList)
		if aRevComList.Count > 0 then
			aRevCommID = aRevComList(0).GetPropertyInt("ReviewCommitteeID", 0)
		end if
		
		aHref = Request.RawUrl()
		aHref = cWebLib.AddQuerystringParameter(aHref, "Page", "Matches") 
		aHref = cWebLib.AddQuerystringParameter(aHref, "ReviewCommitteeID", aRevCommID)
		aHref = cWebLib.AddQuerystringParameter(aHref, "PageFrame", "Print") 
		
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
    End Sub

	Public Sub Generate()
		dim aType as String
		ctlConflictProcess = CType(FindControl("ctlConflictProcess"), cDropDownText)
		dim aConflictProcessDO as cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("ConflictProcess", ctlConflictProcess.SelectedValue)
		aType = aConflictProcessDO.GetPropertyString("StoredProcName")
		
		dim aRequest as cDataObject = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("DataCommandRequest")
		aRequest("DataCommandXml") = "<DataCommand Key='" + aType + "' DataCommandDefinitionKey='" + aType + "' CommandTimeout='3000'><Parameters><Argument Type='QueryString' TypeKey='ReviewCycleID' ParameterKey='ReviewCycleID' Value='" _
			+ Request.QueryString("ReviewCycleID") + "' /></Parameters></DataCommand>"
		aRequest("DataCommandKey") = aType
		aRequest("Status") = 0
		aRequest("CreateDate") = System.DateTime.Now
		aRequest("CreateUser") = CType(CType(Page, cModulePage).ModuleUser, cEGUser).UserID
		aRequest("ReviewCycleID") = Request.QueryString("ReviewCycleID")
		aRequest("ProcessID") = aConflictProcessDO.GetPropertyInt("ConflictProcessID")
		aRequest.SaveData
		Dim aURL As String = Request.RawUrl
		aURL = cWebLib.AddQuerystringParameter(aURL, "ConflictProcessID", ctlConflictProcess.SelectedValue)
		aURL = aURL + "&#Go"
		CorePage.Redirect(aURL)
	End Sub

End Class
End Namespace