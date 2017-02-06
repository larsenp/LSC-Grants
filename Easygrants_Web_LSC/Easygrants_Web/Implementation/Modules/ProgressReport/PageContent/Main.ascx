<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>

<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->

<table>
	<tr>
		<td>
			This is the <b>Main</b> page for this report.  The report contains multiple pages, and each 
			page is accessible using the navigation list to the left.  Also shown in the left 
			navigation are other pages that are available from this page: <b>Home</b> - brings you to 
			your home page and out of this report; <b>Guidelines</b> provides you with information 
			specific to this competition; and <b>Help</b> provides you with help using each page in the 
			system.
			<p>
			The <b>Validation</b> section at the bottom of this page summarizes the status of your report
			indicating whether each page is validated (i.e., complete).  All required pages must 
			be validated before the system will allow you to submit.  The <b>Validation</b> page, in the 
			navigation list, displays the validation status of each page and outlines specific 
			fields that must be completed before submission, and allows you to view your full 
			report PDF.  Once all required pages are complete, you can submit using the <b>Submit 
			Report</b> page.<p>
		</td>
	</tr>
	<tr>
		<td>
			<EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
				AutoVDateType='Root' Key='Main' LinkTitle='Main' runat='server'/>
		</td>
	</tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Validation Summary</b></td>
	</tr>
	<tr>
		<td>
			<Core:cValidate id='ctlValidate' DisplayFormat='Summary' runat='server'/>
		</td>
	</tr>
</table>	


<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
