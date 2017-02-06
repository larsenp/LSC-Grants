

Namespace Easygrants_Web.Controls.Base

Public Class cPostSubmitDataPresenterCtl
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		SavePostSubmit = True
	End Sub

'=============================================================
End Class

End Namespace 'Easygrants_Web.Controls.Base
