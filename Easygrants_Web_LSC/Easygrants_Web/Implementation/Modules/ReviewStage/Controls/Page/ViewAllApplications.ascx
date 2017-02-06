<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page.cViewAllApplications" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>

<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- "Content Manager" tags -->
<br>
<span id='spnPageContent' runat='server' />
<br><br>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td class='SeparatorHdg'>All Applications</td></tr>	
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
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
		<DataObject Key='ExternalReviewAllApplications' DataObjectDefinitionKey='ExternalReviewAllApplications' Updatable='False'>
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
						<DisplayProperty PropertyKey='AppWfta.GranteeProject.GranteeProjectID' ColumnHeader='GrantId' ConfigurableHeader='True' Width='20%'>	
							<Sortable>
								<Argument PropertyKey='GranteeProjectID'>
									<RelatedProperty PropertyKey='AppWfta.GranteeProject' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='AppWfta.GranteeProject.GrantTitle' ColumnHeader='ProjectTitle' Width='30%' ConfigurableHeader='True'>
							<Sortable>
									<Argument PropertyKey='GrantTitle'>	
										<RelatedProperty PropertyKey='AppWfta.GranteeProject'/>
									</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='AppWfta.GranteeProject.PrimaryOrganization.CommonOrganizationName' ColumnHeader='~~Organization~~' Width='20%'>
							<Sortable>
									<Argument PropertyKey='CommonOrganizationName'>	
										<RelatedProperty PropertyKey='AppWfta.GranteeProject.PrimaryOrganization'/>
									</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ApplicantName' ColumnHeader='Primary Contact' Width='20%'>
							<Sortable>	
								<Argument PropertyKey='ApplicantName'/>
							</Sortable>							
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
