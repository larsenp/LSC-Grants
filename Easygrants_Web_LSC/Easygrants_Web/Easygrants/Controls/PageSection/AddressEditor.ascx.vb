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
Public Class cAddressEditor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'============================================================= 

    Protected ctlIsPrimary As cCheckBox
    Protected trPerson As HtmlTableRow
        Protected WithEvents CUserCtlLoader1 As Core.Web.SvrCtls.cUserCtlLoader
        Protected WithEvents spnPerson As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnOrg As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnAddress1 As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnAddress2 As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnAddress3 As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnCity As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnState As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnOtherRegion As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnZip As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnCountry As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnAddressType As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnIsPrimary As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnSave As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnCancel As System.Web.UI.HtmlControls.HtmlGenericControl
        'Protected WithEvents spnConfigXML As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected trOrg As HtmlTableRow
    
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Select Case EntityTypeID
			Case 1 'Person E-mail
				trOrg.Visible = False
			Case 2 'Organization E-mail
				trPerson.Visible = False
		End Select
	End Sub
	
'=============================================================

	Public Overrides Sub DataPresenter_SaveDataObjects()
        Dim aPrimList As cDataObjectList
		Dim aAddrList As cDataObjectList
		
        ctlIsPrimary = CType(Me.FindControl("ctlIsPrimary"), cCheckBox)
        aAddrList = me.DataObjectCollection("Address")
        
        if ctlIsPrimary.Value = True then
			aPrimList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Address", _
						"EntityID", EntityID, "EntityTypeID", EntityTypeID, "IsPrimary", "True")
						
			if not aPrimList is nothing then
				if aPrimList.Count > 0 then
					if aAddrList(0).GetPropertyInt("AddressID", 0) <> aPrimList(0).GetPropertyInt("AddressID", 0) then 
						aPrimList(0)("IsPrimary") = False
						WebSession.DataObjectFactory.SaveDataObject(aPrimList(0))
					end if
				end if
			End If			
		End If        
        
		MyBase.DataPresenter_SaveDataObjects()

	End Sub
	
'=============================================================

        Private Sub InitializeComponent()

        End Sub
    End Class 'cAddressEditor
End Namespace