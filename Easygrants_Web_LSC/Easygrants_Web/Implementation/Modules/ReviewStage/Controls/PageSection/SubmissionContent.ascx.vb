Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports EasyGrants.Web.Modules
Imports Easygrants_Web.Modules.LOI

Namespace Easygrants_Web.Modules.ReviewStage.Controls.PageSection

Public MustInherit Class cReviewSubmissionContent
	Inherits Easygrants_Web.Controls.Base.cValidationDataPresenterCtl
'=================================================

	Protected spnInvalidText As HtmlGenericControl
	Protected spnSubmitText As HtmlGenericControl


'=================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		Dim aWfDataObject As cWfTaskAssignment

		aWfDataObject = CType(mDataObjHash("WfTaskAssignment")(0), cWfTaskAssignment)

		If Not Valid Then
			spnInvalidText.Visible = True

		Else
			If aWfDataObject.GetPropertyInt("WfTaskStatusID") = 1 Or aWfDataObject.GetPropertyInt("WfTaskStatusID") = 4 Then
				spnSubmitText.Visible = True

			End If
		End If
	End Sub

'-------------------------------------------------



'=================================================
End Class
End Namespace