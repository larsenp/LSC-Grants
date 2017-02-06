Namespace Implementation.Modules.GAR.ProjectedStaffing.PageSection
	Public Class cProjectedStaffingEditor
        Inherits Easygrants_Web.Controls.Base.cWfTADataPresenterCtl

		Private mOffTypeID As Integer

		Public Property OffTypeID() As Integer
			Get
				Return mOffTypeID
			End Get
			Set(ByVal value As Integer)
				mOffTypeID = value
			End Set
		End Property
	End Class
End Namespace
