<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<div style='width:600' class='SeparatorHdg'>
	Instructions
</div>
<div style='width:600' >
	<table width='100%'>
		<tr>
			<td>
				<p>The <b>Supplemental Inquiries form</b> captures the applicant’s systems and procedures that ensure compliance with LSC regulations. <b>All inquiries are required</b>.</p>
				<b>Follow the steps below for assistance on this form</b>:
				<ul>
					<li>Submit inquiries pertaining to technical issues, using the website application, and uploading files to <a href='mailto:techsupport@lsc.gov'>techsupport@lsc.gov</a>.</li>
					<li>Submit all other inquiries regarding this form or the grants process to the LSC Competition Service Desk at <a href='mailto:competition@lsc.gov'>competition@lsc.gov</a>.</li>
					<li>Contact Reginald Haley at <a href='mailto:haleyr@lsc.gov'>haleyr@lsc.gov</a> if you do not receive a response from either service desk within 48 hours.</li>
				</ul>		
			</td>
			<td width="160" valign="top" >
				<Core:cUserCtlLoader CtlID='ctlQuickLinks' 
					Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
					runat='server'/>
			</td>
		</tr>
	</table>
	<br />
	<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
	<br />
	<div style='width:100%' class="SeparatorHdg">
		Supplemental Inquiry
	</div>
	<br />
	1.	Describe Applicant's systems and procedures that ensure compliance and enforcement of LSC’s policies and regulatory requirements, identify staff training provided and the frequency of Applicant’s internal compliance reviews.<span style="color:red">*</span><br />
	<span runat='server' id='spnSystemsProcedures'/>
	<br /><br />
	<div style="text-align:center">
		<span runat='server' id='spnSave'/>&nbsp;
		<span runat='server' id='spnSaveClose'/>
	</div>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscWftaPostPQVApp' DataObjectDefinitionKey='LscWftaPostPQVApp' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SystemsProcedures'>
					<Control ID='txtSystemsProcedures'
						Type='cTextArea'
						Container='spnSystemsProcedures'
						Rows='5'
						Cols='70'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClose'
						Type='cButton'
						Caption='Save and Close'
						Container='spnSaveClose'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PQV' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
