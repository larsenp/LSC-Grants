Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports EasyGrants.Web.Modules
Imports EasyGrants.Web.User

Namespace EasyGrants.Modules.Application.Controls.Page

Public MustInherit Class cSubmissionContentPR
    Inherits Easygrants_Web.Controls.Base.cValidationDataPresenterCtl
'=================================================

    Protected spnInvalidText As HtmlGenericControl
    Protected spnNoReportText As HtmlGenericControl
    Protected spnSubmitText As HtmlGenericControl
    Protected spnSubmitButton As HtmlGenericControl
    
    Protected spnAppNotGenerated As HtmlGenericControl
    Protected spnAppGenerated As HtmlGenericControl
    Protected spnValidationPage As HtmlGenericControl
	'Protected btnSubmit As cButton

	Protected mForceGen As Boolean = True

'=================================================

	Public Property ForceGen() As Boolean
		Get
			Return mForceGen
		End Get
		Set(ByVal Value As Boolean)
			mForceGen = Value
		End Set
	End Property

'=================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		Dim aWfDataObject As cWfTaskAssignment
		Dim aValidationNode As XmlNode
		Dim aValid As Boolean
		Dim aValidPDF As Boolean = False
		Dim aReportDOList As cDataObjectList
		Dim aReportDO As cDataObject

		If Request.QueryString("AppNotGenerated") = "True" Then
			spnAppNotGenerated.Visible = True
		End If

		aValidationNode = (CType(Page, cModulePage)).ValidationNode
		aWfDataObject = CType(mDataObjHash("WfTaskAssignment")(0), cWfTaskAssignment)
		'Check final PDF generation
		aReportDOList = aWfDataObject.GetRelatedPropertyDataObjectList("ReportOutput")
		If aReportDOList.Count > 0 Then
			aReportDO = aReportDOList(0)
			IF aReportDO.GetPropertyInt("GenStatus",0) = -1 And Not aReportDO.GetPropertyValue("ReportOutputData") Is Nothing Then
				aValidPDF = True
			End If
		End If
		If aValidPDF Then
			spnAppGenerated.Visible = True
			spnAppNotGenerated.Visible = False
			spnValidationPage.Visible = False
		Else
			spnAppNotGenerated.Visible = True
			spnValidationPage.Visible = True
		End If		

		aValid = Validate(aValidationNode, WebSession.DataObjectFactory)

		If Not aValid Then
			spnInvalidText.Visible = True
			'spnSubmitButton.Visible = False
			spnAppGenerated.Visible = False
			spnAppNotGenerated.Visible = False
			spnValidationPage.Visible = False
		Else
			spnSubmitText.Visible = True
		End If
		
		If aValid And aValidPDF Then
			spnSubmitButton.Visible = True
		Else
			spnSubmitButton.Visible = False
		End If		
		
	End Sub

'-------------------------------------------------

	Public Sub SubmissionContent_Submit()
		dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		dim aList as cDataObjectList
		
		if aUser.WfTaskID = 7 then
			aList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectWHCF", _
				"GranteeProjectID", aUser.GranteeProjectID.ToString())
				
			if aList.Count > 0 then
				if aList(0).GetPropertyBool("3rdYearRequest") = True then
					try
						aList(0).RaiseEvent(18, aUser.UserID)
					catch
					end try
				end if
			end if
		end if
		
		Dim aSubmitPage as cSubmissionModulePage = CType(Page, cSubmissionModulePage)
		aSubmitPage.PostSubmitModuleConfig = Request.QueryString("Config")
		
		aList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModule", _
			"WfTaskID", aUser.WfTaskID.ToString())
			
		if aList.Count > 0 then
			aSubmitPage.PostSubmitModuleName = aList(0).GetPropertyString("ModuleName")
		else
			aSubmitPage.PostSubmitModuleName = "ProgressReport"
		end if
		
		aSubmitPage.Submit(ForceGen)
	End Sub

'=================================================
End Class
End Namespace