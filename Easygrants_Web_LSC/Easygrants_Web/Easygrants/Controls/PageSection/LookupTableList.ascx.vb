Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cLookupTableList
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

'================================================
#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region
   Protected Overrides Function DataPresenter_Get_DataObjectList(ByRef aDataObjectElement As XmlElement) As cDataObjectList
		Dim aCodeTableDOL As cDataObjectList
		Dim aCodeTableDOLSorted As cDataObjectList
		Dim aCodeTableDO As cDataObject
		Dim aTableName As String
		Dim aDefinitionNode As XmlNode

		aCodeTableDOL = MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)

		If cXMLDoc.AttributeToString(aDataObjectElement, "Key") = "CodeTableList" Then
			For Each aCodeTableDO In aCodeTableDOL
				'Add missing column info from data definition
				aTableName = aCodeTableDO.GetPropertyString("TableName")
				aDefinitionNode = WebAppl.DataDefinitionDoc.DocElement.SelectSingleNode("DataObjectDefinitions/Definition[@RowSource='" + aTableName + "']")
				If Not aDefinitionNode Is Nothing Then
					aCodeTableDO("DataObjectDefinitionKey") = cXMLDoc.AttributeToString(aDefinitionNode, "Key")
				End If
			Next
		End If
		
		'If xxxxxxxxxxxxx Then
		'	'Sort by DataDefinition key
		'	Dim aDOArray(aCodeTableDOL.Count - 1) as cDataObject
		'	Dim i As Integer = 0
		'	For Each aCodeTableDO In aCodeTableDOL
		'		aDOArray(i) = aCodeTableDO
		'		i += 1
		'		aCodeTableDOL.Remove(aCodeTableDO)
		'	Next
		'End If
		
		Return aCodeTableDOL
	End Function

'================================================

End Class
End Namespace
