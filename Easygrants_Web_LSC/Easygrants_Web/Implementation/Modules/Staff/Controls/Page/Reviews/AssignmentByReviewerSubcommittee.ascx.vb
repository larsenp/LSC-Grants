Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public MustInherit Class cAssignmentByReviewerSubcommittee
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
	Protected tblCloseWindow as HtmlTable
	Protected spnCloseControl as HtmlGenericControl
	Protected spnCount as HtmlGenericControl

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)   
	    MyBase.CoreCtl_Load(sender, e)    
		tblCloseWindow.Visible = True

		If Not IsPostBack Then
			Dim aXmlDoc As cXMLDoc
			Dim aDataObjectNode As XmlNode
			Dim aFiltersNode As XmlNode 
			Dim aArgNode As XmlNode
			Dim aRPNode As XmlNode
			Dim aDOList As cDataObjectList
			Dim aDOList2 As cDataObjectList
			Dim aDO As cDataObject
			Dim aCount As Integer = 0

			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("ReviewCommitteeMember", aDataObjectNode, aFiltersNode)
			aArgNode = WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "ReviewCycleID", Request.QueryString("ReviewCycleID"))
			aRPNode = WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "ReviewCycleCommittee", aArgNode)
			aFiltersNode.AppendChild(aRPNode)
			aDOList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
			For Each aDO In aDOList
				aDOList2 = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", _
					"PersonID", aDO.GetPropertyInt("PersonID", 0), _
					"ReviewCommitteeID", aDO.GetPropertyInt("ReviewCommitteeID", 0), _
					"ReviewCycleStageID", Request.QueryString("ReviewCycleStageID"))
				aCount = aCount + aDOList2.Count
			Next		
			spnCount.InnerText = aCount
		End If
	End Sub	
   
	Public Sub CloseWindow()
		tblCloseWindow.Visible = True
		spnCloseControl.Visible = True
	End Sub	
	
End Class
End Namespace