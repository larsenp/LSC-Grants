Imports System.Diagnostics
Imports System.Xml
Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Web
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports Core.Web.Modules

Namespace Easygrants_Web.Controls.Base

Public MustInherit Class cNavigationListCtl
    Inherits EasyGrants.Web.cEGCtl

'=============================================================
    Protected tHeader As HtmlTable
    Protected trHeader As HtmlTableRow
    Protected trBlank As HtmlTableRow
    Protected tdHeader As HtmlTableCell
    Protected trInstructions As HtmlTableRow
    Protected tdInstructions As HtmlTableCell
    Protected tResults As HtmlTable
    Private mDisplayPropertyNode As XmlNode
    Private mModuleName As String
    Private mModuleConfig As String
    Private mModuleNode As XmlNode
    Protected tdBlank As HtmlTableCell

'=============================================================
    Public Overrides Property DisplayPropertyNode() As XmlNode
        Get
            Return mDisplayPropertyNode
        End Get
        Set(ByVal Value As XmlNode)
            mDisplayPropertyNode = Value
        End Set
    End Property
'----------------------------------------------------

    Public Property ModuleName() As String
        Get
            Return mModuleName
        End Get
        Set(ByVal Value As String)
            mModuleName = Value
        End Set
    End Property

'----------------------------------------------------

    Public Property ModuleConfig() As String
        Get
            Return mModuleConfig
        End Get
        Set(ByVal Value As String)
            mModuleConfig = Value
        End Set
    End Property

'----------------------------------------------------

    Public Property ModuleNode() As XmlNode
        Get
            Return mModuleNode
        End Get
        Set(ByVal Value As XmlNode)
            mModuleNode = Value
        End Set
    End Property

'--------------------------------------------------------------------------------

    Public Property HeaderHtml() As String
        Get
            Return tdHeader.InnerHtml
        End Get
        Set(ByVal Value As String)
            If Value <> "" Then
                trHeader.Visible = True
                tdHeader.InnerHtml = Value
            Else
                trHeader.Visible = False
            End If
        End Set
    End Property

'--------------------------------------------------------------------------------

    Public Property InstructionHtml() As String
        Get
            Return tdInstructions.InnerHtml
        End Get
        Set(ByVal Value As String)
            If Value <> "" Then
                trInstructions.Visible = True
                tdInstructions.InnerHtml = Value
                trBlank.Visible = True
                tdBlank.Visible = True
                tdBlank.InnerHtml = "&nbsp;"
            Else
                trInstructions.Visible = False
            End If
        End Set
    End Property

'=============================================================

    Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
        Dim aModuleDoc As cXMLDoc
        Dim aUser As cEGUser
        Dim aMainControlNode As XmlNode
        Dim aHeaderNode As XmlNode
        Dim aInstructionNode As XmlNode
        Dim aNavigationNodeList As XmlNodeList
        Dim aNavElementNode As XmlNode
        Dim aRolesNodeList As XmlNodeList
        Dim aRoleNode As XmlNode
        Dim aControlID As String
        Dim aBool As Boolean
        Dim aDataObject As cDataObject
        Dim aTR As HtmlTableRow
        Dim aTD As HtmlTableCell
        Dim aLink As cLink
        Dim aRepeatColumns As Integer
        Dim aCount As Integer



        'Set DisplayPropertyNode property
        DisplayPropertyNode = aDisplayPropertyNode

        If cXMLDoc.AttributeToString(DisplayPropertyNode, "PropertyKey") <> "" And _
                                aDataObjectList.Count = 0 Then
            Exit Sub
        End If

        aMainControlNode = cXMLDoc.GetControlNode(DisplayPropertyNode)

        aHeaderNode = aMainControlNode.SelectSingleNode("HeaderHtml")
        If Not aHeaderNode Is Nothing Then
            HeaderHtml = aHeaderNode.InnerXml
        End If
        aInstructionNode = aMainControlNode.SelectSingleNode("InstructionHtml")
        If Not aInstructionNode Is Nothing Then
            InstructionHtml = aInstructionNode.InnerXml
        End If

        ModuleName = cXMLDoc.AttributeToString(aMainControlNode, "Module")
        ModuleConfig = cXMLDoc.AttributeToString(aMainControlNode, "ModuleConfig")

        aUser = EGSession.EGUser_From_ModuleConfig(ModuleName, ModuleConfig, aModuleDoc)
        ModuleNode = aModuleDoc.DocElement.SelectSingleNode("Module")

        aNavigationNodeList = ModuleNode.SelectNodes("Navigation/NavElement")

        aRepeatColumns = cXMLDoc.AttributeToInt(aMainControlNode, "RepeatColumns")
        aCount = 0

        For Each aNavElementNode In aNavigationNodeList
            If IsReservedNavElementKey(aNavElementNode) = False Then
                'validate navigation items for person role
                aBool = True
                aRolesNodeList = aNavElementNode.SelectNodes("PersonRole")
                If aRolesNodeList.Count <> 0 Then
                    aBool = False 'assume that navigation item will fail person role valiation
                    For Each aRoleNode In aRolesNodeList

                        For Each aDataObject In aUser.PersonRoles
                            If aDataObject.GetPropertyInt("WfTaskRoleID") = cXMLDoc.AttributeToInt(aRoleNode, "Key") Then
                                aBool = True
                                Exit For
                            End If
                        Next
                    Next

                End If


                If aBool = True Then

                    If aCount = 0 Then
                        aTR = New HtmlTableRow()
                        tResults.Rows.Add(aTR)
                        aCount = aCount + 1
                    End If
                    If aRepeatColumns + 1 > aCount Then
                        aTD = New HtmlTableCell()
                        aTR.Cells.Add(aTD)
                        aCount = aCount + 1
                    End If
                    If aRepeatColumns + 1 = aCount Then
                        aCount = 0
                    End If

                    aControlID = "ctlLink"
                    aLink = CType(LoadControl(WebAppl.ConfigDoc.DocElement.SelectSingleNode("Controls/Control[@Key='cLink']").Attributes("ControlFile").Value), cLink)

                    aLink.EventController = Me.EventController
                    aTD.Controls.Add(aLink)
                    aLink.Caption = cXMLDoc.AttributeToString(aNavElementNode, "NavTitle")
                    aLink.Add_Attribute("PageKey", cXMLDoc.AttributeToString(aNavElementNode, "Key"))

                    aLink.Set_ServerClick(AddressOf aLink.EventController.EventController_ControlClicked)
                End If
            End If 'IsReservedNavElementKey = False
        Next
        'add blank row at the end
        aTR = New HtmlTableRow()
        tResults.Rows.Add(aTR)
        aTD = New HtmlTableCell()
        aTD.InnerHtml = "&nbsp;"
        aTR.Cells.Add(aTD)

    End Sub

'=============================================================

    Public Sub RedirectToModule_PageKey(ByVal aEventSource As Object)
        Dim aSrc As HtmlControl = CType(aEventSource, HtmlControl)
        Dim aPageName As String = cXMLDoc.AttributeToString(ModuleNode, "PageName")

        CType(CorePage, cModulePage).ModulePage_RedirectToModule(ModuleName, ModuleConfig, aPageName, aSrc.Attributes("PageKey"))

    End Sub

'=============================================================

    Protected Function IsReservedNavElementKey(ByVal aNavElementNode As XmlNode) As Boolean

         Select Case cXMLDoc.AttributeToString(aNavElementNode, "Key")
            Case "Staff", "Logout", "ReturnHome", "Help"
                IsReservedNavElementKey = True
            Case Else
                IsReservedNavElementKey = False
        End Select

        If cXMLDoc.AttributeToString(aNavElementNode, "NavTitle") = "(" Then
            IsReservedNavElementKey = True
        End If

    End Function

'=============================================================
End Class 'cNavigationListCtl
End Namespace 'Easygrants_Web.Controls.Base
