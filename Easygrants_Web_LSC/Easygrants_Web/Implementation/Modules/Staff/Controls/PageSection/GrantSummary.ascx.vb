Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web
Imports System.Net
Imports System.Text

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection

Public MustInherit Class cGrantSummary
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected imgMap As HtmlImage
	Protected imgMapLink As HtmlAnchor

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Dim aAddress As StringBuilder = New StringBuilder
		Dim aGPDO As cDataObject = CType(DataObjectCollection("GranteeProject"), cDataObjectList)(0)
		Dim aPrimaryAddressDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Address", "EntityTypeID", "1", "EntityID", aGPDO.GetPropertyString("PrimaryPersonID"), "IsPrimary", "True")
		If aPrimaryAddressDOL.Count > 0 Then
			aAddress.Append(aPrimaryAddressDOL(0).GetPropertyString("Address1") + ", ")
			If Not aPrimaryAddressDOL(0).GetPropertyString("Address2", "") = "" Then
				aAddress.Append(aPrimaryAddressDOL(0).GetPropertyString("Address2") + ", ")
			End If
			If Not aPrimaryAddressDOL(0).GetPropertyString("Address3", "") = "" Then
				aAddress.Append(aPrimaryAddressDOL(0).GetPropertyString("Address3") + ", ")
			End If
			If Not aPrimaryAddressDOL(0).GetPropertyString("City", "") = "" Then
				aAddress.Append(aPrimaryAddressDOL(0).GetPropertyString("City") + ", ")
			End If
			If Not aPrimaryAddressDOL(0).GetPropertyString("Zip", "") = "" Then
				aAddress.Append(aPrimaryAddressDOL(0).GetPropertyString("Zip") + ", ")
			End If
			If Not aPrimaryAddressDOL(0).GetRelatedPropertyString("State.StateAbbr") = "" AndAlso Not aPrimaryAddressDOL(0).GetRelatedPropertyString("State.StateAbbr") = "N/A" Then
				aAddress.Append(aPrimaryAddressDOL(0).GetRelatedPropertyString("State.StateAbbr") + ", ")
			End If
			If Not aPrimaryAddressDOL(0).GetRelatedPropertyString("Country.CountryDesc") = "" Then
				aAddress.Append(aPrimaryAddressDOL(0).GetRelatedPropertyString("Country.CountryDesc"))
			End If
			Dim aMapSettingsDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("MapSettings", "EasygrantsSiteUrl", Request.Url.Host)
			If aMapSettingsDOL.Count > 0 Then
				Try
					Dim aStaticMapURL As String = aMapSettingsDOL(0).GetPropertyString("MapSiteUrl")
					Dim aMapKey As String = aMapSettingsDOL(0).GetPropertyString("MapKey")
					Dim aMapSize As String = aMapSettingsDOL(0).GetPropertyString("MapWidth") + "x" + aMapSettingsDOL(0).GetPropertyString("MapHeight")
					Dim aMapZoom As String = aMapSettingsDOL(0).GetPropertyString("MapZoom")
					Dim aMarkerColor As String = aMapSettingsDOL(0).GetPropertyString("MarkerColor")
					Dim aWebClient As WebClient = New WebClient()
					'http://maps.google.com/maps/geo is the url to get the latitude and longitude of an address
					'aWebClient.BaseAddress = "http://maps.google.com/maps/geo"
					'aWebClient.QueryString.Add("q", aAddress.ToString)
					'aWebClient.QueryString.Add("output", "csv")
					'aWebClient.QueryString.Add("key", aMapKey)
					'Dim aLatLong As String = aWebClient.DownloadString("http://maps.google.com/maps/geo?q=" + aAddress.ToString + "&output=csv&key=" + aMapKey)
					Dim aGeoCodeUrl As String = "http://maps.google.com/maps/geo?output=csv&q=" + aAddress.ToString
					Dim aLatLong As String = aWebClient.DownloadString(aGeoCodeUrl)
					Dim aLatLongArr As String() = aLatLong.Split(",")
					Dim aStatusCode As String = ""
					Dim aAccuracy As Integer = 0
					Dim aLat As String = ""
					Dim aLong As String = ""
					If aLatLongArr.Length = 4 Then
						aStatusCode = aLatLongArr(0)
						If Not aLatLongArr(1) = "" Then
							aAccuracy = Convert.ToInt32(aLatLongArr(1))
						End If
						aLat = aLatLongArr(2)
						aLong = aLatLongArr(3)
					End If
					If Not aStatusCode = "200" OrElse aAccuracy < 5 Then
						HideImage()
					End If
					imgMap.Alt = aAddress.ToString
					imgMap.Src = aStaticMapURL + "?center=" + aLat + "," + aLong + "&markers=" + aLat + "," + aLong + "," + aMarkerColor + "&zoom=" + aMapZoom + "&size=" + aMapSize + "&key=" + aMapKey
					imgMapLink.HRef = "http://maps.google.com/maps?q=" + aAddress.ToString + "&z=" + aMapZoom
				Catch ex As Exception
					HideImage()
				End Try
			Else
				HideImage()
			End If
		Else
			HideImage()
		End If
		If Page.IsPostBack = True Then
			MyBase.CoreCtl_SetValues()
		End If
	End Sub

	Sub HideImage()
		imgMapLink.Visible = False
		imgMap.Visible = False
	End Sub

End Class
End Namespace