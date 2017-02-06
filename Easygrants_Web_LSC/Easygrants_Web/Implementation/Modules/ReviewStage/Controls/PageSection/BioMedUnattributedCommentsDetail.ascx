<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="BioMedUnattributedCommentsDetail.ascx.vb" Inherits="Easygrants_Web.Modules.ReviewStage.Controls.PageSection.cBioMedUnattributedCommentsDetail" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<table id='tabComments' runat='server' width='100%' borders='0'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2">
			<span runat='server' id='spnClose'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="SeparatorHdg" colspan="2">Unattributed Comments</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>	
	<tr>
		<td width='11%'>Organization:</td>
		<td width='89%'><span id='spnInstitution' runat='server'/></td>		
	</tr>
	<tr id='trNoRatings' visible='true'>
		<td colspan="2"><i>No ratings or comments have been entered for this applicant.</i></td>
	</tr>	
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent />
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>	
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='WfTaskID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.PersonPrimaryAffiliation.Organization.CommonOrganizationName'>
					<Control ID='spnInstitution' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							AutoSave='False'
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
		<DataObject Key='WfTaskAssignmentReview' DataObjectDefinitionKey='WfTaskAssignmentReview'>	
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
				<!--
				<Argument Type='' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID'
					Value='not null' 
					bool=''>
					<RelatedProperty PropertyKey='WfTaskAssignment' >
						<JoinFilter>
							<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='WfTaskID'/>
						</JoinFilter>
					</RelatedProperty>
				</Argument>
				-->
			</Filters>			
			<Sort>
				<Argument PropertyKey='PersonID' Direction='Ascending'>
					<RelatedProperty PropertyKey='WfTaskAssignment'/>
				</Argument>
				<Argument PropertyKey='RatingTypeID' Direction='Ascending'/>
			</Sort>
			<DisplayProperties>						
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
