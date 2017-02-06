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
Imports EasyGrants.DataAccess

Namespace Easygrants_Web.Controls.PageSection
Public Class cGrantNotesEditor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'============================================================= 

   'Protected ctlIsPrimary As cCheckBox
	Private mEntityID as Integer
	Private mNotesID As Integer
	Private mEntityTypeID as Integer
	Private mNotes as String
	Private mSubject as String
	
	Protected ctlSubject as cTextBox
    
'=============================================================

	   'Public Overrides Sub DataPresenter_SaveDataObjects()
	   
    '    Dim aXMLDoc As cXMLDoc
    '    Dim aDataObjectNode As XmlNode
    '    Dim aDataObject As cDataObject
	   ' Dim aPerson As Integer
	   ' Dim aEntityType as Integer
	   	     
    '    aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Notes", aDataObjectNode)
    '    aDataObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
    '    aPerson = Request.QueryString("EntityID")
    '    mSubject = ctlSubject.BaseTextBox.Value 
        
    '    aDataObject("EntityID") = aPerson
    '    aEntityType = request.QueryString("EntityTypeID")
    '    aDataObject("EntityTypeID") = aEntityType
    '    aDataObject("CreateDate") = Now()
        '    aDataObject("ModifyDate") = 2/2/2010
    '    'aDataObject("Subject") = mSubject
    '    'aDataObject("Notes") = mNotes

    '    WebSession.DataObjectFactory.SaveDataObject(aDataObject)
    '    mNotesID = aDataObject("NotesID")
        
    '    MyBase.DataPresenter_SaveDataObjects()

    'End Sub
	
'=============================================================
End Class 'cNotesEditor
End Namespace