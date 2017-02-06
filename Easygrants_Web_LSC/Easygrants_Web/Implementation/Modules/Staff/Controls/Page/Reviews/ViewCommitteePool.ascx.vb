Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public MustInherit Class cViewCommitteePool
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
	Protected tblCloseWindow as HtmlTable
	Protected spnCloseControl as HtmlGenericControl

   Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)
        tblCloseWindow.Visible = True 
   End Sub	
   
	Public Sub CloseWindow()
		tblCloseWindow.Visible = True
		spnCloseControl.Visible = True
	End Sub	
	
End Class
End Namespace