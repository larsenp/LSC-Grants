<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.TIG_ApplReview.Forms.Open_Repl_WebImpr.cProjectNarrative" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlReviewInfo' 
	Src='Implementation/Modules/TIG_ApplReview/Forms/ReviewInfo.ascx'
	runat='server'/>
	
<div class='SeparatorHdg'>Project Narrative</div>
<br />
<b>1. A full description of the project, including the specific technology(ies) the project will develop or implement</b>
<br />
<span runat='server' id='spnDescription' />
<hr style="width:600px; background-color:Gray; text-align:left" />
<br />

<b>2. The need for the project</b>
<br />
<span runat='server' id='spnNeed' />
<br /><br />
<div style="left:20px; position:relative">

	<div class='MinorSeparatorHdg'>Comments from Other Reviewers</div>
	<br />
	<span runat='server' id='spnPNNeedCommentOther' />
	<br />
	<div class="MinorSeparatorHdg">Your Scores</div>
	<table>
		<tr>
			<td style="width:500px;">
				<b>Criterion</b>
			</td>
			<td style="width:50px;text-align:center">
				<b>Maximum Score</b>
			</td>
			<td style="width:50px;text-align:center">
				<b>Score</b>
			</td>
		</tr>
		<tr>
			<td>
				The application clearly describes nature and scope of the problem(s) the project will address
			</td>
			<td style="text-align:center">
				7
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnNeedClearlyDescribed'/>
			</td>
		</tr>
		<tr>
			<td>
				The application addresses the limitations of the current operational systems
			</td>
			<td style="text-align:center">
				4
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnNeedAddressLimitations'/>
			</td>
		</tr>
		<tr>
			<td>
				Response demonstrates how the technology proposed will address the identified need
			</td>
			<td style="text-align:center">
				4
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnNeedDemonstrateRelevance'/>
			</td>
		</tr>
		<tr>
			<td>
				BONUS: The project addresses one or more of LSC's areas of interest or is an LSC priority 
			</td>
			<td style="text-align:center">
				3
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnNeedAddressAreaOfInterest'/>
			</td>
		</tr>
	</table>
	<div class='MinorSeparatorHdg'>Your Comments</div>
	<br />
	<span runat='server' id='spnPNNeedComment' style="vertical-align:top"/><br />
</div>
<hr style="width:600px; background-color:Gray; text-align:left" />
<br />

<b>3. Project Goal, Objectives, Activities, and Evaluation</b>
<br />
<b>a. Specify the project’s goal and the objectives to achieve the goal. Explain how this will increase the quality or quantity of client services and/or enhance the grantee’s operational effectiveness and efficiency</b><font color='red'>*</font><br />
<span runat='server' id='spnGoalsObjectives' />
<br /><br />
<div style="left:20px; position:relative">
	<div class='MinorSeparatorHdg'>Comments from Other Reviewers</div>
	<br />
	<span runat='server' id='spnGoalsObjectivesCommentOther' />
	<br />
	<div class="MinorSeparatorHdg">Your Scores</div>
	<table>
		<tr>
			<td style="width:500px;">
				<b>Criterion</b>
			</td>
			<td style="width:50px;text-align:center">
				<b>Maximum Score</b>
			</td>
			<td style="width:50px;text-align:center">
				<b>Score</b>
			</td>
		</tr>
		<tr>
			<td>
				The application clearly articulates effective, concrete and measurable goals and objectives of the project.
			</td>
			<td style="text-align:center">
				10
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnGoalsClearlyArticulated'/>
			</td>
		</tr>
	 </table>
	<div class='MinorSeparatorHdg'>Your Comments</div>
	<br />
	<span runat='server' id='spnGoalsObjectivesComment' style="vertical-align:top"/><br />
</div>
<hr style="width:600px; background-color:Gray; text-align:left" />
<br />		
		
<b>b. Identify the strategies and activities that will be undertaken to achieve each of the project objectives.</b><font color='red'>*</font><br />
<span runat='server' id='spnActivities' />
<br /><br />
<div style="left:20px; position:relative">
	<div class='MinorSeparatorHdg'>Comments from Other Reviewers</div>
	<br />
	<span runat='server' id='spnActivitiesCommentOther' />
	<br />
	<div class="MinorSeparatorHdg">Your Scores</div>
	<table>
		<tr>
			<td style="width:500px;">
				<b>Criterion</b>
			</td>
			<td style="width:50px;text-align:center">
				<b>Maximum Score</b>
			</td>
			<td style="width:50px;text-align:center">
				<b>Score</b>
			</td>
		</tr>
		<tr>
			<td>
				The application identifies specific, reasonable activities and strategies that will be implemented to achieve the goals and objectives.
			</td>
			<td style="text-align:center">
				10
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnGoalsIdentifyStrategies'/>
			</td>
		</tr>
	 </table>
	<div class='MinorSeparatorHdg'>Your Comments</div>
	<br />
	<span runat='server' id='spnActivitiesComment' style="vertical-align:top"/><br />
</div>
<hr style="width:600px; background-color:Gray; text-align:left" />
<br />		

<b>c. Identify the evaluation methods and data sets that will be used to evaluate the project.</b><font color='red'>*</font><br />
<span runat='server' id='spnDataEvaluation' />
<br /><br />
<div style="left:20px; position:relative">
	<div class='MinorSeparatorHdg'>Comments from Other Reviewers</div>
	<br />
	<span runat='server' id='spnDataEvaluationCommentOther' />
	<br />
	<div class="MinorSeparatorHdg">Your Scores</div>
	<table>
		<tr>
			<td style="width:500px;">
				<b>Criterion</b>
			</td>
			<td style="width:50px;text-align:center">
				<b>Maximum Score</b>
			</td>
			<td style="width:50px;text-align:center">
				<b>Score</b>
			</td>
		</tr>
		<tr>
			<td>
				The application specifies appropriately detailed methods and data sets that will be used to evaluate the project.
			</td>
			<td style="text-align:center">
				5
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnGoalsSpecifyEvaluation'/>
			</td>
		</tr>
	</table>
	<div class='MinorSeparatorHdg'>Your Comments</div>
	<br />
	<span runat='server' id='spnDataEvaluationComment' style="vertical-align:top"/><br />
</div>
<hr style="width:600px; background-color:Gray; text-align:left" />
<br />

<b>4. Justice community partnerships</b>
<br />
<span runat='server' id='spnJusticePartnerships' />
<br /><br />
<div style="left:20px; position:relative">
	<div class='MinorSeparatorHdg'>Comments from Other Reviewers</div>
	<br />
	<span runat='server' id='spnPNJustPartCommentOther' />
	<br />
	<div class="MinorSeparatorHdg">Your Scores</div>
	<table>
		<tr>
			<td style="width:500px;">
				<b>Criterion</b>
			</td>
			<td style="width:50px;text-align:center">
				<b>Maximum Score</b>
			</td>
			<td style="width:50px;text-align:center">
				<b>Score</b>
			</td>
		</tr>
		<tr>
			<td>
				The application demonstrates participation of appropriate justice community stakeholders in the development and implementation of this project.
			</td>
			<td style="text-align:center">
				5
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnPartnerJusticeCommunity'/>
			</td>
		</tr>
	</table>
	<div class='MinorSeparatorHdg'>Your Comments</div>
	<br />
	<span runat='server' id='spnPNJustPartComment' style="vertical-align:top"/><br />
</div>
<hr style="width:600px; background-color:Gray; text-align:left" />
<br />

<b>5. Replication</b>
<br />
<span runat='server' id='spnProjectReplication' />
<br /><br />
<div style="left:20px; position:relative">
	<div class="MinorSeparatorHdg">Scores</div>
	<table>
		<tr>
			<td style="width:500px;">
				<b>Criterion</b>
			</td>
			<td style="width:50px;text-align:center">
				<b>Maximum Score</b>
			</td>
			<td style="width:50px;text-align:center">
				<b>Score</b>
			</td>
		</tr>
		<tr id='trReplHowReplicates' runat='server'>
			<td>
				The application addresses how the proposed project is replicating a prior TIG at a reduced cost
			</td>
			<td style="text-align:center">
				4
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnReplHowReplicates'/>
			</td>
		</tr>
		<tr id='trReplHowImproves' runat='server'>
			<td>
				 The application addresses how the proposed project will make improvements to a prior TIG project
			</td>
			<td style="text-align:center">
				2
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnReplHowImproves'/>
			</td>
		</tr>
		<tr>
			<td>
				The application identifies the degree to which the problem is commonly found in the legal services community and demonstrates that it would be of value to other LSC-funded programs
			</td>
			<td style="text-align:center">
				2
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnReplCommonProblem'/>
			</td>
		</tr>
		<tr id='trReplAdvantageOverExisting' runat='server'>
			<td>
				 The application demonstrate how the proposed project will promote replication by others in the legal services community, such as a plan to share information about the project at a conference or webinar, by providing a toolkit, and/or creating an online repository through Github or a similar service
			</td>
			<td style="text-align:center">
				2
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnReplAdvantageOverExisting'/>
			</td>
		</tr>
		<tr id='trReplEase' runat='server'>
			<td>
				 The application demonstrates the ease of replication and adaptation based on cost and complexity of the proposed project as well as how it could be implemented at a low cost in other service areas
			</td>
			<td style="text-align:center">
				4
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnReplEase'/>
			</td>
		</tr>
	</table>
	<div class='MinorSeparatorHdg'>Comments from Other Reviewers</div>
	<br />
	<span runat='server' id='spnPNProjRepCommentOther' />
	<br />
	<div class='MinorSeparatorHdg'>Your Comments</div>
	<br />
	<span runat='server' id='spnPNProjRepComment' style="vertical-align:top"/><br />
</div>
<hr style="width:600px; background-color:Gray; text-align:left" />
<br />

<b>6. Program capacity and the project staffing</b>
<br />
<span runat='server' id='spnCapacityStaffing' />
<br /><br />
<div style="left:20px; position:relative">
	<div class='MinorSeparatorHdg'>Comments from Other Reviewers</div>
	<br />
	<span runat='server' id='spnPNCapStaffCommentOther' />
	<br />
	<div class="MinorSeparatorHdg">Your Scores</div>
	<table>
		<tr>
			<td style="width:500px;">
				<b>Criterion</b>
			</td>
			<td style="width:50px;text-align:center">
				<b>Maximum Score</b>
			</td>
			<td style="width:50px;text-align:center">
				<b>Score</b>
			</td>
		</tr>
		<tr>
			<td>
				The application clearly identifies project team members with appropriate experience, expertise and capacity to implement the project.
			</td>
			<td style="text-align:center">
				10
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnCapTeamMembers'/>
			</td>
		</tr>
		<tr>
			<td>
				The application clearly demonstrates that the program has the organizational capacities necessary to successfully complete the project.
			</td>
			<td style="text-align:center">
				5
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnCapOrganization'/>
			</td>
		</tr>
	</table>
	<div class='MinorSeparatorHdg'>Your Comments</div>
	<br />
	<span runat='server' id='spnPNCapStaffComment' style="vertical-align:top"/><br />
</div>
<hr style="width:600px; background-color:Gray; text-align:left" />
<br />

<b>7. Past Performance</b>
<br />
<span runat='server' id='spnPastPerformance' />
<br /><br />
<div style="left:20px; position:relative">
	<div class='MinorSeparatorHdg'>Comments from Other Reviewers</div>
	<br />
	<span runat='server' id='spnPNPastPerformanceCommentOther' />
	<br />
	<div class="MinorSeparatorHdg">Your Scores</div>
	<table>
		<tr>
			<td style="width:500px;">
				<b>Criterion</b>
			</td>
			<td style="width:50px;text-align:center">
				<b>Maximum Score</b>
			</td>
			<td style="width:50px;text-align:center">
				<b>Score</b>
			</td>
		</tr>
		<tr>
			<td>
				Applicant has performed well on all past TIG projects, or applicant demonstrates lessons learned from previous delays and how they will ensure timely performance.  (Per TIG Program priorities, applicants that have never been awarded a TIG receive 10 points for this section. Reviewers should enter this score.)
			</td>
			<td style="text-align:center">
				10
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnPastTig'/>
			</td>
		</tr>
	</table>
	<div class='MinorSeparatorHdg'>Your Comments</div>
	<br />
	<span runat='server' id='spnPNPastPerformanceComment' style="vertical-align:top"/><br />
</div>
<hr style="width:600px; background-color:Gray; text-align:left" />
<br />

<b>8. Sustainability of the project</b>
<br />
<span runat='server' id='spnSustainability' />
<br /><br />
<div style="left:20px; position:relative">
	<div class='MinorSeparatorHdg'>Comments from Other Reviewers</div>
	<br />
	<span runat='server' id='spnPNSustainabilityCommentOther' />
	<br />
	<div class="MinorSeparatorHdg">Your Scores</div>
	<table>
		<tr>
			<td style="width:500px;">
				<b>Criterion</b>
			</td>
			<td style="width:50px;text-align:center">
				<b>Maximum Score</b>
			</td>
			<td style="width:50px;text-align:center">
				<b>Score</b>
			</td>
		</tr>
		<tr>
			<td>
				The application provides a clear strategy to sustain the project after the completion of the grant, including concrete plans for future support (if applicable) and an accurate assessment of future costs. 
			</td>
			<td style="text-align:center">
				7
			</td>
			<td style="text-align:center">
				<span runat='server' id='spnSustClearStrategy'/>
			</td>
		</tr>
	</table>
	<div class='MinorSeparatorHdg'>Your Comments</div>
	<br />
	<span runat='server' id='spnPNSustainabilityComment' style="vertical-align:top"/><br />
</div>
<hr style="width:600px; background-color:Gray; text-align:left" />
<br />
<b>Overall Comments on the Project Narrative</b><br />
<div style="left:20px; position:relative">
	<div class='MinorSeparatorHdg'>Comments from Other Reviewers</div>
	<br />
	<span runat='server' id='spnPNOverallCommentOther' />
	<br />
	<div class='MinorSeparatorHdg'>Your Comments</div>
	<br />
	<span runat='server' id='spnPNOverallComment' style="vertical-align:top"/><br />
</div>
<hr style="width:600px; background-color:Gray; text-align:left" />
<br />
<div style="text-align:center">
	<span runat='server' id='spnSave' />
	<span runat='server' id='spnSaveContinue' />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='41' />
				<Argument PropertyKey='WfTaskStatusID' Value='2' />
			</Filters>
		</DataObject>
		<DataObject Key='LscTigProjectNarrative' DataObjectDefinitionKey='LscTigProjectNarrative' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='lblDescription'
						Type='cLabel'
						Container='spnDescription'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Need'>
					<Control ID='lblNeed'
						Type='cLabel'
						Container='spnNeed'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GoalsObjectives'>
					<Control ID='lblGoalsObjectives'
						Type='cLabel'
						Container='spnGoalsObjectives'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Activities'>
					<Control ID='lblActivities'
						Type='cLabel'
						Container='spnActivities'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataEvaluation'>
					<Control ID='lblDataEvaluation'
						Type='cLabel'
						Container='spnDataEvaluation'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='JusticePartnerships'>
					<Control ID='lblJusticePartnerships'
						Type='cLabel'
						Container='spnJusticePartnerships'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProjectReplication'>
					<Control ID='lblProjectReplication'
						Type='cLabel'
						Container='spnProjectReplication'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CapacityStaffing'>
					<Control ID='lblCapacityStaffing'
						Type='cLabel'
						Container='spnCapacityStaffing'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PastPerformance'>
					<Control ID='lblPastPerformance'
						Type='cLabel'
						Container='spnPastPerformance'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Sustainability'>
					<Control ID='lblSustainability'
						Type='cLabel'
						Container='spnSustainability'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscTigReviewOpenRepWebImpr' DataObjectDefinitionKey='LscTigReviewOpenRepWebImpr' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PNNeedComment'>
					<Control ID='txtPNNeedComment'
						Type='cTextArea'
						Container='spnPNNeedComment'
						Rows='5'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GoalsObjectivesComment'>
					<Control ID='txtGoalsObjectivesComment'
						Type='cTextArea'
						Container='spnGoalsObjectivesComment'
						Rows='5'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ActivitiesComment'>
					<Control ID='txtActivitiesComment'
						Type='cTextArea'
						Container='spnActivitiesComment'
						Rows='5'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataEvaluationComment'>
					<Control ID='txtDataEvaluationComment'
						Type='cTextArea'
						Container='spnDataEvaluationComment'
						Rows='5'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PNJustPartComment'>
					<Control ID='txtPNJustPartComment'
						Type='cTextArea'
						Container='spnPNJustPartComment'
						Rows='5'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PNProjRepComment'>
					<Control ID='txtPNProjRepComment'
						Type='cTextArea'
						Container='spnPNProjRepComment'
						Rows='5'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PNCapStaffComment'>
					<Control ID='txtPNCapStaffComment'
						Type='cTextArea'
						Container='spnPNCapStaffComment'
						Rows='5'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PNPastPerformanceComment'>
					<Control ID='txtPNPastPerformanceComment'
						Type='cTextArea'
						Container='spnPNPastPerformanceComment'
						Rows='5'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PNSustainabilityComment'>
					<Control ID='txtPNSustainabilityComment'
						Type='cTextArea'
						Container='spnPNSustainabilityComment'
						Rows='5'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PNOverallComment'>
					<Control ID='txtPNOverallComment'
						Type='cTextArea'
						Container='spnPNOverallComment'
						Rows='5'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveContinue'
						Type='cButton'
						Container='spnSaveContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscTigAppReviewScore' DataObjectDefinitionKey='LscTigAppReviewScore' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='NeedClearlyDescribed'>
					<Control ID='txtNeedClearlyDescribed'
						Type='cTextBox'
						Container='spnNeedClearlyDescribed'
						Size='2'
						MaxLength='1'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='7'
							ErrorMessage='The score for "The application clearly describes nature and scope of the problem(s) the project will address" must be a whole number between 0 and 7.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NeedAddressLimitations'>
					<Control ID='txtNeedAddressLimitations'
						Type='cTextBox'
						Container='spnNeedAddressLimitations'
						Size='2'
						MaxLength='1'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='4'
							ErrorMessage='The score for "The application addresses the limitations of the current operational systems" must be a whole number between 0 and 4.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NeedDemonstrateRelevance'>
					<Control ID='txtNeedDemonstrateRelevance'
						Type='cTextBox'
						Container='spnNeedDemonstrateRelevance'
						Size='2'
						MaxLength='1'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='4'
							ErrorMessage='The score for "Response demonstrates how the technology proposed will address the identified need" must be a whole number between 0 and 4.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NeedAddressAreaOfInterest'>
					<Control ID='txtNeedAddressAreaOfInterest'
						Type='cTextBox'
						Container='spnNeedAddressAreaOfInterest'
						Size='2'
						MaxLength='1'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='3'
							ErrorMessage='The score for "BONUS: The project addresses one or more of LSC&apos;s areas of interest or is an LSC priority" must be a whole number between 0 and 3.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GoalsClearlyArticulated'>
					<Control ID='txtGoalsClearlyArticulated'
						Type='cTextBox'
						Container='spnGoalsClearlyArticulated'
						Size='2'
						MaxLength='2'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10'
							ErrorMessage='The score for "The application clearly articulates effective, concrete and measurable goals and objectives of the project." must be a whole number between 0 and 10.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GoalsIdentifyStrategies'>
					<Control ID='txtGoalsIdentifyStrategies'
						Type='cTextBox'
						Container='spnGoalsIdentifyStrategies'
						Size='2'
						MaxLength='2'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10'
							ErrorMessage='The score for "The application identifies specific, reasonable activities and strategies that will be implemented to achieve the goals and objectives." must be a whole number between 0 and 10.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GoalsSpecifyEvaluation'>
					<Control ID='txtGoalsSpecifyEvaluation'
						Type='cTextBox'
						Container='spnGoalsSpecifyEvaluation'
						Size='2'
						MaxLength='1'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='5'
							ErrorMessage='The score for "The application specifies appropriately detailed methods and data sets that will be used to evaluate the project. " must be a whole number between 0 and 5.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PartnerJusticeCommunity'>
					<Control ID='txtPartnerJusticeCommunity'
						Type='cTextBox'
						Container='spnPartnerJusticeCommunity'
						Size='2'
						MaxLength='1'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='5'
							ErrorMessage='The score for "The application demonstrates participation of appropriate justice community stakeholders in the development and implementation of this project." must be a whole number between 0 and 5.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReplCommonProblem'>
					<Control ID='txtReplCommonProblem'
						Type='cTextBox'
						Container='spnReplCommonProblem'
						Size='2'
						MaxLength='1'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='2'
							ErrorMessage='The score for "The application identifies the degree to which the problem is commonly found in the legal services community and demonstrates that it would be of value to other LSC-funded programs" must be a whole number between 0 and 2.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReplAdvantageOverExisting'>
					<Control ID='txtReplAdvantageOverExisting'
						Type='cTextBox'
						Container='spnReplAdvantageOverExisting'
						Size='2'
						MaxLength='1'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='2'
							ErrorMessage='The score for "The application demonstrates the advantage of the proposed project&apos;s  innovations over established approaches to addressing the specified problem" must be a whole number between 0 and 2.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReplEase'>
					<Control ID='txtReplEase'
						Type='cTextBox'
						Container='spnReplEase'
						Size='2'
						MaxLength='1'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='4'
							ErrorMessage='The score for "The application demonstrates the ease of replication and adaptation based on cost and complexity of the proposed project as well as how it could be implemented at a low cost in other service areas" must be a whole number between 0 and 4.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReplHowReplicates'>
					<Control ID='txtReplHowReplicates'
						Type='cTextBox'
						Container='spnReplHowReplicates'
						Size='2'
						MaxLength='1'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='4'
							ErrorMessage='The score for "The application addresses how the proposed project is replicating a prior TIG at a reduced cost" must be a whole number between 0 and 4.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReplHowImproves'>
					<Control ID='txtReplHowImproves'
						Type='cTextBox'
						Container='spnReplHowImproves'
						Size='2'
						MaxLength='1'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='2'
							ErrorMessage='The score for " The application addresses how the proposed project will make improvements to a prior TIG project" must be a whole number between 0 and 2.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CapTeamMembers'>
					<Control ID='txtCapTeamMembers'
						Type='cTextBox'
						Container='spnCapTeamMembers'
						Size='2'
						MaxLength='2'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10'
							ErrorMessage='The score for "The application clearly identifies project team members with appropriate experience, expertise and capacity to implement the project." must be a whole number between 0 and 10.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CapOrganization'>
					<Control ID='txtCapOrganization'
						Type='cTextBox'
						Container='spnCapOrganization'
						Size='2'
						MaxLength='1'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='5'
							ErrorMessage='The score for "The application clearly demonstrates that the program has the organizational capacities necessary to successfully complete the project." must be a whole number between 0 and 5.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PastTig'>
					<Control ID='txtPastTig'
						Type='cTextBox'
						Container='spnPastTig'
						Size='2'
						MaxLength='2'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10'
							ErrorMessage='The score for "Applicant has performed well on all past TIG projects, or applicant demonstrates lessons learned from previous delays and how they will ensure timely performance.  (Per TIG Program priorities, applicants that have never been awarded a TIG receive 10 points for this section. Reviewers should enter this score.)" must be a whole number between 0 and 10.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SustClearStrategy'>
					<Control ID='txtSustClearStrategy'
						Type='cTextBox'
						Container='spnSustClearStrategy'
						Size='2'
						MaxLength='1'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='7'
							ErrorMessage='The score for "The application provides a clear strategy to sustain the project after the completion of the grant, including concrete plans for future support (if applicable) and an accurate assessment of future costs. " must be a whole number between 0 and 7.'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscTigReviewOpenRepWebImprOther' DataObjectDefinitionKey='LscTigReviewOpenRepWebImpr' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' >
					<RelatedProperty PropertyKey='WfTaskAssignment' />
				</Argument>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Operator='NotEqual'/>
				<Argument Type='Data' PropertyKey='WfTaskID' Value='43' >
				   <RelatedProperty PropertyKey='WfTaskAssignment' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPNNeedCommentOther'
						Type='cDataListCtl'
						Container='spnPNNeedCommentOther'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='PNNeedComment' ColumnHeader='Comment' >
							<Control ID='lblPNNeedComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlGoalsObjectivesCommentOther'
						Type='cDataListCtl'
						Container='spnGoalsObjectivesCommentOther'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='GoalsObjectivesComment' ColumnHeader='Comment' >
							<Control ID='lblGoalsObjectivesComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlActivitiesCommentOther'
						Type='cDataListCtl'
						Container='spnActivitiesCommentOther'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='ActivitiesComment' ColumnHeader='Comment' >
							<Control ID='lblActivitiesCommentOther'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataEvaluationCommentOther'
						Type='cDataListCtl'
						Container='spnDataEvaluationCommentOther'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='DataEvaluationComment' ColumnHeader='Comment' >
							<Control ID='lblDataEvaluationCommentOther'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPNJustPartCommentOther'
						Type='cDataListCtl'
						Container='spnPNJustPartCommentOther'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='PNJustPartComment' ColumnHeader='Comment' >
							<Control ID='lblPNJustPartComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPNProjRepCommentOther'
						Type='cDataListCtl'
						Container='spnPNProjRepCommentOther'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='PNProjRepComment' ColumnHeader='Comment' >
							<Control ID='lblPNProjRepComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPNCapStaffCommentOther'
						Type='cDataListCtl'
						Container='spnPNCapStaffCommentOther'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='PNCapStaffComment' ColumnHeader='Comment' >
							<Control ID='lblPNCapStaffComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPNPastPerformanceCommentOther'
						Type='cDataListCtl'
						Container='spnPNPastPerformanceCommentOther'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='PNPastPerformanceComment' ColumnHeader='Comment' >
							<Control ID='lblPNPastPerformanceComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPNSustainabilityCommentOther'
						Type='cDataListCtl'
						Container='spnPNSustainabilityCommentOther'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='PNSustainabilityComment' ColumnHeader='Comment' >
							<Control ID='lblPNSustainabilityComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPNOverallCommentOther'
						Type='cDataListCtl'
						Container='spnPNOverallCommentOther'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='PNOverallComment' ColumnHeader='Comment' >
							<Control ID='lblPNOverallComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscGranteeProjectTig' DataObjectDefinitionKey='LscGranteeProjectTig'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
		</DataObject>
	</ModuleSection>
</span>