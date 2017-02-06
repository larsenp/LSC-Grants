<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cAllRequestConflictEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="AllRequestConflictEditor.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' Namespace='Core.Web.Navigation.CrumbTrail' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

 <asp:CustomValidator 
				id='valOptionConflict'
				runat='server'
				OnServerValidate='ValidateOptionConflict'
				ErrorMessage=''
				Display='None'/>


<!-- USER MODIFIABLE CONTENT AREA -->
<br />
<br />


<Core:cUserCtlLoader CtlID='ReviewStageInfo'
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewStageInfo.ascx'
	runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Review Assignment Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Reviewer</b></td>
		<td><span runat='server' id='spnName'/></td>
		<td><b>Committee</b></td>
		<td><span runat='server' id='spnCommittee'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<br />
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Editor</b></td>
	</tr>
	<tr>
		<td>
			To modify an <i>external</i> Conflict/Preference, select the Type and then select 
			the appropriate Conflict/Preference Type from the drop-down.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
		   
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center' width='100%'>
	<tr>
		<td align='center'><span runat='server' id='spnSave' />&nbsp;&nbsp;
		<span runat='server' id='spnSaveClose' />&nbsp;&nbsp;
		<span runat='server' id='spnClose' /></td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewCycle' DataObjectDefinitionKey='ReviewCycle'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID'/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='ReviewCycleCommittee.ReviewCommittee.ReviewCommitteeDescription'>
					<Control ID='spnCommittee' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID'/>
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='Person.LastNameFirstNameMiddleName'>
					<Control ID='spnName' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTaskAssignmentList' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='EntityID' PropertyKey='PersonID' />
				<Argument Type='Data' TypeKey='WfTaskRoleID' PropertyKey='WfTaskRoleID' Value='7' Bool='And'/>
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID' Bool='And'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName'>
					<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
				</Argument>
				<Argument PropertyKey='FirstName'>
					<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
				</Argument>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						NoRecordMessage='No reviewer tasks.'
						MaxPerPage='500'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName' ColumnHeader='Participant'>
							<Sortable>
								<Argument PropertyKey='LastNameFirstNameMiddleName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.CommonOrganizationName' ColumnHeader='Participant ~~Organization~~'>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryOrganization'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatus' ColumnHeader='Status'>
							<Sortable>
								<Argument PropertyKey='WfTaskStatus'>
									<RelatedProperty PropertyKey='WfTaskStatus'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='ReviewPreferenceTypeID' ColumnHeader='Preferences/Conflicts' DataAlign='Center' HeaderAlign='Center'>
							<Control ID='ctlOptions'
								Type='cRadioButtonList'
								LoadParam='True'
								RepeatDirection='Horizontal'
								RepeatColumns='0'
								RequiredField='True'
								ErrorMessage='Rating is required.'>
								<Parameters>
									<Parameter StoredValue='1' DisplayValue='Able'/>
							        <Parameter StoredValue='2' DisplayValue='Not Able'/>
							        <Parameter StoredValue='3' DisplayValue='Preferred'/>
							        <Parameter StoredValue='4' DisplayValue='Conflict'/>
								</Parameters>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewConflictTypeID' ColumnHeader='Conflict Type' HeaderAlign='Center'>
							<Control ID='ctlConflictType'
								Type='cDropDown'
								DataObjectDefinitionKey='ConflictType'
								StoredValue='ConflictTypeID'
								DisplayValue='Description'>
								<Sort>
									<Argument PropertyKey='Description' />
								</Sort>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>				
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
					<Control ID='btnSaveClose'
						Container='spnSaveClose'
						Type='cButton'
						Image='Save_And_Close'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
