Namespace Implementation.Modules.Application.PageSection

Public Class cFiscalQuestion
	Inherits Core_Web.Controls.Base.cLSCDataPresenterCtl

	Protected mPartNum As Integer
	Protected mQuestionNum As Integer

	Public Property PartNum() As Integer
		Get
			Return mPartNum
		End Get
		Set(ByVal value As Integer)
			mPartNum = value
		End Set
	End Property

	Public Property QuestionNum() As Integer
		Get
			Return mQuestionNum
		End Get
		Set(ByVal value As Integer)
			mQuestionNum = value
		End Set
	End Property

End Class


End Namespace
