Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base
Public MustInherit Class cLookupDropDown
    Inherits cDropDown

'=============================================================

	Public Overrides Sub CoreCtl_SetCtlValueFromDataObject(ByVal aDataObject As cDataObject)
		Dim aPropertyKey As String
		Dim aControlNode As XmlNode
		Dim aValue As String
		
		aControlNode = cXMLDoc.GetControlNode(DisplayPropertyNode)
		aPropertyKey = cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey")
		aValue = aDataObject.GetPropertyString(aPropertyKey)
		'If value is not represented in existing drop-down items, check to see if the value exists anywhere in the source lookup table
		If selDropDown.Items.FindByValue(aValue) Is Nothing Then
			Dim aDataObjectDefinitionKey As String = cXMLDoc.AttributeToString(aControlNode, "DataObjectDefinitionKey")
			Dim aNewItemDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey(aDataObjectDefinitionKey, aValue)
			'If the value doesn't exist, there's nothing to set.
			If aNewItemDO Is Nothing Then Exit Sub
			'If it does exist, create a new item to represent it.
			Dim aStoredValueProperty As String = cXMLDoc.AttributeToString(aControlNode, "StoredValue")
			Dim aDisplayValueProperty As String = cXMLDoc.AttributeToString(aControlNode, "DisplayValue")
			Dim aLI As ListItem = New ListItem(aNewItemDO.GetRelatedPropertyString(aDisplayValueProperty), aNewItemDO.GetRelatedPropertyString(aStoredValueProperty))
			selDropDown.Items.Add(aLI)
		End If
		SelectedField = aValue
	End Sub
	
'=============================================================

End Class
End Namespace