Namespace Implementation.Modules.Application.Controls.Page
    Public Class cBudgetInfo
        Inherits Core_Web.Controls.Base.cDataPresenterCtl

        Private mBudgetTypeID As Integer

        Public Property BudgetTypeID() As Integer
            Get
                Return mBudgetTypeID
            End Get
            Set(ByVal value As Integer)
                mBudgetTypeID = value
            End Set
        End Property

    End Class
End Namespace