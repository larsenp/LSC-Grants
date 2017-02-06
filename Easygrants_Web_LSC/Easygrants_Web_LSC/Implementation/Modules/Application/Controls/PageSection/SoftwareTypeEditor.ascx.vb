Namespace Implementation.Modules.Application.Controls.PageSection
	Public Class cSoftwareTypeEditor
		Inherits Core_Web.Controls.Base.cDataPresenterCtl

		Private mSoftwareTypeID As Integer

		Public Property SoftwareTypeID() As Integer
			Get
				Return mSoftwareTypeID
			End Get
			Set(ByVal value As Integer)
				mSoftwareTypeID = value
			End Set
		End Property

	End Class
End Namespace