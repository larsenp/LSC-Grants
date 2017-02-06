Imports Core.Web
Imports Core.Web.Modules
Imports Core.Web.User
Imports Core.Web.Navigation.CrumbTrail
Imports System.Xml
Imports Core.DataAccess.XMLAccess

Namespace Implementation.Modules.Staff.Controls.Page.Contacts

Public MustInherit Class cAdvancedContactsEL
    Inherits Core_Web.Controls.Base.cFilterListDataPresenterCtl

'=============================================================

	Protected tbSearchParameters As HtmlTable
	Protected spnShow As HtmlGenericControl
	Protected spnShowLink As HtmlGenericControl
	Protected spnHide As HtmlGenericControl
	Protected spnHideLink As HtmlGenericControl
    Protected drpSearchType As DropDownList
    Protected spnPerContent As HtmlGenericControl
    Protected spnOrgContent As HtmlGenericControl
	Protected spnMoreTextPer As HtmlGenericControl
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Dim aNode As XmlNode
		Dim aChildNode As XmlNode
		Dim aNodeList As XmlNodeList
		Dim aXMLDoc As cXMLDoc = New cXMLDoc()
		Dim i As Integer = 0
		Dim aSearchType As String

		aSearchType = Request.QueryString("SearchType")

		If Not aSearchType Is Nothing Then
			If aSearchType <> "Both" Then
				aXMLDoc.LoadFromXML(spnConfigXML.InnerText)

				aNode = aXMLDoc.DocElement.SelectSingleNode("ResultLists/ResultList[@Key='" + aSearchType + "']")

				If Not aNode Is Nothing Then aXMLDoc.DocElement.SelectSingleNode("ResultLists").RemoveChild(aNode)

				aNode = aXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='Filter']")

				If Not aNode Is Nothing Then aNodeList = aNode.SelectNodes("DisplayProperties/DisplayProperty")

				For Each aNode In aNodeList
					aChildNode = aNode.SelectSingleNode("Control/FilterList[@List='" + aSearchType + "']")

					If Not aChildNode Is Nothing Then
						aXMLDoc.DocElement.SelectNodes("DataObject[@Key='Filter']/DisplayProperties/DisplayProperty").Item(i).SelectSingleNode("Control").RemoveChild(aChildNode)
					End If

					i = i + 1
				Next

				aNode = aXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='" + aSearchType + "']")

				If Not aNode Is Nothing Then aXMLDoc.DocElement.RemoveChild(aNode)

				spnConfigXML.InnerText = aXMLDoc.DocElement.OuterXml
			End If
		End If

        If Request.QueryString("Find") = "True" Then
            Select Case aSearchType
                Case Is = "Both"
                    spnPerContent.Visible = True
                    spnOrgContent.Visible = True
                    'spnMoreTextPer.Visible = True
                Case Is = "OrgList" ' For some reason this the value set is opposite to what it should be.
                    spnPerContent.Visible = True
                    'spnMoreTextPer.Visible = True
                    spnOrgContent.Visible = False
                Case Is = "PerList" ' For some reason this the value set is opposite to what it should be.
                    spnPerContent.Visible = False
                    'spnMoreTextPer.Visible = False
                    spnOrgContent.Visible = True
            End Select
        End If

        MyBase.CoreCtl_Load(sender, e)

        If Request.QueryString("Find") = "True" Then
            'btnShow = CType(FindControl("btnShow"), cButton)
            spnShow.Visible = False
            spnShowLink.Visible = False
            spnHide.Visible = True
            spnHideLink.Visible = True
            If Request.QueryString("ShowParams") <> "True" Then
                spnShow.Visible = True
                spnShowLink.Visible = True
                spnHide.Visible = False
                spnHideLink.Visible = False
                tbSearchParameters.Visible = False
            End If
        Else
            spnShow.Visible = False
            spnShowLink.Visible = False
            spnHide.Visible = True
            spnHideLink.Visible = True
		End If

		drpSearchType = Me.FindControl("drpSearchType")
		For Each aItem As ListItem In drpSearchType.Items
			aItem.Text = ConfigurableText(aItem.Text)
		Next

	End Sub

'=============================================================
	Public Sub AddContact_Click(ByVal aPageKey As String, ByVal aReturnURL As String)
		If aPageKey = "AddPerson" Then
			aReturnURL = cWebLib.AddQuerystringParameter(aReturnURL, "Page", "Contacts")
			EventController_NavigateToModulePageKey(aPageKey, aReturnURL, "PersonID=0")
		Else
			aReturnURL = cWebLib.AddQuerystringParameter(aReturnURL, "Page", "Contacts")
			EventController_NavigateToModulePageKey(aPageKey, aReturnURL, "OrganizationID=0")
		End If
	End Sub
'=============================================================

		Public Sub ShowSearchParameters()
			'tbSearchParameters.Visible = True
			Dim aURL As String = cWebLib.AddQuerystringParameter(Request.Url().ToString(), "ShowParams", "True")

			Response.Redirect(aURL)
		End Sub

'-------------------------------------------------------------------------

		Public Sub HideSearchParameters()
			Dim aURL As String = cWebLib.AddQuerystringParameter(Request.Url().ToString(), "ShowParams", "False")

			Response.Redirect(aURL)
		End Sub

'=============================================================

	Public Sub FilterDataPresenter_Find()
		mURL = Request.Url.ToString
		mURL = cWebLib.AddQuerystringParameter(mURL, "SearchType", drpSearchType.SelectedItem.Value)
		FilterListDataPresenter_Find()
	End Sub

'=============================================================

End Class 'cStageDetail
End Namespace 'Easygrants_Web.Modules.Staff.Controls.Page
