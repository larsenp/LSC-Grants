Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.Web.Modules
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports Core.Web
Imports Core.DataAccess.XMLAccess

Namespace Implementation.Modules.Application.Controls.Page
Public Class cKatzScienceClass
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'============================================================= 

	Protected ctlCategory As cDropDown
	protected ctlScience as cRadioButtonList
	Protected mReportOutputDefinitionID As Integer
	Protected mGranteeProjectDO As cDataObject
        Protected WithEvents spnHelp As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnCategory As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnScience As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnSave As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnSave_and_Continue As System.Web.UI.HtmlControls.HtmlGenericControl
        'Protected WithEvents spnConfigXML As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected mFormattedReportXMLDoc As cXMLDoc
        Protected ctlNewWindowOpener As cNewWindowOpener
    Protected valSubCategory as CustomValidator
    
'----------------------------------------------------

	Public ReadOnly Property GranteeProjectInfoDO() As cDataObject
		Get
			If mGranteeProjectDO Is Nothing Then
				mGranteeProjectDO = Me.DataObjectCollection("GranteeProjectInfo")(0)
			End If

			Return mGranteeProjectDO
		End Get
	End Property

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)			
			
		Dim aDataObjectNode As XmlNode
		Dim aControlNode As XmlNode
		Dim aActionNode As XmlNode
		Dim aXMLDoc As cXMLDoc = New cXMLDoc()
		dim aNode as XmlNode
		dim aArgumentNode as XmlNode
		dim aChildNode as XmlNode
		dim aNewChildNode as XmlNode
		Dim aNewElement as XmlElement	
		dim aFiltersNode as XmlNode
		dim aGranteeProjectInfoDO as cDataObject
		dim aCategoryID as Integer
		dim aScienceID as Integer
		dim aGranteeProjectID as Integer
		
		if me.Request.QueryString("Category") = ""  then
			
			aXMLDoc.LoadFromXML(spnConfigXML.InnerText)
			
			aNode = aXMLDoc.DocElement.SelectSingleNode("DataObject[@Key='GranteeProjectInfo']")
			aControlNode = aNode.SelectSingleNode("DisplayProperties/DisplayProperty/Control[@ID='ctlScience']")
			aArgumentNode = aControlNode.SelectSingleNode("Filters/Argument[@Type='QueryString']")
			aFiltersNode = aControlNode.SelectSingleNode("Filters")
							
			aNewElement = aXMLDoc.XMLDocument.CreateElement("Argument")
			aNewElement.SetAttribute("Type", "DataObjectCollection")
			aNewElement.SetAttribute("TypeKey", "GranteeProjectInfo")
			aNewElement.SetAttribute("DataObjectPropertyKey", "ScienceKatz.CategoryID")
			aNewElement.SetAttribute("PropertyKey", "CategoryID")
			aNewChildNode = aNewElement
			aChildNode = aFiltersNode.SelectSingleNode("Argument")
			aFiltersNode.ReplaceChild(aNewChildNode, aChildNode) 
					
			spnConfigXML.InnerText = aXMLDoc.DocElement.OuterXml
		end if
			
		MyBase.CoreCtl_Load(aSrc, aEvent)

		aGranteeProjectInfoDO = Me.DataObjectCollection("GranteeProjectInfo")(0)
				
		ctlCategory = CType(Me.FindControl("ctlCategory"), cDropDown)
		ctlScience = CType(Me.FindControl("ctlScience"), cRadioButtonList)
		ctlCategory.Set_ServerIndexChange(AddressOf AddFilter)	
		
		if me.Request.QueryString("Category") = "" then	
			ctlCategory = CType(Me.FindControl("ctlCategory"), cDropDown)
			ctlCategory.Set_ServerIndexChange(AddressOf AddFilter)
			
			ctlScience = CType(Me.FindControl("ctlScience"), cRadioButtonList)
			if not aGranteeProjectInfoDO is nothing then
				aCategoryID = aGranteeProjectInfoDO.GetPropertyInt("ScienceCategoryID", 0)
				ctlCategory.SelectedField = aCategoryID	
				aScienceID = aGranteeProjectInfoDO.GetPropertyInt("ScienceID", 0)
				ctlScience.SelectedField = aScienceID	
			end if	
		elseif (me.Request.QueryString("Category") <> "" and Me.Request.QueryString("Science") <> "") then
			ctlCategory = CType(Me.FindControl("ctlCategory"), cDropDown)
			ctlScience = CType(Me.FindControl("ctlScience"), cRadioButtonList)
			ctlCategory.Set_ServerIndexChange(AddressOf AddFilter)	
			
			if not aGranteeProjectInfoDO is nothing then
				aCategoryID = aGranteeProjectInfoDO.GetPropertyInt("ScienceCategoryID")
				ctlCategory.SelectedField = aCategoryID	
				aScienceID = aGranteeProjectInfoDO.GetPropertyInt("ScienceID")
				ctlScience.SelectedField = aScienceID	
			end if			
		end if

		if me.Request.QueryString("Category") <> "" then
			ctlCategory = CType(Me.FindControl("ctlCategory"), cDropDown)
			ctlCategory.SelectedField = me.Request.QueryString("Category")
		End If		

		if me.Request.QueryString("Science") <> "" then
			ctlScience = CType(Me.FindControl("ctlScience"), cRadioButtonList)
			ctlScience.SelectedField = me.Request.QueryString("Science")
		End If		
		
	End Sub
	
'-----------------------------------------------------
  
    Public Sub ValidateSubCategory(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		
		ctlCategory = CType(Me.FindControl("ctlCategory"), cDropDown)
		ctlScience = CType(Me.FindControl("ctlScience"), cRadioButtonList)
						
		If ctlCategory.SelectedField <> "" And ctlScience.SelectedValue = "" then
			aArgs.IsValid = False
		Else
			aArgs.IsValid = True 
		End If
						
   End Sub
   
 	
'==============================================================

	Public Sub ViewScores()
		Dim aHref As String

		aHref = WebAppl.Build_RootURL("EasyGrants/Controls/PageSection/pgViewScores.aspx")
		'aHref = cWebLib.AddQuerystringParameter(aHref, "AllReviewers", "True")
		'aHref = cWebLib.AddQuerystringParameter(aHref, "WfTaskAssignmentID", aWfTaskAssignmentID)
		'aHref = cWebLib.AddQuerystringParameter(aHref, "GranteeProjectID", aGranteeProjectID)
		'aHref = cWebLib.AddQuerystringParameter(aHref, "AppWfTaskAssignmentID", aAppWfTaskAssignmentID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub
'-------------------------------------------------------------

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		
		ctlScience = CType(Me.FindControl("ctlScience"), cRadioButtonList)
		dim aCategoryID as Integer
		dim aScienceID as Integer
		
		if not me.Request.QueryString("Category") is nothing then
			ctlCategory.SelectedField = me.Request.QueryString("Category")
		else
				aCategoryID = GranteeProjectInfoDO.GetPropertyInt("ScienceCategoryID", 0)	
				ctlCategory.SelectedField = aCategoryID		
		End If
		
		if not me.Request.QueryString("Science") is nothing then
			aScienceID = GranteeProjectInfoDO.GetPropertyInt("ScienceID", 0)	
			ctlScience.SelectedField = aScienceID
		else
				aScienceID = GranteeProjectInfoDO.GetPropertyInt("ScienceID", 0)	
				ctlScience.SelectedField = aScienceID	
		End If

	End Sub

'-------------------------------------------------------------

	Private Sub AddFilter(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		ctlScience = CType(Me.FindControl("ctlScience"), cRadioButtonList)
		
		dim aURL as String
				aURL = Request.RawUrl.ToString()
				aURL = cWebLib.AddQuerystringParameter(aURL, "Category", ctlCategory.SelectedValue)
				aURL = cWebLib.AddQuerystringParameter(aURL, "Redirect", "True")
				me.Response.Redirect(aURL)	
	End Sub
	
'=============================================================

        Private Sub InitializeComponent()

        End Sub
    End Class 'cKatzScienceClass
End Namespace
