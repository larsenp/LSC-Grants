Imports Core.DataAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User

Namespace Easygrants_Web.Modules.ReviewStage.Controls.PageSection

Public MustInherit Class cBioMedUnattributedCommentsDetail
    Inherits Easygrants_Web.Controls.Base.cEGDataPresenterCtl

	Protected tabComments As HtmlTable
    Protected trNoRatings As HtmlTableRow   

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
        MyBase.CoreCtl_Load(aSrc, aEvent)
        Dim aWfDataObject As cDataObject
        Dim aWfDataObjectList As cDataObjectList
        Dim aPersonKey as Integer
        'Dim aRatingDescription as String
        Dim aPersonID as Integer
        Dim aPersonName as String
        Dim aReviewStage as String        
        Dim aRating as String        
        Dim aComments as String
        Dim aFirstRow as Boolean
        Dim aNewRecord as Boolean
        Dim i as Integer = 1

        aWfDataObjectList = CType(mDataObjHash("WfTaskAssignmentReview"), cDataObjectList)

		if aWfDataObjectList.Count > 0 Then
			trNoRatings.Visible = False
		End If
		
        for each aWfDataObject in aWfDataObjectList
            if aPersonKey = nothing then
                aPersonKey = aWfDataObject.GetRelatedPropertyInt("WfTaskAssignment.PersonID")
                aFirstRow = True
            else
                aFirstRow = False
            end if
            if aPersonKey = aWfDataObject.GetRelatedPropertyInt("WfTaskAssignment.PersonID") then
                If aFirstRow = True then
                    aNewRecord = True
                Else
                    aNewRecord = False
                End If
            else
                If aPersonKey <> CType(CType(CorePage, cModulePage).ModuleUser, cEGUser).PersonID then
                    i+=1
                End If
                aNewRecord = True        
                aPersonKey = aWfDataObject.GetRelatedPropertyInt("WfTaskAssignment.PersonID")
            End If
            'aRatingDescription = aWfDataObject.GetRelatedPropertyString("RatingType.Rating_Desc")
            aPersonID = aWfDataObject.GetRelatedPropertyInt("WfTaskAssignment.PersonID")
			aReviewStage = aWfDataObject.GetRelatedPropertyString("WfTaskAssignment.ReviewCycleStage.ReviewCycle.Name")

			aRating = aWfDataObject.GetRelatedPropertyString("WfTaskAssignment.ReviewRating")
			'Select Case aWfDataObject.GetRelatedPropertyString("WfTaskAssignment.ReviewRating")
			'	Case "1"
			'		aRating = "A"
			'	Case "2"
			'		aRating = "B"
			'	Case "3"
			'		aRating = "C"
			'	Case "4"
			'		aRating = "D"
			'	Case "5"
			'		aRating = "F"
			'End Select
			
            aComments = aWfDataObject.GetPropertyString("Comments")
            aComments = aComments.Replace(vbCrLf, "<br>")
            aPersonName = aWfDataObject.GetRelatedPropertyString("WfTaskAssignment.Person.LastNameFirstName")

            PrintRow(i, aPersonID, aPersonName, aReviewStage, aRating, aComments, aNewRecord)
        Next
    End Sub

	Private Sub PrintRow(i as Integer, aKey as Integer, aPersonName as String, aReviewStage as String, aRating as String, aComment as String, aNewRecord as Boolean)
        Dim aTR As HtmlTableRow
		Dim aTD As HtmlTableCell
        Dim aPersonID as Integer
        aPersonID = CType(CType(CorePage, cModulePage).ModuleUser, cEGUser).PersonID

        'insert spacer line
        If aNewRecord = True then
		    aTR = New HtmlTableRow()
		    aTD = New HtmlTableCell()
            aTD.InnerHtml = "<hr>"
            aTD.ColSpan = 2
		    aTR.Cells.Add(aTD)
		    tabComments.Rows.Add(aTR)
            ''insert header line
            If aKey = CType(CType(CorePage, cModulePage).ModuleUser, cEGUser).PersonID then
                aTR = New HtmlTableRow()
		        aTD = New HtmlTableCell()
                aTD.InnerHtml = "<b>Reviewer (" + aPersonName + "):" + "</b>"
                aTD.ColSpan = 2
		        aTR.Cells.Add(aTD)
		        tabComments.Rows.Add(aTR)
            else
                aTR = New HtmlTableRow()
		        aTD = New HtmlTableCell()
                aTD.InnerHtml = "<b>Reviewer " + i.ToString() + ":</b>"
                'aTD.InnerHtml = "<b>Reviewer " + ":</b>"
                aTD.ColSpan = 2
		        aTR.Cells.Add(aTD)
		        tabComments.Rows.Add(aTR)
            End If
        End If

		'aTR = New HtmlTableRow()
		'aTD = New HtmlTableCell()
  '      aTD.InnerHtml = aRatingType.ToString() + ":"
  '      aTD.ColSpan = 2
		'aTR.Cells.Add(aTD)
		'tabComments.Rows.Add(aTR)

		aTR = New HtmlTableRow()
		aTD = New HtmlTableCell()
		aTD.InnerHtml = "Review Stage:"
		aTR.Cells.Add(aTD)
		aTD = New HtmlTableCell()
        aTD.InnerHtml = "<i>" + aReviewStage + "</i>" 
        aTR.VAlign = "Top"
		aTR.Cells.Add(aTD)
		tabComments.Rows.Add(aTR)

		aTR = New HtmlTableRow()
		aTD = New HtmlTableCell()
		aTD.InnerHtml = "Rating:"
		aTR.Cells.Add(aTD)
		aTD = New HtmlTableCell()
        aTD.InnerHtml = "<i>" + aRating + "</i>" 
        aTR.VAlign = "Top"
		aTR.Cells.Add(aTD)
		tabComments.Rows.Add(aTR)

        If aKey = CType(CType(CorePage, cModulePage).ModuleUser, cEGUser).PersonID Then
            aTR = New HtmlTableRow()
            aTD = New HtmlTableCell()
            aTD.InnerHtml = "Comments:"
            aTR.Cells.Add(aTD)
            aTD = New HtmlTableCell()
            aTD.InnerHtml = "<b><i>" + aComment + "</i></b>"
            aTR.VAlign = "Top"
            aTR.Cells.Add(aTD)
            tabComments.Rows.Add(aTR)
        Else
            aTR = New HtmlTableRow()
            aTD = New HtmlTableCell()
            aTD.InnerHtml = "Comments:"
            aTR.Cells.Add(aTD)
            aTD = New HtmlTableCell()
            aTD.InnerHtml = "<i>" + aComment + "</i>"
            aTR.VAlign = "Top"
            aTR.Cells.Add(aTD)
            tabComments.Rows.Add(aTR)
        End If

        aTR = New HtmlTableRow()
        aTD = New HtmlTableCell()
        aTD.InnerHtml = "&nbsp;"
        aTD.ColSpan = 2
        aTR.Cells.Add(aTD)
        tabComments.Rows.Add(aTR)

	End Sub

End Class
End Namespace