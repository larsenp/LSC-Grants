Namespace Implementation.Modules.ApplReview.Controls.PageSection
	Public Class cEvaluation
		Inherits Easygrants_Web.Controls.Base.cWfTADataPresenterCtl

		Protected mPA As String
		Protected mC As String
		Protected mQ As String

		Public Property PA() As String
			Get
				Return mPA
			End Get
			Set(ByVal value As String)
				mPA = value
			End Set
		End Property

		Public Property C() As String
			Get
				Return mC
			End Get
			Set(ByVal value As String)
				mC = value
			End Set
		End Property

		Public Property Q() As String
			Get
				Return mQ
			End Get
			Set(ByVal value As String)
				mQ = value
			End Set
		End Property

	End Class
End Namespace