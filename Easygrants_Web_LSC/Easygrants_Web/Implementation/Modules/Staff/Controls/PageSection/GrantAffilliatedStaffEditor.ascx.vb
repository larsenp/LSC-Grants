Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.Web.Modules
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports Core.Web

Namespace Easygrants_Web.Controls.PageSection
Public Class cGrantAffilliatedStaffEditor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
	'============================================================= 

	'Protected ctlIsPrimary As cCheckBox

'=============================================================

 Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub
Public Overrides Sub DataPresenter_SaveDataObjects()
		Dim aGranteeProjectID As Integer = Convert.ToInt32(Request.QueryString.Get("GranteeProjectID"))
		Dim aPrevGranteeProjectSA As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectStaffAffiliation", _
						"GranteeProjectID", aGranteeProjectID, "IsPrimary", "True")

		MyBase.DataPresenter_SaveDataObjects()

		Dim aPrimList As cDataObjectList
		Dim aGranteeProjList As cDataObjectList
		Dim aPOA As cDataObject
		Dim ctlIsPrimary As cCheckBox
		Dim aDO As cDataObject

		ctlIsPrimary = CType(Me.FindControl("ctlIsPrimary"), cCheckBox)

		aGranteeProjList = Me.DataObjectCollection("GranteeProjectStaffAffiliation")
		aPOA = aGranteeProjList(0)

		'Mark all affiliations for the person as not Primary
		If ctlIsPrimary.Value = True Then
			aPrimList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectStaffAffiliation", _
						"GranteeProjectID", aPOA.GetPropertyInt("GranteeProjectID", 0), "IsPrimary", "True")
			If Not aPrimList Is Nothing Then
				For Each aDO In aPrimList
					If aGranteeProjList(0).GetPropertyInt("GranteeProjectStaffAffiliationID", 0) <> aDO.GetPropertyInt("GranteeProjectStaffAffiliationID", 0) Then
						aDO("IsPrimary") = False
						WebSession.DataObjectFactory.SaveDataObject(aDO)
					End If
				Next
			End If

			If aPrevGranteeProjectSA.Count > 0 Then
				Dim aGPSAHistory As cDataObject
				aGPSAHistory = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("GranteeProjectStaffAffiliationHistory")
				aGPSAHistory("GranteeProjectID") = aPrevGranteeProjectSA(0)("GranteeProjectID")
				aGPSAHistory("GranteeProjectStaffAffiliationID") = aPrevGranteeProjectSA(0)("GranteeProjectStaffAffiliationID")
				aGPSAHistory("StaffPersonID") = aPrevGranteeProjectSA(0)("StaffPersonID")
				aGPSAHistory("AffiliationTypeID") = aPrevGranteeProjectSA(0)("AffiliationTypeID")
				aGPSAHistory("CreateDate") = System.DateTime.Now
				aGPSAHistory("CreateUser") = aPOA("CreateUser")
				WebSession.DataObjectFactory.SaveDataObject(aGPSAHistory)
			End If
		End If




	End Sub
End Class
End Namespace