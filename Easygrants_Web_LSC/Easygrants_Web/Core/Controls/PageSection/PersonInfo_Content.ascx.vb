Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml

Namespace Core_Web.Controls.PageSection

Public MustInherit Class cPersonInfo_Content
    Inherits EasyGrants_Web.Controls.Base.cEGDataPresenterCtl

'====================================================

	Private mPersonID as Integer

    Private mDisplayPropertyNode As XmlNode
    
'====================================================

    Public Overrides Property DisplayPropertyNode() As XmlNode
        Get
            DisplayPropertyNode = mDisplayPropertyNode
        End Get
        Set(ByVal Value As XmlNode)
            mDisplayPropertyNode = Value
        End Set
    End Property
    
'----------------------------------------------------
    Public Property PersonID() As Integer
        Get
            PersonID = mPersonID
        End Get
        Set(ByVal PersonID As Integer)
            mPersonID = PersonID
        End Set
	End Property  
	
'----------------------------------------------------

    Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
        Dim aPropertyKey As String
		
        DisplayPropertyNode = aDisplayPropertyNode

        aPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey").ToString()
        PersonID = aDataObjectList(0).GetRelatedPropertyString(aPropertyKey)

    End Sub
  
'----------------------------------------------------

    Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)

    End Sub
    
'----------------------------------------------------

End Class
End Namespace