Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web

Namespace Core_Web.Controls.Base

	Public Class cLSCDataPresenterCtl
		Inherits cDataPresenterCtl
		'=============================================================

	Public Overridable Sub LSC_EventController_NavigateToURL_NewWindowOpener(ByVal aURL As String)
		Dim ctlNewWindowOpener As cNewWindowOpener
		ctlNewWindowOpener = Me.FindControl("ctlNewWindowOpener")
		ctlNewWindowOpener.NewWindowURL = aURL
		ctlNewWindowOpener.Open()

	End Sub

	Public Overridable Sub LSC_EventController_NavigateToURL_NewWindowOpener(ByVal aURL As String, ByVal aQuery1 As String)
		Dim aNewURL As String = cWebLib.AddQuerystringParameter(aURL, aQuery1, Server)
		LSC_EventController_NavigateToURL_NewWindowOpener(aNewURL)
	End Sub

	Public Overridable Sub LSC_EventController_NavigateToURL_NewWindowOpener(ByVal aURL As String, ByVal aQuery1 As String, ByVal aQuery2 As String)
		Dim aNewURL As String = cWebLib.AddQuerystringParameter(aURL, aQuery1, Server)
		aNewURL = cWebLib.AddQuerystringParameter(aNewURL, aQuery2, Server)
		LSC_EventController_NavigateToURL_NewWindowOpener(aNewURL)
	End Sub

	Public Overridable Sub LSC_EventController_NavigateFromModulePageKey_NewWindowOpener(ByVal aPageKey As String, ByVal aQuery1 As String)
		Dim aURL As String
		Dim aQueries() As String
		aQueries = New String() {aQuery1}
		aURL = BuildURLFromPageAndQueries(aPageKey, aQueries)
		LSC_EventController_NavigateToURL_NewWindowOpener(aURL)
	End Sub

	Public Overridable Sub LSC_EventController_NavigateFromModulePageKey_NewWindowOpener(ByVal aPageKey As String, ByVal aQuery1 As String, ByVal aQuery2 As String)
		Dim aURL As String
		Dim aQueries() As String
		aQueries = New String() {aQuery1, aQuery2}
		aURL = BuildURLFromPageAndQueries(aPageKey, aQueries)
		LSC_EventController_NavigateToURL_NewWindowOpener(aURL)
	End Sub

	Public Overridable Sub LSC_EventController_NavigateFromModulePageKey_NewWindowOpener(ByVal aPageKey As String, ByVal aQuery1 As String, ByVal aQuery2 As String, ByVal aQuery3 As String)
		Dim aURL As String
		Dim aQueries() As String
		aQueries = New String() {aQuery1, aQuery2, aQuery3}
		aURL = BuildURLFromPageAndQueries(aPageKey, aQueries)
		LSC_EventController_NavigateToURL_NewWindowOpener(aURL)
	End Sub

	Public Overridable Sub LSC_EventController_NavigateFromModulePageKey_NewWindowOpener(ByVal aPageKey As String, ByVal aQuery1 As String, ByVal aQuery2 As String, ByVal aQuery3 As String, ByVal aQuery4 As String)
		Dim aURL As String
		Dim aQueries() As String
		aQueries = New String() {aQuery1, aQuery2, aQuery3, aQuery4}
		aURL = BuildURLFromPageAndQueries(aPageKey, aQueries)
		LSC_EventController_NavigateToURL_NewWindowOpener(aURL)
	End Sub


	Public Overridable Function BuildURLFromPageAndQueries(ByVal aPageKey As String, ByVal aQueries() As String)
		Dim aURL As String
		Dim i As Integer

		'Method can accept aPageKey as stand-alone page key ("GrantEditor") or as name-value pair ("Page=GrantEditor")
		If aPageKey.Substring(0, 5) = "Page=" Then
			aPageKey = aPageKey.Substring(5)
		End If
		aURL = Request.Url.ToString().Substring(0, Request.Url.ToString().IndexOf("?"))
		aURL = cWebLib.AddQuerystringParameter(aURL, "Config", Request.QueryString("Config"))
		aURL = cWebLib.AddQuerystringParameter(aURL, "Page", aPageKey)
		If Not aQueries Is Nothing Then
			For i = 0 To aQueries.Length - 1
				aURL = cWebLib.AddQuerystringParameter(aURL, aQueries(i), Server)
			Next
		End If
		Return aURL
	End Function

	Public Overridable Sub DocumentList_ViewConvertedUploadedFile(ByVal aPrimaryKeyValue As String)

		Dim aHref As String

		aHref = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
		aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", aPrimaryKeyValue)
		LSC_EventController_NavigateToURL_NewWindowOpener(aHref)

	End Sub

	Public Overrides Function EventController_GetArgumentValue(ByVal aArgumentNode As XmlNode, ByVal aDataObject As cDataObject) As String
			Dim aType As String
			Dim aListPropertyKey As String

			aType = cXMLDoc.AttributeToString(aArgumentNode, "Type")
			aListPropertyKey = cXMLDoc.AttributeToString(aArgumentNode, "ListPropertyKey")

			If aType = "DataObjectCollection" Then
				Dim aList As cDataObjectList = DataObjectCollection(cXMLDoc.AttributeToString(aArgumentNode, "TypeKey"))
				If aList Is Nothing Then Return ""
				If aListPropertyKey = "Count" Then
					Return aList.Count.ToString
				End If
				Dim aIndex As Integer = cXMLDoc.AttributeToInt(aArgumentNode, "DataObjectListIndex", -1)
				If aIndex <> -1 Then
					Dim aDO As cDataObject = aList(aIndex)
					If aDO Is Nothing Then
						Return ""
					Else
						Dim aDataObjPropertyKey As String = cXMLDoc.AttributeToString(aArgumentNode, "DataObjectPropertyKey")
						Return aDO.GetRelatedPropertyString(aDataObjPropertyKey)
					End If
				End If
			End If

			Return MyBase.EventController_GetArgumentValue(aArgumentNode, aDataObject)

	End Function


	End Class

End Namespace 'Core_Web.Controls.Base
