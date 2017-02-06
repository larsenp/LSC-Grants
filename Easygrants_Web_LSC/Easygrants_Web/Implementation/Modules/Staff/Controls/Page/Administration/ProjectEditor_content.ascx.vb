Imports Core_Web.Controls.Base
Imports Core_Web.Controls.Sharepoint
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Easygrants_Web.Modules.Staff.Controls.Page

Public MustInherit Class cProjectEditor_content
	Inherits Core_Web.Controls.Sharepoint.cSharepointLib
'=============================================================

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

	Protected ctlAutoGeneratePayment As cRadioButtonList
	Protected ctlAutoGenerateReport As cRadioButtonList
	Protected ctlDefaultPaymentSetup As cRadioButtonList
	Protected ctlDefaultReportSetup As cRadioButtonList
	Protected ctlPaymentProcess As cDropDown
	Protected ctlReportProcess As cDropDown
	Protected trDescription1 As HtmlTableRow
	Protected trDescription2 As HtmlTableRow
	Protected trSpace1 As HtmlTableRow
	Protected trSpace2 As HtmlTableRow

	Protected ctlProjectAbbr As cTextBox
'=============================================================

	Public ReadOnly Property WfProjectID() As String
		Get
            If Not Request.QueryString("WfProjectID") Is Nothing Then
                Return Request.QueryString("WfProjectID")
            Else
                Return ""
            End If
		End Get
	End Property

'=============================================================

	Public ReadOnly Property CtlDefaultPaymentSetupClientID() As String
		Get
			If ctlDefaultPaymentSetup Is Nothing Then
				ctlDefaultPaymentSetup = CType(FindControl("ctlDefaultPaymentSetup"), cRadioButtonList)
			End If
			Return ctlDefaultPaymentSetup.ClientID
		End Get		
	End Property

'=============================================================

	Public ReadOnly Property CtlDefaultReportSetupClientID() As String
		Get
			If ctlDefaultReportSetup Is Nothing Then
				ctlDefaultReportSetup = CType(FindControl("ctlDefaultReportSetup"), cRadioButtonList)
			End If
			Return ctlDefaultReportSetup.ClientID
		End Get		
	End Property

'=============================================================

	Public ReadOnly Property CtlDefaultPaymentSetupCoreCtlClientID() As String
		Get
			If ctlDefaultPaymentSetup Is Nothing Then
				ctlDefaultPaymentSetup = CType(FindControl("ctlDefaultPaymentSetup"), cRadioButtonList)
			End If
			Return ctlDefaultPaymentSetup.CoreCtl_ClientID
		End Get		
	End Property
	
'=============================================================

	Public ReadOnly Property CtlDefaultReportSetupCoreCtlClientID() As String
		Get
			If ctlDefaultReportSetup Is Nothing Then
				ctlDefaultReportSetup = CType(FindControl("ctlDefaultReportSetup"), cRadioButtonList)
			End If
			Return ctlDefaultReportSetup.CoreCtl_ClientID
		End Get		
	End Property
	
'=============================================================

	Public ReadOnly Property CtlPaymentProcessClientID() As String
		Get
			If ctlPaymentProcess Is Nothing Then
				ctlPaymentProcess = CType(FindControl("ctlPaymentProcess"), cDropDown)
			End If
			Return ctlPaymentProcess.ClientID
		End Get		
	End Property

'=============================================================

	Public ReadOnly Property CtlPaymentProcessCoreCtlClientID() As String
		Get
			If ctlPaymentProcess Is Nothing Then
				ctlPaymentProcess = CType(FindControl("ctlPaymentProcess"), cDropDown)
			End If
			Return ctlPaymentProcess.CoreCtl_ClientID
		End Get		
	End Property

'=============================================================

	Public ReadOnly Property CtlReportProcessClientID() As String
		Get
			If ctlReportProcess Is Nothing Then
				ctlReportProcess = CType(FindControl("ctlReportProcess"), cDropDown)
			End If
			Return ctlReportProcess.ClientID
		End Get		
	End Property

'=============================================================

	Public ReadOnly Property CtlReportProcessCoreCtlClientID() As String
		Get
			If ctlReportProcess Is Nothing Then
				ctlReportProcess = CType(FindControl("ctlReportProcess"), cDropDown)
			End If
			Return ctlReportProcess.CoreCtl_ClientID
		End Get		
	End Property

'=============================================================

	Public ReadOnly Property TrDescription1ClientID() As String
		Get
			Return trDescription1.ClientID
		End Get		
	End Property

'=============================================================

	Public ReadOnly Property TrDescription2ClientID() As String
		Get
			Return trDescription2.ClientID
		End Get		
	End Property

'=============================================================

	Public ReadOnly Property TrSpace1ClientID() As String
		Get
			Return trSpace1.ClientID
		End Get		
	End Property

'=============================================================

	Public ReadOnly Property TrSpace2ClientID() As String
		Get
			Return trSpace2.ClientID
		End Get		
	End Property

'=============================================================

    Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)

		ctlAutoGeneratePayment = CType(FindControl("ctlAutoGeneratePayment"), cRadioButtonList)
		ctlAutoGenerateReport = CType(FindControl("ctlAutoGenerateReport"), cRadioButtonList)

		ctlDefaultPaymentSetup = CType(FindControl("ctlDefaultPaymentSetup"), cRadioButtonList)
		ctlDefaultReportSetup = CType(FindControl("ctlDefaultReportSetup"), cRadioButtonList)
        
        ctlPaymentProcess = CType(FindControl("ctlPaymentProcess"), cDropDown)
        ctlPaymentProcess.Set_ServerIndexChange(AddressOf DropDown1Changed)
        
        ctlReportProcess = CType(FindControl("ctlReportProcess"), cDropDown)
		ctlReportProcess.Set_ServerIndexChange(AddressOf DropDown2Changed)

		ctlProjectAbbr = CType(FindControl("ctlProjectAbbr"), cTextBox)
    End Sub

'=============================================================

	Protected Overrides Sub OnPreRender(ByVal e As EventArgs)
		MyBase.OnPreRender(e)
        
        If ctlAutoGeneratePayment.SelectedValue = "" Then
			ctlAutoGeneratePayment.SelectedField = "True"
		End If        
        If ctlAutoGenerateReport.SelectedValue = "" Then
			ctlAutoGenerateReport.SelectedField = "True"
		End If        
        If ctlDefaultPaymentSetup.SelectedValue = "" Then
			ctlDefaultPaymentSetup.SelectedField = "True"
		End If        
        If ctlDefaultReportSetup.SelectedValue = "" Then
			ctlDefaultReportSetup.SelectedField = "True"
		End If        

		If Not IsPostBack Then
			DropDown1Changed(new Object(), new EventArgs())
			DropDown2Changed(new Object(), new EventArgs())
		End If
	End Sub

'=============================================================

	Public Sub DropDown1Changed(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		If ctlPaymentProcess.SelectedValue = "" Then
			trDescription1.Visible = False
			trSpace1.Visible = False
		Else
			trDescription1.Visible = True
			trSpace1.Visible = True
			ctlDefaultPaymentSetup.SelectedField = "False"
		End If		
	End Sub

'=============================================================

	Public Sub DropDown2Changed(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		If ctlReportProcess.SelectedValue = "" Then
			trDescription2.Visible = False
			trSpace2.Visible = False
		Else
			trDescription2.Visible = True
			trSpace2.Visible = True
			ctlDefaultReportSetup.SelectedField = "False"
		End If		
	End Sub


'=============================================================

 '   Public Overloads Overrides Function EventController_Save() As Boolean
 '  		Dim aURL As String
	'	aURL = Request.QueryString("ReturnURL")
       
 '       MyBase.EventController_Save()

	'	Response.Redirect(aURL)
	'End Function

'=============================================================

	Public Overrides Sub DataPresenter_SaveDataObjects()
		Page.Validate()
		If Page.IsValid Then
			'The rename to be executed when editing the name but not when creating a new one.
			If WfProjectID > 0 Then
				'--------------- This Functionality should be executed only when SharePoint is Active. ----------------
				Dim aSPIntegrationDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")(0)
				If Not aSPIntegrationDO Is Nothing Then
					'Here definition key is the Table Name

					Dim aEventTypeID As Integer = 3
					Dim aDefinitionKey As String = "WfProject"
					Dim aUniqueID As Integer = WfProjectID

					Dim aWfProjectDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("WfProject", WfProjectID)(0)
					Dim aOldFolderName As String = WfProjectID & "_" & TruncateSpecialCharacters(aSPIntegrationDO, aWfProjectDO.GetPropertyString("ShortName"))

					MyBase.DataPresenter_SaveDataObjects()

					Dim aNewFolderName As String = WfProjectID & "_" & TruncateSpecialCharacters(aSPIntegrationDO, ctlProjectAbbr.Value)

					'Here we are comparing the Values before save and after save. if they both are different then we need to rename the Folder in sharepoint.
					If aOldFolderName <> aNewFolderName Then
						RenameFolder(aEventTypeID, aDefinitionKey, aUniqueID, aOldFolderName, aNewFolderName, aSPIntegrationDO, aWfProjectDO)
					End If
					'Here we need to exit because otherwise DataPresenter_SaveDataObject will be executed at the end again
					Exit Sub
				End If
			End If
		End If
		MyBase.DataPresenter_SaveDataObjects()
	End Sub

'=============================================================
End Class

End Namespace 'Easygrants_Web.Modules.Staff.Controls.Page
