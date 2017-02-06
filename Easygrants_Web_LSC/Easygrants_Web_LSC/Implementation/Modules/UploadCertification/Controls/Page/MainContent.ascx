<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<p>The <b>Main</b> page provides a summary of the information requested and the application status.</p>

<p>The Validation Summary below displays the status of your submission, indicating whether each section 
is validated (complete). Click the section links in the Validation Summary below or use the links at 
the left to navigate through the sections of the application.</p>

<p>All fields throughout the application marked with an asterisk (<font color='red'>*</font>) are required.</p>

<p>At the bottom of most pages, you may: </p>

<ul>
	<li><b>Save</b>, to save your work </li>
	<li><b>Save and Continue</b>, to save your work and continue to the next section </li>
	<li><b>Cancel</b>, to return to the previous page without saving changes </li>
</ul>

<div width='100%' class='SeparatorHdg'>
	Validation Summary
</div>
<Core:cValidate id='ctlValidate' DisplayFormat='Summary' 
			runat='server'/>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>
