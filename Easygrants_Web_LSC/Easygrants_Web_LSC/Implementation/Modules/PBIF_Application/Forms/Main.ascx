<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<br />

<div class='SeparatorHdg' width='100%'>Main</div>

<p>The <b>Main</b> page provides a summary of the information requested and the application status.</p>

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
<p>Please also be aware of the following:</p>
<ul>
	<li>The “Subgrants” and "Contracts" forms will be checked as complete whether or not information is submitted. However, it is essential that you read and understand the instructions on these forms and provide these files if required.</li>
	<li>Pages for which information is not required (e.g., "Letters of Support") will be checked as complete whether or not information is submitted. If you wish to provide such information in your application, check to ensure that you have done so before you submit.</li> 
</ul> 

<br />
<div class='SeparatorHdg' width='100%'>Validation Summary</div>
<br />
<Core:cValidate id='ctlValidate' DisplayFormat='Summary' 
	runat='server'/>

<div style="text-align:center">
		<span runat='server' id='spnContinue' />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
      <DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Caption='Continue'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>