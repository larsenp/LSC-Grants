<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br>
Upload files must be no larger than 5 MB.  The following formats can be uploaded into Easygrants:
Microsoft Word for Windows (.doc), Microsoft Excel for Windows (.xls), Rich Text Format (.rtf),
Text Format (.txt), Adobe PDF (.pdf), and PowerPoint (.ppt).

<Core:cUserCtlLoader CtlID='ctlDocumentEditor' 
	Src='Easygrants/Controls/PageSection/Document_Editor.ascx'
	runat='server'/>

<span runat='server' id='spnConfigXML' visible='false'>
	<ModuleSection>
	</ModuleSection>
</span>