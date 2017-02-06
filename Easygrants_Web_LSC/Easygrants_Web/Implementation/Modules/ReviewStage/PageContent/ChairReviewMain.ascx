<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.ReviewStage.PageContent.cChairReviewMain" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>

	
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<!-- USER MODIFIABLE CONTENT AREA -->
<br>
    <span id='spnPageContent' runat='server' />
<p>

<!-- Control Label (for Publication upload) -->

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Assignments</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td width='15%'>
			<b>Committee Name</b>
		</td>
		<td><span runat='server' id='spnReviewCommittee' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'><span runat='server' id='spnViewByReviewer' /></td>
	</tr>
		<tr>
		<td colspan='2'><span runat='server' id='spnViewByApplicant' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center' visible='true'>
	<tr>
		<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span runat='server' id='spnSubmit' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<!-- Page Content - Controls -->

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	 <PageContent />
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskAssignmentID' 
					PropertyKey='WfTaskAssignmentID' 
					Value='' 
					Bool=''/>			
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='ReviewCommitteeName.ReviewCommitteeDescription'>
					<Control ID='spnReviewCommittee'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control Container='spnViewByReviewer' 
						ID='ctlViewByReviewer'
						Type='cLink'
						Caption='View Assignments by Reviewer'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='ViewAssignmentsByReviewer'>
							<Parameters>
								<Argument Type='DataObjectCollection' 
									TypeKey='WfTaskAssignment' 
									DataObjectPropertyKey='ReviewCommitteeID' 
									PropertyKey='ReviewCommitteeID' 
									BaseValue=''/>
								<Argument Type='DataObjectCollection' 
									TypeKey='WfTaskAssignment' 
									DataObjectPropertyKey='ReviewCycleStageID' 
									PropertyKey='ReviewCycleStageID' 
									BaseValue=''/>
								<Argument Type='DataObjectCollection' 
									TypeKey='WfTaskAssignment' 
									DataObjectPropertyKey='GranteeProjectID' 
									PropertyKey='GranteeProjectID' 
									BaseValue=''/>
								<Argument Type='DataObjectCollection' 
									TypeKey='WfTaskAssignment' 
									DataObjectPropertyKey='GranteeProject.ApplicantWfTaskAssignment.WfTaskAssignmentID' 
									PropertyKey='GranteeProject.ApplicantWfTaskAssignment.WfTaskAssignmentID' 
									BaseValue=''/>
							</Parameters>
						</Action>		
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control Container='spnViewByApplicant' 
						ID='ctlViewByApplicant'
						Type='cLink'
						Caption='View Assignments by Applicant'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='ViewAssignmentsByApplicant'>
							<Parameters>
								<Argument Type='DataObjectCollection' 
									TypeKey='WfTaskAssignment' 
									DataObjectPropertyKey='ReviewCommitteeID' 
									PropertyKey='ReviewCommitteeID' 
									BaseValue=''/>
								<Argument Type='DataObjectCollection' 
									TypeKey='WfTaskAssignment' 
									DataObjectPropertyKey='ReviewCycleStageID' 
									PropertyKey='ReviewCycleStageID' 
									BaseValue=''/>
								<Argument Type='DataObjectCollection' 
									TypeKey='WfTaskAssignment' 
									DataObjectPropertyKey='GranteeProjectID' 
									PropertyKey='GranteeProjectID' 
									BaseValue=''/>
								<Argument Type='DataObjectCollection' 
									TypeKey='WfTaskAssignment' 
									DataObjectPropertyKey='GranteeProject.ApplicantWfTaskAssignment.WfTaskAssignmentID' 
									PropertyKey='GranteeProject.ApplicantWfTaskAssignment.WfTaskAssignmentID' 
									BaseValue=''/>
							</Parameters>
						</Action>			
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>		
					
				
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit'
						Container='spnSubmit'
						Type='cButton'
						Image='Submit'
						Confirmation='Submission will prevent any further changes. Are you ready to submit?'>
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


