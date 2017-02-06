Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Controls.PageSection
Public Class cProjectKeywords
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'=============================================================
        
        Protected mSvButton As String
        Protected trSaveAndCancel As HtmlTableRow

'=============================================================

        Public Property SvButton() As String
            Get
                Return mSvButton
            End Get
            Set(ByVal Value As String)
                mSvButton = Value
            End Set
        End Property

'=============================================================

        Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            MyBase.CoreCtl_Load(aSrc, aEvent)

            If SvButton = "NoShow" Then
                trSaveAndCancel.Visible = False
            End If
        End Sub

'=============================================================
	
    Public Function ValidateOther(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs) As Boolean
	    Dim ctlArea As cDropDown
        ctlArea = CType(FindControl("ctlArea"), cDropDown)
	    Dim ctlAreaOther As cTextBox
        ctlAreaOther = CType(FindControl("ctlAreaOther"), cTextBox)
        
        If ctlArea.SelectedText = "Other" And ctlAreaOther.Value.Trim = "" Then
			Return False
		Else
			Return True
		End If        
   End Function

'============================================================= 

End Class 'cProjectKeywords
End Namespace