Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports System.Xml
Imports Core.Web.User
Imports Easygrants_Web.Controls
Imports Easygrants_Web.Controls.PageSection
Imports System.Diagnostics
Imports System.Web.UI
Imports Core.Web.SvrCtls
Imports EasyGrants.DataAccess

Namespace Easygrants_Web.Controls.PageSection
    Public MustInherit Class cOtherSupport

        Inherits Core_Web.Controls.Base.cDataPresenterCtl

'============================================================= 

        Protected ctlNoOtherSupport As cCheckBox
		Protected btnAdd As cCSSButton
        Protected spnAdd as HtmlGenericControl
		Protected trNoOtherSupport as HtmlTableRow
		
'============================================================= 
 
        Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            MyBase.CoreCtl_Load(aSrc, aEvent)

			'if ctype(me.DataObjectCollection("GranteeProject"), cDataObjectList)(0).GetPropertyBool("NoOtherSupport", False) then
			'	spnAdd.Visible = False
			'End If			
			
			'if ctype(me.DataObjectCollection("GranteeProjectOtherSupport"), cDataObjectList).Count > 0 then
			'	trNoOtherSupport.Visible = False
			'End If			
			
			'ctlNoOtherSupport = FindControl("ctlNoOtherSupport")
			'ctlNoOtherSupport.Set_ServerClick(AddressOf HideAdd)
        End Sub
        
  '-------------------------------------------------------------

	Private Sub HideAdd(ByVal sender As System.Object, ByVal e As System.EventArgs)
		me.EventController_Save()
		
		if ctlNoOtherSupport.Value then
			spnAdd.Visible = False
		else
			spnAdd.Visible = True
		End If		
	End Sub

'======================================================
   
    End Class
End Namespace