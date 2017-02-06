Imports System.Xml
Imports Core.DataAccess
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.GAR.ActualStaffing.Controls.Page
	Public Class cStaffMemberEditor
        'Inherits Core_Web.Controls.Base.cDataPresenterCtl
        Inherits Easygrants_Web.Controls.Base.cWfTADataPresenterCtl

		Public ReadOnly Property LscStaffDetailID() As String
			Get
				If Request.QueryString("LscStaffDetailID") <> "0" Then
					Return Request.QueryString("LscStaffDetailID")
				Else
					Dim aPageKey As String = Request.QueryString("Page")
					Dim aControlEl As XmlElement = Me.mXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='Base']/DisplayProperties/DisplayProperty/Control[@ID='ctlStaffMemberEditor']")
					Dim aEditor As cDataPresenterCtl = GetControl(aControlEl)
					Dim aStaffList As cDataObjectList = aEditor.DataObjectCollection("LscStaffDetail")
					Dim aStaffDO As cDataObject = aStaffList(0)
					Return aStaffDO.GetPropertyString("LscStaffDetailID")
				End If
			End Get
		End Property

	End Class
End Namespace
