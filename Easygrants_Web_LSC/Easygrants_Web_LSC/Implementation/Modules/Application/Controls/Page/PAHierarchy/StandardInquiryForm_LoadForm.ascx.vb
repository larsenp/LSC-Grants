Namespace Implementation.Modules.Application.Controls.Page.PAHierarchy

Public Class cStandardInquiryForm
	Inherits Core_Web.Controls.Base.cLSCDataPresenterCtl

	Private mInquiryID As Integer

	Public Property InquiryID() As Integer
		Get
			Return mInquiryID
		End Get
		Set(ByVal value As Integer)
			mInquiryID = value
		End Set
	End Property
End Class

End Namespace
