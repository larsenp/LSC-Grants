Imports System.Diagnostics
Imports System.Web.UI.WebControls
Imports System.Xml
Imports Core.Web
Imports Core.Web.Modules

Namespace Core_Web.Controls.Base

Public MustInherit Class cPrintableViewLink1
    Inherits Core.Web.cCoreCtl
'=============================================================

    Protected ancPrintableViewLink As HtmlAnchor
    
    protected mAutoHideInPrintMode as Boolean = True
    protected mImageName as String = ""
    protected mCaption as String = ""

'--------------------------------------------------------------

	public Property AutoHideInPrintMode as Boolean
		Get
			return mAutoHideInPrintMode
		End Get		
		Set
			mAutoHideInPrintMode = value
		End Set		
	End Property	

'--------------------------------------------------------------

	public Property ImageName as String
		Get
			return mImageName
		End Get		
		Set
			mCaption = value
			mImageName = mCaption.Replace(" ", "_") + ".jpg"
		End Set		
	End Property	

'--------------------------------------------------------------

	public Property Caption as String
		Get
			return mCaption
		End Get		
		Set
			mCaption = value
                'mImageName = ""
		End Set		
	End Property	

'=============================================================

	Public Sub Set_Visible_InPrintMode()
		if not AutoHideInPrintMode then return
		
		Dim	aPageFrame as String
		
		aPageFrame = CType(CorePage, cModulePage).PageFrameKey
		if aPageFrame = "Print" then Visible = False
	End Sub	

'--------------------------------------------------------------

	Public Sub Set_Link()
		Dim aNewURL as String
		Dim aInnerHtml as String
		
		aNewURL = cWebLib.AddQuerystringParameter(me.Request.Url.PathAndQuery, "PageFrame", "Print")
		ancPrintableViewLink.HRef = aNewURL
		ancPrintableViewLink.Target = "_blank"
		
		if not ImageName = "" then
			aInnerHtml = "<img src='" + _
							CorePage.WebAppl.Build_RootURL(ImageName) + "' " + _
							"alt='" + Caption + "' " + _
							"border='0'" + _
							"/>"
			ancPrintableViewLink.InnerHtml = aInnerHtml
		else if not Caption = "" then
			aInnerHtml = Caption
			ancPrintableViewLink.InnerHtml = aInnerHtml
		End If		
	End Sub	

'--------------------------------------------------------------

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		Set_Visible_InPrintMode
		if not Visible then return
		
		Set_Link()
	End Sub

'==============================================================

End Class

End Namespace