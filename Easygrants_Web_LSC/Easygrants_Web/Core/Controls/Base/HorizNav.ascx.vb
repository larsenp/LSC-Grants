Imports Core.Util
Imports Core.Web
Imports Core.Web.Navigation
Imports Core.Web.Modules
imports System.Xml
imports System.Reflection
imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base

Public MustInherit Class cHorizNavCtl
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
	Protected tblHorizNavMain As HtmlTable

	Private mMasterNavElement As cNavElement
	Private mNavKey As String
    Private mParentNavElementKey As String
    Private mAlwaysExpanded As Boolean = False
    Private mNavStandard As String = ""
    Private mNavSelected As String = ""
    Private mNavBorder As String = ""
    Private mNavDisiabled As String = ""
    Private mSeperator As String = "&nbsp;"
	private mActionNode as XmlNode
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

	Public Property NavKey() As String
		Get
			NavKey = mNavKey
		End Get
		Set(ByVal Value As String)
			mNavKey = Value
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
	
'-------------------------------------------------------------

	Public Property NavDisiabled() As String
		Get
			NavDisiabled = mNavDisiabled
		End Get
		Set(ByVal Value As String)
			mNavDisiabled = Value
		End Set
	End Property
	
'-------------------------------------------------------------

	Public Property NavSelected() As String
		Get
			NavSelected = mNavSelected
		End Get
		Set(ByVal Value As String)
			mNavSelected= Value
		End Set
	End Property
	
'-------------------------------------------------------------

	Public Property NavBorder() As String
		Get
			NavBorder = mNavBorder
		End Get
		Set(ByVal Value As String)
			mNavBorder= Value
		End Set
	End Property
	
'-------------------------------------------------------------

	Public Property NavStandard() As String
		Get
			NavStandard = mNavStandard
		End Get
		Set(ByVal Value As String)
			mNavStandard = Value
		End Set
	End Property
	
'-------------------------------------------------------------

	Public Property Seperator() As String
		Get
			Seperator = mSeperator
		End Get
		Set(ByVal Value As String)
			mSeperator = Value
		End Set
	End Property

'=============================================================

	Private Sub NavControl_Load_NavTable(ByVal aNavElement As cNavElement, ByVal aLevel As Integer, ByVal aTblRow as HtmlTableRow)
		Dim aTblCell As HtmlTableCell
		If Not aNavElement.Visible Then Exit Sub

		If aNavElement.Key <> "" Then
            'If aNavElement.Horizontal = True then
			    'CorePage.Working_Navigation_Page_Key
			    If aNavElement.Enabled = False Then
				    aTblCell = cWebLib.Add_TableCell(aTblRow, aNavElement.NavTitle + Seperator) '+ "(" + aNavElement.Key.ToString() + ")")
				    aTblCell.Attributes.Add("class", NavDisiabled)
				ElseIf aNavElement.Key = CType(CorePage, cModulePage).PageKey Then
					aTblCell = cWebLib.Add_TableCell(aTblRow, aNavElement.NavTitle + Seperator) '+ "(" + aNavElement.Key.ToString() + ")")
					aTblCell.Attributes.Add("class", NavSelected)
					cWebLib.Add_TableCell(aTblRow, Seperator)
			    ElseIf aNavElement.Key = "Help" Then
				    Dim aAnchor As HtmlAnchor = New HtmlAnchor()
				    aTblCell = New HtmlTableCell()
				    aTblCell.NoWrap = True
				    aTblCell.Width = "*"

				    'Dim aLiteral As HtmlGenericControl = New HtmlGenericControl()
				    'aLiteral.InnerHtml = ""
				    'aTblCell.Controls.Add(aLiteral)
				    aAnchor.Target = "_blank"
				    aAnchor.Attributes.Add("SourceFile", aNavElement.SourceFile)
				    aAnchor.InnerHtml = aNavElement.NavTitle + Seperator '+ "(" + aNavElement.Key.ToString() + ")"
                    If aNavElement.External = True Then
                        aAnchor.HRef = mHelpURL
                    Else
                        aAnchor.Href = WebAppl.Build_RootURL(mHelpURL)
                    End If

                    aTblCell.Controls.Add(aAnchor)

                    aTblCell.Attributes.Add("class", NavStandard)

                    aTblRow.Cells.Add(aTblCell)
			    Else
				    Dim aAnchor As HtmlAnchor = New HtmlAnchor()
				    aTblCell = New HtmlTableCell()

                    
			        ''Add space image
				    'Dim aLiteralSpacer As HtmlGenericControl 
			     '   aLiteralSpacer = New HtmlGenericControl()
			     '   aLiteralSpacer.InnerHtml = "<a href='images/spacer.gif' width='1' height='12' name='key_" & aNavElement.Key & "' border= '10'></a>"
			     '   aTblCell.Controls.Add(aLiteralSpacer)

				    'Dim aLiteral As HtmlGenericControl = New HtmlGenericControl()
				    'aLiteral.InnerHtml = ""
				    'aTblCell.Controls.Add(aLiteral)

				    If aNavElement.Target <> "" Then
					    aAnchor.Target = aNavElement.Target
				    End If

				    aAnchor.Attributes.Add("SourceFile", aNavElement.SourceFile)
				    aAnchor.InnerHtml = aNavElement.NavTitle '+ "(" + aNavElement.Key.ToString() + ")"
                    
                    'If aNavElement.Key = CorePage.PageNavKey() Then
				    'If aNavElement.Key = CorePage.PageHorizNavKey Then
				    '    aAnchor.Attributes.Add("class", NavSelected)
        '            Else
				    '    aAnchor.Attributes.Add("class", NavStandard)
        '            End If
                    
     

				    If aNavElement.NavTitle <> "&nbsp;" Then
					    If aNavElement.External = True Then
						    aAnchor.HRef = aNavElement.SourceFile
					    Else
						    aAnchor.Href = WebAppl.Build_RootURL(aNavElement.SourceFile)
						    If Not aNavElement.ArgumentsNode Is Nothing Then
								Dim aArgumentNode As XmlNode
								Dim aQryParamKey As String
								for each aArgumentNode in aNavElement.ArgumentsNode.ChildNodes
									aQryParamKey = cXMLDoc.AttributeToString(aArgumentNode, "PropertyKey", "")
									If cXMLDoc.AttributeToString(aArgumentNode, "Type", "") = "QueryString" AndAlso Not Request.QueryString.Get(aQryParamKey) = "" Then
											aAnchor.HRef = cWebLib.AddQuerystringParameter(aAnchor.HRef, aQryParamKey, Request.QueryString.Get(aQryParamKey), Server)
									Else If cXMLDoc.AttributeToString(aArgumentNode, "Type", "") = "Data" AndAlso Not aQryParamKey = "" Then
										aAnchor.HRef = cWebLib.AddQuerystringParameter(aAnchor.HRef, aQryParamKey, Server)
									End If
								Next
							End If
					    End If
				    End If

                    'Build menu if child elements exist
		            'If aNavElement.HasChildElements Then
		            '	aAnchor.Attributes.Add("onMouseOver", "MM_showMenu(window." & aNavElement.Key & " ,-1,32,null,'key_" & aNavElement.Key & "');")
		            '	aAnchor.Attributes.Add("onMouseOut", "MM_startTimeout();")
		            'End If
		            if not aNavElement.ActionNode is nothing then
						mActionNode = aNavElement.ActionNode
						AddHandler aAnchor.ServerClick, AddressOf NavClicked
					end if
				    aTblCell.Controls.Add(aAnchor)
                    mHelpURL = aNavElement.HelpFile
            '        If aNavElement.Key = CorePage.PageNavKey() Then
				        'aTblCell.Attributes.Add("class", NavSelected)
            '        Else
				        aTblCell.Attributes.Add("class", NavStandard)
                    'End If

				    aTblRow.Cells.Add(aTblCell)
				    cWebLib.Add_TableCell(aTblRow, Seperator)
                End If
			'aTblCell.Width = 120
			'End If
		End If
	End Sub
	
'-------------------------------------------------------------

	public sub NavClicked(byval aSrc as Object, byval aArgs as EventArgs)
		dim aObj as Object = ctype(me.WebSession.CurrentPage, cModulePage).PageContentCtl
		dim aType as Type = aObj.GetType
		dim aMethod as MethodInfo = aType.GetMethod(cXMLDoc.AttributeToString(mActionNode, "Method"))
		dim aURL as String() = {ctype(aSrc, HtmlAnchor).HRef}
		''dim aServer as HttpServerUtility
		'Dim TestString As String = "This is a <Test String>."
		'Dim writer As New StringWriter
		'Server.UrlEncode(TestString, writer)
		'Dim EncodedString As String = writer.ToString()
		
		try
			aMethod.Invoke(aObj, aURL)
		catch
			me.Response.Redirect(aURL(0))
		end try
	end sub
	
'-------------------------------------------------------------

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aArgs)
		dim aNode as XmlNode = ctype(Application("gHorizNav_" + NavKey), XmlNode).SelectSingleNode("TabControl")
		NavStandard = cXMLDoc.AttributeToString(aNode, "NavStandard")
		NavSelected = cXMLDoc.AttributeToString(aNode, "NavSelected")
		NavBorder = cXMLDoc.AttributeToString(aNode, "NavBorder")
		If MasterNavElement Is Nothing Then
			MasterNavElement = new cXMLNavElement(true)
		End If	
		CType(MasterNavElement, cXMLNavElement).XMLNavElement_Load(aNode)
		MasterNavElement.Horizontal = True
		Dim aNavElement As cNavElement = MasterNavElement
		If aNavElement Is Nothing Then Exit Sub

		If ParentNavElementKey <> "" Then
			aNavElement = aNavElement.Find_ChildElement(ParentNavElementKey)
		End If

		Dim aTblRow As HtmlTableRow
        aTblRow = New HtmlTableRow()
		Dim aRowNum As Integer
		For aRowNum = 0 To aNavElement.ChildElement_Count - 1
			NavControl_Load_NavTable(aNavElement.NavElement(aRowNum), 1, aTblRow)
		Next
		aTblRow.Cells.RemoveAt(aTblRow.Cells.Count - 1)
        tblHorizNavMain.Rows.Add(aTblRow)
        tblHorizNavMain.Attributes.Add("class", NavBorder)
	End Sub

'=============================================================
End Class

End Namespace 'Core_Web.Controls.Base

