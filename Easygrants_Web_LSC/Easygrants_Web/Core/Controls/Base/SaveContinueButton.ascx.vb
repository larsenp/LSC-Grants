Imports System.Web.UI.WebControls
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core.Web.Modules
Imports Core.Web.Navigation

Namespace Core_Web.Controls.Base

Public MustInherit Class cSaveContinueButton
    Inherits Core_Web.Controls.Base.cImageButton

        Private mSave As Boolean = True
'=============================================================

        Public Property Save() As Boolean
            Get
                Save = mSave
            End Get
            Set(ByVal Value As Boolean)
                mSave = Value
            End Set
        End Property


        Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
            MyBase.CoreCtl_Configure(aDisplayPropertyNode, aDataObjectList)
            If Not Visible Then Exit Sub
            Dim aCaption As String
            Dim aControlNode As XmlNode = aDisplayPropertyNode.SelectSingleNode("Control")
            aCaption = cXMLDoc.AttributeToString(aControlNode, "Image")
            Save = cXMLDoc.AttributeToBool(aControlNode, "Save", True)
            If aCaption = "" Then
                aCaption = "Save_and_Continue"
            End If
            Caption = aCaption
			RemoveHandler ancButton.Click, AddressOf EventController.EventController_ControlClicked
			ancButton.Attributes.Remove("onclick")
            Set_ServerClick(AddressOf GoToNextNav)
        End Sub

        '--------------------------------------------------------------

         Public Sub GoToNextNav(ByVal aSrc As Object, ByVal aEvent As System.Web.UI.ImageClickEventArgs)
            Dim aContinue As Boolean
            If Save Then
                aContinue = Me.EventController.EventController_Save()
            Else
                aContinue = True
            End If

            Dim aURL As String = Me.Request.RawUrl()
            Dim aModule As String = aURL.Substring(aURL.IndexOf("Modules/") + 8)
            aModule = aModule.Substring(0, aModule.IndexOf("/"))
            Dim aModuleConfig As String = aURL.Substring(aURL.IndexOf("Config=") + 7, aURL.IndexOf("&") - aURL.IndexOf("Config=") - 7)
            Dim aPageKey As String = aURL.Substring(aURL.IndexOf("Page=") + 5)

            If aPageKey.IndexOf("&") <> -1 Then
                aPageKey = aPageKey.Substring(0, aPageKey.IndexOf("&"))
            End If

            Dim aConfigDoc As cXMLDoc = New cXMLDoc(WebAppl.Build_RootFileSystemPath(WebAppl.Get_RelativeDefaultModuleRoot() + "/" + aModule + "/" + aModuleConfig))
            Dim aList As XmlNodeList = aConfigDoc.DocElement.SelectNodes("Module/Navigation/NavElement")
            Dim aNode As XmlNode
            Dim aNext As Boolean = False
            For Each aNode In aList
				If aNode.Attributes("NavTitle").Value <> "(" then
					If aNext = True And NavElement(cXMLDoc.AttributeToString(aNode, "Key")).Enabled Then Exit For
					If cXMLDoc.AttributeToString(aNode, "Key") = aPageKey Then aNext = True
				End If
            Next
            If (aContinue) Then
                Me.Response.Redirect(cWebLib.AddQuerystringParameter(aURL, "Page", cXMLDoc.AttributeToString(aNode, "Key")))
            End If
        End Sub

        '--------------------------------------------------------------

        Public Function NavElement(ByVal aKey As String) As cNavElement
            Return (CType(Page, cModulePage).ModuleUser).MasterNavElement.Find_ChildElement(aKey)
        End Function

        '==============================================================

End Class

End Namespace
