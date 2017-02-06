Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.Web.Modules
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports Core.Web
Imports Core.Web.cCoreCtl

Namespace Easygrants_Web.Controls.PageSection
Public Class cEducation_Editor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'============================================================= 

    Protected ctlIsPrimary As cCheckBox
    Protected spnPersonContent As HtmlGenericControl
    Protected spnOrgContent As HtmlGenericControl
    Protected trPerson As HtmlTableRow
    Protected trOrg As HtmlTableRow
    
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

	End Sub
		
'=============================================================

	Public Overrides Sub DataPresenter_SaveDataObjects()
       
		MyBase.DataPresenter_SaveDataObjects()

	End Sub
	
'=============================================================

	Public Sub Save()
		
		dim aURL as String
		dim aEducationID as String
		dim aEducationDO as cDataObject
		
		DataPresenter_SaveDataObjects()
		
		aEducationDO = Me.DataObjectCollection("Education")(0)
		
		if not aEducationDO is nothing then
			aEducationID = aEducationDO.GetRelatedPropertyString("EducationID")	
			aURL = Request.RawUrl.ToString()
			aURL = cWebLib.RemoveQuerystringParameter(aURL, "EducationID")
			aURL = cWebLib.AddQuerystringParameter(aURL, "EducationID", aEducationID)
			response.Redirect(aURL)
		end if
		
	End Sub
	
'=============================================================
End Class 'cEducationEditor
End Namespace