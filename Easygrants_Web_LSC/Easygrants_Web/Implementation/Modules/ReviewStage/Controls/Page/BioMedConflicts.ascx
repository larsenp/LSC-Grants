<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="BioMedConflicts.ascx.vb" Inherits="Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page.cBioMedConflicts" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<!-- USER MODIFIABLE CONTENT AREA -->
<!-- "Content Manager" tags -->
<span id='spnSubmitted' runat='server'>
	Thank you for submitting your conflicts.  Shown below are the choices that you submitted.<br>
	<br>
	<b>Note:</b> To distribute applications appropriately among reviewers, any application
	below that is marked "None" could be assigned to you for review.
</span>
<span id='spnUnsubmitted' runat='server'>
	<span id='spnPageContent' runat='server' />
	<br><br>
</span>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr id='trSave2'>
		<td colspan='2'>
			<span runat='server' id='spnSave2' />&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSubmit2' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Conflicts</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>
	<tr id='trSave1'>
		<td colspan='2'>
			<span runat='server' id='spnSave' />&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSubmit' />
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent />
	
		<DataObject Key='MedPhysicianRCList' DataObjectDefinitionKey='MedPhysicianRCList'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ReviewerID' Value='' />
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='RevWfTaskID' Value='' />
			</Filters>
			<Sort>
				<Argument PropertyKey='CommonOrganizationName'>
					<RelatedProperty PropertyKey='AppPerson.PersonPrimaryAffiliation.Organization'/>
				</Argument>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='MedPhysicianRCList'
						NoRecordMessage='No reviewer tasks.'
						IsSaveOnSort='True'
						SeparatorWidth='2'
						MaxPerPage='600'>
						<DisplayProperty PropertyKey='' ColumnHeader=''>
							<Control ID='btnProjectTeam'
								Type='cButton'
								Image='Project_Team'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ProjectTeam'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='AppPerson.PersonPrimaryAffiliation.Organization.CommonOrganizationName' ColumnHeader='Organization'>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='AppPerson.PersonPrimaryAffiliation.Organization'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='ApplicantName' ColumnHeader='Applicant'>
							<Sortable>
								<Argument PropertyKey='ApplicantName'/>
							</Sortable>
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='RequestConflictID' ColumnHeader='Options' DataAlign='Center' HeaderAlign='Center'>
							<Parameters>
								<Argument Value='2' ValueKey='WfTaskStatusID' DisplayValue='' PropertyKey='RequestConflict' />
								<Argument Value='1' ValueKey='WfTaskStatusID' DisplayValue='Control' PropertyKey='RevWftaID'>
									<Control ID='ctlOptions'
										Type='cRadioButtonList'
										LoadParam='True'
										RepeatDirection='Horizontal'
										RepeatColumns='0'
										RequiredField='True'
										ErrorMessage='Rating is required.'>
										<Parameters>
											<Parameter StoredValue='2' DisplayValue='Conflict'/>
											<Parameter StoredValue='0' DisplayValue='None'/>
										</Parameters>
									</Control>
								</Argument>
							</Parameters>
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
						Image='Save' EnterKey='True'
						ToolTipText='Save and stay on this page'>
						<Action
							PostBack='True'
							AutoSave='True'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit'
						Container='spnSubmit'
						Type='cButton'
						Image='Submit'
						ToolTipText='Submit your final selections'
						Confirmation='Are you sure you want to Submit?  Once you submit, you will not be able to make changes to your Preferences.'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='DataPresenter'
							Method='Submit'>
							<Parameters>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave2'
						Container='spnSave2'
						Type='cButton'
						Image='Save'
						ToolTipText='Save and stay on this page'>
						<Action
							PostBack='True'
							AutoSave='True'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit2'
						Container='spnSubmit2'
						Type='cButton'
						Image='Submit'
						ToolTipText='Submit your final selections'
						Confirmation='Are you sure you want to Submit?  Once you submit, you will not be able to make changes to your Preferences.'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='DataPresenter'
							Method='Submit'>
							<Parameters>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
