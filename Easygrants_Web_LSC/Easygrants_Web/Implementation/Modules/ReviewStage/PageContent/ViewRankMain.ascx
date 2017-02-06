<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.ReviewStage.PageContent.cViewRankMain" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIABLE CONTENT AREA -->
<br>
         <span id='spnPageContent' runat='server' />
<p>

<!-- Control Label (for Publication upload) -->

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Rank, Scores and Critiques</b></td>
	</tr>
</table>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='90%'>
	<tr>	
		<td>
			<span runat='server' id='spnHeader'></span>
		</td>
	</tr>
	<tr>	
		<td>
			<span runat='server' id='spnViewRank'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2' width='15%'>
			<span id='spnSecondaryCritique' runat='server' visible='true'/>
		</td>
	</tr>
	<tr>
		<td>
			<span id='spnReaderCritique' runat='server' visible='true'/>
		</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center' visible='true'>
	<tr>

		<td>
			<span runat='server' id='spnClose' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<!-- Page Content - Controls -->

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	  <PageContent />
	
		<DataObject Key='GranteeProjectReviewStages' DataObjectDefinitionKey='GranteeProjectReviewStage'>
			<Filters>
				<Argument Type='Data' 
					TypeKey='ReviewTaskID' 
					PropertyKey='ReviewTaskID' 
					Value='3' 
					Bool=''/>
				<Argument Type='ModuleUser' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' 
					Bool='And'/>
			</Filters>
			<DisplayProperties>	
				<!-- <DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						NoRecordMessage='No application tasks.'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName' ColumnHeader='Applicant Name'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
								</Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
								</Argument>
								<Argument PropertyKey='MiddleName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProjectInfo.ScienceClassification.Description' ColumnHeader='Primary Science'>
						<Sortable>
							<Argument PropertyKey='Description'>
								<RelatedProperty PropertyKey='GranteeProjectInfo.ScienceClassification'/>
							</Argument>
						</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Scores and Critique'>
							<Control ID='btnViewCritique'
								Container='spnViewCritique'
								Type='cButton'
								Image='View'>
								</Action>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='ViewScores'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' BaseValue=''/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue=''/>
										<Argument Type='DataObjectRelated' TypeKey='GranteeProject.ApplicantWfTaskAssignment.WfTaskAssignmentID' AttributeName='GranteeProject.ApplicantWfTaskAssignment.WfTaskAssignmentID' BaseValue=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskAssignmentID' ColumnHeader='WFTAID' />
					</Control>
				</DisplayProperty> -->
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlHeader'
						Container='spnHeader'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlViewRank'
						Container='spnViewRank'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>	
					
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlSecondaryCritique'
						Container='spnSecondaryCritique'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlReaderCritique'
						Container='spnReaderCritique'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose' Container='spnClose' Type='cButton' Image='Close'>
						<Action PostBack='True' Object='WebSession' Method='RedirectToModule'>
							<Parameters>
								<Argument Value='Home' />
								<Argument Value='HomeModuleConfig' />
								<Argument Value='Home' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>							
			</DisplayProperties>
		</DataObject>
	
	
	</ModuleSection>
</span>


