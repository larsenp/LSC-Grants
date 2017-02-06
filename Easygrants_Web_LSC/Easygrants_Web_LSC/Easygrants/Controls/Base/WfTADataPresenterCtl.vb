Imports System.Reflection
Imports Core.Web.Modules
Imports EasyGrants.Web.User

Namespace Easygrants_Web.Controls.Base
	Public Class cWfTADataPresenterCtl
		Inherits Core_Web.Controls.Base.cLSCDataPresenterCtl

		Public ReadOnly Property WfTaskAssignmentID() As Integer
			Get
				Dim aAssembly As [Assembly]	'"Assembly" has to be enclosed in brackets because it is a VB keyword as well as a class name
				Dim aType As Type

				aAssembly = [Assembly].Load("Easygrants")
				aType = aAssembly.GetType("EasyGrants.Web.Modules.cSubmissionModulePage")
				If Me.Page.GetType().IsSubclassOf(aType) Then
					Return CType(CType(Page, cModulePage).ModuleUser, cEGWfTAUser).WfTaskAssignmentID
				Else
					Return Request.QueryString("WfTaskAssignmentID")
				End If
			End Get
		End Property
	End Class
End Namespace
