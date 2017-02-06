Imports Core.Web.Modules

Namespace Core_Web.Controls.Base
Public Class cSaveCtl
	Inherits Core.Web.SvrCtls.cSortCtl

	Protected mIsSaveOnSort As Boolean

	Public Property IsSaveOnSort() As Boolean
		Get
			Return mIsSaveOnSort
		End Get
		Set(ByVal Value As Boolean)
			mIsSaveOnSort = Value
		End Set
	End Property
	
	Protected Overrides Sub AddSortToQueryString()
		If IsSaveOnSort Then
			If Not CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).EventController_Save() Then
				Exit Sub
			End If
		End If
		MyBase.AddSortToQueryString()
	End Sub

End Class
End Namespace
