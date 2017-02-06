<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>

<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<br>
<table>
	<tr runat='server' visible='false'>
		<td>
			The Louis N. and Arnold M. Katz Prize encourages new investigators to continue research 
			careers in basic cardiovascular science.  This award historically has recognized research 
			involving biochemical, cellular, molecular, and genetic sciences, and has come increasingly to 
			include whole animal studies, especially those entailing the creation of new genetic lines.
			<br><br>
		</td>
	</tr>
	<tr>
		<td>
			This is the main page for your application submission. The application for this award consists of multiple pages.  
			Use the links on the left to jump to any page in your submission. Clicking <b>Guidelines</b> (left) will open a new 
			window with instructions and guidelines.  
			<br><br>
			The <b>Application Validation</b> section (below) indicates the status of each page in your submission. All required 
			pages must be validated before the system will allow you to submit your application. Use the <b>Validate and Submit</b> 
			page (in the navigation list at left) to see which specific fields must be completed before your application can be 
			submitted. 
			<br><br>
			Once all required pages are complete, you can view your application using the <b>PDF Generation</b> page and submit 
			your application using the <b>Validate and Submit</b> page.  
			<br><br>
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
