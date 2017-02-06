<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Core_Web.Controls.Base.cDataPresenterCtl"%>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->
<EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Root' Key='WordTemplate' LinkTitle='Word Template' runat='server'/>
<Core:cUserCtlLoader CtlID='ctlComWordTempUpload' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ComWordTempList.ascx'
	runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>

<tr><td>&nbsp;</td></tr>
</table>

<p></p>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<Filters>
			</Filters>
			<DisplayProperties>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>

	<!-- End Embedded XML -->
</span>