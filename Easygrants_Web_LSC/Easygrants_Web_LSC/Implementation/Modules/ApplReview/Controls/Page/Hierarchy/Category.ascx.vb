Namespace Implementation.Modules.ApplReview.Controls.Page.Hierarchy
	Public Class cCategory
		Inherits Easygrants_Web.Controls.Base.cWfTADataPresenterCtl

		Protected mPA As String
		Protected mCat As String


		Public Property PA() As String
			Get
				Return mPA
			End Get
			Set(ByVal value As String)
				mPA = value
			End Set
		End Property

		Public Property Cat() As String
			Get
				Return mCat
			End Get
			Set(ByVal value As String)
				mCat = value
			End Set
		End Property


	End Class
End Namespace