Imports Core_Web.Controls.Base
Imports EasyGrants.Web.Modules
Imports Core.Web
Imports EasyGrants.Web
Imports Core.DataAccess

Namespace Easygrants_Web.Modules.Staff.Controls.PageContent


    Public MustInherit Class cGrant_Attachment
        Inherits Core_Web.Controls.Base.cDataPresenterCtl
		Protected ctlNewWindowOpener As cNewWindowOpener

		Protected ctlSubmittedFilesPDF As cDataListCtl
		Protected aButtonHash As Hashtable

		Protected ctlSubmittedFiles As cDataListCtl
		Protected aSubButtonHash As Hashtable
		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)

			'Here we are Updating the Href of the Links , before we use to Open a new window with NewWindowControl , but now we are opening a New window with Target=_blank
			'These are for Summary Documents.
			Dim aSummaryDO As cDataObject
			Dim aEntityID, aDefinitionID, aGetButtonID As Integer
			Dim aButton As cLink
			Dim aSummaryList As cDataObjectList = CType(DataObjectCollection("SubmittedFilesPDF"), cDataObjectList)
			ctlSubmittedFilesPDF = FindControl("ctlSubmittedFilesPDF")
			aButtonHash = ctlSubmittedFilesPDF.DataListCtl_GetControlCollection("btnViewPDF")
			For Each aSummaryDO In aSummaryList
				aEntityID = aSummaryDO.GetRelatedPropertyInt("EntityID", 0)
				aDefinitionID = aSummaryDO.GetRelatedPropertyInt("DefinitionID", 0)
				aGetButtonID = aSummaryDO.GetRelatedPropertyInt("SummaryDocumentsID")
				aButton = CType(aButtonHash(aGetButtonID), cLink)
				If Not aButton Is Nothing Then
					Dim aUrl As String = WebAppl.Build_RootURL("Core/Controls/Base/pgReportOutputReader.aspx")
					aButton.Href = aUrl & "?EntityID=" & aEntityID & "&DefinitionID=" & aDefinitionID
					aButton.Add_Attribute("class", "CSSButtonStyle")
				End If
			Next


			  'These are for Submitted Documents.
			  Dim aSubmittedDO As cDataObject
			  Dim aSubmittedFileID, aSubGetButtonID As Integer
			  Dim aSubButton As cLink
			  Dim aSubmittedList As cDataObjectList = CType(DataObjectCollection("SubmittedFiles"), cDataObjectList)
			  ctlSubmittedFiles = FindControl("ctlSubmittedFiles")
			  aSubButtonHash = ctlSubmittedFiles.DataListCtl_GetControlCollection("btnViewRawFile")
			  For Each aSubmittedDO In aSubmittedList
				  aSubmittedFileID = aSubmittedDO.GetRelatedPropertyInt("SubmittedFileID", 0)
				  aSubGetButtonID = aSubmittedDO.GetRelatedPropertyInt("SubmittedFileID")
				  aSubButton = CType(aSubButtonHash(aSubGetButtonID), cLink)
				  If Not aSubButton Is Nothing Then
					  Dim aUrl As String = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
					  aSubButton.Href = aUrl & "?SubmittedFileID=" & aSubmittedFileID
					  'aSubButton.Add_Attribute("class", "CSSButtonStyle")
				  End If
			  Next
		End Sub
   '     Public Sub ViewPDF(ByVal aEntityID As String, ByVal aDefinitionID As String)
   '         Dim aHref As String
   '         aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aEntityID, aDefinitionID)
   '         ctlNewWindowOpener.NewWindowURL = aHref
   '         ctlNewWindowOpener.Open()
   '     End Sub
		Public Sub DocumentList_ViewConvertedUploadedFile(ByVal aPrimaryKeyValue As String)

			Dim aHref As String

			aHref = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
			aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", aPrimaryKeyValue)
			ctlNewWindowOpener.NewWindowURL = aHref
			ctlNewWindowOpener.Open()
			'Response.Redirect(aHref)

		End Sub
    End Class
End Namespace
