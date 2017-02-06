Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml

Namespace Core_Web.Controls.PageSection

Public MustInherit Class cProjectRelationships_Content
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

'====================================================

    Private mGranteeProjectID As Integer
    Private mWfTaskAssignmentID As Integer
    Private mWfTaskID As Integer
    Private mPersonID As Integer
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

    Public Property GranteeProjectID() As Integer
        Get
            GranteeProjectID = mGranteeProjectID
        End Get
        Set(ByVal aGranteeProjectID As Integer)
            mGranteeProjectID = aGranteeProjectID
        End Set
    End Property

'----------------------------------------------------

    Public Property WfTaskAssignmentID() As Integer
        Get
            WfTaskAssignmentID = mWfTaskAssignmentID
        End Get
        Set(ByVal aWfTaskAssignmentID As Integer)
            mWfTaskAssignmentID = aWfTaskAssignmentID
        End Set
    End Property

'----------------------------------------------------

    Public Property WfTaskID() As Integer
        Get
            WfTaskID = mWfTaskID
        End Get
        Set(ByVal aWfTaskID As Integer)
            mWfTaskID = aWfTaskID
        End Set
    End Property

'----------------------------------------------------

    Public Property PersonID() As Integer
        Get
            PersonID = mPersonID
        End Get
        Set(ByVal aPersonID As Integer)
            mPersonID = aPersonID
        End Set
    End Property

'----------------------------------------------------

    Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
        Dim aDataObject As cDataObject

        DisplayPropertyNode = aDisplayPropertyNode
        aDataObject = aDataObjectList(0)
        WfTaskAssignmentID = aDataObject.GetRelatedPropertyString("WfTaskAssignmentID")
        WfTaskID = aDataObject.GetRelatedPropertyString("WfTaskID")
        GranteeProjectID = aDataObject.GetRelatedPropertyString("GranteeProjectID")
        PersonID = aDataObject.GetRelatedPropertyString("PersonID")
    End Sub

'----------------------------------------------------

    Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)


    End Sub

'----------------------------------------------------

End Class
End Namespace