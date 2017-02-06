Imports Core.DataAccess

Namespace Implementation.Modules.ReviewStage.Controls.Page
Public MustInherit Class cProjectTeam
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected spnCVContact1Name As HtmlGenericControl
	Protected spnCVContact1Title As HtmlGenericControl
	Protected spnCVContact1Institution As HtmlGenericControl
	Protected spnCVContact2Name As HtmlGenericControl
	Protected spnCVContact2Title As HtmlGenericControl
	Protected spnCVContact2Institution As HtmlGenericControl
	Protected spnCVContact3Name As HtmlGenericControl
	Protected spnCVContact3Title As HtmlGenericControl
	Protected spnCVContact3Institution As HtmlGenericControl
	Protected spnCVContact4Name As HtmlGenericControl
	Protected spnCVContact4Title As HtmlGenericControl
	Protected spnCVContact4Institution As HtmlGenericControl

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)	
		
		Dim aGranteeProjectPersonContactInfoDOList As cDataObjectList
		Dim aGranteeProjectPersonContactInfoDO As cDataObject
		Dim aLoop As Integer = 1
		Dim aSpan As HtmlGenericControl

		aGranteeProjectPersonContactInfoDOList = CType(DataObjectCollection("GranteeProjectPersonContactInfo"), cDataObjectList)
		If aGranteeProjectPersonContactInfoDOList.Count = 0 Then
			spnCVContact1Name.InnerText = "No people."
		End If		
		For Each aGranteeProjectPersonContactInfoDO In aGranteeProjectPersonContactInfoDOList
			aSpan = CType(FindControl("spnCVContact" + aLoop.ToString() + "Name"), HtmlGenericControl)
			aSpan.InnerText = aGranteeProjectPersonContactInfoDO.GetPropertyString("FirstName") + " " + _
				aGranteeProjectPersonContactInfoDO.GetPropertyString("MiddleName") + " " + _
				aGranteeProjectPersonContactInfoDO.GetPropertyString("LastName")
			aSpan = CType(FindControl("spnCVContact" + aLoop.ToString() + "Title"), HtmlGenericControl)
			aSpan.InnerText = aGranteeProjectPersonContactInfoDO.GetPropertyString("Title")
			aSpan = CType(FindControl("spnCVContact" + aLoop.ToString() + "Institution"), HtmlGenericControl)
			aSpan.InnerText = aGranteeProjectPersonContactInfoDO.GetRelatedPropertyString("Organization.CommonOrganizationName")
			aLoop = aLoop + 1
		Next		
	End Sub

End Class
End Namespace