<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="CommitteesEditor.ascx.vb" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cCommitteesEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<%-- <asp:CustomValidator id='valMembers'  
	runat='server' OnServerValidate='ValidateMembers' 
	ErrorMessage='You must select at least one reviewer to be a member of your committee.' 
	Display='None'/> --%>

<br />
<br />
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Edit Committee</b></td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='20%'><b>Committee Name&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnName' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class='FieldLabel'>Limit: 100 characters</td>
	</tr>
	<tr>
		<td><b><%=GetLabel("ProgramName")%></b></td>
		<td><span id='spnProgram' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Time Period/Award Cycle</b></td>
		<td><span id='spnTimePeriod' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Active Committee?</b></td>
		<td><span id='spnInactive' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Select Committee Members</b></td>
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
	<tr>
		<td colspan="2">
			<span runat='server' id='spnReviewCommitteeMember'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" align='center'>
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
				<Argument Type='QueryString' TypeKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ReviewCommitteeDescription'>
					<Control ID='ctlName'
						Type='cTextBox'
						Container='spnName'
						Size='50'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Committee Name is required.'>
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
		
		<DataObject Key='ReviewCommitteeProgram' DataObjectDefinitionKey='ReviewCommitteeProgram' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewCommittee' DataObjectPropertyKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='ReviewCommittee' DataObjectPropertyKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ProgramID'>
					<Control ID='ctlProgram'
						Container='spnProgram'
						Type='cDropDown'
						DataObjectDefinitionKey='Program'
						StoredValue='ProgramID'
						DisplayValue='ProgramName'
						DisplayNone='False'
						DisplayText='Select'>
						<Sort>
							<Argument PropertyKey='ProgramName' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TimePeriodID'>
					<Control ID='ctlTimePeriod'
						Container='spnTimePeriod'
						Type='cDropDown'
						DataObjectDefinitionKey='TimePeriod'
						StoredValue='TimePeriodID'
						DisplayValue='Description'
						DisplayNone='False'
						DisplayText='Select'>
						<Sort>
							<Argument PropertyKey='Description' />
						</Sort>
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
						StoredDisplayValue='Person.LastNameFirstName' 
						Height='9'
						DisplaySort='False'
						DisplayNone='False'
						DisplayMoveAll='True'>
						<Filters>
							<Argument Type='Data' TypeKey='' PropertyKey='IsReviewer' Value='1'/>
							<Argument Type='QueryString' TypeKey='find' Operator='Like' PropertyKey='LastName'/>
							<Argument Type='' TypeKey='' PropertyKey='ReviewerStatusID' Value='1' bool=''>
								<RelatedProperty PropertyKey='PersonReviewer'/>
							</Argument>
						</Filters>
						<Sort>
	                        <Argument PropertyKey='LastName' Direction='Ascending'/>   
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
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='CommitteesEditor'/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCommittee' DataObjectPropertyKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID' BaseValue='ReviewCommitteeID='/>
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
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='CommitteeMember'/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCommittee' DataObjectPropertyKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID' BaseValue='ReviewCommitteeID='/>
								<Argument Type='QueryString' TypeKey='ParentRCID' PropertyKey='ParentRCID' BaseValue='ParentRCID='/>
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
							AutoSave='True'
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
