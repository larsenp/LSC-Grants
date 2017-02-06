Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base


    Public MustInherit Class cLabel_LSC
        Inherits Core_Web.Controls.Base.cLabel

		'Fixes bug in framework - control does not configure itself if invisible but still tries to populate value, throwing an error.
        Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
            MyBase.CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)

            Dim aControlNode As XmlNode
            Dim aPropertyKey As String
            Dim aLabelText As String

            DisplayPropertyNode = aDisplayPropertyNode
            aControlNode = cXMLDoc.GetControlNode(DisplayPropertyNode)
            ConfigurableLabel = cXMLDoc.AttributeToBool(aControlNode, "ConfigurableLabel", False)

            aLabelText = cXMLDoc.AttributeToString(aControlNode, "LabelText")
            If aLabelText <> "" Then
                Value = aLabelText
            End If
        End Sub

		Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
			'Baseline class attempts to set data object value from a read-only control. This derived class correctly does nothing instead.
		End Sub

    End Class
End Namespace
