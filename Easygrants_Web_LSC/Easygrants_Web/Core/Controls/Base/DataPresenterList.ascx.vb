Imports System.Xml
Imports Core.Web.Modules
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base

Namespace Core_Web.Controls.Base
Public MustInherit Class cDataPresenterList
	Inherits Core.Web.cEventController
'=============================================================
	Protected tResults As HtmlTable
	
	Protected mDataPresenterCollection as Hashtable = new Hashtable
'=============================================================

	Public ReadOnly Property DataPresenterCollection as Hashtable
		Get
			Return mDataPresenterCollection
		End Get
	End Property
	
'=============================================================
	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)

		MyBase.CoreCtl_Load(sender, e)

	End Sub

'-------------------------------------------------------------

    Public Overrides Sub CoreCtl_Configure(ByVal aDisplayControlNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
		Dim aDataObject as cDataObject
		Dim aDataPresenterURL as String
		Dim aDataPresenterID as String
		Dim aControlNode as XmlNode
		Dim aCtlID As String
		Dim aTR As HtmlTableRow
		Dim aTD As HtmlTableCell
		Dim aIndex as Integer = 0
		Dim aDataPresenter as cDataPresenterCtl
		
		aControlNode = aDisplayControlNode.SelectSingleNode("Control")
		aDataPresenterURL = WebAppl.Build_RootURL(cXMLDoc.AttributeToString(aControlNode, "DataPresenterURL"))
		aDataPresenterID = cXMLDoc.AttributeToString(aDisplayControlNode, "DataPresenterID")
		For Each aDataObject in aDataObjectList
			aTR = new HtmlTableRow
			tResults.Rows.Add(aTR)
			aTD = new HtmlTableCell
			aTR.Cells.Add(aTD)
			aCtlID = "ctl_" + aIndex.ToString
			aDataPresenter = CType(CType(Page, cModulePage).CorePage_LoadControl(aDataPresenterURL, aCtlID, aTD), cDataPresenterCtl)
			aDataPresenter.Index = aIndex
			aDataPresenter.DataPresenterList = Me
			mDataPresenterCollection.Add(aIndex, aDataPresenter)
			aIndex += 1
		Next
		
	 End Sub

'-------------------------------------------------------------

	Public Function DataPresenterList_GetData(aDataObjectKey as String) as cDataObjectList
		Dim aParent as cDataPresenterCtl
		Dim aDataObjectList as cDataObjectList

		aParent = CType(me.EventController, cDataPresenterCtl)
		Return CType(aParent.DataObjectCollection(aDataObjectKey), cDataObjectList)
	End Function
	
'-------------------------------------------------------------

    Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
		Dim aIndex as Object
		Dim aDataPresenter as cDataPresenterCtl
		
		For Each aIndex in mDataPresenterCollection.Keys
			aDataPresenter = CType(mDataPresenterCollection(aIndex), cDataPresenterCtl)
			aDataPresenter.DataPresenter_SaveDataObjects()
		Next
    End Sub
    
'=============================================================
End Class
End Namespace