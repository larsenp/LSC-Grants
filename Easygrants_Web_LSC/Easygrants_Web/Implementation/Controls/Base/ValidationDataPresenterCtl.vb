Imports System.Xml
Imports System.Reflection
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core.Web.Navigation
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports EasyGrants.Web

Namespace Implementation.Controls.Base

Public Class cValidationDataPresenterCtl
	Inherits cDataPresenterCtl
	
'This class contains functionality to disable validation sections when they are linked
'to a navigation element that is invisible. In order for this to work, the ValidationSection
'element must have a NavKey attribute whose value matches the Key attribute of the corresponding
'Navigation element in the module configuration file.
'=============================================================

	Protected tabResults As HtmlTable
	Protected tabHeader As HtmlTable

	Protected mFormat As String
	Private mValid As Boolean
	Private mWfDataObject As cWfTaskAssignment
	Private mReopenedSections As ArrayList

'=============================================================

	Public Property DisplayFormat() As String
	Get
		Return mFormat
	End Get
	Set(ByVal Value As String)
		mFormat = Value
	End Set
	End Property

'-------------------------------------------------------------

	Public Property Valid() As Boolean
	Get
		Return mValid
	End Get
	Set(ByVal Value As Boolean)
		mValid = Value
	End Set
	End Property

'-------------------------------------------------------------

	Public Property WfDataObject() As cWfTaskAssignment
	Get
		WfDataObject = mWfDataObject
	End Get
	Set(ByVal Value As cWfTaskAssignment)
		mWfDataObject = Value
	End Set
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property ReopenedSections() As ArrayList
		Get
			If mReopenedSections Is Nothing Then
				mReopenedSections = New ArrayList()
				Dim aWftaReopenSectionList As cDataObjectList
				Dim aWftaReopenSection As cDataObject
				aWftaReopenSectionList = WfDataObject.GetRelatedPropertyDataObjectList("ActiveRequestToReopenThis.WftaReopenSections")
				If Not aWftaReopenSectionList Is Nothing Then
					For Each aWftaReopenSection In aWftaReopenSectionList
						mReopenedSections.Add(aWftaReopenSection.GetPropertyString("SectionKey"))
					Next
				End If
			End If
			Return mReopenedSections
		End Get
	End Property

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		If Not Me.Visible Then Exit Sub
		MyBase.CoreCtl_Load(aSrc, aEvent)

		Dim aValidationNode As XmlNode
		'Dim aWfDataObject As cWfTaskAssignment
		'Dim aDataObjectKey As String
		'Dim aOutcomeNodeList As XmlNodeList
		'Dim aOutcomeNode As XmlNode
		'Dim aValidationSectionList As XmlNodeList

		aValidationNode = (CType(Page, cModulePage)).ValidationNode
		WfDataObject = CType(mDataObjHash("WfTaskAssignment")(0), cWfTaskAssignment)

		'The Validate method accepts the XmlNode by reference and updates it with validation results. 
		'It also returns a boolean value indicating whether the task assignment passed validation.
		Valid = Validate(aValidationNode, WebSession.DataObjectFactory)
		If Not tabResults Is Nothing Then
			WriteValidation(aValidationNode)
		End If
	End Sub

'-------------------------------------------------------------

	Public Function Validate(ByRef aValidationNode As XmlNode, ByVal aDataObjectFactory As cDataObjectFactory) As Boolean
		Dim aValidationHeadersList As XmlNodeList
		Dim aValidationItemList As XmlNodeList
		Dim aValidationSectionList As XmlNodeList
		Dim aValidationSectionNode As XmlNode
		Dim aNavKey As String
		Dim aNavElement As cNavElement
		Dim aValidationItemNode As XmlNode
		Dim aResultCode As Integer
		Dim aOverallResult As Integer = 0

		aValidationHeadersList = aValidationNode.SelectNodes("ValidationHeader")
		If aValidationHeadersList.Count = 0 Then
			aValidationSectionList = aValidationNode.SelectNodes("ValidationSection")
		Else
			aValidationSectionList = aValidationNode.SelectNodes("ValidationHeader/ValidationSection")
		End If
		
		'Make validation section visible or invisible based on corresponding nav element.
		For Each aValidationSectionNode In aValidationSectionList
			Dim aValidateSection As Boolean
			aNavKey = cXMLDoc.AttributeToString(aValidationSectionNode, "NavKey")
			If aNavKey = "" Then 
				aValidateSection = True
			Else
				aNavElement =(CType(Page, cModulePage)).ModuleUser.MasterNavElement.Find_ChildElement(aNavKey)
				aValidateSection = aNavElement.Visible
				If Not aNavElement.Visible Then
					cXMLDoc.AddAttribute_ToNode(aValidationSectionNode, "Active", "False")
				End If
			End If
			If aValidateSection Then
				aValidationItemList = aValidationSectionNode.SelectNodes("ValidationItem")
				For Each aValidationItemNode In aValidationItemList
					If cXMLDoc.AttributeToString(aValidationItemNode, "Type") = "Method" Then
						aResultCode = EvaluateItemByMethod(aValidationItemNode)
					Else
						aResultCode = WfDataObject.EvaluateItem(aValidationItemNode, aDataObjectFactory)
					End If
					If aResultCode > aOverallResult Then
						aOverallResult = aResultCode
					End If
				Next
			Else
				
			End If
		Next

		If (aOverallResult > 2) Then
			Return False
		Else
			Return True
		End If
	End Function
'-------------------------------------------------------------

	Protected Function EvaluateItemByMethod(ByVal aValidationItemNode As XmlNode) As Integer
		Dim aActionNode As XmlNode
		Dim aObjName As String
		Dim aObj As Object
		Dim aType As Type
		Dim aMethodName As String
		Dim aMethod As MethodInfo
		Dim aArgsList As ArrayList = New ArrayList()
		'Dim aAdditionalArgs As Object()
		Dim aTypes As Type()
		Dim i As Integer
		Dim aResult As Integer

		aActionNode = aValidationItemNode.SelectSingleNode("Action")
		aObjName = cXMLDoc.AttributeToString(aActionNode, "Object")
		aObj = EventController_GetActionTarget(aObjName, "")
		aType = aObj.GetType

		'The workflow task assignment and the validation item node are always passed to the custom method 
		'(the validation item node is passed by reference). Other arguments may be specified in the action node.
		aArgsList.Add(WfDataObject)
		aArgsList.Add(aValidationItemNode)
		EventController_GetEventMethodArgs(aArgsList, Nothing, Nothing, aActionNode)
		'If Not aArgsList Is Nothing Then
		'    For i = 0 To aAdditionalArgs.Length - 1
		'        ReDim Preserve aArgs(i + 2)
		'        aArgs(i + 2) = aAdditionalArgs(i)
		'    Next
		'End If
		For i = 0 To aArgsList.Count - 1
			ReDim Preserve aTypes(i)
			aTypes(i) = aArgsList(i).GetType
		Next
		aMethodName = cXMLDoc.AttributeToString(aActionNode, "Method")
		aMethod = aType.GetMethod(aMethodName)
		aResult = aMethod.Invoke(aObj, aArgsList.ToArray)
		'Mark result in validation node
		cXMLDoc.IndicateValidationResult(aValidationItemNode, aResult)
		Return aResult
	End Function
'-------------------------------------------------------------

	Protected Sub WriteValidation(ByVal aValidationNode As XmlNode)
		Dim aValidationHeadersList As XmlNodeList
		Dim aValidationHeaderNode As XmlNode
		Dim aValidationSectionList As XmlNodeList
		Dim aValidationSectionNode As XmlNode
		Dim aResultNodeList As XmlNodeList
			Dim aRequiredText As String
			Dim aSectionHeader As Control
			Dim aTR As HtmlTableRow
			Dim aDetailedRequiredText As String
		Dim aTD As HtmlTableCell
		Dim aImage As HtmlControl

		aValidationHeadersList = aValidationNode.SelectNodes("ValidationHeader")
		If aValidationHeadersList.Count = 0 Then
			aValidationSectionList = aValidationNode.SelectNodes("ValidationSection")
		Else
			For Each aValidationHeaderNode In aValidationHeadersList
				WriteValidationHeader(aValidationHeaderNode)
				WriteValidation(aValidationHeaderNode)
			Next
			Exit Sub
		End If
			If DisplayFormat = "Summary" Then
				aTR = New HtmlTableRow()
				aTD = New HtmlTableCell()
				aTD.InnerHtml = "&nbsp;"
				aTR.Cells.Add(aTD)
				tabResults.Rows.Add(aTR)
				'aTR = New HtmlTableRow()
				'aTD = New HtmlTableCell()
				'aTD.InnerHtml = "<b>Status</b>"
				'aTR.Cells.Add(aTD)
				'aTD = New HtmlTableCell()
				'aTD.InnerHtml = "<b>Section</b>"
				'aTD.Width = "100"
				'aTR.Cells.Add(aTD)
				'aTD = New HtmlTableCell()
				'aTD.InnerHtml = "<b>Required</b>"
				'aTR.Cells.Add(aTD)
				'tabResults.Rows.Add(aTR)
			End If
			For Each aValidationSectionNode In aValidationSectionList
				If cXMLDoc.AttributeToBool(aValidationSectionNode, "Active", True) Then
					If DisplayFormat = "Detail" Then
						aTR = New HtmlTableRow()
						aTD = New HtmlTableCell()
						aTD.InnerHtml = "&nbsp;"
						aTR.Cells.Add(aTD)
						tabResults.Rows.Add(aTR)
					End If
					aRequiredText = cXMLDoc.AttributeToString(aValidationSectionNode, "RequiredText")
					aDetailedRequiredText = cXMLDoc.AttributeToString(aValidationSectionNode, "DetailedRequiredText")

					'Write section header, which links back to the appropriate page
					aSectionHeader = GetSectionHeader(aValidationSectionNode)

					aResultNodeList = aValidationSectionNode.SelectNodes("ValidationItem/Results/Result")
					Select Case DisplayFormat
						Case "Detail"
							aTR = New HtmlTableRow()
							aTD = New HtmlTableCell()
							aTD.ColSpan = 2
							aTD.Controls.Add(aSectionHeader)
							'aTD.InnerHtml = "<b>" + aDisplayName + "</b>"
							aTR.Cells.Add(aTD)
							tabResults.Rows.Add(aTR)
							WriteSectionDetail(aResultNodeList)
						Case "Summary"
							aTR = New HtmlTableRow()
							aTD = New HtmlTableCell()
							aTD.ColSpan = 3
							aTD.InnerHtml = "<HR>"
							aTR.Cells.Add(aTD)
							tabResults.Rows.Add(aTR)
							aTR = New HtmlTableRow()
							aImage = GetStatusImage(SectionResult(aResultNodeList))
							aTD = New HtmlTableCell()
							aTD.Controls.Add(aImage)
							aTR.Cells.Add(aTD)
							aTD = New HtmlTableCell()
							aTD.Controls.Add(aSectionHeader)
							'aTD.InnerHtml = "<b>" + aDisplayName + "</b>"
							aTR.Cells.Add(aTD)
							'aTD = New HtmlTableCell()
							'aTD.InnerHtml = aRequiredText
							'aTR.Cells.Add(aTD)
							tabResults.Rows.Add(aTR)
						Case "SubmittedSummary"
							aTR = New HtmlTableRow()
							aTD = New HtmlTableCell()
							If SectionResult(aResultNodeList) <> -1 Then
								aImage = GetStatusImage(SectionResult(aResultNodeList))
								aTD.Controls.Add(aImage)
							End If
							aTR.Cells.Add(aTD)
							aTD = New HtmlTableCell()
							aTD.Controls.Add(aSectionHeader)

							aTR.Cells.Add(aTD)
							tabResults.Rows.Add(aTR)
							If cXMLDoc.AttributeToString(aValidationSectionNode, "ShowDetail") = "True" Then
								WriteSectionDetail(aResultNodeList)
							End If
					End Select
				End If
			Next
		End Sub

		'-------------------------------------------------------------

		Protected Sub WriteSectionDetail(ByVal aResultNodeList As XmlNodeList)
			Dim aResultNode As XmlNode
			Dim aTR As HtmlTableRow
			Dim aTD As HtmlTableCell
			Dim aImage As HtmlControl
			Dim aResultCode As Integer
			Dim aNoRows As Boolean = True

			For Each aResultNode In aResultNodeList
				aResultCode = cXMLDoc.AttributeToString(aResultNode, "ResultCode")
				If cXMLDoc.AttributeToBool(aResultNode, "ActualResult") And aResultCode <> 0 Then
					aTR = New HtmlTableRow()
					aTD = New HtmlTableCell()
					aTD.VAlign = "top"
					aImage = GetStatusImage(aResultCode)
					aTD.Controls.Add(aImage)
					aTR.Cells.Add(aTD)
					aTD = New HtmlTableCell()
					aTD.InnerText = cXMLDoc.AttributeToString(aResultNode, "Message")
					aTR.Cells.Add(aTD)
					tabResults.Rows.Add(aTR)
					aNoRows = False
				End If
			Next
			If aNoRows Then
				'aTR = New HtmlTableRow()
				'aTD = New HtmlTableCell()
				'aTD.ColSpan = 2
				'aTD.InnerHtml = "<b>This item has been successfully validated.</b>"
				'aTR.Cells.Add(aTD)
				'tabResults.Rows.Add(aTR)
				aResultCode = 1
				aTR = New HtmlTableRow()
				aTD = New HtmlTableCell()
				aTD.VAlign = "top"
				aImage = GetStatusImage(aResultCode)
				aTD.Controls.Add(aImage)
				aTR.Cells.Add(aTD)
				aTD = New HtmlTableCell()
                aTD.InnerHtml = "<b>This item has been validated.</b>"
				aTR.Cells.Add(aTD)
				tabResults.Rows.Add(aTR)

			End If

		End Sub
		'-------------------------------------------------------------

		Protected Sub WriteValidationHeader(ByVal aValidationHeaderNode As XmlNode)
			Dim aTR As HtmlTableRow
			Dim aTD As HtmlTableCell
			Dim aHeaderName As String

			'aTR = New HtmlTableRow()
			'aTD = New HtmlTableCell()
			'aTD.InnerHtml = "&nbsp;"
			'aTR.Cells.Add(aTD)
			'tabHeader.Rows.Add(aTR)

			aTR = New HtmlTableRow()
			aTD = New HtmlTableCell()
			aHeaderName = cXMLDoc.AttributeToString(aValidationHeaderNode, "HeaderText")
			aTD.InnerHtml = "<td class='SeparatorHdg'>" + aHeaderName + "</td>"
			aTD.ColSpan = 0
			aTR.Cells.Add(aTD)
			tabHeader.Rows.Add(aTR)

		End Sub

		'-------------------------------------------------------------

		Protected Function SectionResult(ByVal aResultNodeList As XmlNodeList) As Integer
			Dim aResultNode As XmlNode
			'Dim aTR As HtmlTableRow
			'Dim aTD As HtmlTableCell
			'Dim aImage As HtmlControl
			Dim aResult As Integer
			Dim aSectionResult As Integer = 0

			For Each aResultNode In aResultNodeList
				If cXMLDoc.AttributeToBool(aResultNode, "ActualResult") Then
					aResult = cXMLDoc.AttributeToString(aResultNode, "ResultCode")
					If aResult > aSectionResult Then aSectionResult = aResult
				End If
			Next
			'If validation returns no results or a result of 0, return 1 (OK)
			If aSectionResult = 0 Then
				Return 1
			Else
				Return aSectionResult
			End If
		End Function

		'-------------------------------------------------------------

		Private Function GetStatusImage(ByVal aStatusID As String) As HtmlControl
			Dim aImage As HtmlImage = New HtmlImage()
			Dim aImagePath As String = WebSession.WebAppl.Build_RootURL("Core/images/")
			Dim aImageFileName As String

			Select Case aStatusID
				Case "1"			 'Valid
					aImageFileName = "Check.gif"
				Case "2"			 'Valid with warning
					aImageFileName = "Warning.gif"
				Case "3"			 'Invalid
					aImageFileName = "x.gif"
			End Select
			aImage.Src = aImagePath + aImageFileName
			GetStatusImage = CType(aImage, HtmlControl)
		End Function


		'-------------------------------------------------------------

		Private Sub SectionLink_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
			Dim aLink As cLink = Me.GetCoreControlFromEventSource(aSrc)
			Dim aModuleKey As String = aLink.Get_Attribute("ModuleKey")
			Dim aPageKey As String = aLink.Get_Attribute("PageKey")
			Dim aModuleConfig As String

			If aModuleKey = "" Then
				'redirect to a page within the same module
				EventController_NavigateToModulePageKey(aPageKey)
			Else
				aModuleConfig = aLink.Get_Attribute("ModuleConfig")
				CType(WebSession, cEGSession).RedirectToModule(aModuleKey, aModuleConfig, aPageKey)
			End If
		End Sub


		'-------------------------------------------------------------

		Protected Function GetSectionHeader(ByVal aValidationSectionNode As XmlNode) As Control
			Dim aSectionKey As String
			Dim aCreateLink As Boolean = True
			Dim aLink As cLink
			Dim aLinkCtlFilePath As String
			Dim aModuleKey As String
			Dim aModuleConfig As String
			Dim aPageKey As String
			Dim aNavKey As String
			Dim aDisplayName As String
			Dim aCaption As String

			aModuleKey = cXMLDoc.AttributeToString(aValidationSectionNode, "ModuleKey")
			aModuleConfig = cXMLDoc.AttributeToString(aValidationSectionNode, "ModuleConfig")
			aPageKey = cXMLDoc.AttributeToString(aValidationSectionNode, "PageKey")
            aNavKey = cXMLDoc.AttributeToString(aValidationSectionNode, "NavKey")
			aSectionKey = cXMLDoc.AttributeToString(aValidationSectionNode, "Key")

            If aNavKey <> "" And aPageKey = "" Then
				Dim aNavElement As XmlElement = CType(Page, cModulePage).ModuleConfigDoc.DocElement.SelectSingleNode("Module/Navigation/NavElement[@Key='" + aNavKey + "']")
				Dim aSourceFile As String = cXMLDoc.AttributeToString(aNavElement, "SourceFile")
				aPageKey = aSourceFile.Substring(aSourceFile.IndexOf("Page=") + 5)
            End If
            
			'Determine which type of control needs to be returned - a link or a simple literal control
			If aPageKey = "" Then aCreateLink = False
			If DisplayFormat = "SubmittedSummary" Then aCreateLink = False
			If WfDataObject.GetPropertyInt("WfTaskStatusID") = 4 And aCreateLink = True Then
				aCreateLink = False
				Dim aXMLDoc As cXMLDoc = New cXMLDoc()
				aXMLDoc.LoadFromXML("<DocElement></DocElement>")
				Dim aFiltersNode As XmlNode = aXMLDoc.XMLDocument.CreateNode(XmlNodeType.Element, "Filters", "")
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "SectionKey", aSectionKey))
				'If the status is 4 and there are no reopened section items, the task assignment has been reopened in full, and all items should 
				'render as links.
				If ReopenedSections.Count = 0 Then
					aCreateLink = True
				Else
					Dim aReopenedSectionKey As String
					For Each aReopenedSectionKey In ReopenedSections
						If aReopenedSectionKey = aSectionKey Then
							aCreateLink = True
							Exit For
						End If
					Next
				End If
			End If
			aDisplayName = cXMLDoc.AttributeToString(aValidationSectionNode, "DisplayName")
			If aDisplayName = "" Then
				aDisplayName = cXMLDoc.AttributeToString(aValidationSectionNode, "Key")
			End If
			Select Case DisplayFormat
				Case "Detail"
					aCaption = "<b>" + aDisplayName + "</b> " '(" + aDetailedRequiredText + ")"
				Case "Summary"
					aCaption = aDisplayName
				Case "SubmittedSummary"
					aCaption = "<b>" + aDisplayName + "</b>"
			End Select
			If aCreateLink Then
				aLinkCtlFilePath = WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cLink']").Attributes("ControlFile").Value
				aLink = CType(LoadControl(aLinkCtlFilePath), cLink)
				'aLink.Caption = "<b>" + aDisplayName + "</b>"
				'aLink.Caption = aDisplayName
				aLink.Add_Attribute("ModuleKey", aModuleKey)
				aLink.Add_Attribute("ModuleConfig", aModuleConfig)
				aLink.Add_Attribute("PageKey", aPageKey)
				aLink.Set_ServerClick(AddressOf SectionLink_Click)
				aLink.DisplayPropertyNode = aValidationSectionNode
				aLink.Caption = aCaption
				Return aLink
			Else
				Dim aSpan As HtmlGenericControl = New HtmlGenericControl()
				aSpan.InnerHtml = aCaption
				Return aSpan
			End If
		End Function

		'=============================================================
End Class

End Namespace
