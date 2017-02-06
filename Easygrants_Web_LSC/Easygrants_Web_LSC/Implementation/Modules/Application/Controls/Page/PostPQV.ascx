<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br />
<div style='width:600' class='SeparatorHdg'>
	Instructions
</div>
<div style='width:600' >
<br />
	<table width='100%'>
		<tr>
			<td>
				<p>
				The <b>PQV forms</b> allow Applicants to a) describe actions taken in response to certain PQV Recommendations, b) describe significant changes or major developments in the delivery system that have occurred since the PQV ended, and those that are anticipated during the grant year, and c) respond to a Supplemental Inquiry. <b>All inquiries are required.</b>
				</p>
				<p>
				Click on a link to respond to the inquiries in that form. If there are no recommendations for a given Performance Area, the form will state, “The Program Quality Visit report contained no recommendations.” 
				</p>
			</td>
			<td width="160" valign="top" >
				<Core:cUserCtlLoader CtlID='ctlQuickLinks' 
					Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
					runat='server'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan="2">
				<b>Follow the steps below for assistance on this form:</b>
				<ul>
					<li>Submit inquiries pertaining to technical issues, using the website application, and uploading files to <a href='mailto:techsupport@lsc.gov'>techsupport@lsc.gov</a>.</li>
					<li>Submit all other inquiries regarding this form or the grants process to the LSC Competition Service Desk at <a href='mailto:competition@lsc.gov'>competition@lsc.gov</a>.</li>
					<li>Contact Reginald Haley at <a href='mailto:haleyr@lsc.gov'>haleyr@lsc.gov</a> if you do not receive a response from either service desk within 48 hours.</li>
				</ul>
			</td>
		</tr>
	</table>
	<br />
	<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
	<br />
	<div class="SeparatorHdg" style="width:600px">
		PQV Recommendations, Modifications to the Delivery System, and Supplemental Inquiry
	</div>

	<br />
	<span runat='server' id='spnPostPQVPA1' /><br />
	<span runat='server' id='spnPostPQVPA2' /><br />
	<span runat='server' id='spnPostPQVPA3' /><br />
	<span runat='server' id='spnPostPQVPA4' /><br />
	<span runat='server' id='spnPostPQVSupplemental' /><br />


	<br />
	<div width='100%' style="text-align:center" >
		<span runat='server' id='spnContinue' />
	</div>
</div>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
		<DataObject Key='LscInsertLscPQVRecommendationServArea' DataObjectDefinitionKey='LscInsertLscPQVRecommendationServArea' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="wfta_id"/>
			</Filters>
		</DataObject>

		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Caption='Continue'
						Save='False'
						GoToNextPage='True'/>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkPostPQVPA1'
						Type='cLink'
						Container='spnPostPQVPA1'
						Caption = 'Performance Area 1'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PostPQVPA1' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkPostPQVPA2'
						Type='cLink'
						Container='spnPostPQVPA2'
						Caption = 'Performance Area 2'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PostPQVPA2' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkPostPQVPA3'
						Type='cLink'
						Container='spnPostPQVPA3'
						Caption = 'Performance Area 3'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PostPQVPA3' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkPostPQVPA4'
						Type='cLink'
						Container='spnPostPQVPA4'
						Caption = 'Performance Area 4'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PostPQVPA4' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkPostPQVSupplemental'
						Type='cLink'
						Container='spnPostPQVSupplemental'
						Caption = 'Supplemental Inquiry'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PostPQVSupplemental' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	     
	</ModuleSection>
	
</span>