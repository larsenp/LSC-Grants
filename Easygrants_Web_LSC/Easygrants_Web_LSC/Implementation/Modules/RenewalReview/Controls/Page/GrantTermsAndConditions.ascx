<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />

<div class='SeparatorHdg' width='100%'>
	Instructions
</div>
<br />

<Core:cUserCtlLoader CtlID='ctlAppInfo'
	Src='Implementation/Modules/RenewalReview/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='ctlGrantInfo'
	Src='Implementation/Modules/RenewalReview/Controls/PageSection/GrantInformation.ascx'
	runat='server'/>

<div class='SeparatorHdg' width='100%'>
	PART IV. SPECIAL GRANT CONDITIONS AND OTHER IDENTIFIED ISSUES
</div>
<p>A. Proposed special grant conditions should be identified and explained here. Click the buttons below to add or delete special grant conditions. </p>
<p><span runat='server' id='spnNoGrantConditions' /> No Grant Conditions to Add</p>

<span runat='server' id='spnAdd' /><br />
<span runat='server' id='spnGrantConditions' /><br />

<p>In the box below, enter the grant conditions to be included in the Grant Award Package.</p>
<span runat='server' id='spnSpecialGrantConditions' /><br />

<p>List and describe other identified issues that should be tracked by staff during the grant term. (Examples include: 
subgrant issues, PAI plans, client service data, technology, staffing patterns.) </p>
<span runat="server" id='spnNoOtherIssues' /> None<br /><br />
<span runat="server" id='spnOtherIssues' />
<br /><br />

<table width='100%'>
	<tr>
		<td>
			<b>Primary Reader</b>
		</td>
		<td>
			<span runat='server' id='spnPrimaryReaderPersonID' />
		</td>
		<td>
			<b>Date</b> 
			<span runat='server' id='spnPrimaryReaderDate' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Recommendation Reader</b>
		</td>
		<td>
			<span runat='server' id='spnRecReaderPersonID' />
		</td>
		<td>
			<b>Date</b> 
			<span runat='server' id='spnRecReaderDate' />
		</td>
	</tr>
	<tr>
		<td>
			<b>OPP Management</b>
		</td>
		<td>
			<span runat='server' id='spnOPPMgmtPersonID' />
		</td>
		<td>
			<b>Date</b> 
			<span runat='server' id='spnOPPMgmtDate' />
		</td>
	</tr>
</table>
<br /><br />
<table width='100%'>
	<tr>
		<td align=center>
			<span runat='server' id='spnSave' />&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnContinue' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewedWfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTAYear' Value='2009'>
					<RelatedProperty PropertyKey='WfTACompetitionYear' />
				</Argument>
				<Argument Group='(' Bool='And' />
				<Argument PropertyKey='WfTaskID' Value='2' Bool=''/>
				<Argument PropertyKey='WfTaskID' Value='4' Bool='Or'/>
				<Argument Group=')' Bool='' />
			</Filters>
		</DataObject>
		<DataObject Key='LscRenewalRec' DataObjectDefinitionKey='LscRenewalRec' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Create='True' Update='False'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='NoGrantConditions'>
					<Control ID='chkNoGrantConditions'
						Type='cCheckBox'
						Container='spnNoGrantConditions' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd'
						Type='cButton'
						Container='spnAdd'
						Caption='Add'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='GrantTermsAndConditionsEditor' />
								<Argument Value='GrantConditionID=0' />
								<Argument Type='DataObjectCollection' TypeKey='ReviewedWfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' BaseValue='ReviewedWfTaskAssignmentID=' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SpecialGrantConditions'>
					<Control ID='txtSpecialGrantConditions'
						Type='cTextArea'
						Container='spnSpecialGrantConditions'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='NoOtherIssues'>
					<Control ID='txtNoOtherIssues'
						Type='cCheckBox'
						Container='spnNoOtherIssues'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherIssues'>
					<Control ID='txtOtherIssues'
						Type='cTextArea'
						Container='spnOtherIssues'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryReaderPersonID'>
					<Control ID='ctlPrimaryReaderPersonID' 
						Type='cDropDown' 
						Container='spnPrimaryReaderPersonID'
						DisplayValue='Person.FirstNameLastName'
						StoredValue='PersonID'
						DataObjectDefinitionKey='PersonReviewer'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryReaderDate'>
					<Control ID='ctlPrimaryReaderDate' 
						Type='cDateTextBox' 
						Container='spnPrimaryReaderDate'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='Primary Reader Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='Primary Reader Date must be in mm/dd/yyyy format.'
						Size='25'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecReaderPersonID'>
					<Control ID='ctlRecReaderPersonID' 
						Type='cDropDown' 
						Container='spnRecReaderPersonID'
						DisplayValue='Person.FirstNameLastName'
						StoredValue='PersonID'
						DataObjectDefinitionKey='PersonReviewer'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecReaderDate'>
					<Control ID='ctlRecReaderDate' 
						Type='cDateTextBox' 
						Container='spnRecReaderDate'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='Recommendation Reader Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='Recommendation Reader Date must be in mm/dd/yyyy format.'
						Size='25'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OPPMgmtPersonID'>
					<Control ID='ctlOPPMgmtPersonID' 
						Type='cDropDown' 
						Container='spnOPPMgmtPersonID'
						DisplayValue='Person.FirstNameLastName'
						StoredValue='EntityID'
						DataObjectDefinitionKey='ContactCategoryMember'>
						<Filters>
							<Argument PropertyKey='ContactCategoryID' Value='1' />
							<Argument PropertyKey='EntityTypeID' Value='1' />
						</Filters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OPPMgmtDate'>
					<Control ID='ctlOPPMgmtDate' 
						Type='cDateTextBox' 
						Container='spnOPPMgmtDate'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='OPP Management Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='OPP Management Date must be in mm/dd/yyyy format.'
						Size='25'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'
						Enter='False'
						Caption='Save and Continue'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscGrantCondition' DataObjectDefinitionKey='LscGrantCondition' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewedWfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='ReviewedWfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlGrantConditions'
						Type='cDataListCtl'
						Container='spnGrantConditions'
						SeparatorWidth='2'
						DataObjectDefinitionKey='LscGrantCondition'>
						<DisplayProperty PropertyKey='LscGrantConditionType.Description' ColumnHeader='Condition' />
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'  Width='25%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GrantTermsAndConditionsEditor'/>
										<Argument Type='DataObject' TypeKey='LscGrantConditionID' AttributeName='GrantConditionID' BaseValue='GrantConditionID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='LscGrantConditionID' AttributeName='LscGrantConditionID'/>
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
