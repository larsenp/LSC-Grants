<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	<br />
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="SeparatorHdg"><b>Edit Committee Member</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td	valign="top" width="20%"><b>Committee Member</b></td>
		<td><span id='spnName' runat='server'/></td>
	</tr>
	<tr>
		<td	valign="top"><b>Reviewer <%=GetLabel("Organization")%></b></td>
		<td><span id='spnPrimaryInst' runat='server'/></td>
	</tr>
	<tr>
		<td	valign="top"><b>Research Area</b></td>
		<td><span id='spnResearchArea' runat='server'/></td>
	</tr>
	<tr>
		<td	valign="top"><b>Committee Member Role</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnRole' runat='server'/></td>
	</tr>
	<tr>
		<td	valign="top"><b>Start Date</b></td>
		<td><span id='spnStartDate' runat='server'/></td>
	</tr>
	<tr>
		<td	valign="top"><b>End Date</b></td>
		<td><span id='spnEndDate' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Active?</b></td>
		<td><span id='spnInactive' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" align='center'>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSaveAndClose'/>
			<span runat='server' id='spnCancel'/> 
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewCommitteeMember' DataObjectDefinitionKey='ReviewCommitteeMember' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCommitteeMemberID' PropertyKey='ReviewCommitteeMemberID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID'/>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Person.LastNameFirstName'>
					<Control ID='spnName' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Person.PersonPrimaryAffiliation.Organization.CommonOrganizationName'>
					<Control ID='spnPrimaryInst' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReviewerRoleID'>
					<Control ID='ctlRole'
						Container='spnRole'
						Type='cDropDown'
						DataObjectDefinitionKey='ReviewerRole'
						StoredValue='ReviewerRoleID'
						DisplayNone='False'
						RequiredField='True'
						ErrorMessage='Committee Member Role is required.'
						DisplayValue='Description'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='StartDate'>
					<Control ID='ctlStartDate'
						Container='spnStartDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						NotSupportedDateErrorMessage='Enter a valid Start Date in MM/dd/yyyy format (ex. 01/01/1000).'
						Size='25'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EndDate'>
					<Control ID='ctlEndDate'
						Container='spnEndDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						NotSupportedDateErrorMessage='Enter a valid End Date in MM/dd/yyyy format (ex. 01/01/1000).'
						Size='25'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Inactive'>
					<Control ID='ctlInactive'
						Container='spnInactive'
						Type='cDropDown'
						ParamList='False|Yes~True|No'
						Separator='~'
						SubSeparator='|'
						DisplayNone='False'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Continue'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='CommitteeMember'/>
								<Argument Type='QueryString' TypeKey='ReviewCommitteeID' BaseValue='ReviewCommitteeID='/>
								<Argument Type='QueryString' TypeKey='ParentRCID' BaseValue='ParentRCID='/>
							</Parameters>							
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='CommitteeMember'/>
								<Argument Type='QueryString' TypeKey='ReviewCommitteeID' BaseValue='ReviewCommitteeID='/>
								<Argument Type='QueryString' TypeKey='ParentRCID' BaseValue='ParentRCID='/>
							</Parameters>						
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='PersonReviewerExpertise' DataObjectDefinitionKey='PersonReviewerExpertise'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonID' 
					PropertyKey='PersonID' Value='' Bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='Description'>	
					<RelatedProperty PropertyKey='ResearchArea'/>
				</Argument>
			</Sort>	
			<DisplayProperties>
			    <DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnResearchArea'
						Type='cDataListCtl'
						MaxPerPage='10'
						ShowColumnHeaderRow='False'>                    
						    <DisplayProperty PropertyKey='ResearchArea.Description' ColumnHeader='' Width='50%'/>
					</Control>					
				</DisplayProperty>		 
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
