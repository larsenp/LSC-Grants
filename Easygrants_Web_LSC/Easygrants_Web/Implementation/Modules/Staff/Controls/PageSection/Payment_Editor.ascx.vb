Imports System.Diagnostics
Imports System.Web.UI
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core.Web
Imports System.Text
Imports System.Collections.Specialized

Namespace Easygrants_Web.Modules.Staff.Controls.PageContent
Public MustInherit Class cPayment_Editor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

    Protected spnWorkflowTask As HtmlGenericControl
    Protected ctlDescription As cTextBox
	Protected ctlPayee As cTextBox
	Protected ctlRequestStatus As cDropDown
    Protected ctlGeneralFund As cDropDown
    Protected ctlRequestedDate as cTextBox
    Protected ctlRequestedAmount as cMoneyTextBox
	Protected ctlPaymentAmount As cMoneyTextBox
    Protected ctlPaymentDate as cTextBox
    Protected ctlNotes as cTextArea
	Protected btnSave As cCSSButton
    Protected spnSave As HtmlGenericControl
	Protected ctlRequiredOutcome As cDropDown
	Protected ctlWorkflowTask As cDropDown
'=============================================================

	Public ReadOnly Property PaymentNumber() As String
		Get
            If Not Request.QueryString("PaymentNumber") Is Nothing Then Return Request.QueryString("PaymentNumber")

			If Payment Is Nothing Then Return ""

            Return Payment.GetPropertyString("PaymentNumber")
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property Description() As String
		Get
            If Not Request.QueryString("Description") Is Nothing Then Return Request.QueryString("Description")

			If Payment Is Nothing Then Return ""

            Return Payment.GetPropertyString("Description")
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property TaskID() As String
		Get
            If Not Request.QueryString("TaskID") Is Nothing Then Return Request.QueryString("TaskID")

			If Payment Is Nothing Then Return ""

            Return Payment.GetPropertyString("TaskID")
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property GranteeProjectID() As String
		Get
            If Not Request.QueryString("GranteeProjectID") Is Nothing Then
                Return Request.QueryString("GranteeProjectID")
            Else
                Return ""
            End If
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property PaymentID() As String
		Get
            If Not Request.QueryString("PaymentID") Is Nothing Then
                Return Request.QueryString("PaymentID")
            Else
                Return ""
            End If
		End Get
	End Property

'-------------------------------------------------------------

	Protected ReadOnly Property Payment() As cDataObject
		Get
			If Request.QueryString("PaymentID") Is Nothing Then Return Nothing

			Return WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Payment", _
				Request.QueryString("PaymentID"))
		End Get
	End Property

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		btnSave = CType(Me.FindControl("btnSave"), cCSSButton)
		ctlWorkflowTask = CType(Me.FindControl("ctlWorkflowTask"), cDropDown)
		ctlWorkflowTask.Set_ServerIndexChange(AddressOf ctlDropDown_IndexChange)
		If PaymentID = "0" or PaymentID = "" Then
			dim ctlPrimaryOrganization as HtmlGenericControl
			ctlPayee = CType(Me.FindControl("ctlPayee"), cTextBox)
			Dim aGranteeProjectDO As cDataObject
			aGranteeProjectDO = Me.DataObjectCollection("GranteeProject")(0)
			If Not ctlPayee Is Nothing And Not aGranteeProjectDO Is Nothing Then
				ctlPayee.Value = aGranteeProjectDO.GetRelatedPropertyString("PrimaryOrganization.CommonOrganizationName")
			End If
		End If

	End Sub

	Public Overloads Overrides Function EventController_Save() As Boolean
        MyBase.EventController_Save()
		Page.Validate()
		If Page.IsValid Then
			If PaymentID > 0 Then
				Dim aObj As cDataObject = CType(Me.DataObjectCollection("Payment"), cDataObjectList)(0)
				Dim aHistoryObj As cDataObject = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("PaymentHistory")
				aHistoryObj("PaymentID") = aObj.GetPropertyInt("PaymentID", 0)
				aHistoryObj("GranteeProjectID") = aObj.GetPropertyInt("GranteeProjectID", 0)
				'aHistoryObj("PaymentNumber") = aObj.GetPropertyString("PaymentNumber")
				'aHistoryObj("Description") = aObj.GetPropertyString("Description")
				aHistoryObj("TaskID") = aObj.GetPropertyInt("TaskID", 0)
				aHistoryObj("OutcomeID") = aObj.GetPropertyInt("OutcomeID", 0)
				aHistoryObj("RequestStatusID") = aObj.GetPropertyInt("RequestStatusID", 0)
				'aHistoryObj("RequestEntityID") = aObj.GetPropertyInt("RequestEntityID", 0)
				aHistoryObj("RequestAccountFundID") = aObj.GetPropertyInt("RequestAccountFundID", 0)
				aHistoryObj("RequestedDate") = aObj.GetPropertyString("RequestedDate")
				aHistoryObj("RequestedAmount") = aObj.GetPropertyString("RequestedAmount")
				'aHistoryObj("SentDate") = aObj.GetPropertyString("SentDate")
				'aHistoryObj("PaymentEntityID") = aObj.GetPropertyInt("PaymentEntityID", 0)
				aHistoryObj("PaymentAccountFundID") = aObj.GetPropertyInt("PaymentAccountFundID", 0)
				aHistoryObj("CheckPaymentNumber") = aObj.GetPropertyString("CheckPaymentNumber")
				aHistoryObj("PaymentAmount") = aObj.GetPropertyString("PaymentAmount")
				aHistoryObj("PaymentDate") = aObj.GetPropertyString("PaymentDate")
				aHistoryObj("Notes") = aObj.GetPropertyString("Notes")
				aHistoryObj("PayeeName") = aObj.GetPropertyString("PayeeName")
				aHistoryObj("CreateUser") = aObj.GetPropertyInt("CreateUser", 0)
				aHistoryObj("CreateDate") = aObj.GetPropertyString("CreateDate")
				aHistoryObj("ModifyUser") = aObj.GetPropertyInt("ModifyUser", 0)
				aHistoryObj("ModifyDate") = aObj.GetPropertyString("ModifyDate")
				Me.WebSession.DataObjectFactory.SaveDataObject(aHistoryObj)
			End If
			Dim aValid As Boolean = True
			ctlGeneralFund = CType(Me.FindControl("ctlGeneralFund"), cDropDown)
            Return True
	    else
            Return False		
		End If
	End Function

'=============================================================

	Private Sub ctlDropDown_IndexChange(ByVal sender As System.Object, ByVal e As System.EventArgs)

		Dim aItem As ListItem
		Dim aObj As cDataObject

		ctlWorkflowTask = CType(Me.FindControl("ctlWorkflowTask"), cDropDown)
		ctlRequiredOutcome = CType(Me.FindControl("ctlRequiredOutcome"), cDropDown)
		ctlRequiredOutcome.Items.Clear()
		aItem = New ListItem("<None>", "")
		ctlRequiredOutcome.Items.Add(aItem)

		If ctlWorkflowTask.SelectedValue <> "" Then
			Dim aWftaDo As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", _
				"WfTaskAssignmentID", ctlWorkflowTask.SelectedValue)(0)
			Dim aList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskOutcome", _
				"WfTaskID", aWftaDo.GetPropertyString("WfTaskID"))
			For Each aObj In aList
				aItem = New ListItem(aObj.GetPropertyString("WfTaskOutcome"), aObj.GetPropertyString("WfTaskOutcomeID"))
				Me.ctlRequiredOutcome.Items.Add(aItem)
			Next
		End If

        Page.SetFocus(spnWorkflowTask)
    End Sub

'=============================================================

End Class
End Namespace
