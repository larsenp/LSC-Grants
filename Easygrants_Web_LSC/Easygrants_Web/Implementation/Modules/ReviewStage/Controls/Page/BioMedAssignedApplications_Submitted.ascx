<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="False" %>

<!-- USER MODIFIABLE CONTENT AREA -->
<!-- "Content Manager" tags -->
<!-- Control Label (for Publication upload) -->
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="2">
			Thank you for submitting your ratings and comments.  Shown below is the
			information you submitted. Click the <b>Log Out</b> link in the left navigation
			bar to exit.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Assigned Applications</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Page Content - Controls -->
<a name='List'/>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='90%'>
	<tr><td width=1%></td>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
			</Filters>
		</DataObject>
		<DataObject Key='ReviewCycleStage' DataObjectDefinitionKey='ReviewCycleStage' Updatable='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
			</Filters>
		</DataObject>

		<DataObject Key='BioMedAssignedApplicationsList' DataObjectDefinitionKey='BioMedAssignedApplicationsList' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ReviewerID' Value='' />
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='RevWfTaskID' Value=''/>
				<Argument Type='DataObjectCollection' TypeKey='ReviewCycleStage' DataObjectPropertyKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
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
						DataObjectDefinitionKey='GradAssignedApplicationsList'
						NoRecordMessage='No reviewer tasks.'
						SeparatorWidth='2'
						MaxPerPage='25'
						ShowSubColumnHeaderRow='False'>
						<DisplayProperty PropertyKey='ViewApplicationURL' ColumnHeader='Application' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnViewPDF'
								Type='cButton'  DisableControl='False'
								Image='View_PDF'>
								<Action
									PostBack='False'
									Target='_blank'
									URL='WebRelative'/>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='AppPerson.PersonPrimaryAffiliation.Organization.CommonOrganizationName' ColumnHeader='Organization' NoWrap='true'>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='AppPerson.PersonPrimaryAffiliation.Organization'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ApplicantName' ColumnHeader='Applicant' NoWrap='true'>
							<Sortable>
								<Argument PropertyKey='ApplicantName'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Rating' ColumnHeader='Rating' NoWrap='True'>
							<Parameters>
								<Argument Value='2' Operator='LessThan' ValueKey='Rating' DisplayValue='A'/>
								<Argument Value='3' Operator='LessThan' ValueKey='Rating' DisplayValue='B'/>
								<Argument Value='4' Operator='LessThan' ValueKey='Rating' DisplayValue='C'/>
								<Argument Value='5' Operator='LessThan' ValueKey='Rating' DisplayValue='D'/>
								<Argument Value='5' Operator='GreaterThanEqual' ValueKey='Rating' DisplayValue='F'/>
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' HeaderAlign='Center' DataAlign='Center' ColumnHeader='Comments'>
							<Control ID='btnEditComment'
								Type='cButton'
								Image='View'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument Value='ViewComments'/>
										<Argument Type='DataObject' TypeKey='RevWftaID' AttributeName='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' Value=''/>
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