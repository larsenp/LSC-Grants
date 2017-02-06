Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Xml
Imports System.Reflection
Imports Core.Web.User
Imports Core.DataAccess
Imports Core.DataAccess.DBAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core.Web.Modules
Imports Core.Web.SvrCtls
Imports Core_Web.Controls.Base
Imports Core.Util
Imports EasyGrants.Web.User
Imports EasyGrants.Web.Modules
Imports EasyGrants.Web
Imports System.Net
Imports System.Text

Namespace Core_Web.Controls.Base

    Public Class cDataPresenterCtl
        Inherits Core.Web.cEventController
        '=============================================================

        Protected spnConfigXML As HtmlGenericControl
		Protected spnPageContent As HtmlGenericControl

        Protected mXMLDoc As cXMLDoc = New cXMLDoc()
        Protected mDataObjHash As Hashtable = New Hashtable()
        Protected mDataObjectsList As XmlNodeList
        Protected mIndex As Integer
        Protected mDataPresenterList As cDataPresenterList
		Private mSavePostSubmit As Boolean = False		
        '=============================================================

        Public Overrides ReadOnly Property DataObjectCollection() As Hashtable
            Get
                Return mDataObjHash
            End Get
        End Property

		'-----------------------------------------------------
		Public Property SavePostSubmit() As Boolean
			Get
				Return mSavePostSubmit
			End Get
			Set(ByVal value As Boolean)
				mSavePostSubmit = value
			End Set
		End Property

		'-----------------------------------------------------

		'The Index and DataPresenterList properties are used only in cases when the DataPresenterCtl
		'is being rendered inside a DataPresenterList
		Public Property Index() As Integer
			Get
				Return mIndex
			End Get
			Set(ByVal Value As Integer)
				mIndex = Value
			End Set
		End Property

		'-----------------------------------------------------

		Public Property DataPresenterList() As cDataPresenterList
			Get
				Return mDataPresenterList
			End Get
			Set(ByVal Value As cDataPresenterList)
				mDataPresenterList = Value
			End Set
		End Property

		'=============================================================
		'returns the QueryString name for the sort as it would appear for this DataObjectElement
		'* <ID>_DPSort_<Key> (e.g., ctlDataPresenter_DPSort_Person)
		Public Function Get_DataObjectSortQueryKey(ByVal aDataObjectElement As XmlNode) As String
			Dim aKey As String

			aKey = cXMLDoc.AttributeToString(aDataObjectElement, "Key", "")
			If aKey = "" Then
				aKey = cXMLDoc.AttributeToString(aDataObjectElement, "DataObjectDefinitionKey", "")
			End If

			Return ID + "_DPSort_" & aKey
		End Function

		'-----------------------------------------------------
		'returns the QueryString value for the sort as it would appear for this DataObjectElement
		'* <Control>/<DispalyProperty PropertyKey>.<Dir> (e.g., ctlList/Person.LastName)
		'* direction is not set here - the SortCtl handles this (see cSortCtl.AddSortToQueryString())
		Public Function Get_DataObjectSortQueryValue(ByVal aControlID As String, _
			ByVal aDisplayPropertyNode As XmlNode) As String
			Dim aValue As String = ""

			If Not aControlID = "" Then aValue = aValue + aControlID
			aValue = aValue + "/"
			aValue = aValue + cXMLDoc.AttributeToString(aDisplayPropertyNode, "PropertyKey")

			Return aValue
		End Function

		'-----------------------------------------------------

		Public Function Get_DataObjectSortDisplayProperty(ByVal aSortQueryKey As String, ByRef aControlID As String, _
			 ByRef aSortDir As String) As String
			Dim aValue As String
			Dim aIndex As Integer

			aSortDir = "Asc"
			aControlID = ""

			aValue = Request.QueryString(aSortQueryKey)
			If aValue Is Nothing Then Return ""

			aSortDir = cSortCtl.Get_Page_SortDir(CorePage, aSortQueryKey, aValue)

			aIndex = aValue.IndexOf("/")
			If aIndex <> -1 Then
				aControlID = aValue.Substring(0, aIndex)
				aValue = aValue.Substring(aIndex + 1)
			End If

			Return aValue
		End Function

		'=============================================================

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			Dim aDataObjectElement As XmlElement
			Dim aDataObjectList As cDataObjectList
			Dim aSaveInSessionID As String

			If Not Me.Visible Then Exit Sub

			'Create XML object from spnConfigXML.InnerText
			'Me.mXMLDoc.LoadFromXML(spnConfigXML.InnerText)
			LoadConfigXML()
			LoadPageContent()

			mDataObjectsList = mXMLDoc.DocElement.SelectNodes("DataObject")

			'Loop through data objects, building each one and adding to hashtable
			For Each aDataObjectElement In mDataObjectsList
				aSaveInSessionID = Me.ID + cXMLDoc.AttributeToString(aDataObjectElement, "Key")

				If Not Me.IsPostBack Then
					If cXMLDoc.AttributeToString(aDataObjectElement, "DataObjectSource") = "DataPresenterList" Then
						aDataObjectList = DataPresenterList.DataPresenterList_GetData(cXMLDoc.AttributeToString(aDataObjectElement, "DataObjectSourceKey"))
					ElseIf cXMLDoc.AttributeToString(aDataObjectElement, "DataObjectDefinitionKey") = "" Then
						aDataObjectList = Nothing
					Else
						aDataObjectList = DataPresenter_Get_DataObjectList(aDataObjectElement)
					End If

					If Not aDataObjectList Is Nothing Then
						'If aDataObjectList.Count > 0 Then
							Session(aSaveInSessionID) = aDataObjectList
						'End If
					End If
				Else
					aDataObjectList = CType(Session(aSaveInSessionID), cDataObjectList)
					Session.Remove(aSaveInSessionID)

					If aDataObjectList Is Nothing Then
						If cXMLDoc.AttributeToString(aDataObjectElement, "DataObjectSource") = "DataPresenterList" Then
							aDataObjectList = DataPresenterList.DataPresenterList_GetData(cXMLDoc.AttributeToString(aDataObjectElement, "DataObjectSourceKey"))
						ElseIf cXMLDoc.AttributeToString(aDataObjectElement, "DataObjectDefinitionKey") = "" Then
							aDataObjectList = Nothing
						Else
							aDataObjectList = DataPresenter_Get_DataObjectList(aDataObjectElement)
						End If
					'Else
					'	'If "Me" is a FilterListDataPresenter, this will set criteria, enabling the list to be displayed.
					'	If Request.QueryString("Find") = "True" then
					'		ProcessFilters(aDataObjectElement) 
					'	End If
					End If
				End If

				If Not aDataObjectList Is Nothing Then
					Dim aDataObjKey As String
					aDataObjKey = cXMLDoc.AttributeToString(aDataObjectElement, "Key")
					mDataObjHash.Add(aDataObjKey, aDataObjectList)
				End If

				'----- code snippet to move to second loop -----
				'Build list of display property XML nodes
				'Dim aDisplayPropertyNodeList As XmlNodeList
				'aDisplayPropertyNodeList = cXMLDoc.GetDisplayPropertyNodeList(aDataObjectElement)

				'Create (if necessary) and configure controls
				If cXMLDoc.AttributeToBool(aDataObjectElement, "GetData", True) Or Request.QueryString("Find") = "True" Then
					RenderControls(aDataObjectElement, aDataObjectList)
				End If
				'----- End Code Snippet -----
			Next 'aDataObjectElement In mDataObjectsList

			For Each aDataObjectElement In mDataObjectsList
				'get aDataObjectList from mDataObjHash
				'* continue if aDataObjectList is nothing
				'insert code snippet here...
			Next
		End Sub

	'-----------------------------------------------------

		Public Overridable Sub LoadConfigXML()
			'Create XML object from spnConfigXML.InnerText
			Me.mXMLDoc.LoadFromXML(spnConfigXML.InnerText)

		End Sub

	  '-----------------------------------------------------

		Public Overridable Sub LoadPageContent()
			Dim aList As cDataObjectList
			If (cReflection.TypeBasedFrom(WebSession.CurrentPage.GetType(), "Easygrants", "EasyGrants.Web.Modules.cSubmissionModulePage")) Then
				If Not mXMLDoc.DocElement.SelectSingleNode("PageContent") Is Nothing Then
					Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)

					If aUser.WfTaskAssignmentObject.HasProperty("ProgressReportTaskID") AndAlso (Not aUser.WfTaskAssignmentObject.GetPropertyString("ProgressReportTaskID") Is System.DBNull.Value) AndAlso (Not aUser.WfTaskAssignmentObject.GetPropertyString("ProgressReportTaskID") = "") Then
						aList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("PageContent", _
							"ProgressReportTaskID", aUser.WfTaskAssignmentObject.GetPropertyString("ProgressReportTaskID"), _
							"PageKey", Me.Request.QueryString("Page"), "WfTaskStatusID", aUser.WfTaskAssignmentObject.GetPropertyString("WfTaskStatusID"))
					Else
						aList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("PageContent", _
							"ProjectID", aUser.WfTaskAssignmentObject.GetRelatedPropertyString("GranteeProject.WfProjectID"), _
							"WfTaskID", aUser.WfTaskID.ToString(), "WfTaskStatusID", aUser.WfTaskAssignmentObject.GetPropertyString("WfTaskStatusID"), _
							"PageKey", Me.Request.QueryString("Page"))
					End If

					'If aUser.WfTaskAssignmentObject.GetPropertyString("ContentID") Is System.DBNull.Value Or aUser.WfTaskAssignmentObject.GetPropertyString("ContentID") = "" Then
					'    aList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("PageContent", _
					'        "ProjectID", aUser.WfTaskAssignmentObject.GetRelatedPropertyString("GranteeProject.WfProjectID"), _
					'        "WfTaskID", aUser.WfTaskID.ToString(), "WfTaskStatusID", aUser.WfTaskAssignmentObject.GetPropertyString("WfTaskStatusID"), _
					'        "PageKey", Me.Request.QueryString("Page"))
					'Else
					'    aList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("PageContent", _
					'        "ProgressReportTaskID", aUser.WfTaskAssignmentObject.GetPropertyString("ContentID"), _
					'        "PageKey", Me.Request.QueryString("Page"), "WfTaskStatusID", aUser.WfTaskAssignmentObject.GetPropertyString("WfTaskStatusID"))
					'End If

					If aList.Count > 0 Then
						spnPageContent.InnerHtml = aList(0).GetPropertyString("Content")
					End If
				End If
			End If
		End Sub

  '-----------------------------------------------------

		Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)

			MyBase.CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)
			If Not Visible Then Exit Sub

		End Sub
		'-----------------------------------------------------

		Public Overrides Sub CoreCtl_SetValues()
			'iterate through data object properties and populate controls
			Dim aDataObjectElement As XmlElement
			Dim aItem As IDictionary
			Dim aDataObjectList As cDataObjectList
			Dim aKey As String
			Dim aDisplayPropertyNodeList As XmlNodeList
			Dim aDisplayPropertyNode As XmlNode
			Dim aObjIndex As Integer

			If Not Me.Visible Then Exit Sub

			For Each aDataObjectElement In mDataObjectsList
				aKey = cXMLDoc.AttributeToString(aDataObjectElement, "Key")
				aDataObjectList = mDataObjHash(aKey)
				If Not aDataObjectList Is Nothing Then
					aDisplayPropertyNodeList = cXMLDoc.GetDisplayPropertyNodeList(aKey, mXMLDoc)
					For Each aDisplayPropertyNode In aDisplayPropertyNodeList
						If cXMLDoc.AttributeToString(aDataObjectElement, "DataObjectSource") = "DataPresenterList" Then
							aObjIndex = Me.Index
						Else
							aObjIndex = cXMLDoc.AttributeToInt(aDisplayPropertyNode, "ObjIndex")
						End If
						If aDataObjectList.Count > aObjIndex Then
							If Not aDataObjectList(aObjIndex).IsNewDataObject Then
								DataPresenter_SetCtlValueFromDataObject(aDisplayPropertyNode, aDataObjectList(aObjIndex))
							End If
						End If
					Next
				End If
			Next
		End Sub
		'-----------------------------------------------------


		Private Sub PopulateFilter(ByVal aFilterNode As XmlNode)
			Select Case aFilterNode.Attributes("Type").Value
				Case "QueryString"
					aFilterNode.Attributes("Value").Value = Request.QueryString(aFilterNode.Attributes("TypeKey").Value)
					'System.Diagnostics.Debug.WriteLine(aNode.OuterXml);
				Case "User"
					'aFilterNode.Attributes("Value").Value = eguser.
					'Additional cases for other types go here
			End Select
		End Sub

		'-----------------------------------------------------

		Protected Sub Configure_HtmlAnchor(ByVal aDisplayPropertyNode As XmlNode)
			Dim aActionNode As XmlNode = cXMLDoc.GetActionNode(aDisplayPropertyNode)

			Dim aAnc As HtmlAnchor = CType(GetHTMLControl(aDisplayPropertyNode), HtmlAnchor)

			If cXMLDoc.AttributeToString(aActionNode, "PostBack") = "false" Then
				aAnc.HRef = cXMLDoc.AttributeToString(aActionNode, "URL")
			End If
		End Sub

		'-----------------------------------------------------

		Protected Sub DataPresenter_SetCtlValueFromDataObject(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)

			If cXMLDoc.AttributeToString(aDisplayPropertyNode, "PropertyKey") = "" Then Exit Sub

			Dim aControlNode As XmlNode = cXMLDoc.GetControlNode(aDisplayPropertyNode)
			Select Case aControlNode.Attributes("Type").Value

				Case "HtmlGenericControl", "HtmlAnchor"
					'Values for these controls are set on configure because they should appear regardless of whether
					'the page is being posted back.
				Case "HtmlInputText"

					DataPresenter_SetCtlHtmlInputTextValueFromDataObject(aDisplayPropertyNode, aDataObject)
				Case Else
					Dim aCtl As cCoreCtl
					aCtl = GetControl(aControlNode)
					aCtl.CoreCtl_SetCtlValueFromDataObject(aDataObject)
			End Select
		End Sub

		'-----------------------------------------------------

		Protected Sub DataPresenter_SetHtmlGenericControlValueFromDataObject(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
			Dim aValue As String
			Dim aControlNode As XmlNode = cXMLDoc.GetControlNode(aDisplayPropertyNode)
			Dim aHtmlControl As HtmlGenericControl = CType(FindControl(aControlNode.SelectSingleNode("@ID").Value), HtmlGenericControl)
			Dim aColName As String = aDisplayPropertyNode.SelectSingleNode("@PropertyKey").Value
			Dim aFormat As String = cXMLDoc.AttributeToString(aDisplayPropertyNode, "Format")
			Dim aIfBlank As String = cXMLDoc.AttributeToString(aDisplayPropertyNode, "IfBlank")
			Dim aEncode As Boolean = cXMLDoc.AttributeToBool(aDisplayPropertyNode, "HtmlEncode", True)
			If aDataObject.GetRelatedPropertyString(aColName) = "" And aIfBlank <> "" Then
				aHtmlControl.InnerHtml = aIfBlank
			Else
				If aFormat <> "" Then
					aValue = aDataObject.GetRelatedPropertyFormattedString(aColName, aFormat)
				Else
					aValue = aDataObject.GetRelatedPropertyString(aColName)
				End If
				If aEncode Then
					aHtmlControl.InnerHtml = Server.HtmlEncode(aValue)
				Else
					aHtmlControl.InnerHtml = aValue
				End If
			End If
		End Sub

		'-----------------------------------------------------

		Private Sub DataPresenter_SetCtlHtmlInputTextValueFromDataObject(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)

			Dim aControlNode As XmlNode = cXMLDoc.GetControlNode(aDisplayPropertyNode)
			Dim aText As HtmlInputText = CType(FindControl(aControlNode.SelectSingleNode("@ID").Value), HtmlInputText)
			Dim aColName As String = aDisplayPropertyNode.SelectSingleNode("@PropertyKey").Value

			aText.Value = aDataObject(aColName).ToString()

		End Sub


		'-----------------------------------------------------

		Public Overridable Overloads Function EventController_Save(ByVal aValidate As Boolean) As Boolean

			If aValidate Then
				Page.Validate()
				If Not Page.IsValid Then
					EventController_Save = False
					Exit Function
				End If
			End If

			Dim aWfStatus As Integer
			Dim aWfTaskAssignmentID As Integer
			Try
				' throws an exception when Page is not of type cSubmissionModulePage				
				aWfTaskAssignmentID = CType(Page, cSubmissionModulePage).WfTaskAssignmentObject.GetPropertyInt("WfTaskAssignmentID")
				aWfStatus = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("WfTaskAssignment", aWfTaskAssignmentID)(0).GetPropertyInt("WfTaskStatusID")

				'Exit function without changes if task status is submitted and not staff
				If aWfStatus = 2 AndAlso SavePostSubmit = False Then
					If WebSession.HasStaffUser Then
						'Do Nothing, let staff change after submission
					Else
						CType(Page, cSubmissionModulePage).ModulePage_RedirectToModule("Home", "HomeModuleConfig", "", "EditAfterSubmitError")
					End If
				End If

			Catch se As SystemException

			End Try

			Dim aDataObjectElement As XmlNode
			Dim aDisplayPropertyNode As XmlNode
			Dim aDisplayPropertyNodeList As XmlNodeList
			Dim aControlNode As XmlNode
			Dim aCtl As cCoreCtl
			Dim aAssemblyName As String
			Dim aAssembly As [Assembly]	'"Assembly" has to be enclosed in brackets because it is a VB keyword as well as a class name
			Dim aType As Type

			Try
				Me.BeginTrans()

				For Each aDataObjectElement In mDataObjectsList

					aDisplayPropertyNodeList = cXMLDoc.GetDisplayPropertyNodeList(aDataObjectElement)
					For Each aDisplayPropertyNode In aDisplayPropertyNodeList

						aControlNode = cXMLDoc.GetControlNode(aDisplayPropertyNode)
						aCtl = GetControl(aControlNode)
						If Not aCtl Is Nothing Then
							aAssemblyName = WebAppl.WebAssembly
							aAssembly = [Assembly].Load(aAssemblyName)
							aType = aAssembly.GetType("Core_Web.Controls.Base.cDataPresenterCtl")
							If aCtl.GetType().IsSubclassOf(aType) Then
							'If aCtl.GetType().IsSubclassOf(Me.GetType().BaseType) Then
								CType(aCtl, cDataPresenterCtl).DataPresenter_SaveDataObjects()
							End If
						End If

					Next
				Next
				DataPresenter_SaveDataObjects()

				Me.CommitTrans()
			Catch ex As Exception
				Me.RollbackTrans()
				EventController_Save = False
				Throw (ex) 'Throwing the error redirects to the configured error page.
				Exit Function
			End Try

			EventController_Save = True

		End Function

		'-----------------------------------------------------

		Public Overloads Overrides Function EventController_Save() As Boolean
			Return EventController_Save(True)
		End Function

		'-----------------------------------------------------

		Public Overloads Function EventController_Save(ByVal aValidate As String) As Boolean
			Select Case aValidate.ToLower
				Case "true"
					EventController_Save(True)
				Case "false"
					EventController_Save(False)
			End Select

		End Function

		Public Overridable Overloads Function DataPresenter_Save_And_NavigateToModulePageKey(ByVal aPageKey As String)
			If EventController_Save(True) = True Then
				EventController_NavigateToModulePageKey(aPageKey)
			End If
		End Function

		Public Overridable Overloads Function DataPresenter_Save_And_NavigateToModulePageKey(ByVal aPageKey As String, ByVal aQuery1 As String)
			If EventController_Save(True) = True Then
				EventController_NavigateToModulePageKey(aPageKey, aQuery1)
			End If
		End Function

		Public Overridable Overloads Function DataPresenter_Save_And_NavigateToModulePageKey(ByVal aPageKey As String, ByVal aQuery1 As String, ByVal aQuery2 As String)
			If EventController_Save(True) = True Then
				EventController_NavigateToModulePageKey(aPageKey, aQuery1, aQuery2)
			End If
		End Function

		Public Overridable Overloads Function DataPresenter_Save_And_NavigateToModulePageKey(ByVal aPageKey As String, ByVal aQuery1 As String, ByVal aQuery2 As String, ByVal aQuery3 As String)
			If EventController_Save(True) = True Then
				EventController_NavigateToModulePageKey(aPageKey, aQuery1, aQuery2, aQuery3)
			End If
		End Function

		Public Overridable Overloads Function DataPresenter_Save_And_NavigateToModulePageKey(ByVal aPageKey As String, ByVal aQuery1 As String, ByVal aQuery2 As String, ByVal aQuery3 As String, ByVal aQuery4 As String)
			If EventController_Save(True) = True Then
				EventController_NavigateToModulePageKey(aPageKey, aQuery1, aQuery2, aQuery3, aQuery4)
			End If
		End Function

		Public Overridable Overloads Function DataPresenter_Save_And_NavigateToModulePageKey(ByVal aPageKey As String, ByVal aQuery1 As String, ByVal aQuery2 As String, ByVal aQuery3 As String, ByVal aQuery4 As String, ByVal aQuery5 As String)
			If EventController_Save(True) = True Then
				EventController_NavigateToModulePageKey(aPageKey, aQuery1, aQuery2, aQuery3, aQuery4, aQuery5)
			End If
		End Function

		Public Overridable Overloads Function DataPresenter_Save_And_NavigateToModulePageKey(ByVal aPageKey As String, ByVal aQuery1 As String, ByVal aQuery2 As String, ByVal aQuery3 As String, ByVal aQuery4 As String, ByVal aQuery5 As String, ByVal aQuery6 As String)
			If EventController_Save(True) = True Then
				EventController_NavigateToModulePageKey(aPageKey, aQuery1, aQuery2, aQuery3, aQuery4, aQuery5, aQuery6)
			End If
		End Function

		Public Overridable Overloads Function DataPresenter_Save_And_NavigateToModulePageKey(ByVal aPageKey As String, ByVal aQuery1 As String, ByVal aQuery2 As String, ByVal aQuery3 As String, ByVal aQuery4 As String, ByVal aQuery5 As String, ByVal aQuery6 As String, ByVal aQuery7 As String)
			If EventController_Save(True) = True Then
				EventController_NavigateToModulePageKey(aPageKey, aQuery1, aQuery2, aQuery3, aQuery4, aQuery5, aQuery6, aQuery7)
			End If
		End Function

		Public Function DataPresenter_Reload_After_Save(ByVal aQueryKeyValueParam As String)
			'Page.Validate()
			If Page.IsValid Then
				'Get the url without the query string
				Dim aUrl As String = Request.Url.ToString().Substring(0, Request.Url.ToString().IndexOf("?"))
				Dim aQueryKeyParam As String = aQueryKeyValueParam.Substring(0, aQueryKeyValueParam.IndexOf("="))
				Dim aUrlQueryKey As String
				For Each aUrlQueryKey In Request.QueryString
					If Not aUrlQueryKey = aQueryKeyParam Then
						aUrl = cWebLib.AddQuerystringParameter(aUrl, aUrlQueryKey, Request.QueryString(aUrlQueryKey), Server)
					End If
				Next
				aUrl = cWebLib.AddQuerystringParameter(aUrl, aQueryKeyValueParam, Server)
				EventController_NavigateToURL(aUrl)
			End If
		End Function
		
		Public Function DataPresenter_Reload_After_Save(ByVal aPageKeyValueParam As String, ByVal aQueryKeyValueParam As String)
			'Page.Validate()
			If Page.IsValid Then
				'Get the url without the query string
				Dim aUrl As String = Request.Url.ToString().Substring(0, Request.Url.ToString().IndexOf("?"))
				Dim aQueryKeyParam As String = aQueryKeyValueParam.Substring(0, aQueryKeyValueParam.IndexOf("="))
				Dim aPageKeyParam As String = aPageKeyValueParam.Substring(0, aPageKeyValueParam.IndexOf("="))
				Dim aUrlQueryKey As String
				aUrl = cWebLib.AddQuerystringParameter(aUrl, aQueryKeyValueParam, Server)
				aUrl = cWebLib.AddQuerystringParameter(aUrl, aPageKeyValueParam, Server)
				
				For Each aUrlQueryKey In Request.QueryString
					If Not aUrlQueryKey = aQueryKeyParam AndAlso Not aUrlQueryKey=aPageKeyParam Then
						aUrl = cWebLib.AddQuerystringParameter(aUrl, aUrlQueryKey, Request.QueryString(aUrlQueryKey), Server)
					End If
				Next
				
				EventController_NavigateToURL(aUrl)
			End If
		End Function

		'-----------------------------------------------------

		Public Overrides Sub EventController_Reset()

			CorePage.Redirect()
		End Sub

		'-----------------------------------------------------

		Protected Overridable Sub DataPresenter_SetDataObjectValuesFromCtls(ByRef aDataObjectList As cDataObjectList, ByVal aDataObjectElement As XmlNode)
			Dim aDefaultValuesNodeList As XmlNodeList
			Dim aDisplayPropertyNodeList As XmlNodeList
			Dim aDisplayPropertyNode As XmlNode
			'Dim aDataObjectElement As XmlNode
			Dim aKey As String
			'Dim aDataObjectList As cDataObjectList
			Dim aObjectCount As Integer
			Dim i As Integer

			'aDataObjectList = mDataObjHash(aKey)
			aKey = cXMLDoc.AttributeToString(aDataObjectElement, "Key")
			aDefaultValuesNodeList = aDataObjectElement.SelectNodes("DefaultValues/Argument")
			aObjectCount = cXMLDoc.AttributeToInt(aDataObjectElement, "ObjectCount")

			If aDataObjectList.Count > 0 Then
				Do
					If aDefaultValuesNodeList.Count > 0 Then
						DataPresenter_SetDefaultValues(aDefaultValuesNodeList, aDataObjectList(i))
					End If
					i = i + 1
				Loop While i < aObjectCount
			End If

			aDisplayPropertyNodeList = cXMLDoc.GetDisplayPropertyNodeList(aKey, mXMLDoc)
			For Each aDisplayPropertyNode In aDisplayPropertyNodeList
				'aObjIndex = cXMLDoc.DisplayPropertyObjIndex(aDisplayPropertyNode)

				If cXMLDoc.AttributeToString(aDisplayPropertyNode.SelectSingleNode("Control"), "Select") = "CheckBox" Then
					DataPresenter_SetDataObjectValueFromCtl(aDisplayPropertyNode, aDataObjectList, aDisplayPropertyNodeList)
					Exit For
				End If

				DataPresenter_SetDataObjectValueFromCtl(aDisplayPropertyNode, aDataObjectList, aDataObjectElement)
			Next

		End Sub

		'-----------------------------------------------------

		Protected Sub DataPresenter_SetDefaultValues(ByVal aDefaultValuesNodeList As XmlNodeList, ByVal aDataObject As cDataObject)
			Dim aArgumentNode As XmlNode

			For Each aArgumentNode In aDefaultValuesNodeList
				Dim aValue As String

				If (aDataObject.IsNewDataObject And cXMLDoc.AttributeToBool(aArgumentNode, "Create", True)) _
				  Or ((Not aDataObject.IsNewDataObject) And cXMLDoc.AttributeToBool(aArgumentNode, "Update", False)) _
				  Or (aDataObject.IsNewDataObject And cXMLDoc.AttributeToString(aArgumentNode, "Type") <> "") Then

					If cXMLDoc.AttributeToString(aArgumentNode, "Type") = "" Then
						aValue = cXMLDoc.AttributeToString(aArgumentNode, "Value")
					Else
						aValue = EventController_GetArgumentValue(aArgumentNode, Nothing)
					End If

					aDataObject(aArgumentNode.SelectSingleNode("@PropertyKey").Value) = aValue

				End If
			Next
		End Sub
		'-----------------------------------------------------

		Protected Sub DataPresenter_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList, ByVal aDataObjectNode As XmlNode)
			If cXMLDoc.AttributeToString(aDataObjectNode, "DataObjectSource") = "DataPresenterList" Then
				DataPresenter_SetDataObjectValueFromCtl(aDisplayPropertyNode, aDataObjectList, Index)
			Else
				DataPresenter_SetDataObjectValueFromCtl(aDisplayPropertyNode, aDataObjectList, 0)
			End If
		End Sub

		'-----------------------------------------------------
		Protected Overridable Sub DataPresenter_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList, ByVal aIndex As Integer)
			Dim aObjIndex As Integer
			Dim aDataObject As cDataObject

			If aIndex <> 0 Then
				aObjIndex = aIndex
			Else
				aObjIndex = cXMLDoc.AttributeToInt(aDisplayPropertyNode, "ObjIndex")
			End If
			aDataObject = aDataObjectList(aObjIndex)

			If Not aDataObject Is Nothing Then
				Dim aControlNode As XmlNode = cXMLDoc.GetControlNode(aDisplayPropertyNode)
				Select Case aControlNode.Attributes("Type").Value
					Case "Label", "HtmlGenericControl"
						'No user input - nothing to save
					Case "HtmlInputText"
						SetDataObjectValueFromHtmlInputText(aDisplayPropertyNode, aDataObject)
					Case Else
						Dim aCtl As cCoreCtl
						aCtl = CType(FindControl(cXMLDoc.GetControlID(aDisplayPropertyNode)), cCoreCtl)
						aCtl.CoreCtl_SetDataObjectValueFromCtl(aDisplayPropertyNode, aDataObject)
				End Select
			End If
		End Sub

		'-----------------------------------------------------

		Protected Sub DataPresenter_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList, ByVal aDisplayPropertyNodeList As XmlNodeList)
			Dim aDataObject As cDataObject
			Dim aIndex As Integer

			aDataObject = aDataObjectList(0)

			If Not aDataObject Is Nothing Then
				Dim aCtl As cCoreCtl
				aCtl = CType(FindControl(cXMLDoc.GetControlID(aDisplayPropertyNode)), cCoreCtl)
				aCtl.CoreCtl_SetDataObjectCheckedPropertyFromCtl(aDisplayPropertyNode, aDataObjectList)

				For aIndex = 1 To aDisplayPropertyNodeList.Count - 1
					aCtl = CType(FindControl(cXMLDoc.GetControlID(aDisplayPropertyNodeList(aIndex))), cCoreCtl)

					For Each aDataObject In aDataObjectList
						aCtl.CoreCtl_SetDataObjectValueFromCtl(aDisplayPropertyNodeList(aIndex), aDataObject)
					Next
				Next
			End If
		End Sub

		'-----------------------------------------------------

		Protected Sub DataPresenter_SetDataObjectUserModified(ByRef aDataObjList As cDataObjectList)
			Dim i As Integer
			Dim aDataObject As cDataObject

			For i = 1 To aDataObjList.Count
				'need to fix this - so that it checks for the existence of UserID property in data definition
				Try
					For Each aDataObject In aDataObjList
						aDataObject("UserID") = CType(WebSession.User("cEGStaffUser"), cEGUser).UserID.ToString
					Next
				Catch
					Exit Sub
				Finally
				End Try
			Next
		End Sub

		'-----------------------------------------------------

		' Sets values from Controls into Data Objects and Saves

		Public Overridable Sub DataPresenter_SaveDataObjects()
			Dim aDataObjectElement As XmlElement

			If Not Me.Visible Then Exit Sub

			For Each aDataObjectElement In mDataObjectsList
				DataPresenter_SaveDataObject(aDataObjectElement)
			Next

			EventController_Notify_DataModified(WebSession.DataObjectFactory, mDataObjHash)

		End Sub

		'-----------------------------------------------------

		 Public Overridable Sub DataPresenter_SaveDataObject(ByVal aDataObjectElement As XmlElement)

			Dim aDataObjKey As String
			Dim aDataObjList As cDataObjectList
			Dim aDataObj As cDataObject

			aDataObjKey = cXMLDoc.AttributeToString(aDataObjectElement, "Key")
			If cXMLDoc.AttributeToString(aDataObjectElement, "Updatable") = "True" Then
				aDataObjList = mDataObjHash(aDataObjKey)
				'try getting the data object list again, in case it uses Data Object Collection filter for
				'an object that has been saved before this object
				If aDataObjList.Count = 0 Then
					aDataObjList = DataPresenter_Get_DataObjectList(aDataObjectElement)
				End If
				'DataPresenter_SetDataObjectUserModified(aDataObjList)
				DataPresenter_SetDataObjectValuesFromCtls(aDataObjList, aDataObjectElement)
				'For Each aDataObj In aDataObjList
				aDataObjList.UserID = GetUserID()
				WebSession.DataObjectFactory.SaveDataObject(aDataObjList)
				'Next
			End If
		End Sub

		'-----------------------------------------------------

		Protected Function GetUserID() As Integer
			If Not WebSession.User("cEGStaffUser") Is Nothing Then
				Return CType(WebSession.User("cEGStaffUser"), cEGUser).UserID
			ElseIf Not WebSession.User("cEGHomeUser") Is Nothing Then
				Return CType(WebSession.User("cEGHomeUser"), cEGUser).UserID
			ElseIf Not WebSession.User("cEGGuestUser") Is Nothing Then
				Return CType(WebSession.User("cEGGuestUser"), cEGUser).UserID
			End If

			Return 0
		End Function

		'-----------------------------------------------------

		Private Sub SetDataObjectValueFromHtmlInputText(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
			Dim aControlNode As XmlNode = cXMLDoc.GetControlNode(aDisplayPropertyNode)
			Dim aText As HtmlInputText = CType(FindControl(aControlNode.SelectSingleNode("@ID").Value), HtmlInputText)

			aDataObject(aDisplayPropertyNode.SelectSingleNode("@PropertyKey").Value) = aText.Value
			'aDataObject.Update(aDisplayPropertyNode.SelectSingleNode("@PropertyKey").Value, aText.Value)
		End Sub

		'-----------------------------------------------------

		'    Private Sub SaveDateTextBox(ByVal aDisplayPropertyNode As XmlNode)
		'        Dim aControlNode As XmlNode = GetControlNode(aDisplayPropertyNode)
		'        Dim aDateTextBox As cDateTextBox
		'        Dim aColName As String

		'        aDateTextBox = CType(FindControl(aControlNode.SelectSingleNode("@ID").Value), cDateTextBox)
		'        aColName = aDisplayPropertyNode.SelectSingleNode("@PropertyKey").Value
		'        DataObject.DataObjectRow(aColName) = aDateTextBox.myDate
		'    End Sub

		'-----------------------------------------------------

		Private Function DataObjectElement(ByVal aKey As String) As XmlElement
			Return CType(mXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='" + aKey + "']"), XmlElement)
		End Function

		'-----------------------------------------------------

		'Public Overrides sub EventController_GetEventMethodArgs(ByVal aArgsList As ArrayList, ByVal aCtl As cCoreCtl, _
		'                            ByVal aEventSrc As Object, ByVal aActionNode As XmlNode)

		'    Dim aType As String
		'    Dim aArgumentsNode As XmlNode = aActionNode.SelectSingleNode("Parameters")
		'    If aArgumentsNode Is Nothing Then
		'        Exit Sub
		'    End If

		'    'MyBase.EventController_GetEventMethodArgs(aArgsList, aCtl, aEventSrc, aActionNode)

		'    EventController_SetArgumentsInNodeList(aArgumentsNode)
		'    Dim aArgsNodeList As XmlNodeList = aArgumentsNode.SelectNodes("Argument")
		'    Dim aArgNode As XmlNode

		'    For Each aArgNode In aArgsNodeList
		'        aType = cXMLDoc.AttributeToString(aArgNode, "Type")

		'        Select Case aType
		'            Case Else
		'                aArgsList.Add(cXMLDoc.AttributeToString(aArgNode, "Value"))
		'        End Select
		'    Next

		'End Sub

		'-----------------------------------------------------

		Public Overrides Function EventController_GetEventArgumentObject(ByVal aArgumentNode As XmlNode, _
			 ByVal aCtl As cCoreCtl, ByVal aEventSrc As Object) As Object

			Dim aObjectType As String
			aObjectType = cXMLDoc.AttributeToString(aArgumentNode, "ObjectType")

			Select Case aObjectType
				Case "DataObject"
					Return mDataObjHash(cXMLDoc.AttributeToString(aArgumentNode, "ObjectKey"))(0)
				Case Else
					Return MyBase.EventController_GetEventArgumentObject(aArgumentNode, aCtl, aEventSrc)
			End Select

		End Function

		'-----------------------------------------------------

		Protected Sub BuildValidatorControls(ByVal aControlNode As XmlNode)
			Dim aValidationNodeList As XmlNodeList = aControlNode.SelectNodes("Validation")
			Dim aControlID As String = cXMLDoc.AttributeToString(aControlNode, "ID")
			Dim aValidationNode As XmlNode
			Dim aValidator As BaseValidator

			For Each aValidationNode In aValidationNodeList
				aValidator = BuildValidatorControl(aValidationNode, aControlID)
				If Not aValidator Is Nothing Then
					Controls.Add(aValidator)
				End If
			Next
		End Sub

		'-----------------------------------------------------

		Protected Function BuildValidatorControl(ByVal aValidationNode As XmlNode, ByVal aControlID As String) As BaseValidator
			'Dim aControlID As String = cXMLDoc.AttributeToString(aParentNode, "ID")
			'Dim aValidationNode As XmlNode = aParentNode.SelectSingleNode("Validation")
			Dim aValidator As BaseValidator

			If aValidationNode Is Nothing Then Return Nothing

			Dim aValidationType As String = cXMLDoc.AttributeToString(aValidationNode, "Type")
			Select Case aValidationType
				Case "Compare"
					aValidator = New CompareValidator()
					Dim aCompareValidator As CompareValidator = CType(aValidator, CompareValidator)
					aCompareValidator.Type = GetValidationDataType(cXMLDoc.AttributeToString(aValidationNode, "DataType"))
					aCompareValidator.ControlToCompare = cXMLDoc.AttributeToString(aValidationNode, "ControlToCompare")
					aCompareValidator.[Operator] = GetValidationCompareOperator(cXMLDoc.AttributeToString(aValidationNode, "Operator"))
					aCompareValidator.ValueToCompare = cXMLDoc.AttributeToString(aValidationNode, "ValueToCompare")
				Case "Custom"
					aValidator = New CustomValidator()
					Dim aCustomValidator As CustomValidator = CType(aValidator, CustomValidator)
					'Need to figure out how to add an event handler in code, and also
					'how to structure event handling in the Event Controller (we would
					'presumably need a delegate like EventController_ControlClicked).
					AddHandler aCustomValidator.ServerValidate, AddressOf EventController_ControlValidate
				Case "Range"
					aValidator = New RangeValidator()
					Dim aRangeValidator As RangeValidator = CType(aValidator, RangeValidator)
					aRangeValidator.Type = GetValidationDataType(cXMLDoc.AttributeToString(aValidationNode, "DataType"))
					aRangeValidator.MaximumValue = cXMLDoc.AttributeToString(aValidationNode, "MaximumValue")
					aRangeValidator.MinimumValue = cXMLDoc.AttributeToString(aValidationNode, "MinimumValue")
				Case "RegularExpression"
					aValidator = New RegularExpressionValidator()
					Dim aRegExValidator As RegularExpressionValidator = CType(aValidator, RegularExpressionValidator)
					aRegExValidator.ValidationExpression = cXMLDoc.AttributeToString(aValidationNode, "ValidationExpression")
				Case "RequiredField"
					aValidator = New RequiredFieldValidator()
					Dim aReqValidator As RequiredFieldValidator = CType(aValidator, RequiredFieldValidator)
					aReqValidator.InitialValue = cXMLDoc.AttributeToString(aValidationNode, "InitialValue")
				Case Else
					Return Nothing
			End Select

			aValidator.ControlToValidate = aControlID
			aValidator.ErrorMessage = cXMLDoc.AttributeToString(aValidationNode, "ErrorMessage")
			aValidator.Enabled = True
			aValidator.Display = ValidatorDisplay.None
			Return aValidator
		End Function


		'-----------------------------------------------------

		Public Function GetValidationDataType(ByVal aTypeName As String) As ValidationDataType
			Select Case aTypeName.ToLower
				Case "currency"
					Return ValidationDataType.Currency
				Case "date"
					Return ValidationDataType.Date
				Case "double"
					Return ValidationDataType.Double
				Case "integer"
					Return ValidationDataType.Integer
				Case "string"
					Return ValidationDataType.String
				Case Else
					Return Nothing
			End Select
		End Function

		'-----------------------------------------------------

		Public Function GetValidationCompareOperator(ByVal aOperatorName As String) As ValidationCompareOperator
			Select Case aOperatorName.ToLower
				Case "datatypecheck"
					Return ValidationCompareOperator.DataTypeCheck
				Case "equal"
					Return ValidationCompareOperator.Equal
				Case "greaterthan"
					Return ValidationCompareOperator.GreaterThan
				Case "greaterthanequal"
					Return ValidationCompareOperator.GreaterThanEqual
				Case "lessthan"
					Return ValidationCompareOperator.LessThan
				Case "lessthanequal"
					Return ValidationCompareOperator.LessThanEqual
				Case "notequal"
					Return ValidationCompareOperator.NotEqual
				Case Else
					Return Nothing
			End Select
		End Function

		'=============================================================

		Public Overloads Overrides Sub EventController_ControlClicked(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
			Dim aCtl As cCoreCtl = MyBase.GetCoreControlFromEventSource(CType(aSrc, Control))
			Dim aActionNode As XmlNode = cXMLDoc.GetActionNode(aCtl.DisplayPropertyNode)
			'AutoSave=true by default
			If cXMLDoc.AttributeToBool(aActionNode, "AutoSave") = True Then
				If EventController_Save() = False Then 'if cannot Save, exit
					Exit Sub
				End If
				If cXMLDoc.AttributeToString(aActionNode, "Method") = "" Then
					CorePage.Redirect()
					Exit Sub
				End If
			End If
			MyBase.EventController_ControlClicked(aSrc, aEvent)
		End Sub

		'=============================================================

		Public Overloads Overrides Sub EventController_ControlClicked(ByVal aSrc As Object, ByVal aEvent As System.Web.UI.ImageClickEventArgs)
			EventController_ControlClicked(aSrc, CType(aEvent, EventArgs))
		End Sub

		'=============================================================

		Protected Overridable Sub ProcessFilters(ByRef aDataObjectElement As XmlElement)
			Dim aFilterNode As XmlNode

			aFilterNode = aDataObjectElement.SelectSingleNode("Filters")
			If Not aFilterNode Is Nothing Then
				EventController_SetArgumentsInNodeList(aFilterNode)
			End If
		End Sub

		'-----------------------------------------------------

		Protected Overridable Sub ProcessSorts(ByRef aDataObjectElement As XmlElement)
			Dim aSortQueryKey As String
			Dim aSortDisplayPropertyKey As String
			Dim aSortDir As String
			Dim aControlID As String

			aSortQueryKey = Get_DataObjectSortQueryKey(aDataObjectElement)
			If Not aSortQueryKey = "" Then
				aSortDisplayPropertyKey = Get_DataObjectSortDisplayProperty(aSortQueryKey, aControlID, aSortDir)
				If Not aSortDisplayPropertyKey = "" Then
					Dim aDisplayPropertyNode As XmlNode

					If aControlID = "" Then
						aDisplayPropertyNode = cXMLDoc.FindNode(aDataObjectElement, "DisplayProperties/DisplayProperty", _
							   "PropertyKey", aSortDisplayPropertyKey)
					Else
						Dim aControlNode As XmlNode

						aControlNode = cXMLDoc.FindNode(aDataObjectElement, "DisplayProperties/DisplayProperty/Control", _
							   "ID", aControlID)
						If aControlNode Is Nothing Then
							aDisplayPropertyNode = Nothing
						Else
							aDisplayPropertyNode = cXMLDoc.FindNode(aControlNode, "DisplayProperty", _
								   "PropertyKey", aSortDisplayPropertyKey)
						End If
					End If

					If Not aDisplayPropertyNode Is Nothing Then
						Dim aQuerySortNode As XmlNode

						aQuerySortNode = aDisplayPropertyNode.SelectSingleNode("Sortable")
						If Not aQuerySortNode Is Nothing Then
							Dim aSortNode As XmlNode

							aSortNode = cXMLDoc.Get_ChildNode(aDataObjectElement, "Sort", True)
							If Not aSortNode Is Nothing Then
								Dim aArgumentNode As XmlNode
								For Each aArgumentNode In aQuerySortNode
									If aArgumentNode.Name = "Argument" Then
										cXMLDoc.AddAttribute_ToNode(aArgumentNode, "Direction", _
											aSortDir)
									End If
								Next
								aSortNode.InnerXml = aQuerySortNode.InnerXml
							End If
						End If
					End If
				End If
			End If
		End Sub

		'-----------------------------------------------------

		Protected Overridable Function DataPresenter_Get_DataObjectList(ByRef aDataObjectElement As XmlElement) As cDataObjectList

			'Get filter definitions from spnConfigXML
			ProcessFilters(aDataObjectElement)

			'Get sort definitions from spnConfigXML
			ProcessSorts(aDataObjectElement)

			'Get data object for control
			If Not cXMLDoc.AttributeToBool(aDataObjectElement, "GetData", True) Then
				Return Nothing
			ElseIf Request.QueryString("Action") = "New" Then
				Return WebSession.DataObjectFactory.GetNewDataObjectList(aDataObjectElement)
			Else
				Dim aDataObjectList As cDataObjectList
				aDataObjectList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectElement)
				If cXMLDoc.AttributeToBool(aDataObjectElement, "CreateNew") Then
					aDataObjectList.FillWithNewDataObjectsToCount(aDataObjectElement)
				End If

				Return aDataObjectList
			End If
		End Function

		'=============================================================

		Protected Overridable Overloads Sub RenderControls(ByVal aDataObjectNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
			If cXMLDoc.AttributeToString(aDataObjectNode, "DataObjectSource") = "DataPresenterList" Then
				RenderControls(aDataObjectNode.SelectNodes("DisplayProperties/DisplayProperty"), aDataObjectList, Index)
			Else
				RenderControls(aDataObjectNode.SelectNodes("DisplayProperties/DisplayProperty"), aDataObjectList, 0)
			End If
		End Sub

		'-----------------------------------------------------

		Protected Overridable Overloads Sub RenderControls(ByRef aDisplayPropertyNodeList As XmlNodeList, ByVal aDataObjectList As cDataObjectList)
			RenderControls(aDisplayPropertyNodeList, aDataObjectList, 0)
		End Sub

		'-----------------------------------------------------

		Protected Overridable Overloads Sub RenderControls(ByRef aDisplayPropertyNodeList As XmlNodeList, ByVal aDataObjectList As cDataObjectList, ByVal aDataObjectListIndex As Integer)
			Dim aDisplayPropertyNode As XmlNode
			Dim aControlNode As XmlNode
			Dim aCtl As cCoreCtl
			Dim aValidator As BaseValidator
			Dim aVisibleNode As XmlNode
			Dim aVisible As Boolean

			For Each aDisplayPropertyNode In aDisplayPropertyNodeList

				aControlNode = cXMLDoc.GetControlNode(aDisplayPropertyNode)
				Select Case cXMLDoc.GetDisplayPropertyType(aDisplayPropertyNode)
					Case "HtmlInputText", "TextArea"
						'no configuration for these controls
					Case "HtmlGenericControl", "HtmlAnchor"
						'Set values for non-data-entry controls on configure - we want these values to appear regardless of whether
						'the page is posting back.
						If aDataObjectList.Count > aDataObjectListIndex Then
							DataPresenter_SetHtmlGenericControlValueFromDataObject(aDisplayPropertyNode, aDataObjectList(aDataObjectListIndex))
						End If
					Case "HtmlAnchor"
						Configure_HtmlAnchor(aDisplayPropertyNode)
					Case Else 'one of our controls
						aCtl = GetControl(aControlNode)
						aCtl.EventController = Me
						aCtl.CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)
				End Select
				'aValidator = BuildValidatorControl(aControlNode)
				'If Not aValidator Is Nothing Then
				'    Controls.Add(aValidator)
				'End If


				BuildValidatorControls(aControlNode)


			Next 'aDisplayPropertyNode In aDisplayPropertyNodeList

		End Sub

		'-----------------------------------------------------

		Public Overrides Function EventController_GetArgumentValue(ByVal aArgumentNode As XmlNode, ByVal aDataObject As cDataObject) As String
			Dim aType As String
			Dim aTypeKey As String

			aType = cXMLDoc.AttributeToString(aArgumentNode, "Type")
			aTypeKey = cXMLDoc.AttributeToString(aArgumentNode, "TypeKey")

			Select Case aType
				Case "DataPresenter"
					Return CType(cReflection.Invoke_Property(Me, aTypeKey), String)
				Case "DataObjectCollection"
					Dim aDataObjPropertyKey As String = cXMLDoc.AttributeToString(aArgumentNode, "DataObjectPropertyKey")
					Dim aDataObjList As cDataObjectList = CType(DataObjectCollection(aTypeKey), cDataObjectList)
					If aDataObjList Is Nothing OrElse aDataObjList(Index) Is Nothing Then
						Return ""
					Else
						Return aDataObjList(Index).GetRelatedPropertyString(aDataObjPropertyKey)
					End If
				Case Else
					Return MyBase.EventController_GetArgumentValue(aArgumentNode, aDataObject)
			End Select
		End Function

		'-----------------------------------------------------

		Public Overloads Sub Execute_Action(ByVal aCtl As cCoreCtl, ByVal aEventSrc As Object, ByVal aRowKey As String, _
				  ByVal aDataListKey As String, ByVal aDropDownKey As String)
			Dim aDataList As cDataListCtl
			Dim aDropDown As cDropDown
			Dim aActionObj As cDataObject
			Dim aActionID As String
			Dim aXMLDoc As cXMLDoc
			Dim aActionNode As XmlNode
			Dim aActionNodeList As XmlNodeList

			aDataList = CType(FindControl(aDataListKey), cDataListCtl)
			aDropDown = CType(aDataList.DataListCtl_GetControl(aDropDownKey, CType(aRowKey, Integer)), cDropDown)
			aActionID = aDropDown.SelectedValue
			If aActionID = "" Then Exit Sub
			aActionObj = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("EasylistAction", aActionID)
			aXMLDoc = New cXMLDoc()
			aXMLDoc.LoadFromXML(aActionObj.GetPropertyString("ActionXml"))
			aActionNodeList = aXMLDoc.DocElement.SelectNodes("Action")
			For Each aActionNode In aActionNodeList
				EventController_ExecuteActionMethod(aActionNode, aEventSrc, aCtl)
			Next
		End Sub

		'-----------------------------------------------------

		Public Overloads Sub Execute_Action(ByVal aCtl As cCoreCtl, ByVal aEventSrc As Object, ByVal aRowKey As String)

			Execute_Action(aCtl, aEventSrc, aRowKey, "ctlList", "ctlActions")

			'Dim aDataList As cDataListCtl
			'Dim aDropDown As cDropDown
			'Dim aActionObj As cDataObject
			'Dim aActionID As String
			'Dim aXMLDoc As cXMLDoc
			'Dim aActionNode As XmlNode
			'Dim aActionNodeList As XmlNodeList

			'aDataList = CType(FindControl("ctlList"), cDataListCtl)
			'aDropDown = CType(aDataList.DataListCtl_GetControl("ctlActions", CType(aRowKey, Integer)), cDropDown)
			'aActionID = aDropDown.SelectedValue
			'If aActionID = "" Then Exit Sub
			'MyBase.Execute_Action(aCtl, aEventSrc, aActionID)

			'aActionObj = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("EasylistAction", aActionID)
			'aXMLDoc = New cXMLDoc()
			'aXMLDoc.LoadFromXML(aActionObj.GetPropertyString("ActionXml"))
			'aActionNodeList = aXMLDoc.DocElement.SelectNodes("Action")
			'For Each aActionNode In aActionNodeList
			'    EventController_ExecuteActionMethod(aActionNode, aEventSrc, aCtl)
			'Next
		End Sub

		'-----------------------------------------------------

		Public Overloads Sub RequestDataCommand(ByVal aDataCommandKey As String)
			Dim aDataCommandEl As XmlElement

			aDataCommandEl = mXMLDoc.DocElement.SelectSingleNode("DataCommand[@Key='" + aDataCommandKey + "']")
			If Not aDataCommandEl Is Nothing Then
				RequestDataCommand(aDataCommandEl)
			End If
		End Sub

		'-----------------------------------------------------

		Public Overloads Sub RequestDataCommand(ByVal aDataCommandEl As XmlElement)
			Dim aArgsList As XmlNodeList
			Dim aDataCommandKey As String
			Dim aArgNode As XmlNode
			Dim aRequest As cDataObject

			aArgsList = aDataCommandEl.SelectNodes("Parameters/Argument")
			aDataCommandKey = cXMLDoc.AttributeToString(aDataCommandEl, "DataCommandDefinitionKey")
			EventController_SetArgumentsInNodeList(aArgsList)
			aRequest = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("DataCommandRequest")
			aRequest("DataCommandXml") = aDataCommandEl.OuterXml
			aRequest("DataCommandKey") = aDataCommandKey
			aRequest("Status") = 0
			aRequest("CreateDate") = System.DateTime.Now
			aRequest("CreateUser") = CType(CType(Page, cModulePage).ModuleUser, cEGUser).UserID
			aRequest.SaveData()
			CorePage.Redirect()
		End Sub

		'=============================================================

		Public Sub BeginTrans()
			   CType(WebSession.DataObjectFactory.GetDataProvider("EGDatabase"), cDataProviderSQL).DBConn.BeginTran()
		End Sub

		'=============================================================

		Public Sub CommitTrans()
			   CType(WebSession.DataObjectFactory.GetDataProvider("EGDatabase"), cDataProviderSQL).DBConn.CommitTran()
		End Sub

		'=============================================================

		Public Sub RollbackTrans()
			   CType(WebSession.DataObjectFactory.GetDataProvider("EGDatabase"), cDataProviderSQL).DBConn.RollbackTran()
		End Sub

		'=============================================================

		Public Overloads Sub EventController_Delete(ByVal aDataObjectKey As String, ByVal aPKValue As String)
			EventController_Delete(aDataObjectKey, aPKValue, True)
		End Sub

		'-------------------------------------------------------------

		Public Overloads Sub EventController_Delete(ByVal aDataObjectKey As String, ByVal aPKValue As String, ByVal aRedirect As String)
			If aRedirect = "False" Then
				EventController_Delete(aDataObjectKey, aPKValue, False)
			Else
				EventController_Delete(aDataObjectKey, aPKValue, True)
			End If
		End Sub

		'-------------------------------------------------------------

		Public Overloads Sub EventController_Delete(ByVal aDataObjectKey As String, ByVal aPKValue As String, ByVal aRedirect As Boolean)
			Dim aDOEl As XmlElement
			Dim aRelatedDOEl As XmlElement
			Dim aDOList As cDataObjectList
			Dim aDO As cDataObject
			Dim aDefinitionKey As String

			'Use aDataObjectKey parameter to get the data object node and data object list
			aDOEl = Me.mXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='" + aDataObjectKey + "']")
			aDefinitionKey = cXMLDoc.AttributeToString(aDOEl, "DataObjectDefinitionKey")

			'Get RelatedDataObjects node list. If this exists, it will specify the child records to be deleted.
			aRelatedDOEl = aDOEl.SelectSingleNode("DisplayProperties/DisplayProperty/Control/Action/Parameters/RelatedDataObjects")
			aDOList = DataObjectCollection(aDataObjectKey)

			If Not aRelatedDOEl Is Nothing Then
				'If cascading delete has been specified, delete the child records.
				EventController_Delete(aRelatedDOEl, aDefinitionKey, aPKValue, GetUserID())
				'EventController_Delete(aRelatedDOEl, aDefinitionKey, aPKValue)
			End If
			'Delete the main record.
			For Each aDO In aDOList
				If aDO.GetPropertyString(aDO.PrimaryKey) = aPKValue Then Exit For
			Next

			aDO.DataObjectList.UserID = GetUserID()
			Me.WebSession.DataObjectFactory.DeleteData(aDO)
			'MyBase.EventController_Delete(aDefinitionKey, aPKValue)
			If aRedirect Then CorePage.Redirect()
		End Sub

		'-------------------------------------------------------------

		Public Overrides Sub EventController_Notify_DataModified(ByVal aDataObjectFactory As Core.DataAccess.cDataObjectFactory, ByVal aDataObjHash As System.Collections.Hashtable)
			MyBase.EventController_Notify_DataModified(aDataObjectFactory, aDataObjHash)

			'If this is a reopened task, mark current submission section as saved after reopen
			If (cReflection.TypeBasedFrom(WebSession.CurrentPage.GetType(), "Easygrants", "EasyGrants.Web.Modules.cSubmissionModulePage")) Then
				Dim aPage As cSubmissionModulePage = CType(Page, cSubmissionModulePage)
				If aPage.WfTaskAssignmentObject.GetPropertyInt("WfTaskStatusID") = 4 Then
					Dim aWftaReopenRequestID As String = aPage.WfTaskAssignmentObject.GetRelatedPropertyString("ActiveRequestToReopenThis.WftaReopenRequestID")
					If aWftaReopenRequestID <> "" Then
						Dim aWftaReopenSectionList As cDataObjectList
						Dim aWftaReopenSection As cDataObject
						aWftaReopenSectionList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WftaReopenSection", "WftaReopenRequestID", aWftaReopenRequestID)
						For Each aWftaReopenSection In aWftaReopenSectionList
							If aWftaReopenSection.GetPropertyString("SectionKey") = aPage.PageNavKey Then
								aWftaReopenSection("SavedAfterReopen") = True
								aWftaReopenSection.SaveData()
								Exit For
							End If
						Next
					End If
				End If
			End If
		End Sub

		'-------------------------------------------------------------
		Private Sub Copy_DataObject(ByVal aChildDefinitionDOList As cDataObjectList, ByVal aCopyToDOPropertyKey As String, ByVal aCopyFromDOID As String, ByVal aRelationType As String, ByVal aCopyToDOID As String)
			Dim aChildDefinitionDO As cDataObject

			If aRelationType = "One" Then
				aChildDefinitionDO = aChildDefinitionDOList(0)
				Copy_DataObject_Contents(aChildDefinitionDO, aCopyToDOPropertyKey, aCopyFromDOID, aCopyToDOID)
			Else
				For Each aChildDefinitionDO In aChildDefinitionDOList
					Copy_DataObject_Contents(aChildDefinitionDO, aCopyToDOPropertyKey, aCopyFromDOID, aCopyToDOID)
				Next
			End If

		End Sub

	Private Sub Copy_DataObject_Contents(ByVal aCopyFromDO As cDataObject, ByVal aCopyToDOPropertyKey As String, ByVal aCopyFromDOID As String, ByVal aCopyToDOID As String)

		Dim aCopyToDO As cDataObject
		aCopyToDO = WebSession.DataObjectFactory.CloneDataObject(aCopyFromDO)
		aCopyToDO(aCopyToDOPropertyKey) = aCopyToDOID
		aCopyToDO = Update_Dates(aCopyToDO)
		aCopyToDO.SaveData()
	End Sub

		Private Function Update_Dates(ByVal aCopyToDO As cDataObject) As cDataObject
			Dim aUser As cEGUser
			aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			If aCopyToDO.HasProperty("CreateUser") Then
				aCopyToDO("CreateUser") = aUser.UserID
			End If
			If aCopyToDO.HasProperty("CreateDate") Then
				aCopyToDO("CreateDate") = System.DateTime.Now()
			End If
			If aCopyToDO.HasProperty("ModifyUser") Then
				aCopyToDO("ModifyUser") = System.DBNull.Value
			End If
			If aCopyToDO.HasProperty("ModifyDate") Then
				aCopyToDO("ModifyDate") = System.DBNull.Value
			End If
			Return aCopyToDO
		End Function


		Public Sub CopyToNewTask(ByVal aWfTaskAssignmentID As String, ByVal aNewProjectID As String)
			Dim aUser As cEGUser
			aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)

			Dim aWfTaskAssignmentDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", Request.QueryString("WfTaskAssignmentID"))
			Dim aGranteeProjectID As String = aWfTaskAssignmentDO.GetPropertyString("GranteeProjectID")
			Dim aGranteeProjectDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", aGranteeProjectID)
			Dim aNewGranteeDO As cDataObject
			Dim aXmlDoc As cXMLDoc
			Dim aDataObjectNode As XmlNode
			Dim aFiltersNode As XmlNode

			 Try
				BeginTrans()

				'Creating a new record in the grantee table
				aNewGranteeDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Grantee")
				aNewGranteeDO("EntityID") = aUser.PersonID
				aNewGranteeDO("EntityTypeID") = 1 'Person
				WebSession.DataObjectFactory.SaveDataObject(aNewGranteeDO)

				'Creating a new record in the grantee project table
				Dim aNewGranteeProjectDO As cDataObject
				aNewGranteeProjectDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("GranteeProject")
				aNewGranteeProjectDO("GranteeID") = aNewGranteeDO("GranteeID")
				aNewGranteeProjectDO("WfProjectID") = aNewProjectID
				aNewGranteeProjectDO("PrimaryPersonID") = aUser.PersonID
				aNewGranteeProjectDO("GrantStatusID") = 2
				If Not aGranteeProjectDO.GetPropertyString("PrimaryOrganizationID", "") = "" Then
					aNewGranteeProjectDO("PrimaryOrganizationID") = aGranteeProjectDO.GetPropertyInt("PrimaryOrganizationID")
				End If
				If Not aGranteeProjectDO.GetPropertyString("PrimaryAddressID", "") = "" Then
					aNewGranteeProjectDO("PrimaryAddressID") = aGranteeProjectDO.GetPropertyInt("PrimaryAddressID")
				End If
				If Not aGranteeProjectDO.GetPropertyString("GrantTitle", "") = "" Then
					aNewGranteeProjectDO("GrantTitle") = aGranteeProjectDO.GetPropertyString("GrantTitle")
				End If

				aNewGranteeProjectDO("CopiedBasedOn") = aGranteeProjectID
				aNewGranteeProjectDO("CreateUser") = aUser.UserID
				aNewGranteeProjectDO("CreateDate") = System.DateTime.Now()
				WebSession.DataObjectFactory.SaveDataObject(aNewGranteeProjectDO)

				'Copying the data in the related dataobjects that have the attribute ApplicationCopy='True'
				Copy_RelatedDataObjects(aGranteeProjectDO, aGranteeProjectID, aNewGranteeProjectDO("GranteeProjectID").ToString())

				'Creating a new record in the wf_task_assignment table
				Dim aNewWfTaskAssignmentDO As cDataObject
				aNewWfTaskAssignmentDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskAssignment")
				aNewWfTaskAssignmentDO("WfTaskID") = aWfTaskAssignmentDO.GetPropertyInt("WfTaskID")
				aNewWfTaskAssignmentDO("WfTaskStatusID") = 1
				aNewWfTaskAssignmentDO("GranteeProjectID") = aNewGranteeProjectDO.GetPropertyInt("GranteeProjectID")
				aNewWfTaskAssignmentDO("PersonID") = aUser.PersonID
				aNewWfTaskAssignmentDO("WfTaskRoleID") = aWfTaskAssignmentDO.GetPropertyInt("WfTaskRoleID")
				aNewWfTaskAssignmentDO("CreateUser") = aUser.UserID
				aNewWfTaskAssignmentDO("CreateDate") = System.DateTime.Now()
				WebSession.DataObjectFactory.SaveDataObject(aNewWfTaskAssignmentDO)

				Copy_RelatedDataObjects(aWfTaskAssignmentDO, aWfTaskAssignmentDO("WfTaskAssignmentID").ToString(), aNewWfTaskAssignmentDO("WfTaskAssignmentID").ToString())

				Dim aNewDOSubmittedFileList As cDataObjectList
				Dim aNewDOSubmittedFile As cDataObject
				Dim aExistingDOSubmittedFileList As cDataObjectList
				Dim aExistingDOSubmittedFile As cDataObject
				aExistingDOSubmittedFileList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SubmittedFile", "EntityID", aWfTaskAssignmentDO("WfTaskAssignmentID").ToString(), "EntityDataObjectKey", "WfTaskAssignment")
				If aExistingDOSubmittedFileList.Count > 0 Then
					For Each aExistingDOSubmittedFile In aExistingDOSubmittedFileList
						aNewDOSubmittedFile = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("SubmittedFile")
						aNewDOSubmittedFile("EntityID") = aNewWfTaskAssignmentDO.GetPropertyInt("WfTaskAssignmentID")
						Dim aUploadId As String
						Dim aProjectTaskId As Integer
						Dim aProjectTaskUploadId As Integer
						Dim aWfProjectTaskList As cDataObjectList
						Dim aWfProjectTaskUploadList As cDataObjectList

						Dim aNewWfProjectID As Integer = aNewWfTaskAssignmentDO.GetRelatedPropertyInt("GranteeProject.WfProjectID")
						Dim aWfTaskID As Integer = aNewWfTaskAssignmentDO.GetPropertyInt("WfTaskID")

						aUploadId = aExistingDOSubmittedFile.GetRelatedPropertyInt("TaskUploadType.UploadId")
						aWfProjectTaskList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", aNewWfProjectID, "WfTaskID", aWfTaskID)
						aProjectTaskId = aWfProjectTaskList(0).GetPropertyInt("WfProjectTaskID")
						aWfProjectTaskUploadList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskUpload", "WfProjectTaskID", aProjectTaskId, "UploadId", aUploadId)
						aProjectTaskUploadId = aWfProjectTaskUploadList(0).GetPropertyInt("WfProjectTaskUploadID")
						aNewDOSubmittedFile("UploadID") = aProjectTaskUploadId
						aNewDOSubmittedFile("SourceFileName") = aExistingDOSubmittedFile("SourceFileName")
						aNewDOSubmittedFile("SourceFileMIMEType") = aExistingDOSubmittedFile("SourceFileMIMEType")
						aNewDOSubmittedFile("SourceFilePath") = aExistingDOSubmittedFile("SourceFilePath")
						aNewDOSubmittedFile("StoredFilePath") = aExistingDOSubmittedFile("StoredFilePath")
						aNewDOSubmittedFile("SubmitDate") = aExistingDOSubmittedFile("SubmitDate")
						aNewDOSubmittedFile("ConversionStatus") = aExistingDOSubmittedFile("ConversionStatus")
						aNewDOSubmittedFile("ConversionResult") = aExistingDOSubmittedFile("ConversionResult")
						aNewDOSubmittedFile("UploadedByID") = aExistingDOSubmittedFile("UploadedByID")
						aNewDOSubmittedFile("EntityDataObjectKey") = aExistingDOSubmittedFile("EntityDataObjectKey")

						WebSession.DataObjectFactory.SaveDataObject(aNewDOSubmittedFile)

						Copy_RelatedDataObjects(aExistingDOSubmittedFile, aExistingDOSubmittedFile("SubmittedFileID").ToString(), aNewDOSubmittedFile("SubmittedFileID").ToString())
					Next
				End If
			CommitTrans()
			Catch ex As Exception
				RollbackTrans()
				Throw (ex) 'Throwing the error redirects to the configured error page.
				Exit Sub
			End Try

		End Sub

		'parameters: 1: the base dataobject 2: Id of the parent DO 3: Id of the copied/child DO
		Private Sub Copy_RelatedDataObjects(ByVal aDataObject As cDataObject, ByVal aCopyFromDOID As String, ByVal aCopyToDOID As String)
			Dim aXmlDoc As cXMLDoc
			aXmlDoc = WebAppl.DataDefinitionDoc()
			Dim aDataObjectDefNode As XmlNode = aDataObject.ObjDefNode()
			Dim aName() As String = {"DataType", "ApplicationCopy"}
			Dim aValue() As String = {"cDataObject", "True"}

			Dim aDataObjectPropertiesNodeList As XmlNodeList = cXMLDoc.FindNodes(aDataObjectDefNode.SelectSingleNode("Properties"), "Property", aName, aValue)

			'looping through the RelationShip properties in the DataObject definition
			For Each aXmlNode As XmlNode In aDataObjectPropertiesNodeList
				Dim aRelationType As String = aXmlNode.SelectSingleNode("Relationship").Attributes("Type").Value()
				Dim aCount As Integer = aXmlNode.SelectNodes("Relationship/RelationshipProperties/RelationshipProperty").Count()
				Dim aParentProperty(aCount - 1) As String
				Dim aChildProperty(aCount - 1) As String
				Dim aChildPropertyValue(aCount - 1) As String

				Dim aRelationshipPropertyNodeList As XmlNodeList = aXmlNode.SelectNodes("Relationship/RelationshipProperties/RelationshipProperty")
				Dim aChildDefinitionKey = aXmlNode.SelectSingleNode("Relationship").Attributes("ChildDefinitionKey").Value()

				Dim i As Integer
				For i = 0 To aRelationshipPropertyNodeList.Count - 1

					If aRelationshipPropertyNodeList(i).Attributes("Data") Is Nothing Then
						aParentProperty(i) = aRelationshipPropertyNodeList(i).Attributes("parentProperty").Value()

						aChildProperty(i) = aRelationshipPropertyNodeList(i).Attributes("childProperty").Value()
						If aParentProperty(i).IndexOf(".") <> -1 Then
							aChildPropertyValue(i) = aDataObject.GetRelatedPropertyString(aParentProperty(i))
						Else
							aChildPropertyValue(i) = aDataObject.GetPropertyString(aParentProperty(i))
						End If
					Else
						aChildProperty(i) = aRelationshipPropertyNodeList(i).Attributes("childProperty").Value()
						aChildPropertyValue(i) = aRelationshipPropertyNodeList(i).Attributes("Data").Value().ToString()
					End If
				Next

				Dim aChildDefinitionDOList As cDataObjectList
				aChildDefinitionDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter(aChildDefinitionKey, aChildProperty, aChildPropertyValue)

				If aChildDefinitionDOList.Count > 0 Then
					Copy_DataObject(aChildDefinitionDOList, aChildProperty(0), aCopyFromDOID, aRelationType, aCopyToDOID)
				End If

			Next
		End Sub

		Public Sub Copy_WfProject_RelatedDataObjects(ByVal aCopyFromWfProjectID As String, ByVal aCopyToWfProjectID As String)
			Dim aWfProjectObj As cDataObject = Me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProject", aCopyToWfProjectID)
			Dim aSourceObj As cDataObject = Me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProject", aCopyFromWfProjectID)			
			Dim aWfTaskID As Integer
			Dim aWfProjectTaskOutcomeList, aList As cDataObjectList
			Dim aChildObj, aProjectTaskObj, aChildProjectTaskObj, aWfProjectTaskOutcomeObj, aChildProjectTaskOutcomeObj As cDataObject
				 'copy page content
			aChildObj = CopyDataObject("PageContent", aSourceObj.GetPropertyValue("WfProjectID"), Nothing, False, Nothing, "ProjectID", aWfProjectObj.GetPropertyValue("WfProjectID"))

			'copy project task and related tables
			aList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", _
				"WfProjectID", aCopyFromWfProjectID)

			For Each aProjectTaskObj In aList
				aChildProjectTaskObj = CopyDataObject("", "", aProjectTaskObj, False, Nothing, "WfProjectID", aWfProjectObj.GetPropertyInt("WfProjectID"))

				'copy project_task_uploads and related table
				Dim aWfProjectTaskUploadsList As cDataObjectList = aProjectTaskObj.GetRelatedPropertyDataObjectList("WfProjectTaskUploads")
				Dim aWfProjectTaskUploadsObj, aChildProjectTaskUploadsObj, aChildWfProjectTaskUploadOrgObj As cDataObject
				Dim aWfProjectTaskUploadOrganizationEligibilityList As cDataObjectList
				For Each aWfProjectTaskUploadsObj In aWfProjectTaskUploadsList
					aChildProjectTaskUploadsObj = CopyDataObject("", "", aWfProjectTaskUploadsObj, False, Nothing, "WfProjectTaskID", _
																	aChildProjectTaskObj.GetPropertyInt("WfProjectTaskID"))

					aChildWfProjectTaskUploadOrgObj = CopyDataObject("WfProjectTaskUploadOrganizationEligibility", "", aWfProjectTaskUploadsObj, True, Nothing, _
																		"WfProjectTaskUploadID", aChildProjectTaskUploadsObj.GetPropertyInt("WfProjectTaskUploadID"))
				Next
				'copy project_task_nav_elements
				Dim aWfProjectTaskNavElementObj, aChildProjectTaskNavElementObj As cDataObject
				aChildProjectTaskNavElementObj = CopyDataObject("WfProjectTaskNavElements", "", aProjectTaskObj, True, Nothing, "WfProjectTaskID", _
																	aChildProjectTaskObj.GetPropertyInt("WfProjectTaskID"))

				'copy project_task_eligibility_answers
				Dim aWfProjectTaskEligAnswersObj, aChildProjectTaskEligAnswersObj As cDataObject
				aChildProjectTaskEligAnswersObj = CopyDataObject("WFProjectTaskEligibilityAnswers", "", aProjectTaskObj, True, Nothing, "WfProjectTaskID", _
																	aChildProjectTaskObj.GetPropertyInt("WfProjectTaskID"))

				'copy project_task_outcome and related tables
				aWfProjectTaskOutcomeList = aProjectTaskObj.GetRelatedPropertyDataObjectList("WfProjectTaskOutcome")
				For Each aWfProjectTaskOutcomeObj In aWfProjectTaskOutcomeList

					aChildProjectTaskOutcomeObj = CopyDataObject("", "", aWfProjectTaskOutcomeObj, False, Nothing, "WfProjectTaskID", _
																	aChildProjectTaskObj.GetPropertyInt("WfProjectTaskID"))

					'copy project_task_outcome_events and related tables
					Dim aWfProjectTaskOutcomeEventsList As cDataObjectList = aWfProjectTaskOutcomeObj.GetRelatedPropertyDataObjectList("WfProjectTaskOutcomeEvents")
					Dim aWfProjectTaskOutcomeEventsObj, aChildProjectTaskOutcomeEventsObj, aChildEventObj, aChildEventCorrObj As cDataObject
					For Each aWfProjectTaskOutcomeEventsObj In aWfProjectTaskOutcomeEventsList
						Dim aParentEventObj As cDataObject = aWfProjectTaskOutcomeEventsObj.GetRelatedPropertyDataObject("EventKey")
						aChildEventObj = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Event")
						aChildEventObj("EventDescription") = aParentEventObj.GetPropertyString("EventDescription")
						aChildEventObj.SaveData()

						Dim aParentEventCorrObj As cDataObject = aWfProjectTaskOutcomeEventsObj.GetRelatedPropertyDataObject("EventCorrespondence")
						aChildEventCorrObj = Me.WebSession.DataObjectFactory.CloneDataObject(aParentEventCorrObj)
						aChildEventCorrObj("EventID") = aChildEventObj.GetPropertyInt("EventID")
						Me.WebSession.DataObjectFactory.SaveDataObject(aChildEventCorrObj)


						aChildProjectTaskOutcomeEventsObj = Me.WebSession.DataObjectFactory.CloneDataObject(aWfProjectTaskOutcomeEventsObj)
						aChildProjectTaskOutcomeEventsObj("WfProjectTaskOutcomeID") = aChildProjectTaskOutcomeObj.GetPropertyInt("WfProjectTaskOutcomeID")
						aChildProjectTaskOutcomeEventsObj("WfProjectTaskID") = aChildProjectTaskObj.GetPropertyInt("WfProjectTaskID")
						aChildProjectTaskOutcomeEventsObj("EventKeyID") = aChildEventObj.GetPropertyInt("EventID")
						Me.WebSession.DataObjectFactory.SaveDataObject(aChildProjectTaskOutcomeEventsObj)
					Next
					'copy project_task_outcome_filters and related table
					Dim aWfProjectTaskOutcomeFiltersList As cDataObjectList = aWfProjectTaskOutcomeObj.GetRelatedPropertyDataObjectList("WfProjectTaskOutcomeFilters")
					Dim aWfProjectTaskOutcomeFiltersObj, aChildProjectTaskOutcomeFiltersObj, aChildFilterArgumentObj As cDataObject
					For Each aWfProjectTaskOutcomeFiltersObj In aWfProjectTaskOutcomeFiltersList

						aChildProjectTaskOutcomeFiltersObj = CopyDataObject("", "", aWfProjectTaskOutcomeFiltersObj, False, Nothing, _
																		"WfProjectTaskOutcomeID", aChildProjectTaskOutcomeObj.GetPropertyInt("WfProjectTaskOutcomeID"))

						aChildFilterArgumentObj = CopyDataObject("FilterArgument", "", aWfProjectTaskOutcomeFiltersObj, True, Nothing, "", "")
					Next

					'copy Workflow Events
					Dim aProjectTaskOutcomeWorkflowEventsList As cDataObjectList = aWfProjectTaskOutcomeObj.GetRelatedPropertyDataObjectList("WorkflowEvents")
					CopyDataObject("", "", Nothing, False, aProjectTaskOutcomeWorkflowEventsList, "WorkflowID", aChildProjectTaskOutcomeObj.GetPropertyInt("WfProjectTaskOutcomeID"))
				Next

				'copy project_task_pdf
				Dim aChildProjectTaskPDFObj As cDataObject
				aChildProjectTaskPDFObj = CopyDataObject("WfProjectTaskPDF", "", aProjectTaskObj, True, Nothing, "WfProjectTaskID", aChildProjectTaskObj.GetPropertyInt("WfProjectTaskID"))


				Dim aRemindersList As cDataObjectList = aProjectTaskObj.GetRelatedPropertyDataObjectList("Reminders")
				Dim aRemindersObj, aChildRemindersObj As cDataObject
				For Each aRemindersObj In aRemindersList
					'If aRemindersObj.GetRelatedPropertyBool("IsEnabled") Then
						aChildRemindersObj = CopyDataObject("", "", aRemindersObj, False, Nothing, "ProjectTaskID", aChildProjectTaskObj.GetPropertyInt("WfProjectTaskID"))
						aChildRemindersObj("WfProjectID") = aWfProjectObj.GetPropertyString("WfProjectID")
						aChildRemindersObj("CompetitionID") = aWfProjectObj.GetPropertyString("CompetitionID")
						aChildRemindersObj("ProgramID") = aWfProjectObj.GetRelatedPropertyString("WfCompetition.WfProgram.ProgramID")
						Update_Dates(aChildRemindersObj)
						aChildRemindersObj.SaveData()
					'End If
				Next

				'copy Workflow Events
				Dim aProjectTaskWorkflowEventsList As cDataObjectList = aProjectTaskObj.GetRelatedPropertyDataObjectList("WorkflowEvents")
				CopyDataObject("", "", Nothing, False, aProjectTaskWorkflowEventsList, "WorkflowID", aChildProjectTaskObj.GetPropertyInt("WfProjectTaskID"))
			Next

			'copy project_task_outcome_tasks
			'because there can be multiple project task outcome and project task outcome tasks records with the same wf_project_task_id AND next_wf_project_task_id, 
			'  we need to find the project task outcome.task_outcome_id for source obj.  then, once we have that we can get the wf_project_task_outcome_id AND
			'  next_wf_project_task_id for new obj to create our new project task outcome tasks records.  (kda, 6/24/2008)
			For Each aSourceObj In aList
				Dim aWfProjectTaskOutcomeTasksObj, aChildProjectTaskOutcomeTasksObj, aNextProjectTaskObj, aNewProjectTaskObj As cDataObject
				Dim aNextWfTaskID, aNewProjectTaskID, aParentProjectTaskID, aTaskOutcomeID, aNewWfProjectTaskOutcomeID As Integer
				aWfProjectTaskOutcomeList = aSourceObj.GetRelatedPropertyDataObjectList("WfProjectTaskOutcome")
				If aWfProjectTaskOutcomeList.Count > 0 Then
					For Each aWfProjectTaskOutcomeObj In aWfProjectTaskOutcomeList
						aWfProjectTaskOutcomeTasksObj = aWfProjectTaskOutcomeObj.GetRelatedPropertyDataObject("WfProjectTaskOutcomeTasks")
						If Not aWfProjectTaskOutcomeTasksObj Is Nothing Then
							aTaskOutcomeID = aWfProjectTaskOutcomeObj.GetPropertyInt("TaskOutcomeID")
							aNewProjectTaskObj = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", _
								aWfProjectObj.GetPropertyInt("WfProjectID").ToString(), "WfTaskID", aWfProjectTaskOutcomeObj.GetRelatedPropertyInt("WfProjectTask.WfTaskID").ToString())(0)
							aChildProjectTaskOutcomeTasksObj = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfProjectTaskOutcomeTasks")
							aNextWfTaskID = aWfProjectTaskOutcomeTasksObj.GetRelatedPropertyInt("NextWfProjectTask.WfTaskID")
							aNextProjectTaskObj = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", _
								aWfProjectObj.GetPropertyInt("WfProjectID"), "WfTaskID", aNextWfTaskID.ToString())(0)
							aNewWfProjectTaskOutcomeID = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskOutcome", "WfProjectTaskID", _
								aNewProjectTaskObj.GetPropertyInt("WfProjectTaskID").ToString(), "TaskOutcomeID", _
								aTaskOutcomeID.ToString())(0).GetPropertyInt("WfProjectTaskOutcomeID")
							aChildProjectTaskOutcomeTasksObj("WfProjectTaskOutcomeID") = aNewWfProjectTaskOutcomeID
							aChildProjectTaskOutcomeTasksObj("NextWfProjectTaskID") = aNextProjectTaskObj.GetPropertyInt("WfProjectTaskID")
							Me.WebSession.DataObjectFactory.SaveDataObject(aChildProjectTaskOutcomeTasksObj)
						End If
					Next
				End If

				'update parent task id
				Dim aNewParentProjectTaskObj As cDataObject
				Dim aNewProjectTaskList As cDataObjectList
				aParentProjectTaskID = aSourceObj.GetPropertyInt("ParentProjectTaskID", 0)
				If aParentProjectTaskID <> 0 Then
					aWfTaskID = Me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", aParentProjectTaskID.ToString()).GetPropertyInt("WfTaskID").ToString()
					aNewParentProjectTaskObj = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", aWfProjectObj.GetPropertyInt("WfProjectID"), _
						"WfTaskID", aWfTaskID.ToString())(0)
					aNewProjectTaskList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", _
						aWfProjectObj.GetPropertyInt("WfProjectID").ToString(), "WfTaskID", aSourceObj.GetPropertyInt("WfTaskID").ToString())
					For Each aNewProjectTaskObj In aNewProjectTaskList
						aNewProjectTaskObj("ParentProjectTaskID") = aNewParentProjectTaskObj.GetPropertyInt("WfProjectTaskID")
						aNewProjectTaskObj.SaveData()
					Next
				End If
			Next

			'copy project payment table
			aChildObj = CopyDataObject("ProjectPayment", aSourceObj.GetPropertyValue("WfProjectID"), Nothing, False, Nothing, _
											"ProjectID", aWfProjectObj.GetPropertyInt("WfProjectID"))


			'copy project report table
			aChildObj = CopyDataObject("ProjectReport", aSourceObj.GetPropertyValue("WfProjectID"), Nothing, False, Nothing, _
											"ProjectID", aWfProjectObj.GetPropertyInt("WfProjectID"))

			'copy budget category table
			Dim aNewMainBudgetCatID, aSourceBudgetCatID, aChildBudCatID As Integer
			'Add the Main Parent Budget Category (Ex: Total)
			Dim aMainBudgetCatDO As cDataObject = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetCategory", _
				"ProjectID", aSourceObj.GetPropertyValue("WfProjectID"), "ParentID", 0)(0)
			If Not aMainBudgetCatDO Is Nothing Then
				Dim aMainBudCatID = aMainBudgetCatDO.GetPropertyInt("BudgetCategoryID")
				CopyBudgetCategory(aMainBudgetCatDO, aCopyToWfProjectID, 0)
			End If
			
		End Sub

		Private Sub CopyBudgetCategory(ByVal aBudgetSourceDO As cDataObject, ByVal aCopyToWfProjectID As Integer, ByVal aParentID As Integer)
			Dim aChildObj As cDataObject = Me.WebSession.DataObjectFactory.CloneDataObject(aBudgetSourceDO)
			Dim aNewBudgetCatID As Integer
			aChildObj("ProjectID") = aCopyToWfProjectID
			'Me.WebSession.DataObjectFactory.SaveDataObject(aChildObj)
			'aChildObj("SortOrder") = aChildObj.GetPropertyInt("BudgetCategoryID")
			aChildObj("ParentID") = aParentID
			aChildObj.SaveData()
			aNewBudgetCatID = aChildObj.GetPropertyInt("BudgetCategoryID")

			Dim aChildBudCatDOL As cDataObjectList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetCategory", _
						"ProjectID", aBudgetSourceDO.GetPropertyValue("ProjectID"), "ParentID", aBudgetSourceDO.GetPropertyInt("BudgetCategoryID"))
			Dim aChildBudCatDO As cDataObject

			If aChildBudCatDOL.Count <> 0 Then
				For Each aChildBudCatDO In aChildBudCatDOL
					CopyBudgetCategory(aChildBudCatDO, aCopyToWfProjectID, aNewBudgetCatID)
				Next
			End If

		End Sub


		 Public Function CopyDataObject(ByVal aDataObjKey As String, ByVal aParamValue As String, ByVal aDataObj As cDataObject, ByVal aRelatedObj As Boolean, _
										ByVal aList As cDataObjectList, ByVal aPropertyKey As String, ByVal aPropertyValue As String)
			Dim aChildObj As cDataObject
			Dim aSourceObj As cDataObject

			If aDataObjKey <> "" AndAlso Not aRelatedObj Then
				aList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter(aDataObjKey, aPropertyKey, aParamValue)
			End If
			If aRelatedObj Then
				aList = aDataObj.GetRelatedPropertyDataObjectList(aDataObjKey)
			End If
			If Not aList Is Nothing AndAlso aList.Count > 0 Then
				For Each aSourceObj In aList
					aChildObj = Me.WebSession.DataObjectFactory.CloneDataObject(aSourceObj)
					If aPropertyKey <> "" Then aChildObj(aPropertyKey) = aPropertyValue
					Me.WebSession.DataObjectFactory.SaveDataObject(aChildObj)
				Next
			ElseIf Not aDataObj Is Nothing AndAlso Not aRelatedObj Then
				aChildObj = Me.WebSession.DataObjectFactory.CloneDataObject(aDataObj)
				If aPropertyKey <> "" Then aChildObj(aPropertyKey) = aPropertyValue
				Me.WebSession.DataObjectFactory.SaveDataObject(aChildObj)
			End If

			Return aChildObj
		End Function


		Public Sub CreateGrantTask(ByVal aWfProjectTaskID As String)
			'Dim aWfProjectTaskID As String = ctlGrantTasks.SelectedValue()
			Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			If Not aWfProjectTaskID = "" Then
				Dim aWfTADO As cDataObject = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskAssignment")
				Dim aGranteeProjectID As String = Request.QueryString("GranteeProjectID")
				Dim aGPDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", aGranteeProjectID)
				Dim aWfProjectTaskDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", aWfProjectTaskID)

				Dim aAssignTo As String = aWfProjectTaskDO("AssignTo")
				Dim aAssignToType, aAssignToID As String
				Dim aDefaultWorkgroupDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WorkGroup", "IsPrimary", "True")(0)
				If aAssignTo.IndexOf("~") > 0 Then

					Dim aAssignToValues() As String = aAssignTo.Split("~")
					aAssignToID = aAssignToValues(0)
					aAssignToType = aAssignToValues(1)

					Select Case aAssignToType
					  Case "role"
						If aAssignToID = "1" Then aWfTADO("PersonID") = aGPDO.GetPropertyInt("PrimaryPersonID")
					  Case "workgroup"
						If aAssignToValues(2) <> "" Then
							Dim aWorkGroupDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WorkGroup", aAssignToValues(2))
							If Not aWorkGroupDO Is Nothing Then
								aWfTADO("WorkGroupID") = aAssignToValues(2)
							ElseIf Not aDefaultWorkgroupDO Is Nothing Then
								aWfTADO("WorkGroupID") = aDefaultWorkgroupDO.GetPropertyString("WorkGroupID")
							End If
						End If
					  Case "primary_staff_support_contact"
						If Not aDefaultWorkgroupDO Is Nothing Then
							aWfTADO("WorkGroupID") = aDefaultWorkgroupDO.GetPropertyString("WorkGroupID")
						End If
						aWfTADO("PersonID") = aGPDO.GetRelatedPropertyInt("GranteeProjectPrimaryStaffAffiliation.StaffPersonID")
					  Case Else
					End Select
				End If


				Dim aWfTaskRoleDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskRole", "TaskTypeID", "8", "IsDefault", "True")(0)
				Dim aWfTaskRoleID As String = "114"
				If Not aWfTaskRoleDO Is Nothing Then
					aWfTaskRoleID = aWfTaskRoleDO.GetPropertyString("WfTaskRoleID")
				End If
				aWfTADO("GranteeProjectID") = Convert.ToInt32(aGranteeProjectID)
				aWfTADO("WfTaskID") = aWfProjectTaskDO.GetPropertyInt("WfTaskID")
				aWfTADO("WfTaskRoleID") = aWfTaskRoleID
				aWfTADO("WfTaskStatusID") = aWfProjectTaskDO.GetPropertyInt("DefaultStatusID")
				aWfTADO("WfTaskOutcomeID") = aWfProjectTaskDO.GetPropertyInt("DefaultOutcomeID")
				aWfTADO("CreateDate") = Date.Now
				aWfTADO("CreateUser") = aUser.UserID
				aWfTADO.SaveData()
			End If
			CorePage.Redirect()
		End Sub




		'The Below 2 functions are used for a delete File from a submitted File Table and also from sharepoint if sharepoint is Active
		Public Sub SubmittedFile_Delete(ByVal aPrimaryKeyValue As String)
			Dim aSubmittedFile As cSubmittedFile
			aSubmittedFile = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SubmittedFile", aPrimaryKeyValue)


			If aSubmittedFile.GetPropertyInt("ConversionStatus", 0) = -1 AndAlso aSubmittedFile.GetPropertyInt("SharepointConversionStatus", 0) = -1 Then
				'If sharepoint is Active only the following code needs to be executed.
				Dim aSharePointDOList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")
				If aSharePointDOList.Count > 0 Then
					Dim aRemoteOrginalFileURL As String = ""
					Dim aRemotePDFFileURL As String = ""
					Dim aSharePointDO As cDataObject = Nothing
					Dim aDeleteResult As Boolean = True

					CorePage.GetFileUrl(aSubmittedFile, aSharePointDO, aRemotePDFFileURL, aRemoteOrginalFileURL)
					'Here we are getting the FolderUrl and then Truncating it to 128 characters as sharepoint supports only supports 128 character Folder Name
					'aRemotePDFFileURL = cWebLib.TruncateFolderName(aRemotePDFFileURL)
					'aRemoteOrginalFileURL = cWebLib.TruncateFolderName(aRemoteOrginalFileURL)

					Dim myCred As New System.Net.NetworkCredential(aSharePointDO("UserName"), aSharePointDO("Password"))
					Dim aSPUrl As String = cWebLib.GetFormattedUrl(aSharePointDO.GetPropertyString("SharePointURL"))
					'Here before deleting from sharepoint , we are checking where Delete Permanentely is check for SharePoint seetings
					If aSharePointDO.GetPropertyBool("DeleteDocumentPermanently") = True Then
						aDeleteResult = DeleteFileFromSharepoint(aSPUrl, aRemoteOrginalFileURL, myCred)
						aDeleteResult = DeleteFileFromSharepoint(aSPUrl, aRemotePDFFileURL, myCred)
					End If
				End If
			End If
			aSubmittedFile.SubmittedFile_Delete()

		End Sub


		Public Function DeleteFileFromSharepoint(ByVal webUrl As String, ByVal webRelativeUrls As String, ByVal myCred As System.Net.NetworkCredential) As Boolean
			Dim method As String = "method=remove+documents%3a12.0.4518.1016&service_name=%2f&url_list=[{0}]"
			method = String.Format(method, webRelativeUrls)
			Dim result As String
			Try
				Dim aWC As WebClient = New WebClient
				aWC.Credentials = myCred

				aWC.Headers.Add("Content-Type", "application/x-vermeer-urlencoded")
				aWC.Headers.Add("X-Vermeer-Content-Type", "application/x-vermeer-urlencoded")
				result = Encoding.UTF8.GetString(aWC.UploadData(webUrl + "/_vti_bin/_vti_aut/author.dll", "POST", Encoding.UTF8.GetBytes(method)))

				If result.IndexOf("\n<p>message=successfully") < 0 Then	'note: will show success even if document(s) did not exist on the server 
					Return True
				Else
					Throw New Exception(result)
				End If
			Catch ex As Exception
				 result = ex.Message
				 Return False
			End Try
		End Function

		'The Below function are used for a delete File from a UploadTemplate File Table and also from sharepoint if sharepoint is Active
		Public Sub UploadTemplateFile_Delete(ByVal aPrimaryKeyValue As String)

			'The below code will delete the template from the database and if any uploads are associated with the deleted templated . we are updating it to null.
			Dim aUploadTemplateDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("UploadTemplate", aPrimaryKeyValue)
			Dim aUploadTemplateID As String

			If Not aUploadTemplateDO Is Nothing Then
				Dim aUploadDO As cDataObject
				Dim aUploadDOList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Upload", "UploadTemplateID", aPrimaryKeyValue)
				If aUploadDOList.Count > 0 Then
					For Each aUploadDO In aUploadDOList
						If aUploadDO.GetPropertyInt("UploadTemplateID", 0) = aPrimaryKeyValue Then
							aUploadDO("UploadTemplateID") = System.DBNull.Value
							aUploadDO.SaveData()
						End If
					Next
				End If
				aUploadTemplateDO.DataObjectFactory.DeleteData(aUploadTemplateDO)
				'EventController_Delete("UploadTemplate", aPrimaryKeyValue)

				'If sharepoint is Active only the following code needs to be executed.
				Dim aSharePointDOList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")
				If aSharePointDOList.Count > 0 Then
					Dim aRemoteOrginalFileURL As String = ""
					Dim aRemotePDFFileURL As String = ""
					Dim aSharePointDO As cDataObject = Nothing
					Dim aDeleteResult As Boolean = True

					CorePage.GetFileUrl(aUploadTemplateDO, aSharePointDO, aRemoteOrginalFileURL)
					'Here we are getting the FolderUrl and then Truncating it to 128 characters as sharepoint supports only supports 128 character Folder Name
					'aRemotePDFFileURL = cWebLib.TruncateFolderName(aRemotePDFFileURL)
					'aRemoteOrginalFileURL = cWebLib.TruncateFolderName(aRemoteOrginalFileURL)

					Dim myCred As New System.Net.NetworkCredential(aSharePointDO("UserName"), aSharePointDO("Password"))
					Dim aSPUrl As String = cWebLib.GetFormattedUrl(aSharePointDO.GetPropertyString("SharePointURL"))
					'Here before deleting from sharepoint , we are checking where Delete Permanentely is check for SharePoint seetings
					If aSharePointDO.GetPropertyBool("DeleteDocumentPermanently") = True Then
						aDeleteResult = DeleteFileFromSharepoint(aSPUrl, aRemoteOrginalFileURL, myCred)
						'aDeleteResult = DeleteFileFromSharepoint(aSPUrl, aRemotePDFFileURL, myCred)
					End If
				End If
			End If

		End Sub

		Public Sub DeleteSubmittedFile(ByVal aSubmittedFileDO As cSubmittedFile)
			Dim aRemoteOrginalFileURL As String = ""
			Dim aRemotePDFFileURL As String = ""
			Dim aSharePointDO As cDataObject = Nothing
			Dim aDeleteResult As Boolean = True

			'We are the GetFileurl method of cDataPresenterCtl class to generate the aRemotePDFFileurl and aRemoteOrginalFileURL
			CorePage.GetFileUrl(aSubmittedFileDO, aSharePointDO, aRemotePDFFileURL, aRemoteOrginalFileURL)
			If Not aSharePointDO Is Nothing Then
				Dim myCred As New System.Net.NetworkCredential(aSharePointDO("UserName"), aSharePointDO("Password"))
				Dim aSPUrl As String = cWebLib.GetFormattedUrl(aSharePointDO.GetPropertyString("SharePointURL"))

				'Here before deleting from sharepoint , we are checking where Delete Permanentely is check for SharePoint seetings
				If aSubmittedFileDO.GetPropertyString("SharepointConversionStatus") = "-1" AndAlso aSharePointDO.GetPropertyBool("DeleteDocumentPermanently") Then
					'We are the DeleteFileFromSharepoint method of cDataPresenterCtl class to delete a File from SharePoint. this function is at one place so maintenance will be easy
					aDeleteResult = DeleteFileFromSharepoint(aSPUrl, aRemoteOrginalFileURL, myCred)
					aDeleteResult = DeleteFileFromSharepoint(aSPUrl, aRemotePDFFileURL, myCred)
				End If
			End If
			If Not aSubmittedFileDO Is Nothing Then
				aSubmittedFileDO.SubmittedFile_Delete()
			End If
		End Sub

	End Class

End Namespace 'Core_Web.Controls.Base
