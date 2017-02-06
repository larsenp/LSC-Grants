Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base

<ValidationPropertyAttribute("OrgSelectLauncher")> Public MustInherit Class cOrgSelectLauncher
    Inherits Core.Web.cCoreCtl
'=============================================================	
    Protected txtOrgName As HtmlInputText
    Protected hdnOrgID As HtmlInputHidden	
    Protected valReqText As RequiredFieldValidator

    Private mDisplayPropertyNode As XmlNode

'=============================================================

    Public ReadOnly Property OrgSelectLauncher() As String
      Get
         Return txtOrgName.Value.ToString()
      End Get

   End Property
   	
'=============================================================	

    Public Property OrganizationName() As String
    Get
        Return txtOrgName.Value
    End Get
    Set(ByVal Value As String)
        txtOrgName.Value = Value
    End Set
    End Property

'-------------------------------------------------------------	

    Public Property OrganizationID() As String
    Get
        Return hdnOrgID.Value
    End Get
    Set(ByVal Value As String)
        hdnOrgID.Value = Value
    End Set
    End Property

'----------------------------------------------------

    Public Overrides Property DisplayPropertyNode() As XmlNode
        Get
            DisplayPropertyNode = mDisplayPropertyNode
        End Get
        Set(ByVal Value As XmlNode)
            mDisplayPropertyNode = Value
        End Set
    End Property

'-------------------------------------------------------------

    Public Overridable ReadOnly Property RequiredFieldValidator() As RequiredFieldValidator
    Get
        Return valReqText
    End Get
    End Property

'-------------------------------------------------------------

    Public ReadOnly Property ControlNode() As XmlNode
    Get
        ControlNode = DisplayPropertyNode.SelectSingleNode("Control")
    End Get
    End Property

 '-------------------------------------------------------------  

    Public Overridable WriteOnly Property ValidateFieldName() As String
        Set(ByVal Value As String)
            RequiredFieldValidator.ErrorMessage =  Value
        End Set
    End Property

'-------------------------------------------------------------

    Public Property RequiredField() As Boolean
        Get
            RequiredField = RequiredFieldValidator.Enabled
        End Get
        Set(ByVal Value As Boolean)
            RequiredFieldValidator.Enabled = Value
        End Set
    End Property

'=============================================================

    Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
        Dim aControlNode As XmlNode
        aControlNode = cXMLDoc.GetControlNode(aDisplayPropertyNode)

        DisplayPropertyNode = aDisplayPropertyNode        
        RequiredField = cXMLDoc.AttributeToBool(aControlNode,"RequiredField")		
        valReqText.ErrorMessage = cXMLDoc.AttributeToString(aControlNode, "ErrorMessage")

    End Sub

'-------------------------------------------------------------	

    Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
        Dim aDisplayPropertyKey As String
        Dim aHiddenValueKey As String

        aDisplayPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey")
        aHiddenValueKey = cXMLDoc.AttributeToString(ControlNode, "HiddenValueKey")
        OrganizationName = aDataObject.GetRelatedPropertyString(aDisplayPropertyKey)
        OrganizationID = aDataObject(aHiddenValueKey).ToString()

    End Sub

'-------------------------------------------------------------	

    Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
        Dim aDisplayPropertyKey As String
        Dim aHiddenValueKey As String

        aDisplayPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey")
        aHiddenValueKey = cXMLDoc.AttributeToString(ControlNode, "HiddenValueKey")
        'aDataObject(aDisplayPropertyKey) = OrganizationName
        aDataObject(aHiddenValueKey) = OrganizationID

    End Sub
'=============================================================	

End Class
End Namespace