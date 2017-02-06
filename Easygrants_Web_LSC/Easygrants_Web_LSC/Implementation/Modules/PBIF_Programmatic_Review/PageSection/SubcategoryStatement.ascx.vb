Namespace Implementation.Modules.PBIF_Programmatic_Review.PageSection

	Public Class cSubcategoryStatement
		Inherits Core_Web.Controls.Base.cLSCDataPresenterCtl

		Protected mCategoryNum As Integer
		Protected mSubcategoryNum As Integer

		Public Property CategoryNum() As Integer
			Get
				Return mCategoryNum
			End Get
			Set(ByVal value As Integer)
				mCategoryNum = value
			End Set
		End Property

		Public Property SubcategoryNum() As Integer
			Get
				Return mSubcategoryNum
			End Get
			Set(ByVal value As Integer)
				mSubcategoryNum = value
			End Set
		End Property

	End Class

End Namespace