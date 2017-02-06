<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page.cConflictsAndPreferences_ViewAllApps" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>

<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- "Content Manager" tags -->
<br>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
<tr>
	<td class="SeparatorHdg"><b>Instructions</b></td>
</tr>
<tr>
	<td>&nbsp;</td>
</tr>
<tr>
	<td><span id='spnPageContent' runat='server' /></td>
</tr>
</table>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td class='SeparatorHdg'>All Applications</td></tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
      <PageContent />
		<DataObject Key='ReviewWfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
			</Filters>
		</DataObject>
		<DataObject Key='ExternalReviewApplicationsList' DataObjectDefinitionKey='ExternalReviewApplicationsList' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='RevWfTaskID' />	
				<Argument Type='DataObjectCollection' TypeKey='ReviewWfTaskAssignment' DataObjectPropertyKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='ApplicantName'/>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						NoRecordMessage='No reviewer tasks.'
						SeparatorWidth='2'
						MaxPerPage='25'
						ShowSubColumnHeaderRow='False'>		
						<DisplayProperty PropertyKey='' ColumnHeader=' '  Width='10%'>														
							<Control ID='btnView'
								Type='cButton'
								Container='spnViewApp'
								Caption='View PDF'
								Image='view_pdf'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='ViewPDF'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='AppWftaID' AttributeName='WfTaskAssignmentID='/>												
									</Parameters>
								</Action>
							</Control>									
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='GrantId' ConfigurableHeader='True' Width='20%'>	
							<Sortable>
								<Argument PropertyKey='GranteeProjectID'/>
							</Sortable>
							<Control ID='ctlLinkGrantID' Type='cLink' >
								<Action
									PostBack='True'
									AutoSave='True'
									Object='DataPresenter'
									Method='ViewParticipantSummary'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ParticipantSummary'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ApplicantName' ColumnHeader='Primary Contact/PI' Width='20%'>
							<Sortable>	
								<Argument PropertyKey='ApplicantName'/>
							</Sortable>							
						</DisplayProperty>
						<DisplayProperty PropertyKey='AppWfta.GranteeProject.PrimaryOrganization.CommonOrganizationName' ColumnHeader='~~Organization~~' Width='20%'>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='AppWfta.GranteeProject.PrimaryOrganization'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>