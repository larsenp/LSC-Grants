Namespace Implementation.Controls.PageSection

Public Class cDataChangeLog
	Inherits Core_Web.Controls.Base.cLSCDataPresenterCtl

Private mTableName As String
Private mPrimaryKey As Integer

	Public Property TableName() As String
		Get
			Return mTableName
		End Get
		Set(ByVal value As String)
			mTableName = value
		End Set
	End Property

	Public Property PrimaryKey() As Integer
		Get
			Return mPrimaryKey
		End Get
		Set(ByVal value As Integer)
			mPrimaryKey = value
		End Set
	End Property

	'On load, set table name and primary key properties based on the DataObject in which this control is displayed
End Class

End Namespace
