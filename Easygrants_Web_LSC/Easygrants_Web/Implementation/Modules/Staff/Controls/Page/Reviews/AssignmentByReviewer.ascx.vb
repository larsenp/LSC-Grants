Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public MustInherit Class cAssignmentByReviewer
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected spnCount As HtmlGenericControl

	Public Overrides Sub LoadConfigXML()
		mXMLDoc.LoadFromXML(spnConfigXML.InnerText)
        
		If Request.QueryString("ReviewerID") = "-1" Then
			Dim aNode As XmlNode = cXMLDoc.FindNode(mXMLDoc.DocElement.SelectSingleNode("DataObject/Filters"), "Argument", "TypeKey", "ReviewerID")
			mXMLDoc.DocElement.SelectSingleNode("DataObject/Filters").RemoveChild(aNode)
		End If
    End Sub

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)	
		
		Dim ctlEditAll As cLink
		ctlEditAll = CType(FindControl("ctlEditAll"), cLink)
		Dim ctlDeleteAll As cLink
		ctlDeleteAll = CType(FindControl("ctlDeleteAll"), cLink)
		If Request.QueryString("ReviewerID") = "-1" Then
			ctlEditAll.Visible = False
			ctlDeleteAll.Visible = False
		Else
			ctlDeleteAll.Add_Attribute("onclick", "return confirm('Are you sure you want to delete all assignments for this reviewer?');")
		End If
		
		Dim aDOL As cDataObjectList
		aDOL = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
		If aDOL.Count < 1 Then
			ctlEditAll.Visible = False
			ctlDeleteAll.Visible = False
		End If
		
		spnCount.InnerText = aDOL.Count
	End Sub

	Public Sub DeleteAll(ByVal aReviewerID As String, ByVal aReviewCycleStageID As String)
		Dim aReviewDO As cDataObject
		Dim aDO As cDataObject
		Dim aDOL As cDataObjectList
		aDOL = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)

		Try
			Me.BeginTrans
			
			For Each aDO In aDOL
				aReviewDO = aDO.GetRelatedPropertyDataObject("WfTaskAssignmentReview")
				If Not aReviewDO Is Nothing
					WebSession.DataObjectFactory.DeleteData(aReviewDO)
				End If			
			Next
			WebSession.DataObjectFactory.DeleteData(aDOL)
			
			Me.CommitTrans()
		Catch ex As Exception
			Me.RollbackTrans()
			Throw(ex)
			'Exit Sub
		End Try

		CorePage.Redirect()
	End Sub

End Class
End Namespace
