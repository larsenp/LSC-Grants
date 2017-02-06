<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cPersonSummaryInfo" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"  EnableViewState="false" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Summary</b></td>
	</tr>	
</table>
<br>
<!--Click <b>Edit</b> to modify the Person Name.  Click the <b>primary organization name link</b> to view/edit that 
contact record. Click the <b>primary contact e-mail link</b> to send an e-mail to the contact.  Click the <b>Web 
link</b> to open a Web page displaying the organization Web site. Use the sections below to edit address, phone, 
and affiliated organization information. -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>
			<span id='spnPersonName' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
			<span id='spnOrgLink' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
			<span id='spnFullAddress' runat='server'/>
		</td>
	</tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>
			<span id='spnEdit' runat='server'/>
		</td>
	</tr>	
</table>
<br>
<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<br>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='PersonID' PropertyKey='PersonID' Value='' bool=''/>
			</Filters>
			<DefaultValues />
			<DisplayProperties>
				<DisplayProperty PropertyKey='LastNameFirstNameMiddleName'>
					<Control ID='spnPersonName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PersonPrimaryAffiliation.Organization.CommonOrganizationName'>
					<Control ID='lnkOrg'
						Type='cLink'
						Container='spnOrgLink'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='OrganizationContact'/>
								<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonPrimaryAffiliation.OrganizationID' BaseValue='OrganizationID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnEdit'
						Container='spnEdit'
							Type='cButton'
							Image='Edit'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='EditPerson'/>
									<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' BaseValue='PersonID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
						</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>								
	</ModuleSection>
<!-- End Embedded XML -->
</span>
