<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Home.Controls.Page.cRequestNewSubgrantApproval" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<br />
<div class='SeparatorHdg'>
	Initiate Step 1 of Subgrant Approval Request
</div>

<p>
	To initiate step 1 of a new subgrant approval request, provide the requested information, then click <b>Save and Continue</b>.
</p>

<table style="width:100%; padding:1px 1px 1px 1px">
	<tr>
		<td>
			<b>Start Date<%=kDenoteRequiredField %></b>
		</td>
		<td>
			<span runat='server' id='spnStartDate' />
		</td>
	</tr>
	<tr>
		<td>
			<b>End Date<%=kDenoteRequiredField %></b>
		</td>
		<td>
			<span runat='server' id='spnEndDate' />
			<asp:CustomValidator id='valCusSubgrantDateOrder'
				runat='server'
				OnServerValidate='ValidateSubgrantDateOrder'
				ErrorMessage='The Start Date must precede the End Date.'
				Display="none" />
			<asp:CustomValidator id='valCusSubgrantDuration'
				runat='server'
				OnServerValidate='ValidateSubgrantDuration'
				ErrorMessage='The subgrant duration must not exceed one year.'
				Display="none" />
		</td>
	</tr>
	<tr>
		<td>
			<b>Subgrantee<%=kDenoteRequiredField %></b>
		</td>
		<td>
			<span runat='server' id='spnSubgranteeName' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Subgrant Amount<%=kDenoteRequiredField %></b>
		</td>
		<td>
			<span runat='server' id='spnSubgrantAmount' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style="text-align:center" colspan='2'>
			<span runat='server' id='spnSaveContinue' />&nbsp;<span runat='server' id='spnCancel' />
		</td>
	</tr>
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' />
			</Filters>
		</DataObject>

		<DataObject Key='Grantee' DataObjectDefinitionKey='Grantee' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument PropertyKey='GranteeID' Value='0' />
			</Filters>
			<DefaultValues>
				<Argument PropertyKey='EntityTypeID' Value='2' />
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonPrimaryAffiliation.OrganizationID' PropertyKey='EntityID' />
			</DefaultValues>
		</DataObject>
		
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument PropertyKey='GranteeProjectID' Value='0' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='Grantee' DataObjectPropertyKey='GranteeID' PropertyKey='GranteeID' />
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PrimaryPersonID' />
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonPrimaryAffiliation.OrganizationID' PropertyKey='PrimaryOrganizationID' />
				<Argument PropertyKey='GrantStatusID' Value='2' />
			</DefaultValues>
		</DataObject>

		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument PropertyKey='WfTaskAssignmentID' Value='0' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='101' />
				<Argument PropertyKey='WfTaskStatusID' Value='1' />
				<Argument PropertyKey='WfTaskRoleID' Value='1' />
				<Argument PropertyKey='WfTaskOutcomeID' Value='114' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' />
			</DefaultValues>
		</DataObject>
		
		<DataObject Key='LscWfTASubgrant' DataObjectDefinitionKey='LscWfTASubgrant'>
			<Filters>
				<Argument PropertyKey='LscWfTASubgrantID' Value='0' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='StartDate'>
					<Control ID='txtStartDate'
						Type='cDateTextBox'
						Container='spnStartDate'
						RequiredField='True'
						ErrorMessage='Start Date is required'
						DateFormat='M/d/yyyy' 
						FirstDate='2015-1-1'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EndDate'>
					<Control ID='txtEndDate'
						Type='cDateTextBox'
						Container='spnEndDate'
						RequiredField='True'
						ErrorMessage='End Date is required'
						DateFormat='M/d/yyyy'  />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteeName'>
					<Control ID='txtSubgranteeName'
						Type='cTextBox'
						Size='30'
						MaxLength='100'
						Container='spnSubgranteeName' 
						RequiredField='True'
						ErrorMessage='Subgrantee Name is required' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgrantAmount'>
					<Control ID='txtSubgrantAmount'
						Type='cMoneyTextBox'
						Container='spnSubgrantAmount' 
					    AllowInputCommas='True'
					    MaxInputDecimalPlaces='0'
					    DecimalErrorMessage='The field "Subgrant Amount" must be a whole number.'
					    RegExErrorMessage='The field "Subgrant Amount" must be a whole number.'
					    Size='10'
					    MaxLength='10'
						RequiredField='True'
						ErrorMessage='Subgrant Amount is required' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveContinue'
						Type='cButton'
						Container='spnSaveContinue'
						Caption='Save and Continue'>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='RequestNewSubgrantApproval'>
							<Parameters>
								<Argument Type='ModuleUser' TypeKey='PersonID' />
								<Argument Type='Control' TypeKey='txtStartDate' ControlPropertyKey='SQLDate' />
								<Argument Type='Control' TypeKey='txtEndDate' ControlPropertyKey='SQLDate' />
								<Argument Type='Control' TypeKey='txtSubgranteeName' ControlPropertyKey='Value' />
								<Argument Type='Control' TypeKey='txtSubgrantAmount' ControlPropertyKey='NumericValue' />
								<Argument Value='101'/>
								<Argument Type='QueryString' TypeKey='WfProjectID' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Type='cButton'
						Container='spnCancel'
						Caption='Cancel'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Home' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>