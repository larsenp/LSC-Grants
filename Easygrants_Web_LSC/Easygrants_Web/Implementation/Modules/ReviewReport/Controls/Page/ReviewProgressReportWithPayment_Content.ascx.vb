Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports Core_Web.Controls.Base
Imports EasyGrants.Web.User
Imports Core.Web.Modules
Imports Core.Web.SvrCtls
Imports Core.Web
Imports EasyGrants.Web
Imports System.Diagnostics
Imports EasyGrants.Web.Modules

Namespace Implementation.Modules.ReviewReport.Controls.Page

	Public MustInherit Class cReviewProgressReportWithPayment_Content
		Inherits Core_Web.Controls.Base.cDataPresenterCtl
		Protected ctlReportOutcome As cDropDown
        Protected ctlPaymentRecommendation As cDropDown
        Protected ctlNewWindowOpener As cNewWindowOpener
		Protected ctlGrantProgress As cDropDown
		Protected tblRptAccepted_GrantProgress As HtmlTable
		'Protected tblPaymentNotRecommended_GrantRecommendation As HtmlTable
		Protected tblCompleteReview As HtmlTable
		Protected tblButtons As HtmlTable
		Protected ctlOutcomeComments as cTextArea

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			Dim aWfTaskOutcomeID As String
			dim aSelectedOutcomeID as String
			
			ctlReportOutcome = CType(Me.FindControl("ctlReportOutcome"), cDropDown)
			ctlPaymentRecommendation = CType(Me.FindControl("ctlPaymentRecommendation"), cDropDown)
			ctlGrantProgress = CType(Me.FindControl("ctlGrantProgress"), cDropDown)
			ctlOutcomeComments = CType(Me.FindControl("ctlOutcomeComments"), cTextArea)
			aWfTaskOutcomeID = (CType(Me.DataObjectCollection("WfTaskAssignment"), cDataObjectList))(0).GetPropertyString("WfTaskOutcomeID")
			aSelectedOutcomeID = (CType(Me.DataObjectCollection("WfTaskAssignmentExt"), cDataObjectList))(0).GetPropertyString("SelectedOutcomeID")
			'Check database for value of outcome id if the Querystring("OutcomeID") is empty.
			'337 --> ReportOutcome Not Accepted
			'338 --> ReportOutcome Accepted


			If Request.QueryString("OutcomeID") = "" Then

                tblButtons.Visible = False
                If aWfTaskOutcomeID = "337" Then  'Not Accepted
					tblButtons.Visible = True
					tblCompleteReview.Visible = True
                    if aSelectedOutcomeID = "13" Then  'Accepted
						tblRptAccepted_GrantProgress.Visible = True
						ProcessReportOutcomeAccepted()
					end if
                    'tblButtons.Visible = True
                ElseIf aWfTaskOutcomeID = "338" Then  'Accepted
					tblButtons.Visible = True
					tblCompleteReview.Visible = True
					if aSelectedOutcomeID <> "14" then
						tblRptAccepted_GrantProgress.Visible = True
						ProcessReportOutcomeAccepted()
					end if
                   ' tblButtons.Visible = True
                ElseIf aWfTaskOutcomeID = "" then  
					tblButtons.Visible = True
					tblCompleteReview.Visible = True
                    if aSelectedOutcomeID = "13" Then  'Accepted
						tblRptAccepted_GrantProgress.Visible = True
						ProcessReportOutcomeAccepted()
					end if
				ElseIf  aWfTaskOutcomeID <> "337" Or aWfTaskOutcomeID <> "338" then
					tblButtons.Visible = True
					tblCompleteReview.Visible = True
                    if aSelectedOutcomeID = "13" Then  'Accepted
						tblRptAccepted_GrantProgress.Visible = True
						ProcessReportOutcomeAccepted()
					end if
                End If
            Else
                'Check  Querystring("SelectedOutcomeID") for value.
                If Request.QueryString("OutcomeID") = "14" Then
                    tblCompleteReview.Visible = True
                    tblButtons.Visible = True
                ElseIf Request.QueryString("OutcomeID") = "13" Then
					tblButtons.Visible = True
					tblCompleteReview.Visible = True
					tblRptAccepted_GrantProgress.Visible = True
					'ProcessReportOutcomeAccepted()
                End If
            End If


			'If Request.QueryString("OutcomeID") = "" Then

			'	tblButtons.Visible = False
			'	If aWfTaskOutcomeID = "337" Then
			'		if aSelectedOutcomeID = "13" Then  'Report Accepted
			'			tblRptAccepted_GrantProgress.Visible = True
			'			ProcessReportOutcomeAccepted()
			'		end if
			'		tblCompleteReview.Visible = True
			'		tblButtons.Visible = True
			'	ElseIf aWfTaskOutcomeID = "338" Then
			'		tblCompleteReview.Visible = False
			'		tblRptAccepted_GrantProgress.Visible = True
			'		ProcessReportOutcomeAccepted()
			'	ElseIf aWfTaskOutcomeID = "" Then  
			'		tblCompleteReview.Visible = True
			'		tblButtons.Visible = True
			'		if aSelectedOutcomeID = "13" Then  'Report Accepted
			'			tblRptAccepted_GrantProgress.Visible = True
			'			ProcessReportOutcomeAccepted()
			'		end if
			'	End If
			'Else
			'	'Check  Querystring("OutcomeID") for value.
   '             If Request.QueryString("OutcomeID") = "14" Then
   '                 tblCompleteReview.Visible = True
   '                 tblButtons.Visible = True
   '             ElseIf Request.QueryString("OutcomeID") = "13" Then
   '                 tblCompleteReview.Visible = False
   '                 tblRptAccepted_GrantProgress.Visible = True
   '                 ProcessReportOutcomeAccepted()
   '             End If
				
			'End If
		End Sub

		Private Sub ProcessReportOutcomeAccepted()
			Dim aPaymentRecommendationID As String
			aPaymentRecommendationID = (CType(Me.DataObjectCollection("WfTaskAssignmentExt"), cDataObjectList))(0).GetPropertyString("PaymentRecommendationID")			
			tblButtons.Visible = False
			If Request.QueryString("PaymentRecommendationID") = "" Then
				'1 --> PaymentRecommended = Yes
				'2 --> PaymentRecommended = No
				If aPaymentRecommendationID = "1" Then
					tblCompleteReview.Visible = True
					tblButtons.Visible = True
				ElseIf aPaymentRecommendationID = "2" Then
					tblCompleteReview.Visible = False
					ProcessPaymentNotRecommended()
				End If
			Else
				'Check  Querystring("OutcomeID") for value.
				If Request.QueryString("PaymentRecommendationID") = "1" Then
					tblCompleteReview.Visible = True
					tblButtons.Visible = True
				ElseIf Request.QueryString("PaymentRecommendationID") = "2" Then
					tblCompleteReview.Visible = False
					ProcessPaymentNotRecommended()
				End If
			End If
		End Sub

		Private Sub ProcessPaymentNotRecommended()
			Dim aPaymentRecommendationID As String
			aPaymentRecommendationID = (CType(Me.DataObjectCollection("WfTaskAssignmentExt"), cDataObjectList))(0).GetPropertyString("PaymentRecommendationID")
			tblButtons.Visible = False
			If Request.QueryString("PaymentRecommendationID") = "" Then
				'1 --> PaymentRecommended = Yes
				'2 --> PaymentRecommended = No
				If aPaymentRecommendationID = "1" Then
					tblCompleteReview.Visible = True
					tblButtons.Visible = True
				ElseIf aPaymentRecommendationID = "2" Then
					'tblPaymentNotRecommended_GrantRecommendation.Visible = True
					tblCompleteReview.Visible = True
					tblButtons.Visible = True
				End If
			Else
				'Check  Querystring("OutcomeID") for value.
				If Request.QueryString("PaymentRecommendationID") = "1" Then
					tblCompleteReview.Visible = True
					tblButtons.Visible = True
				ElseIf Request.QueryString("PaymentRecommendationID") = "2" Then
					'tblPaymentNotRecommended_GrantRecommendation.Visible = True
					tblCompleteReview.Visible = True
					tblButtons.Visible = True
				End If
			End If
		End Sub
		Public Overrides Sub CoreCtl_SetValues()
			MyBase.CoreCtl_SetValues()
			If Request.QueryString("OutcomeID") <> "" Then
				If Request.QueryString("OutcomeID") = "-1" Then
					ctlReportOutcome.SelectedField = "<None>"
				Else
					ctlReportOutcome.SelectedField = Request.QueryString("OutcomeID")
					if Session("OutcomeComments") <> "" then
						ctlOutcomeComments.Value = Session("OutcomeComments")	
					end if			
				End If
			End If
			If Request.QueryString("PaymentRecommendationID") <> "" Then
				If Request.QueryString("PaymentRecommendationID") = "-1" Then
					ctlPaymentRecommendation.SelectedField = "<None>"
				Else
					ctlPaymentRecommendation.SelectedField = Request.QueryString("PaymentRecommendationID")
					if Session("OutcomeComments") <> "" then
						ctlOutcomeComments.Value = Session("OutcomeComments")	
					end if
				End If
            End If
            If Request.QueryString("GrantProgressID") <> "" Then
                If Request.QueryString("GrantProgressID") = "-1" Then
                    ctlGrantProgress.SelectedField = "<None>"
                Else
                    ctlGrantProgress.SelectedField = Request.QueryString("GrantProgressID")
                    if Session("OutcomeComments") <> "" then
						ctlOutcomeComments.Value = Session("OutcomeComments")	
					end if
                End If
            End If
		End Sub
		'----------------------------------------------------
        Public Sub ControlOutcomeSelected(ByVal aSelectedValue As String, ByVal aGrantProgressSelectedValue As String, ByVal aURL As String)
            If aSelectedValue = "" Then
                aSelectedValue = "-1"
            End If
            If aGrantProgressSelectedValue = "" Then
                aGrantProgressSelectedValue = "-1"
            End If
            Dim newURL As String
            'store outcome comments in session
            Session.Add("OutcomeComments", ctlOutcomeComments.Value)
            newURL = cWebLib.AddQuerystringParameter(aURL, "GrantProgressID", aGrantProgressSelectedValue)
            Response.Redirect(cWebLib.AddQuerystringParameter(newURL, "OutcomeID", aSelectedValue + "&#Outcome"))
        End Sub

        Public Sub ControlPaymentRecommendationSelected(ByVal aSelectedValue As String, ByVal aGrantProgressSelectedValue As String, ByVal aURL As String)
            If aSelectedValue = "" Then
                aSelectedValue = "-1"
            End If
            If aGrantProgressSelectedValue = "" Then
                aGrantProgressSelectedValue = "-1"
            End If
            Dim newURL As String
            Session.Add("OutcomeComments", ctlOutcomeComments.Value)
            newURL = cWebLib.AddQuerystringParameter(aURL, "GrantProgressID", aGrantProgressSelectedValue)
            Response.Redirect(cWebLib.AddQuerystringParameter(newURL, "PaymentRecommendationID", aSelectedValue + "&#Payment"))
        End Sub

        Public Sub ControlGrantProgressSelected(ByVal aSelectedValue As String, ByVal aURL As String)
            If aSelectedValue = "" Then
                aSelectedValue = "-1"
            End If
            Session.Add("OutcomeComments", ctlOutcomeComments.Value)
            Response.Redirect(cWebLib.AddQuerystringParameter(aURL, "GrantProgressID", aSelectedValue + "&#Progress"))
        End Sub

        '--------------------------------------------------------------------------
        Public Overrides Sub DataPresenter_SaveDataObjects()
            MyBase.DataPresenter_SaveDataObjects()
            Dim aWftaBMGFDO As cDataObject
            Dim aPaymentRecommendationID As String
            Dim aGrantProgressID As String
            Dim aGrantRecommendationID As String

            aWftaBMGFDO = (CType(Me.DataObjectCollection("WfTaskAssignmentExt"), cDataObjectList))(0)
            If (Not ctlReportOutcome Is Nothing) Then
                If ctlReportOutcome.SelectedValue = "14" Then  'Report Not Accepted
                    'if payment recommend, grant progress and grant recommend data was saved previously and user changes report outcome to Report Not Accepted
                    '  we are setting the payment recommend, grant progress and grant recommend values to null in data base, in order to keep with data integrity
                    '  so the query results in QT are consistent with this review report at time of submission. (kda - 1/7/05)
                    If Not aWftaBMGFDO Is Nothing Then
                        aPaymentRecommendationID = aWftaBMGFDO.GetPropertyString("PaymentRecommendationID")
                        aGrantProgressID = aWftaBMGFDO.GetPropertyString("GrantProgressID")
                        aGrantRecommendationID = aWftaBMGFDO.GetPropertyString("GrantRecommendationID")
                        If aPaymentRecommendationID <> "" Or aGrantProgressID <> "" Or aGrantRecommendationID <> "" Then
                            aWftaBMGFDO("PaymentRecommendationID") = System.DBNull.Value
                            aWftaBMGFDO("GrantProgressID") = System.DBNull.Value
                            aWftaBMGFDO("GrantRecommendationID") = System.DBNull.Value
                            aWftaBMGFDO.SaveData()
                        End If
                    End If
                ElseIf ctlReportOutcome.SelectedValue = "13" Then  '13:Report Accepted, 1: Recommended
                    'if payment recommend, grant progress, grant recommend or FR recommend data was saved previously and user changes report outcome to Report Not Accepted
                    '  we are setting these values to null in data base, in order to keep with data integrity
                    '  so the query results in QT are consistent with this review report at time of submission. (kda - 1/7/05)
                    If Not aWftaBMGFDO Is Nothing Then
                        aPaymentRecommendationID = aWftaBMGFDO.GetPropertyString("PaymentRecommendationID")
                        aGrantProgressID = aWftaBMGFDO.GetPropertyString("GrantProgressID")
                        aGrantRecommendationID = aWftaBMGFDO.GetPropertyString("GrantRecommendationID")
                        If aPaymentRecommendationID <> "" Or aGrantProgressID <> "" Or aGrantRecommendationID <> "" Then
                            aWftaBMGFDO("PaymentRecommendationID") = System.DBNull.Value
                            aWftaBMGFDO("GrantProgressID") = System.DBNull.Value
                            aWftaBMGFDO("GrantRecommendationID") = System.DBNull.Value
                            aWftaBMGFDO.SaveData()
                        End If
                    End If
                End If
            End If
            Session.Remove("OutcomeComments")
        End Sub


        '----------------------------------------------------------------------------------------------------------------------------
        Public Sub RedirectWithoutQueries()
            'Called after save - deletes the querystring values since the values are populated from the database.
            Dim URL As String = Request.RawUrl.ToString()
            URL = cWebLib.RemoveQuerystringParameter(URL, "OutcomeID")
            URL = cWebLib.RemoveQuerystringParameter(URL, "PaymentRecommendationID")
            URL = cWebLib.RemoveQuerystringParameter(URL, "GrantProgressID")
            URL = cWebLib.AddQuerystringParameter(URL, "Progress", "#Progress")
            Response.Redirect(URL)
        End Sub

        '--------------------------------------------------------------------------


        Public Sub Submit()
            If ctlReportOutcome.SelectedValue = "14" Then
                EventController_NavigateToModulePageKey("ReportResubmission", "ReturnURL=" + Request.Url.PathAndQuery, "ReturnPageKey=" + CType(WebSession.CurrentPage, cModulePage).PageKey)
            Else

                'When accepting budget review, make all reopened sections inactive
                'Dim aWfTaskAssignmentID As String = (CType(Me.DataObjectCollection("WfTaskAssignment"), cDataObjectList))(0).GetPropertyString("WfTaskAssignmentID")
                'Dim aBudgetOpenRequest As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WftaReopenRequest", "RequestingWfTaskAssignmentID", aWfTaskAssignmentID)(0)
                'If Not aBudgetOpenRequest Is Nothing Then
                '	aBudgetOpenRequest("Active") = False
                '	aBudgetOpenRequest.SaveData()
                'End If

                Dim aSubmitPage As cSubmissionModulePage
                aSubmitPage = CType(Page, cSubmissionModulePage)
                'Set post-submission parameters. Navigate to default page of current module (i.e., the ApplicationChecklist page key, 
                'which uses SubmittedContent.ascx as its post-submission content control) 
                aSubmitPage.PostSubmitModuleName = "Staff"
                aSubmitPage.PostSubmitModuleConfig = "ModuleConfig"
                aSubmitPage.Submit(False)
            End If
        End Sub

        Public Sub DataList_ViewConvertedUploadedFile(ByVal aPrimaryKeyValue As String)

            Dim aHref As String

            aHref = WebAppl.Build_RootURL("Core/Controls/Base/pgUploadReader.aspx")
            aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", aPrimaryKeyValue)
            ctlNewWindowOpener.NewWindowURL = aHref
            ctlNewWindowOpener.Open()
        End Sub

        '----------------------------------------------------------------------------------------------------------------------------------
        Public Sub DataList_ViewUploadedFile(ByVal aPrimaryKeyValue As String)

            Dim aHref As String

			aHref = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
            aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", aPrimaryKeyValue)
            ctlNewWindowOpener.NewWindowURL = aHref
            ctlNewWindowOpener.Open()
        End Sub

End Class
End Namespace