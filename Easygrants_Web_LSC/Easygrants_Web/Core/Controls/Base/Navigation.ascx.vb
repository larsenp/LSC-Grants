Imports Core.Util
Imports Core.Web
Imports Core.Web.Navigation

Namespace Core_Web.Controls.Base

Public MustInherit Class cNavigationCtl
	Inherits Core.Web.cCoreCtl
'=============================================================

#Region " Web Form Designer Generated Code "

	'This call is required by the Web Form Designer.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

	End Sub

	Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
		'CODEGEN: This method call is required by the Web Form Designer
		'Do not modify it using the code editor.
		InitializeComponent()
	End Sub

#End Region
	Protected tblNavMain As HtmlTable

	Private mMasterNavElement As cNavElement
	Private mParentNavElementKey As String
    Private mAlwaysExpanded As Boolean = False

    'needed because of recursion
    Private mHelpURL As String

'-------------------------------------------------------------

	Public Property MasterNavElement() As cNavElement
		Get
			MasterNavElement = mMasterNavElement
		End Get
		Set(ByVal Value As cNavElement)
			mMasterNavElement = Value
		End Set
	End Property

'-------------------------------------------------------------

	Public Property ParentNavElementKey() As String
		Get
			ParentNavElementKey = mParentNavElementKey
		End Get
		Set(ByVal Value As String)
			mParentNavElementKey = Value
		End Set
	End Property

'-------------------------------------------------------------

	Public Property AlwaysExpanded() As Boolean
		Get
			AlwaysExpanded = mAlwaysExpanded
		End Get
		Set(ByVal Value As Boolean)
			mAlwaysExpanded = Value
		End Set
	End Property

'=============================================================

        Public Overridable Sub NavControl_Load_NavTable(ByVal aNavElement As cNavElement, ByVal aLevel As Integer)
            Dim aRowNum As Integer
            Dim aTblRow As HtmlTableRow
            Dim aTblCell As HtmlTableCell
            Dim aStr As String
            Dim i As Integer = 1


            If (Not aNavElement.Visible) Or aNavElement.Horizontal Then Exit Sub

            If aNavElement.Key <> "" And aNavElement.Key <> ParentNavElementKey Then
                If aNavElement.Horizontal = False Then
                    aTblRow = New HtmlTableRow()
                    aTblRow.Align = "Left"

                    aStr = ""
                    While i < aLevel
                        aStr += "&nbsp;&nbsp;"
                        i += 1
                    End While

                    'CorePage.Working_Navigation_Page_Key
                    If aNavElement.Key = CorePage.PageNavKey() AndAlso Not (aNavElement.IsActiveOnSelect Or aNavElement.Parent.IsActiveOnSelect) Then
                        aTblCell = cWebLib.Add_TableCell(aTblRow, aStr + aNavElement.NavTitle)
                        aTblCell.Attributes.Add("class", "NavigationSel")
                        mHelpURL = aNavElement.HelpFile
                    ElseIf aNavElement.Enabled = False Then
                        aTblCell = cWebLib.Add_TableCell(aTblRow, aStr + aNavElement.NavTitle)
                        aTblCell.Attributes.Add("class", "NavigationDisabled")
                    ElseIf aNavElement.Key = "Help" Then
                        Dim aAnchor As HtmlAnchor = New HtmlAnchor()
                        aTblCell = New HtmlTableCell()

                        Dim aLiteral As HtmlGenericControl = New HtmlGenericControl()
                        aLiteral.InnerHtml = aStr
                        aTblCell.Controls.Add(aLiteral)
                        aAnchor.Target = "_blank"
                        aAnchor.Attributes.Add("SourceFile", aNavElement.SourceFile)
                        aAnchor.InnerHtml = aNavElement.NavTitle
                        If aNavElement.External = True Then
                            aAnchor.HRef = mHelpURL
                        Else
                            aAnchor.Href = WebAppl.Build_RootURL(mHelpURL)
                        End If

                        aTblCell.Controls.Add(aAnchor)
	
                        aTblCell.Attributes.Add("class", "NavigationStd")

                        aTblRow.Cells.Add(aTblCell)
                    Else
                        Dim aAnchor As HtmlAnchor = New HtmlAnchor()
                        aTblCell = New HtmlTableCell()

                        Dim aLiteral As HtmlGenericControl = New HtmlGenericControl()
                        aLiteral.InnerHtml = aStr
                        aTblCell.Controls.Add(aLiteral)

                        If aNavElement.Target <> "" Then
                            aAnchor.Target = aNavElement.Target
                        End If

                        aAnchor.Attributes.Add("SourceFile", aNavElement.SourceFile)
                        aAnchor.InnerHtml = aNavElement.NavTitle

                        If aNavElement.NavTitle <> "&nbsp;" Then
                            If aNavElement.External = True Then
                                aAnchor.HRef = aNavElement.SourceFile
                            Else
                                aAnchor.Href = WebAppl.Build_RootURL(aNavElement.SourceFile)
                            End If
                        End If

                        aTblCell.Controls.Add(aAnchor)

						If aNavElement.Key = CorePage.PageNavKey() Then
							If aNavElement.IsActiveOnSelect Or aNavElement.Parent.IsActiveOnSelect Then
								aTblCell.Attributes.Add("class", "NavigationSel")
								mHelpURL = aNavElement.HelpFile
							End If
						Else
							aTblCell.Attributes.Add("class", "NavigationStd")
						End If
                        aTblRow.Cells.Add(aTblCell)

                    End If
                    aTblCell.Width = 147
                    tblNavMain.Rows.Add(aTblRow)
                End If
            End If
            If aNavElement.Expanded Or AlwaysExpanded Then
                For aRowNum = 0 To aNavElement.ChildElement_Count - 1
                    NavControl_Load_NavTable(aNavElement.NavElement(aRowNum), aLevel + 1)
                Next
            End If
        End Sub

        '-------------------------------------------------------------

        Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aArgs As EventArgs)
            MyBase.CoreCtl_Load(aSrc, aArgs)

            Dim aNavElement As cNavElement = MasterNavElement
            If aNavElement Is Nothing Then Exit Sub

            If ParentNavElementKey <> "" Then
                aNavElement = aNavElement.Find_ChildElement(ParentNavElementKey)
            End If

            NavControl_Load_NavTable(aNavElement, 0)
        End Sub

        '=============================================================
End Class

End Namespace 'Core_Web.Controls.Base

