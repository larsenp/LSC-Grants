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

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cGrantInfoEditor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'=============================================================

	
	Protected CtlSubjectArea As cDropDown
	Protected CtlOther As cTextBox
	Protected CtlResearchAreas As cDoubleListBox2
	Protected ctlResearchOther As cTextBox
	Protected ctlStart As cDateTextBox
	Protected ctlEnd As cDateTextBox
	Protected ctlStatus As cDropDown

'=============================================================
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		 ctlStatus = CType(Me.FindControl("ctlStatus"), cDropDown)
	End Sub


'=============================================================
	Public Sub ValidatevalSubjectArea(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)

		CtlSubjectArea = CType(Me.FindControl("CtlSubjectArea"), cDropDown)
		CtlOther = CType(Me.FindControl("CtlOther"), cTextBox)
		If CtlSubjectArea.SelectedText.ToLower = "other" Then
			If CtlOther.Value.Trim = "" Then
				aArgs.IsValid = False
			End If
		Else
			CtlOther.Value = ""
			aArgs.IsValid = True
		End If
   End Sub
   Public Sub ValidateResearchArea(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)

		CtlResearchAreas = CType(Me.FindControl("CtlResearchAreas"), cDoubleListBox2)
		ctlResearchOther = CType(Me.FindControl("ctlResearchOther"), cTextBox)
		'Research Area value 13 is Other
		Dim aValueArray As String() = CtlResearchAreas.SelectedValueList.Split(",")
		Dim aValue As String
		Dim aHasOther As Boolean = False
		For Each aValue In aValueArray
			If aValue = "13" Then
				aHasOther = True
				Exit For
			End If
		Next
		If aHasOther AndAlso ctlResearchOther.Value.Trim = "" Then
			aArgs.IsValid = False
		End If
   End Sub
   Public Sub ValGranteeProjTerm(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)

		ctlStart = CType(Me.FindControl("ctlStart"), cDateTextBox)
		ctlEnd = CType(Me.FindControl("ctlEnd"), cDateTextBox)
		If IsDate(ctlStart.DateString) = True And IsDate(ctlEnd.DateString) = True Then
			Dim StartDate As Date = ctlStart.DateString
			Dim EndDate As Date = ctlEnd.DateString
			If StartDate >= EndDate Then
				aArgs.IsValid = False
			Else
				aArgs.IsValid = True
			End If
		End If

   End Sub

   Public Overrides Sub DataPresenter_SaveDataObjects()
		Dim aGrantStatusID As Integer = CType(Me.DataObjectCollection("GrantInfoGranteeProject"), cDataObjectList)(0).GetPropertyInt("GrantStatusID", 0)
		MyBase.DataPresenter_SaveDataObjects()

		If Not ctlStatus Is Nothing Then
			If aGrantStatusID <> 0 AndAlso aGrantStatusID <> ctlStatus.SelectedValue Then
				Dim aGrantStatusDO As cDataObject = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("GrantStatusHistory")
				aGrantStatusDO("GranteeProjectID") = Me.Request.QueryString("GranteeProjectID")
				aGrantStatusDO("PersonID") = CType(CType(Page, cModulePage).ModuleUser, cEGUser).PersonID
				aGrantStatusDO("GrantStatusID") = aGrantStatusID
				aGrantStatusDO("CreateDate") = System.DateTime.Now()
				aGrantStatusDO.SaveData()
			End If
		End If
	End Sub

    Public Sub ValidatevalResearchAreas(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
        CtlResearchAreas = CType(Me.FindControl("CtlResearchAreas"), cDoubleListBox2)
        ctlResearchOther = CType(Me.FindControl("ctlResearchOther"), cTextBox)
        Dim aValueList As String = CtlResearchAreas.SelectedValueList()
        Dim aSplitCount As String() = aValueList.Split(",")
        If Array.IndexOf(aSplitCount, "13") < 0 Then

        Else
            If ctlResearchOther.Value.Trim = "" Then
                aArgs.IsValid = False
			Else
				'RN - 10.08.2008 Commented the below line beacuse it is resetting the text in the other textbox to empty string.
				'ctlResearchOther.Value = ""
				aArgs.IsValid = True
            End If
        End If
    End Sub
End Class
End Namespace
