Imports Core.DataAccess
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Controls.PageSection
Public Class cPhoneEditor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'============================================================= 

    Protected ctlIsPrimary As cCheckBox
        Protected WithEvents Cuserctlloader1 As Core.Web.SvrCtls.cUserCtlLoader
        Protected WithEvents Table1 As System.Web.UI.HtmlControls.HtmlTable
        Protected WithEvents spnPhone As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnPhoneExt As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnPhoneType As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnIsPrimary As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents Table2 As System.Web.UI.HtmlControls.HtmlTable
        Protected WithEvents spnSave As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnCancel As System.Web.UI.HtmlControls.HtmlGenericControl
        'Protected WithEvents spnConfigXML As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected trPhoneExt As HtmlTableRow
        Protected trPersonReadOnly As HtmlTableRow
        Protected trOrgReadOnly As HtmlTableRow

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Select Case EntityTypeID
                Case 1 'Person Phone
                    trOrgReadOnly.Visible = False
                Case 2 'Institution Phone
                    trPersonReadOnly.Visible = False
            End Select
	End Sub
	

'=============================================================

	Public Overrides Sub DataPresenter_SaveDataObjects()
        Dim aPrimList As cDataObjectList
        Dim aPrimDO As cDataObject
		Dim aPhoneList As cDataObjectList
		
        ctlIsPrimary = CType(Me.FindControl("ctlIsPrimary"), cCheckBox)
        aPhoneList = me.DataObjectCollection("Phone")
        
        If ctlIsPrimary.Value = True Then
			aPrimList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Phone", _
						"EntityID", EntityID, "EntityTypeID", EntityTypeID, "IsPrimary", "True")

			If Not aPrimList Is Nothing Then
				For Each aPrimDO In aPrimList
					If aPhoneList(0).GetPropertyInt("PhoneID", 0) <> aPrimDO.GetPropertyInt("PhoneID", 0) Then
						aPrimDO("IsPrimary") = False
						WebSession.DataObjectFactory.SaveDataObject(aPrimDO)
					End If
				Next				
			End If			

		End If        
        
		MyBase.DataPresenter_SaveDataObjects()
        
	End Sub
	
'=============================================================

        Private Sub InitializeComponent()

        End Sub
    End Class 'cPhoneEditor
End Namespace