Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports EasyGrants.Web.Modules
Imports EasyGrants.Web.User

Namespace EasyGrants.Modules.Application.Controls.Page

Public MustInherit Class cSubmissionContentThirdParty
    Inherits Easygrants_Web.Controls.Base.cValidationDataPresenterCtl
'=================================================

    Protected spnInvalidText As HtmlGenericControl
    Protected spnNoReportText As HtmlGenericControl
    Protected spnSubmitText As HtmlGenericControl
    Protected spnSubmitButton As HtmlGenericControl
    
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


		aValidationNode = (CType(Page, cModulePage)).ValidationNode
		aWfDataObject = CType(mDataObjHash("WfTaskAssignment")(0), cWfTaskAssignment)
		
		aValid = Validate(aValidationNode, WebSession.DataObjectFactory)

		If Not aValid Then
			spnInvalidText.Visible = True
			spnSubmitText.Visible = False
			spnSubmitButton.Visible = False
		Else
			spnInvalidText.Visible = False
			spnSubmitText.Visible = True
			spnSubmitButton.Visible = True
		End If
		
	End Sub

'-------------------------------------------------

	Public Sub SubmissionContent_Submit()
		Dim aSubmitPage as cSubmissionModulePage
		aSubmitPage = CType(Page, cSubmissionModulePage)
		'aSubmitPage.PostSubmitModuleConfig = Request.QueryString("Config")
		'aSubmitPage.PostSubmitModuleName = "ThirdParty"
		aSubmitPage.Submit(ForceGen)

	End Sub

'=================================================
End Class
End Namespace