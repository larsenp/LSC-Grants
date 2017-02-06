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
Public Class cWebAddressEditor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
	
'============================================================= 

    Protected ctlIsPrimary As cCheckBox
    Protected trPerson As HtmlTableRow
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
	
'-------------------------------------------------------------

	Public Overrides Sub DataPresenter_SaveDataObjects()
        Dim aPrimList As cDataObjectList
		Dim aAddrList As cDataObjectList
		
        ctlIsPrimary = CType(Me.FindControl("ctlIsPrimary"), cCheckBox)
        aAddrList = me.DataObjectCollection("WebAddress")
        
        If ctlIsPrimary.Value = True Then
			aPrimList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WebAddress", _
						"EntityID", EntityID, "EntityTypeID", EntityTypeID, "IsPrimary", "True")

			If Not aPrimList Is Nothing Then
				If aPrimList.Count > 0 Then 
					If aAddrList(0).GetPropertyInt("WebAddressID", 0) <> aPrimList(0).GetPropertyInt("WebAddressID", 0) Then
						aPrimList(0)("IsPrimary") = False
						WebSession.DataObjectFactory.SaveDataObject(aPrimList(0))
					End If
				End If
			End If			
	
		End If        
        
		MyBase.DataPresenter_SaveDataObjects()
        
	End Sub
	
'=============================================================
End Class 'cWebAddressEditor
End Namespace