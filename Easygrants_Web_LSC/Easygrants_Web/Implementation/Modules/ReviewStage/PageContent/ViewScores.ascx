<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.ReviewStage.PageContent.cViewScores" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>

	
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<!-- Control Label (for Publication upload) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td>
			This page lists all applications in this committee.  Click on the <b>View</b> button to view 
			the critique submitted by the reviewer.  The critique will open in a secondary browser 
			window while this window remains intact.     
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>All Applications</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='90%'>
	<tr><td width=1%></td>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center' visible='False'>
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

		<DataObject Key='ReviewCommittee' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Group='('/>
					<Argument Type='Data' 
						TypeKey='ReviewAssignmentTypeID' 
						PropertyKey='ReviewAssignmentTypeID' 
						Value='1' 
						Bool=''/>
					<Argument Type='Data' 
						TypeKey='ReviewAssignmentTypeID' 
						PropertyKey='ReviewAssignmentTypeID' 
						Value='2' 
						Bool='Or'/>
					<Argument Type='Data' 
						TypeKey='ReviewAssignmentTypeID' 
						PropertyKey='ReviewAssignmentTypeID' 
						Value='3' 
						Bool='Or'/>
				<Argument Group=')' Bool=''/>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskAssignmentID' 
					PropertyKey='WfTaskAssignmentID' 
					Value='' 
					Bool='And'/>				
			</Filters>
		</DataObject>	
		
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewCommittee' DataObjectPropertyKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID'/>			
			</Filters>
		</DataObject>

	  
		<DataObject Key='WfTaskAssignmentList' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID'/>	
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='WfTaskID' Value='' />
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
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
								<!-- <Action PostBack='False' Target='Blank' URL='/Easygrants_v4_AHA_r1/Easygrants/Controls/Base/pgSupportForm.aspx?Type=Tech'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' Value=''/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' Value=''/>
									</Parameters>
								</Action> -->
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
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose' Container='spnClose' Type='cButton' Image='Close'>
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


