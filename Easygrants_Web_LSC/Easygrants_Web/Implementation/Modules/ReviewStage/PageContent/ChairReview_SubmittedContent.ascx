<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.ReviewStage.PageContent.cChairReview_SubmittedContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>

	
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<!-- USER MODIFIABLE CONTENT AREA -->
<br>   
<!-- Control Label (for Publication upload) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td>
			Thank you for submitting your review assignments! This page provides links to reports of 
			assignments - by reviewer, by applicant, and all - sorted by applicant.  Click the <b>View 
			Assignment by...</b> link for the desired report.  The report will open in a secondary browser 
			window - and can be printed or saved for future use.       
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			To return to your Home page To Do list at any time, click the <b>Home</b> link to the left.     
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

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


