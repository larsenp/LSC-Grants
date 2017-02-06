Imports System.Diagnostics
Imports System.Web.UI
Imports System.Text
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core.Web
Namespace Implementation.Modules.Staff.Controls.Page.Grants

    Public MustInherit Class cGrantAdd
        Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
        '=============================================================

        'Protected WithEvents ctlCrumbTrail As cCrumbTrailDisplay
        ''=============================================================
        Protected trCmpt As HtmlTableRow
        Protected trProject As HtmlTableRow
        Protected ctlProgram As cDropDown
        Protected ctlCmpt As cDropDown
        Protected ctlProject As cDropDown
        Protected btnCmpt As cCSSButton
        Protected btnProject As cCSSButton
		Protected btnTask As cCSSButton
		Protected tblGrantInfo As HtmlTable
		Protected ctlStart As cDateTextBox
		Protected ctlEnd As cDateTextBox
		Public aGranteeProjectDataObject As cDataObject
		Protected ctlPStaff As cPopUpSelectorLauncher2
		Protected ctlGrantsStatus As cDropDown


        Public ReadOnly Property ProgramID() As String
            Get
                If Not Request.QueryString("ProgramID") Is Nothing Then Return Request.QueryString("ProgramID")

                Return ""
            End Get
        End Property
        '-------------------------------------------------------------
        Public ReadOnly Property CmptID() As String
            Get
                If Not Request.QueryString("CmptID") Is Nothing Then Return Request.QueryString("CmptID")

                Return ""
            End Get
        End Property
        '-------------------------------------------------------------
        Public ReadOnly Property ProjectID() As String
            Get
                If Not Request.QueryString("WfProjectID") Is Nothing Then Return Request.QueryString("WfProjectID")

                Return ""
            End Get
        End Property
        '-------------------------------------------------------------
		Public ReadOnly Property TaskID() As String
			Get
				If Not Request.QueryString("WfTaskID") Is Nothing Then Return Request.QueryString("WfTaskID")

				Return ""
			End Get
		End Property

		 Public ReadOnly Property PrimaryStaffID() As String
			Get
				If Not Request.QueryString("PrimaryStaffID") Is Nothing Then Return Request.QueryString("PrimaryStaffID")

				Return ""
			End Get
		End Property

		Public ReadOnly Property GrantStatusID() As String
			Get
				If Not Request.QueryString("GrantStatusID") Is Nothing Then Return Request.QueryString("GrantStatusID")

				Return ""
			End Get
		End Property
        '-------------------------------------------------------------
        Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
            MyBase.CoreCtl_Load(sender, e)
            ctlProgram = CType(Me.FindControl("ctlProgram"), cDropDown)
            'ctlProgram.Set_ServerIndexChange(AddressOf btnGo_Click)

            If Not ProgramID = "" Then
                Dim aDataObjectList As cDataObjectList
                Dim aDataObject As cDataObject
                Dim aItem As ListItem

                trCmpt.Visible = True

                aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Competition", "ProgramID", ProgramID)
                ctlCmpt.Items.Clear()
                aItem = New ListItem("<Select>", "")
                ctlCmpt.Items.Add(aItem)

                For Each aDataObject In aDataObjectList
                    aItem = New ListItem(aDataObject.GetPropertyString("CompetitionDisplayName"), aDataObject.GetPropertyString("CompetitionID"))
                    ctlCmpt.Items.Add(aItem)
                Next

                ctlCmpt.Attributes.Add("PostBack", "True")
                ctlCmpt.Set_ServerIndexChange(AddressOf ctlDropDown_IndexChange)
                ctlProgram = CType(Me.FindControl("ctlProgram"), cDropDown)
                ctlProgram.SelectedField = ProgramID
                trProject.Visible = False

                If Not CmptID = "" Then
                    aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProject", "CompetitionID", CmptID)

                    ctlProject.Items.Clear()
                    aItem = New ListItem("<Select>", "")
                    ctlProject.Items.Add(aItem)

                    For Each aDataObject In aDataObjectList
                        aItem = New ListItem(aDataObject.GetPropertyString("WfProjectName"), aDataObject.GetPropertyString("WfProjectID"))
                        Me.ctlProject.Items.Add(aItem)
                    Next

                    ctlProject.Attributes.Add("PostBack", "True")
                    ctlProject.Set_ServerIndexChange(AddressOf ctlDropDown_IndexChange)
                    Me.ctlCmpt.SelectedField = CmptID
                    Me.trProject.Visible = True

                End If
                If Not ProjectID = "" Then
                    Me.ctlProject.SelectedField = ProjectID
                    If Not Request.QueryString("PersonID") Is Nothing Then
						Dim aPopUpSelectorPI As cPopUpSelectorLauncher2
						aPopUpSelectorPI = CType(Me.FindControl("ctlPI"), cPopUpSelectorLauncher2)
						aPopUpSelectorPI.ObjID = Request.QueryString("PersonID")
					End If
                End If
			End If

			If (Not ProgramID = "" And Not CmptID = "" And Not ProjectID = "") Then
				tblGrantInfo.Visible = True
			Else
				tblGrantInfo.Visible = False
			End If

			 ctlPStaff = CType(Me.FindControl("ctlPStaff"), cPopUpSelectorLauncher2)
			If PrimaryStaffID <> "" Then
				Dim aPersonDO As cDataObject = Me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", PrimaryStaffID)
				ctlPStaff.ObjID = PrimaryStaffID
				ctlPStaff.ObjName = aPersonDO.GetPropertyString("LastNameFirstNameMiddleName")
			End If

			ctlGrantsStatus = Me.FindControl("ctlGrantsStatus")
			If GrantStatusID <> "" Then
				ctlGrantsStatus.SelectedField = GrantStatusID
			End If

		End Sub
        '=============================================================
		Public Overridable Sub GoClick(ByVal aStepName As String, ByVal aValue As String)
			Dim aURL As String

			aURL = Request.Url.ToString().Substring(0, Request.Url.ToString().IndexOf("?"))
			aURL = cWebLib.AddQuerystringParameter(aURL, "Config", Request.QueryString("Config"))
			aURL = cWebLib.AddQuerystringParameter(aURL, "Page", Request.QueryString("Page"))
			Select Case aStepName
			   Case "Program"
					aURL = cWebLib.AddQuerystringParameter(aURL, "CmptID", "")
					aURL = cWebLib.AddQuerystringParameter(aURL, "ProgramID", aValue)
				Case "Cmpt"
					aURL = cWebLib.AddQuerystringParameter(aURL, "ProgramID", Request.QueryString("ProgramID"))
					aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", "")
					aURL = cWebLib.AddQuerystringParameter(aURL, "CmptID", aValue)
				Case "Project"
					aURL = cWebLib.AddQuerystringParameter(aURL, "ProgramID", Request.QueryString("ProgramID"))
					aURL = cWebLib.AddQuerystringParameter(aURL, "CmptID", Request.QueryString("CmptID"))
					aURL = cWebLib.AddQuerystringParameter(aURL, "WfProjectID", aValue)
			End Select
			aURL = cWebLib.AddQuerystringParameter(aURL, "GranteeProjectID", Request.QueryString("GranteeProjectID"))
			If Not Request.QueryString("PersonID") Is Nothing Then
				aURL = cWebLib.AddQuerystringParameter(aURL, "PersonID", Request.QueryString("PersonID"))
			End If
			Dim aReturnURL As String = Request.QueryString("ReturnURL")
			aURL = cWebLib.AddQuerystringParameter(aURL, "ReturnURL", aReturnURL, Server)

			Response.Redirect(aURL)
		End Sub
        '-------------------------------------------------------------
		Public Overridable Sub ctlDropDown_IndexChange(ByVal sender As System.Object, ByVal e As System.EventArgs)
			Select Case CType(sender, Control).Parent.ID
				Case "ctlCmpt"
					GoClick("Cmpt", ctlCmpt.SelectedValue)
				Case "ctlProject"
					GoClick("Project", ctlProject.SelectedValue)
			End Select
		End Sub
        
		Public Overridable Sub CreateGrant()

			Dim ctlWfProject As cDropDown
			ctlWfProject = CType(Me.FindControl("ctlProject"), cDropDown)
			If ctlWfProject.SelectedValue = "" Then


			End If
			Dim aUser As cEGUser
			aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)

			'Construct Grantee data object node
			Dim aXmlDoc As cXMLDoc
			Dim aDataObjectNode As XmlNode
			Dim aFiltersNode As XmlNode
			Dim aRoleDataObject As cDataObject

			'Create Grantee object for User
			Dim aGranteeDataObject As cDataObject
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Grantee", aDataObjectNode, aFiltersNode)
			aGranteeDataObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
			aGranteeDataObject("EntityID") = aUser.PersonID
			aGranteeDataObject("EntityTypeID") = 1 'Person
			WebSession.DataObjectFactory.SaveDataObject(aGranteeDataObject)

			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("GranteeProject", aDataObjectNode, aFiltersNode)
			aGranteeProjectDataObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
			aGranteeProjectDataObject("GranteeID") = aGranteeDataObject("GranteeID")
			aGranteeProjectDataObject("WfProjectID") = ctlWfProject.SelectedValue
			Dim objPI As cPopUpSelectorLauncher2
			objPI = CType(Me.FindControl("ctlPI"), cPopUpSelectorLauncher2)
			aGranteeProjectDataObject("PrimaryPersonID") = objPI.ObjID
			Dim objOrg As cPopUpSelectorLauncher2
			objOrg = CType(Me.FindControl("ctlOrg"), cPopUpSelectorLauncher2)
			aGranteeProjectDataObject("PrimaryOrganizationID") = objOrg.ObjID
			Dim ctlTitle As cTextBox
			ctlTitle = CType(Me.FindControl("ctlTitle"), cTextBox)
			If Not ctlTitle.Value = "" Then
				aGranteeProjectDataObject("GrantTitle") = ctlTitle.Value
			End If
			Dim ctlDescription As cTextArea
			ctlDescription = CType(Me.FindControl("ctlDescription"), cTextArea)
			If Not ctlDescription.Value = "" Then
				aGranteeProjectDataObject("GrantDescription") = ctlDescription.Value
			End If
			Dim ctlRequestedAmount As cMoneyTextBox
			ctlRequestedAmount = CType(Me.FindControl("ctlRequestedAmount"), cMoneyTextBox)
			If Not ctlRequestedAmount.Value = "" Then
				aGranteeProjectDataObject("RequestAmount") = ctlRequestedAmount.Value
			End If
			Dim ctlAwardDate As cDateTextBox
			ctlAwardDate = CType(Me.FindControl("ctlAwardDate"), cDateTextBox)
			If Not ctlAwardDate.DateString = "" Then
				aGranteeProjectDataObject("GrantAwardDate") = ctlAwardDate.DateString
			End If
			Dim ctlGrantsStatus As cDropDown
			ctlGrantsStatus = CType(Me.FindControl("ctlGrantsStatus"), cDropDown)
			aGranteeProjectDataObject("GrantStatusID") = ctlGrantsStatus.SelectedValue
			Dim ctlGrantsOutcome As cDropDown
			ctlGrantsOutcome = CType(Me.FindControl("ctlGrantsOutcome"), cDropDown)
			If Not ctlGrantsOutcome.SelectedValue = "" Then
				aGranteeProjectDataObject("WfProjectOutcomeID") = ctlGrantsOutcome.SelectedValue
			End If
			aGranteeProjectDataObject("CreateUser") = aUser.UserID
			aGranteeProjectDataObject("CreateDate") = Now()
			aGranteeProjectDataObject("ModifyUser") = aUser.UserID
			aGranteeProjectDataObject("ModifyDate") = Now()
			WebSession.DataObjectFactory.SaveDataObject(aGranteeProjectDataObject)

			Dim aGranteeProjectPIDataObject As cDataObject
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("GranteeProjectPI", aDataObjectNode, aFiltersNode)
			aGranteeProjectPIDataObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
			aGranteeProjectPIDataObject("PITypeID") = 1
			aGranteeProjectPIDataObject("EntityTypeID") = 1
			aGranteeProjectPIDataObject("IsPrimary") = 1
			aGranteeProjectPIDataObject("GranteeProjectID") = aGranteeProjectDataObject("GranteeProjectID")
			aGranteeProjectPIDataObject("PersonID") = objPI.ObjID
			WebSession.DataObjectFactory.SaveDataObject(aGranteeProjectPIDataObject)


			''Create Grantee Project Info record
			Dim aGranteeProjectInfoDO As cDataObject
			aGranteeProjectInfoDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("GranteeProjectInfo")
			aGranteeProjectInfoDO("GranteeProjectID") = aGranteeProjectDataObject("GranteeProjectID")
			Dim ctlStart As cDateTextBox
			ctlStart = CType(Me.FindControl("ctlStart"), cDateTextBox)
			If Not ctlStart.DateString = "" Then
				aGranteeProjectInfoDO("DurationStart") = ctlStart.DateString
			End If
			Dim ctlEnd As cDateTextBox
			ctlEnd = CType(Me.FindControl("ctlEnd"), cDateTextBox)
			If Not ctlEnd.DateString = "" Then
				aGranteeProjectInfoDO("DurationEnd") = ctlEnd.DateString
			End If
			Dim ctlAwardAmount As cMoneyTextBox
			ctlAwardAmount = CType(Me.FindControl("ctlAwardAmount"), cMoneyTextBox)
			If Not ctlAwardAmount.Value = "" Then
				aGranteeProjectInfoDO("AwardAmount") = ctlAwardAmount.Value
			End If
			aGranteeProjectInfoDO("CreateUser") = aUser.UserID
			aGranteeProjectInfoDO("CreateDate") = Now()
			aGranteeProjectInfoDO("ModifyUser") = aUser.UserID
			aGranteeProjectInfoDO("ModifyDate") = Now()
			WebSession.DataObjectFactory.SaveDataObject(aGranteeProjectInfoDO)

			''Create Grantee Project Info record
			Dim aGranteeProjectStaff As cDataObject
			aGranteeProjectStaff = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("GranteeProjectStaffAffiliation")
			aGranteeProjectStaff("GranteeProjectID") = aGranteeProjectDataObject("GranteeProjectID")
			aGranteeProjectStaff("StaffPersonID") = ctlPStaff.ObjID
			aGranteeProjectStaff("AffiliationTypeID") = 4
			aGranteeProjectStaff("IsPrimary") = True
			aGranteeProjectStaff("CreateUser") = aUser.UserID
			aGranteeProjectStaff("CreateDate") = Now()
			aGranteeProjectStaff("ModifyUser") = aUser.UserID
			aGranteeProjectStaff("ModifyDate") = Now()

			WebSession.DataObjectFactory.SaveDataObject(aGranteeProjectStaff)

		End Sub

		Public Sub RedirectToModule(ByVal ReturnURL As String, ByVal AutoSave As String)
			If AutoSave = "True" Then
				CreateGrant()
			End If
			Dim aURL As StringBuilder = New StringBuilder()
			aURL.Append(WebAppl.Get_ModuleRoot("Staff") + "/Staff/" + "ModuleContent.aspx" + "?Config=ModuleConfig&Page=GrantsEditor&GranteeProjectID=" + aGranteeProjectDataObject("GranteeProjectID").ToString)
			Response.Redirect(aURL.ToString)
			'Me.EventController_NavigateToURL(ReturnURL)
		End Sub

		Public Sub ValidateEndDate(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
			ctlStart = CType(Me.FindControl("ctlStart"), cDateTextBox)
			ctlEnd = CType(Me.FindControl("ctlEnd"), cDateTextBox)
			If Not ctlStart.myDate Is Nothing And Not ctlEnd.myDate Is Nothing Then
				If Not ctlStart.DateString = "" AndAlso Not ctlEnd.DateString = "" Then
					If DateTime.Compare(ctlEnd.myDate, ctlStart.myDate) <= 0 Then
						aArgs.IsValid = False
					End If
				End If
			End If
			'If ctlStart.myDate Is Nothing Then
			'ElseIf ctlStart.myDate.Equals(System.DBNull.Value) AndAlso ctlEnd.myDate.Equals(System.DBNull.Value) Then
			'	aArgs.IsValid = True
			'ElseIf ctlStart.myDate.Equals(System.DBNull.Value) AndAlso Not ctlEnd.myDate.Equals(System.DBNull.Value) Then
			'	aArgs.IsValid = False
			'ElseIf DateTime.Compare(ctlEnd.myDate, ctlStart.myDate) <= 0 Then
			'	aArgs.IsValid = False
			'End If
		End Sub

	End Class
End Namespace 'Easygrants_Web.Modules.Staff.Controls.Page
