Imports System.Web.UI
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core.Web
Imports EasyGrants.Web.Modules

Namespace Implementation.Modules.Review.Controls.Page
Public MustInherit Class cFundingSourcesEditor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
	Implements System.Web.UI.ICallbackEventHandler

	Public aCallBackFunctionInvocation As String
	Protected ctlFundingSourceName As cAutoCompleteTextBox
	Protected spnFundingSourceBalance As HtmlGenericControl
	Protected btnSelect As HtmlInputButton
	Private mFundAccountNumber As String = ""
	Private mFundCommonName As String = ""
	Private mFundSourceType As String = ""
	Private mFundSourceEndDate As String = ""
	Private mFundBalanceAmount As String = ""
	Private aUser As cEGUser

	Protected spnFundingSourceStatusLabel As HtmlGenericControl
	Protected spnFundingSourceStatus As HtmlGenericControl
	Protected ctlFundingSourceStatus As cDropDown

	Protected spnFundingSourceID As HtmlGenericControl
	Protected spnFundingSourceCommonName As HtmlGenericControl
	Protected spnFundingSourceType As HtmlGenericControl
	Protected spnFundingSourceEndDate As HtmlGenericControl

	Protected trSourceStatus As HtmlTableRow

	Public Property FundCommonName() As String
		Get
			Return mFundCommonName
		End Get
		Set(ByVal Value As String)
			mFundCommonName = Value
		End Set
	End Property

	Public Property FundSourceType() As String
		Get
			Return mFundSourceType
		End Get
		Set(ByVal Value As String)
			mFundSourceType = Value
		End Set
	End Property

	Public Property FundSourceEndDate() As String
		Get
			Return mFundSourceEndDate
		End Get
		Set(ByVal Value As String)
			mFundSourceEndDate = Value
		End Set
	End Property

	Public Property FundAccountNumber() As String
		Get
			Return mFundAccountNumber
		End Get
		Set(ByVal Value As String)
			mFundAccountNumber = Value
		End Set
	End Property

	Public Property FundBalanceAmount() As String
		Get
			Return mFundBalanceAmount
		End Get
		Set(ByVal Value As String)
			mFundBalanceAmount = Value
		End Set
	End Property

	Public ReadOnly Property GranteeProjectFundingSourcesID() As String
		Get
			If Not Request.QueryString("GranteeProjectFundingSourcesID") Is Nothing Then
				Return Request.QueryString("GranteeProjectFundingSourcesID")
			Else
				Return ""
			End If
		End Get
	End Property

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		ctlFundingSourceName = FindControl("ctlFundingSourceName")
		btnSelect = FindControl("btnSelect")
		Dim aCM As ClientScriptManager = Page.ClientScript
		aCallBackFunctionInvocation = aCM.GetCallbackEventReference(Me, "document.getElementById('mPageFrameCtl_ctlPageContent_ctlFundingSourceName_hdnObjID').value", "UpdateFundingSourceDetails", "", "OnError", True)
		btnSelect.Attributes.Add("onclick", aCallBackFunctionInvocation)
		If Not ctlFundingSourceName.Value = "" Then
			GetFundSourceDetails(ctlFundingSourceName.Value)
		Else
			GetFundSourceDetails(Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlFundingSourceName:hdnObjID"))
		End If
		'If Not Request.QueryString("GranteeProjectFundingSourcesID") = "0" Then
		'	spnFundingSourceBalance.InnerHtml = GetFundBalance(WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProjectFundingSources", Request.QueryString("GranteeProjectFundingSourcesID")).GetPropertyString("FundID"))
		'End If

		If aUser.WfTaskID > 0 Then
			trSourceStatus.Visible = False
			spnFundingSourceStatus.Visible = False
			spnFundingSourceStatusLabel.Visible = True
		Else
			trSourceStatus.Visible = True
			spnFundingSourceStatus.Visible = True
			spnFundingSourceStatusLabel.Visible = False
		End If
		ctlFundingSourceStatus = Me.FindControl("ctlFundingSourceStatus")
	End Sub

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()

		'Populating Funding Sources Status
		Dim aGPFSDO As cDataObject = CType(Me.DataObjectCollection("GranteeProjectFundingSources"), cDataObjectList)(0)
		If Not aGPFSDO Is Nothing Then
			If aGPFSDO.GetPropertyString("FundingSourceStatusID", "") <> "" Then
				ctlFundingSourceStatus.SelectedField = aGPFSDO.GetPropertyString("FundingSourceStatusID", "")
			End If
		End If

		
	End Sub

	Public Function GetCallbackResult() As String Implements System.Web.UI.ICallbackEventHandler.GetCallbackResult
		Return FundAccountNumber + "~~" + FundCommonName + "~~" + FundSourceType + "~~" + FundSourceEndDate + "~~" + FundBalanceAmount
	End Function

	Public Sub RaiseCallbackEvent(ByVal eventArgument As String) Implements System.Web.UI.ICallbackEventHandler.RaiseCallbackEvent
		GetFundSourceDetails(eventArgument)
	End Sub

	Public Sub GetFundSourceDetails(ByVal aFundID As String)
		Dim aFundingSourceDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Fund", aFundID)
		If Not aFundingSourceDO Is Nothing Then
			FundAccountNumber = aFundingSourceDO.GetPropertyString("FundAccountNumber", "")
			FundCommonName = aFundingSourceDO.GetPropertyString("FundDescription", "")
			FundSourceType = aFundingSourceDO.GetRelatedPropertyString("FundSourceType.Description")
			FundSourceEndDate = aFundingSourceDO.GetRelatedPropertyFormattedString("FundEndDate", "MM/dd/yyyy")
			FundBalanceAmount = GetFundBalance(aFundID).ToString("$#,0.00")

			'The following code is implemented when user clicks save without entering the required fields then all the labels of fund details are being erased.
			'the following way we are assigning the values to the label even though the validation are not right.
			spnFundingSourceID.InnerText = FundAccountNumber
			spnFundingSourceCommonName.InnerText = FundCommonName
			spnFundingSourceType.InnerText = FundSourceType
			spnFundingSourceEndDate.InnerText = FundSourceEndDate
			spnFundingSourceBalance.InnerText = FundBalanceAmount

			
		End If
	End Sub

	Private Function GetFundBalance(ByVal aFundID As String) As Double
		Dim aFundBalance As Double = 0.0
		If aFundID = "" Then
			Return aFundBalance
		End If
		Dim aFundAmount As Double = 0.0
		Dim aGranteeProjectFundAllocated As Double = 0.0
		Dim aFundingSourceDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Fund", aFundID)
		aFundAmount = aFundingSourceDO.GetPropertyDouble("FundAmount")
		Dim aGPFundingSourceDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectFundingSources", "FundID", aFundID)
		Dim aGPFundingSourceDO As cDataObject
		For Each aGPFundingSourceDO In aGPFundingSourceDOL
			aGranteeProjectFundAllocated += aGPFundingSourceDO.GetPropertyDouble("AmountAllocated")
		Next
		Return aFundAmount - aGranteeProjectFundAllocated
	End Function

	Public Sub ValidateFundBalance(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		'Dim aFundID As String
		Dim aAmountAllocated As Double = 0.0
		'Dim aFundAmount As Double = 0.0
		Dim aGranteeProjectAmountAllocated As Double = 0.0
		Dim aFundID As String = Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlFundingSourceName:hdnObjID")
		If aFundID = "" Then
			Exit Sub
		End If
		If (Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlAmountAllocated:txtText") <> "") Then
			'Here we are checking the condition bcoz if they enter some thing character apart from numeric then the code breaks. so we need to handle and exit the sub 
            If IsNumeric(Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlAmountAllocated:txtText")) Then
                'Even though cMoneyTextBox Validates for the RegularExpression , but the regular expression will fire only after the custom Validations. so i am checking whether the Entered Text is valis numeric text with out any $ and hipens
                If Not (System.Text.RegularExpressions.Regex.IsMatch(Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlAmountAllocated:txtText"), "^\s*-?[\d,.]*\s*$")) Then
                    aArgs.IsValid = True
                    Exit Sub
                End If
                aAmountAllocated = Convert.ToDouble(Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlAmountAllocated:txtText"))
            Else
                aArgs.IsValid = True
                Exit Sub
            End If
		End If
		'Dim aFundingSourceDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Fund", aFundID)
		'aFundAmount = aFundingSourceDO.GetRelatedPropertyDouble("FundBalance.FundBalanceAmount")
		'If Not Request.QueryString("GranteeProjectFundingSourcesID") = "0" Then
		'	Dim aGranteeProjectFundingSourcesDO As cDataObject = CType(DataObjectCollection("GranteeProjectFundingSources"), cDataObjectList)(0)
		'	aFundBalance = aFundBalance - aGranteeProjectFundingSourcesDO.GetPropertyDouble("AmountAllocated")
		'End If
		'Dim aGPFundingSourceDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectFundingSources", "FundID", aFundID)
		'Dim aGPFundingSourceDO As cDataObject
		'For Each aGPFundingSourceDO In aGPFundingSourceDOL
		'	aGranteeProjectFundAllocated += aGPFundingSourceDO.GetPropertyDouble("AmountAllocated")
		'Next
		If Not Request.QueryString("GranteeProjectFundingSourcesID") = "0" Then
			Dim aGranteeProjectFundingSourcesDO As cDataObject = CType(DataObjectCollection("GranteeProjectFundingSources"), cDataObjectList)(0)
			aGranteeProjectAmountAllocated = aGranteeProjectFundingSourcesDO.GetPropertyDouble("AmountAllocated")
		End If
		If aAmountAllocated > GetFundBalance(aFundID) - aGranteeProjectAmountAllocated Then
			aArgs.IsValid = False
		End If
   End Sub

	Public Sub ValidateTotalAllocatedAmount(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aGranteeProjectInfoDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectInfo", "GranteeProjectID", GranteeProjectID.ToString)(0)
		If aGranteeProjectInfoDO Is Nothing Then
			aGranteeProjectInfoDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("GranteeProjectInfo")
			aGranteeProjectInfoDO("GranteeProjectID") = Convert.ToInt32(GranteeProjectID)
			aGranteeProjectInfoDO.SaveData()
		End If
		Dim aAwardedAmount As Double = aGranteeProjectInfoDO.GetPropertyDouble("AwardAmount", 0.0)
		Dim aTotalAllocatedAmount As Double = aGranteeProjectInfoDO.GetRelatedPropertyDouble("GranteeProjectTotalAllocatedAmount.TotalAllocatedAmount")
		Dim aAmountAllocated As Double = 0.0
		Dim aGranteeProjectAllocatedAmount As Double = 0.0
		If (Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlAmountAllocated:txtText") <> "") Then
			'aAmountAllocated = Convert.ToDouble(Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlAmountAllocated:txtText"))
			'Here we are checking the condition bcoz if they enter some thing character apart from numeric then the code breaks. so we need to handle the code is commented and exit the sub
            If IsNumeric(Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlAmountAllocated:txtText")) Then
                'Even though cMoneyTextBox Validates for the RegularExpression , but the regular expression will fire only after the custom Validations. so i am checking whether the Entered Text is valis numeric text with out any $ and hipens
                If Not (System.Text.RegularExpressions.Regex.IsMatch(Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlAmountAllocated:txtText"), "^\s*-?[\d,.]*\s*$")) Then
                    aArgs.IsValid = True
                    Exit Sub
                End If
                aAmountAllocated = Convert.ToDouble(Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlAmountAllocated:txtText"))
            Else
                aArgs.IsValid = True
                Exit Sub
            End If
		End If
		'If Not Request.QueryString("GranteeProjectFundingSourcesID") = "0" Then
		'	Dim aGranteeProjectFundingSourcesDO As cDataObject = CType(DataObjectCollection("GranteeProjectFundingSources"), cDataObjectList)(0)
		'	aTotalAllocatedAmount = aTotalAllocatedAmount - aGranteeProjectFundingSourcesDO.GetPropertyDouble("AmountAllocated")
		'End If
		Dim aGPFundingSourceDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectFundingSources", "GranteeProjectID", GranteeProjectID.ToString)
		Dim aGPFundingSourceDO As cDataObject
		For Each aGPFundingSourceDO In aGPFundingSourceDOL
			If Not Request.QueryString("GranteeProjectFundingSourcesID") = aGPFundingSourceDO.GetPropertyString("GranteeProjectFundingSourcesID") Then
				aGranteeProjectAllocatedAmount += aGPFundingSourceDO.GetPropertyDouble("AmountAllocated")
			End If
		Next
		If aAmountAllocated > aAwardedAmount - aGranteeProjectAllocatedAmount Then
			aArgs.IsValid = False
		End If

   End Sub

	Public Sub ValidateUniqueFund(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aFundID As String = Request.Form.Get("mPageFrameCtl:ctlPageContent:ctlFundingSourceName:hdnObjID")
		If aFundID = "" Then Exit Sub
		Dim aGPFSID As String = Request.QueryString("GranteeProjectFundingSourcesID")
		If aGPFSID = 0 Then
			'here we are validating when we are in Add Mode
			If (aFundID <> "") Then
				Dim aGPFSDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectFundingSources", "GranteeProjectID", GranteeProjectID.ToString, "FundID", aFundID)(0)
				If Not aGPFSDO Is Nothing Then
					aArgs.IsValid = False
				Else
					aArgs.IsValid = True
				End If
			End If
		ElseIf aGPFSID > 0 Then
			'Here we are validating when we are in edit Mode
			Dim aDBGPFSDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectFundingSources", "GranteeProjectFundingSourcesID", aGPFSID)(0)
			If Not aDBGPFSDO Is Nothing Then
				'First checking whether the edit record is same as the Fund selected else when they edit if this is not the current record then it will go to else part
				If aDBGPFSDO("FundID") = aFundID Then
					aArgs.IsValid = True
				Else
					Dim aGPFSDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectFundingSources", "GranteeProjectID", GranteeProjectID.ToString, "FundID", aFundID)(0)
					If Not aGPFSDO Is Nothing Then
						aArgs.IsValid = False
					Else
						aArgs.IsValid = True
					End If
				End If
			End If
		End If
   End Sub

	Public Overloads Overrides Function EventController_Save() As Boolean
		Page.Validate()
		If Page.IsValid Then
			Dim aGPFSDO As cDataObject = CType(Me.DataObjectCollection("GranteeProjectFundingSources"), cDataObjectList)(0)
			If GranteeProjectFundingSourcesID > 0 Then
				Dim aHistoryObj As cDataObject = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("GranteeProjectFundingSourcesHistory")
				aHistoryObj("GranteeProjectFundingSourcesID") = aGPFSDO.GetPropertyInt("GranteeProjectFundingSourcesID", 0)
				aHistoryObj("GranteeProjectID") = aGPFSDO.GetPropertyInt("GranteeProjectID", 0)
				aHistoryObj("FundID") = aGPFSDO.GetPropertyInt("FundID", 0)
				aHistoryObj("AmountAllocated") = aGPFSDO.GetPropertyString("AmountAllocated")
				aHistoryObj("FundingSourceStatusID") = aGPFSDO.GetPropertyInt("FundingSourceStatusID", 0)
				aHistoryObj("CreateUser") = aGPFSDO.GetPropertyInt("CreateUser", 0)
				aHistoryObj("CreateDate") = aGPFSDO.GetPropertyString("CreateDate")
				aHistoryObj("ModifyUser") = aGPFSDO.GetPropertyInt("ModifyUser", 0)
				aHistoryObj("ModifyDate") = aGPFSDO.GetPropertyString("ModifyDate")
				aHistoryObj("ChangeType") = "Edit"
				aHistoryObj("HistoryModifyUser") = aUser.UserID
				aHistoryObj("HistoryModifyDate") = Date.Now
				Me.WebSession.DataObjectFactory.SaveDataObject(aHistoryObj)
			End If
			MyBase.EventController_Save()

			'Updating the FundingSourceStatusID column Value
			If spnFundingSourceStatus.Visible Then
				If ctlFundingSourceStatus.SelectedValue <> "" Then aGPFSDO("FundingSourceStatusID") = ctlFundingSourceStatus.SelectedValue
			Else
				aGPFSDO("FundingSourceStatusID") = 1
			End If
			aGPFSDO.SaveData()

			Return True
		Else

			If ctlFundingSourceName.Value = "" Then
				spnFundingSourceID.InnerText = ""
				spnFundingSourceCommonName.InnerText = ""
				spnFundingSourceType.InnerText = ""
				spnFundingSourceEndDate.InnerText = ""
				spnFundingSourceBalance.InnerText = ""
			End If

			Return False
		End If
	End Function
End Class
End Namespace