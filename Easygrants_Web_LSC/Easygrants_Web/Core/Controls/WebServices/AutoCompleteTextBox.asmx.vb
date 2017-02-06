Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel
Imports System.Collections.Generic
Imports System.Web
Imports System
Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports System.Diagnostics

Namespace Core_Web.Controls.WebServices
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<System.Web.Script.Services.ScriptService()> _
<ToolboxItem(False)> _
Public Class cAutoCompleteTextBoxService
	Inherits System.Web.Services.WebService

	Public ReadOnly Property WebSession() As cWebSession
		Get
			Return CType(Session("gWebSession"), cWebSession)
		End Get
	End Property

	<WebMethod(EnableSession:=True)> _
	Public Function GetCompletionList(ByVal prefixText As String, ByVal count As Integer, ByVal dataObjectDefinitionKey As String, ByVal searchText As String, ByVal searchValue As String, ByVal sortPropertyKey As String, ByVal searchOperator As String) As String()
		Dim aItemList As List(Of String) = New List(Of String)
		Dim aFiltersNode As XmlNode = Nothing
		Dim aDataObjectNode As XmlNode = Nothing
		Dim aXmlDoc As cXMLDoc = Nothing
		Dim aSortNode As XmlNode = Nothing
		Dim aDOL As cDataObjectList
		Dim aDO As cDataObject

		Try
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode(dataObjectDefinitionKey, aDataObjectNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", searchText, prefixText, "And", searchOperator))
			aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode)
			aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", searchText, ""))
			aDOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
			For Each aDO In aDOL
				aItemList.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(aDO.GetPropertyString(searchText), aDO.GetPropertyString(searchValue)))
			Next
		Catch se As Exception
			EventLog.WriteEntry("Easygrants", se.Message + "\r" + se.StackTrace, EventLogEntryType.Error)
			Console.WriteLine(se.Message)
		End Try
		Return aItemList.ToArray()
	End Function

End Class
End Namespace