<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cSubCommitteesEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="SubCommitteesEditor.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<asp:CustomValidator 
	id='valCommittee'
	runat='server'
	OnServerValidate='ValidateCommittee'
	ErrorMessage='You have selected members for this subcommittee; therefore, you cannot change the committee.'
	Display='None'/>
	


<br />
<br />

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Edit Subcommittee</b></td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Committee&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnParentReviewCommittee' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Subcommittee Name&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnName' runat='server'/></td>
	</tr>
	<tr>
		<td></td>
		<td class='FieldLabel'>Limit: 100 characters</td>
	</tr>
	<tr visible='false' runat='server'>
		<td><b>Program Type</b></td>
		<td><span id='spnProgramType' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Active Subcommittee?</b></td>
		<td><span id='spnInactive' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Select Subcommittee Members</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Last Name</b>&nbsp;&nbsp;
		</td>
		<td>
			<input type='text' id='txtLastName' size='20' maxlength='100' runat='server' /> &nbsp;&nbsp;&nbsp;&nbsp;<span runat='server' id='spnFind'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnReviewCommitteeMember'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' align='center'>
			<span runat='server' id='spnSave'/>&nbsp;
			<span runat='server' id='spnSaveAndContinue'/>&nbsp;	
			<span runat='server' id='spnCancel'/>	
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewCommittee' DataObjectDefinitionKey='ReviewCommittee' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ParentReviewCommitteeID'>
					<Control ID='ctlParentReviewCommittee'
						Container='spnParentReviewCommittee'
						Type='cDropDown'
						DataObjectDefinitionKey='ReviewCommittee'
						StoredValue='ReviewCommitteeID'
						DisplayValue='ReviewCommitteeDescription'
						DisplayText='Select'
						DisplayNone='False'
						RequiredField='True'
						ErrorMessage='Committee is required.'>
						<Filters>
							<Argument PropertyKey='ParentReviewCommitteeID' Value='null'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='ReviewCommitteeDescription'/>
						</Sort>
						<SelectedValue>
							<Argument Type='QueryString' TypeKey='ParentRCID' PropertyKey='ReviewCommitteeID'/>
						</SelectedValue>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey='ReviewCommitteeDescription'>
					<Control ID='ctlName'
						Type='cTextBox'
						Container='spnName'
						Size='80'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Subcommittee Name is required.'>
					</Control>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='ProgramTypeID'>
					<Control ID='ctlProgramType'
						Container='spnProgramType'
						Type='cDropDown'
						DataObjectDefinitionKey='CompetitionType'
						StoredValue='CompetitionTypeID'
						DisplayValue='Description'
						DisplayNone='False'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
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
			</DisplayProperties>
		</DataObject>


		<DataObject Key='ReviewCommitteeMembers' DataObjectDefinitionKey='ReviewCommittee' Updatable='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewCommittee' DataObjectPropertyKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID' />

			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ReviewCommitteeMembers'>
					<Control ID='ctlReviewCommitteeMember'
						Container='spnReviewCommitteeMember'
						Type='cDoubleListBox2'
						DataObjectDefinitionKey='Person'
						DisplayValue='LastNameFirstName'
						StoredValue='PersonID'
						DisplaySort='False'
						StoredDisplayValue='Person.LastNameFirstName' 
						Height='9'
						DisplayNone='False'
						DisplayMoveAll='True'>
						<Filters>
					        <Argument Type='QueryString' TypeKey='ParentRCID' PropertyKey='ReviewCommitteeID' Value='' Bool=''>
					            <RelatedProperty PropertyKey='ReviewCommitteeMember.ReviewCommittee'/>    
					        </Argument>
					        <Argument Type='QueryString' TypeKey='find' Operator='Like' PropertyKey='LastName'/>
						    <Argument Type='Data' TypeKey='' PropertyKey='IsReviewer' Value='1'/>
						    <Argument Type='' TypeKey='' PropertyKey='ReviewerStatusID' Value='1' bool=''>
							    <RelatedProperty PropertyKey='PersonReviewer'/>
						    </Argument>
						    <Argument ID='RCM' Type='' TypeKey='' PropertyKey='PersonID' Value='-1' Operator='NotEqual' bool=''>
							    <RelatedProperty PropertyKey='ReviewCommitteeMember'/>
						    </Argument>
						</Filters>
						<Sort>
	                        <Argument PropertyKey='LastName' Direction='Ascending'>
								
	                        </Argument>
	                        <Argument PropertyKey='FirstName' Direction='Ascending'>
								
	                        </Argument>
	                        <Argument PropertyKey='MiddleName' Direction='Ascending'>
								
	                        </Argument>
	                    </Sort>
						<DefaultValues>
							<Argument Type='DataObjectCollection' TypeKey='ReviewCommittee' DataObjectPropertyKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID' />
							<Argument PropertyKey='ReviewerRoleID' Value='1'/>
						</DefaultValues>
					</Control>
				</DisplayProperty>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='DataPresenter'
							Method='Save'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='SubCommitteesEditor'/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCommittee' DataObjectPropertyKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID' BaseValue='ReviewCommitteeID='/>
								<Argument Type='QueryString' TypeKey='ParentRCID' PropertyKey='ParentRCID' BaseValue='ParentRCID='/>
								<Argument Type='' TypeKey='' PropertyKey='' BaseValue=''/>
							</Parameters>						
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndContinue'
						Container='spnSaveAndContinue'
						Type='cButton'
						Image='Save_and_Continue'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='DataPresenter'
							Method='Save'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='CommitteeMember'/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCommittee' DataObjectPropertyKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID' BaseValue='ReviewCommitteeID='/>
								<Argument Type='QueryString' TypeKey='ParentRCID' PropertyKey='ParentRCID' BaseValue='ParentRCID='/>
								<Argument Type='' TypeKey='' PropertyKey='' BaseValue=''/>
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
							AutoSave='False'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Committees'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnFind'
						Container='spnFind'
						Type='cButton'
						Image='Find'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='DataPresenter'
							Method='Find'>				
						</Action>
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
