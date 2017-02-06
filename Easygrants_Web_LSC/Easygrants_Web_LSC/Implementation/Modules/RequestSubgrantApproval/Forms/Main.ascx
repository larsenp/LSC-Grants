<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<br />
<Core:cUserCtlLoader CtlID='ctlSubgrantInfo' 
	Src='Implementation/Modules/RequestSubgrantApproval/PageSection/SubgrantInfo.ascx'
	runat='server'/>
<br />
<div class='SeparatorHdg'>Instructions</div>

<p>The <b>Main</b> page provides a summary of the information requested and the application status.</p>

<p>The <b>Validation Summary</b> below displays the status of your submission, indicating whether each section is validated 
(complete). Click the section links in the Validation Summary below or use the links at the left to navigate through 
the sections of the application.</p>

<p>Other useful links that will appear in the navigation bar at left throughout the process include: </p>

<ul>
	<li><b>Home</b>, which brings you back to your Home page and out of this application </li>
	<li><b>Log Out</b>, which logs you out of the system </li>
</ul>
<br />
<div class='SeparatorHdg' width='100%'>Validation Summary</div>
<br />
<Core:cValidate id='ctlValidate' DisplayFormat='Summary' 
	runat='server'/>
<br />
<div style="text-align:center">
	<span runat='server' id='spnContinue'/>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Caption='Continue'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>