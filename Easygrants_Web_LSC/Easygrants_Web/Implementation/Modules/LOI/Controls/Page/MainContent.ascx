<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>

<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->

<table>
	<tr><td>
			<p>The <b>Main</b> page provides a summary of the information requested and the 
			letter of inquiry status.</p>
			<p>The Validation Summary below displays the status of your submission, indicating whether each section 
			is validated (complete).  Click the section links in the Validation Summary below or use the links at 
			the left to navigate through the sections of the application.</p>
			<p>Other useful links that will appear in the navigation bar at left throughout the process include:
				<ul>
					<li><b>Home,</b> which brings you back to your Home page and out of this letter of inquiry</li>
					<li><b>Guidelines,</b> which provides information specific to this program</li>
					<li><b>Help</b>, which provides guidance on using each page in the system</li>
					<li><b>Log Out</b>, which logs you out of the system</li>
				</ul>	
			</p>
			<p>All fields throughout the letter of inquiry marked with an asterisk (<font color='red'>*</font>) are required.</p>
			<p>At the bottom of most pages, you may:
				<ul>
					<li><b>Save,</b> to save your work</li>
					<li><b>Save and Continue,</b> to save your work and continue to the next section</li>
					<li><b>Cancel,</b> to return to the previous page without saving changes</li>
				</ul>	
			</p>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Validation Summary</b>
		</td>
	</tr>
	<tr>
		<td><Core:cValidate id='ctlValidate' DisplayFormat='Summary' 
			runat='server'/>
		</td>
	</tr>
</table>	
	
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

		
	</ModuleSection>
<!-- End Embedded XML -->
</span>
