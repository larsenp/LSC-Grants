Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page

Public MustInherit Class cParticipantSummary
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
	Protected spnCloseWindow As HtmlGenericControl
	
	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)
        spnCloseWindow.Visible = False
        
    End Sub
    
    Public Sub btnClose_Clicked()
		spnCloseWindow.Visible = True
	End Sub
	
End Class

End Namespace
