<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<div style="width:800px;">
	<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
		Src='Core/Controls/Base/ValidationSummary.ascx'
		runat='server'/>
	<br />
	<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlReviewInfo' 
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/ApplicationInfo.ascx'
		runat='server'/>
	<br />

	<div class='SeparatorHdg'>Main</div>
	
	<p>The <b>Main</b> page provides a summary of the information requested and the validation status of your review.</p>
	
	<p>The Validation Summary below displays the status of your submission, indicating whether each section is validated 
	(complete). Click the section links in the Validation Summary below or use the links at the left to navigate through 
	the sections of the application.</p>
	
	<p>Other useful links that will appear in the navigation bar at left throughout the process include: </p>
	
	<ul>
		<li><b>Home</b>, which brings you back to your Home page and out of this application </li>
		<li><b>Log Out</b>, which logs you out of the system </li>
	</ul>
	
	<p>All fields throughout the application marked with a red asterisk (<span style="color:Red">*</span>) are required.</p>
	
	<p>At the bottom of each page, you will be presented with some of the following options: </p>
	
	<ul>
		<li><b>Save</b>, to save your work</li>
		<li><b>Continue</b>, to continue to the next section</li>
		<li><b>Save and Continue</b>, to save your work and continue to the next section </li>
	</ul>
	<p>PLEASE NOTE: Some areas in the Validation Summary may be checked as complete even though you may need or wish to 
	provide additional information.</p>  
	
	
	<br />
	<div class='SeparatorHdg' width='100%'>Validation Summary</div>
	<br />
	<Core:cValidate id='ctlValidate' DisplayFormat='Summary' 
		runat='server'/>
</div>


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>