Imports Core.DataAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User

Namespace Implementation.Modules.ReviewStage.Controls.Page

Public MustInherit Class cPanelReviewCommentsEditor
    Inherits Easygrants_Web.Controls.Base.cEGDataPresenterCtl

	Protected tabComments As HtmlTable
    Protected trNoComments As HtmlTableRow   

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
        MyBase.CoreCtl_Load(aSrc, aEvent)
        Dim aPriorWfDataObject As cDataObject
        Dim aPriorWfDataObjectList As cDataObjectList
        Dim aPersonID as Integer = CType(CType(CorePage, cModulePage).ModuleUser, cEGUser).PersonID
        Dim aComments as String
        Dim aWftaskName As String
        Dim aHasPriorComments as Boolean = False
        Dim aWftaReviewDO As cDataObject
        Dim aGranteeProjectID As Integer = Convert.ToInt32(Request.QueryString.Get("GranteeProjectID"))
		Dim aTR As HtmlTableRow
		Dim aTD As HtmlTableCell
        aPriorWfDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "GranteeProjectID", aGranteeProjectID, "PersonID", aPersonID)

        for each aPriorWfDataObject in aPriorWfDataObjectList
            aWftaReviewDO = aPriorWfDataObject.GetRelatedPropertyDataObject("WfTaskAssignmentReview")
            If Not aWftaReviewDO Is Nothing Then
				aComments = aWftaReviewDO.GetRelatedPropertyString("Comments")
				If aComments <> "" Then
					aHasPriorComments = True
					aWftaskName = aPriorWfDataObject.GetRelatedPropertyString("WfTask.WfTask")
					aTR = New HtmlTableRow()
					aTD = New HtmlTableCell()
					aTD.InnerHtml = "<b>" + aWftaskName + ":</b> " + aComments
					aTR.Cells.Add(aTD)
					tabComments.Rows.Add(aTR)
				End If
			End If
        Next
        
        If aHasPriorComments Then
			trNoComments.Visible = False
		End If
    End Sub

End Class
End Namespace