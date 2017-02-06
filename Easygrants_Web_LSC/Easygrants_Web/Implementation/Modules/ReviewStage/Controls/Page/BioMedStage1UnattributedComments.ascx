<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<span id='spnPageContent' runat='server' />
<p>

<span runat='server' id='spnUnattributedCommentsList' visible='true'></span>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent />
		<DataObject Key='ReviewCycleStage' DataObjectDefinitionKey='ReviewCycleStage'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='WfTaskID' />
			</Filters>
		</DataObject>
		<DataObject Key='vBiomedUACStage1' DataObjectDefinitionKey='vBiomedUACStage1'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewCycleStage' PropertyKey='ReviewCycleStageID' DataObjectPropertyKey='ReviewCycleStageID'/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ReviewerID' Value=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='CommonOrganizationName'>
					<RelatedProperty PropertyKey='AppPerson.PersonPrimaryAffiliation.Organization'/>
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlUnattributedCommentsList'
						Container='spnUnattributedCommentsList'
						Type='cDataListCtl'
						MaxPerPage='25'
						SeparatorWidth='2'>
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
						<DisplayProperty PropertyKey=''>
							<Control ID='btnView'
								Type='cButton'
								Image='View Comments'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument Value='UnattributedCommentsDetail'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID=' Value=''/>
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
<!-- End Embedded XML -->
