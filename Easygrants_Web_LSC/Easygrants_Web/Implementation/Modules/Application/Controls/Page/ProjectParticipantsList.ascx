<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.Application.Controls.Page.cProjectParticipantsList"  TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr><td class="SeparatorHdg"><b>Instructions</b></td></tr>	
	<tr><td><span id='spnPageContent' runat='server' /></td></tr>	
</table>
<br>
<Core:cUserCtlLoader CtlID='ctlProjectHeader' 
	Src='Implementation/Modules/Application/Controls/PageSection/ProjectInfoHeader.ascx'
	runat='server'/>
<br>
<Core:cUserCtlLoader CtlID='ctlProjectHeader' 
	Src='Implementation/Modules/Application/Controls/PageSection/ProjectInfoHeader.ascx'
	runat='server'/>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table2">
	<tr><td class="SeparatorHdg"><b>Participating Organizations</b></td></tr>	
	<tr><td>&nbsp;</td></tr>
	<tr><td ><span runat='server' id='spnAddOrg'></span></td></tr>
	<tr><td><span runat='server' id='spnParticipantOrgList'></span></td></tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table3">
	<tr><td class="SeparatorHdg"><b>Principal Investigators</b></td></tr>	
	<tr><td>&nbsp;</td></tr>
	<tr><td ><span runat='server' id='spnAddPI'></span></td></tr>
	<tr><td><span runat='server' id='spnParticipantPIList'></span></td></tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table4">
	<tr><td class="SeparatorHdg"><b>Other Key Personnel (Scientific Personnel)</b></td></tr>	
	<tr><td>&nbsp;</td></tr>
	<tr><td ><span runat='server' id='spnAddKP'></span></td></tr>
	<tr><td><span runat='server' id='spnParticipantKPList'></span></td></tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table6">
	<tr><td class="SeparatorHdg"><b>Administrative Contacts</b></td></tr>	
	<tr><td>&nbsp;</td></tr>
	<tr><td ><span runat='server' id='spnAddAdminContact'></span></td></tr>
	<tr><td><span runat='server' id='spnParticipantAdminContactList'></span></td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' width='100%' runat='server'>	
	<tr align='center'><td><span runat='server' id='spnContinue'/></td></tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='ParticipantOrganizationList' DataObjectDefinitionKey='GranteeProjectOrganizationAffiliation' CreateNew='False' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAddOrg'
						Container='spnAddOrg'
						Type='cButton'
						Image='Add'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='ParticipantOrgEditor'/>
								<Argument Value='GranteeProjectOrganizationAffiliationID=0'/>
								<Argument Type='QueryString' TypeKey='OrganizationID' BaseValue='OrganizationID='/>
								<Argument Type='' TypeKey='' BaseValue='='/>
							</Parameters>
						</Action>		
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlParticipantOrgListList'
						Container='spnParticipantOrgList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GranteeProjectOrganizationAffiliation'
						SeparatorWidth='2'
						NoRecordMessage='No Principal Investigators.'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='CommonOrganizationName' ColumnHeader='~~Organization~~' ConfigurableHeader='True' width='45%' />
						<!--<DisplayProperty PropertyKey='OrganizationName' ColumnHeader='Organization' ConfigurableHeader='True' width='45%' /> -->
						<DisplayProperty PropertyKey='LastNameFirstName' ColumnHeader='Name' ConfigurableHeader='True' width='45%' />



						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' width='55%'>
							<Control ID='btnEdit' Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ParticipantOrgEditor'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectOrganizationAffiliationID' AttributeName='GranteeProjectOrganizationAffiliationID' BaseValue='GranteeProjectOrganizationAffiliationID='/>
										<Argument Type='QueryString' TypeKey='OrganizationID' BaseValue='OrganizationID='/>
										<Argument Type='' TypeKey='' PropertyKey='' BaseValue='='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete' Type='cButton' Image='Delete'
								Confirmation='Are you sure you want to delete the item?'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='GranteeProjectOrganizationAffiliationID' AttributeName='GranteeProjectOrganizationAffiliationID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>	
		</DataObject>

		
		<DataObject Key='ParticipantOrganizationList' DataObjectDefinitionKey='GranteeProjectOrganizationAffiliation' CreateNew='False' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd'
						Container='spnAdd'
						Type='cButton'
						Image='Add'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='ParticipantOrgEditor'/>
								<Argument Value='GranteeProjectOrganizationAffiliationID=0'/>
								<Argument Type='QueryString' TypeKey='OrganizationID' BaseValue='OrganizationID='/>
								<Argument Type='' TypeKey='' BaseValue='='/>
							</Parameters>
						</Action>		
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlParticipantOrgListList'
						Container='spnParticipantOrgList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GranteeProjectOrganizationAffiliation'
						SeparatorWidth='2'
						NoRecordMessage='No Participating Organizations.'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='Organization.CommonOrganizationName' ColumnHeader='~~Organization~~' ConfigurableHeader='True' width='45%' />
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' width='55%'>
							<Control ID='btnEdit' Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ParticipantOrgEditor'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectOrganizationAffiliationID' AttributeName='GranteeProjectOrganizationAffiliationID' BaseValue='GranteeProjectOrganizationAffiliationID='/>
										<Argument Type='QueryString' TypeKey='OrganizationID' BaseValue='OrganizationID='/>
										<Argument Type='' TypeKey='' PropertyKey='' BaseValue='='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete' Type='cButton' Image='Delete'
								Confirmation='Are you sure you want to delete the item?'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='GranteeProjectOrganizationAffiliationID' AttributeName='GranteeProjectOrganizationAffiliationID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>	
		</DataObject>
						


	</ModuleSection>
</span>
<!-- End Embedded XML -->
