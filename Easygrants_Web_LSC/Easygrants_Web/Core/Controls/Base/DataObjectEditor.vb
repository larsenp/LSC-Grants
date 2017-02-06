Imports Core.DataAccess
Imports Core.Web

Namespace Core_Web.Controls.Base

Public Class cDataObjectEditor
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

	protected mDataObjectCollectionKey as String
	protected mPrimaryKeyPropertyID as String
	
'-----------------------------------------------------

	Public Property DataObjectCollectionKey as String
		Set
			mDataObjectCollectionKey = value
		End Set		
		Get
			return mDataObjectCollectionKey '"Organization"
		End Get		
	End Property	

'-----------------------------------------------------

	Public Property PrimaryKeyPropertyID as String
		Set
			mPrimaryKeyPropertyID = value
		End Set		
		Get
			return mPrimaryKeyPropertyID '"OrganizationID"
		End Get		
	End Property	

'-----------------------------------------------------

	Public ReadOnly Property ReturnURL as String
		Get
			return Request.QueryString("ReturnURL")
		End Get		
	End Property	
	
'=============================================================

    Public Overloads Overrides Function EventController_Save() As Boolean
		Dim aNewDO as Boolean
		Dim aDataObjectList As cDataObjectList
		Dim aURL As String

		aDataObjectList = DataObjectCollection(DataObjectCollectionKey)
		If aDataObjectList is nothing Then
			aNewDO = False
		Else
			aNewDO = aDataObjectList(0).IsNewDataObject
		End If		
		
            If MyBase.EventController_Save() Then
                aURL = ReturnURL
                If Not aDataObjectList Is Nothing And aNewDO Then
                    aURL = cWebLib.AddQuerystringParameter(aURL, PrimaryKeyPropertyID, _
                    aDataObjectList(0).GetPropertyString(PrimaryKeyPropertyID))
                    aURL = cWebLib.AddQuerystringParameter(aURL, "NewObj", DataObjectCollectionKey)
                End If

                Response.Redirect(aURL)
            End If

        End Function

        '=============================================================
End Class

End Namespace 'Core_Web.Controls.Base