<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cReviewCycleManager" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='Committee' src='../../../../../../Easygrants/Controls/PageSection/Committee_Editor.ascx' %>
<%@ Register Tagprefix='Easygrants' tagname='Consortia' src='../../../../../../Easygrants/Controls/PageSection/ReviewCycleTask_List.ascx' %>
<%@ Register Tagprefix='Easygrants' tagname='Science' src='../../../../../../Easygrants/Controls/PageSection/ReviewCycleCommittee_List.ascx' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
	
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>


<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<br />
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewPages.ascx'
	runat='server'/>
<br />
<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Last' Key='ReviewCycleManager' LinkTitle='Participant/Committee Pool' runat='server'/>


<Core:cUserCtlLoader CtlID='ReviewCycleInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewCycleInfo.ascx'
	runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Tasks to Include&nbsp;</b><font color='red'>*</font></td>
	</tr>
</table>
<br/>
<span runat='server' id='spnEdit'/>
<br>
<br>  
<table border='0' cellpadding='0' cellspacing='0' width='100%'>
	<tr>
		<td>
			<span runat='server' id='spnReviewCycleProjectTask'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><span id='spnViewApplicantPool' runat='server'/></td></tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Committees to Include&nbsp;</b><font color='red'>*</font></td>
	</tr>
</table>
<br>

<table border='0' cellpadding='0' cellspacing='0' width='100%'>
	<tr>
		<td>
			<span runat='server' id='spnReviewCycleCommittee'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><span id='spnViewCommitteePool' runat='server'/></td></tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center' ID="Table3">		
<tr>
	<td>
		<span runat='server' id='spnSave'/>&nbsp;
		<span runat='server' id='spnSaveAndContinue'/>&nbsp;
		<span runat='server' id='spnCancel'/>	
	</td>
</tr>
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
		<DataObject Key='ReviewCycle' DataObjectDefinitionKey='ReviewCycle'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID'/>
			</Filters>
			<DisplayProperties>																		
			</DisplayProperties>
		</DataObject>
		
		<%--<DataObject Key='ReviewCycleCompetition' DataObjectDefinitionKey='ReviewCycleCompetition'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID'/>
			</Filters>
			<DisplayProperties>																		
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfProject1' DataObjectDefinitionKey='WfProject'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewCycle' DataObjectPropertyKey='ReviewCycleCompetitions.CompetitionID' PropertyKey='CompetitionID'>
				</Argument>
				<Argument Type='DataObjectCollection' TypeKey='ReviewCycle' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'/>
			</Filters>
			<DisplayProperties>																		
			</DisplayProperties>
		</DataObject>--%>

		<DataObject Key='ReviewCycle2' DataObjectDefinitionKey='ReviewCycle' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ReviewCycleProjectTask'>
					<Control ID='ctlReviewCycleProjectTask'
						Container='spnReviewCycleProjectTask'
						Type='cDoubleListBox2'
						DataObjectDefinitionKey='ReviewCycleProjectTasks'
						DisplayValue='ProjectProjectTaskDesc'
						StoredValue='WfProjectTaskID'
						StoredDisplayValue='ReviewCycleProjectTasks.ProjectProjectTaskDesc' 
						Height='9'
						Sort='True'
						DisplayNone='False'
						DisplaySort='False'
						DisplayMoveAll='True'
						MinSelected='1'
						TooFewMessage='Task is required.'>
						<DefaultValues>
							<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' Value=''/>
						</DefaultValues>
						<Filters>
							<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' Value=''/>
							<Argument Group='(' Bool='And'/>
								<Argument Type='' TypeKey='' PropertyKey='TaskTypeID'  Value='1' Bool=''/>
								<Argument Type='' TypeKey='' PropertyKey='TaskTypeID' Value='3' Bool='Or'/>
							<Argument Group=')' Bool=''/>
						</Filters>
						<RelatedDataObjects>
							<RelatedDataObject DataObjectDefinitionKey='ReviewCycleProjectTaskOutcome'>
								<RelationshipProperties>
									<RelationshipProperty parentProperty='ReviewCycleProjectTaskID' childProperty='ReviewCycleProjectTaskID' />
								</RelationshipProperties>
							</RelatedDataObject>
						</RelatedDataObjects>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control Container='spnViewApplicantPool' 
						ID='ctlViewApplicantPool'
						Type='cLink'
						Caption='View of Selected Participant Pool'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='ViewApplicantPool'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReviewCycleID' BaseValue=''/>	
							</Parameters>
						</Action>		
					</Control>
				</DisplayProperty>			
			</DisplayProperties>
		</DataObject>
		<DataObject Key='ReviewCycle3' DataObjectDefinitionKey='ReviewCycle' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='ReviewCycleID'
					PropertyKey='ReviewCycleID' 
					Value='' 
					bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ReviewCycleCommittee'>
					<Control ID='ctlReviewCycleCommittee'
						Container='spnReviewCycleCommittee'
						Type='cDoubleListBox2'
						DataObjectDefinitionKey='ReviewCommittee'
						DisplayValue='ReviewCommitteeDescription'
						StoredValue='ReviewCommitteeID'
						StoredDisplayValue='ReviewCommittee.ReviewCommitteeDescription' 
						Height='9'
						Sort='True'
						DisplayNone='False'
						DisplaySort='False'
						DisplayMoveAll='True'
						MinSelected='1'
						TooFewMessage='Committee is required.'>
						<DefaultValues>
							<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' Value=''/>
						</DefaultValues>
						<Filters>
							<Argument Type='' TypeKey='' PropertyKey='Inactive' Value='False'/>
							<Argument Type='' TypeKey='' PropertyKey='ParentReviewCommitteeID' Value='null'/>
						</Filters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control Container='spnViewCommitteePool' 
						ID='ctlViewCommitteePool'
						Type='cLink'
						Caption='View of Selected Committee/Reviewer Pool'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='ViewCommitteePool'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReviewCycleID' BaseValue=''/>	
							</Parameters>
						</Action>		
					</Control>
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnEdit'
						Container='spnEdit'
						Type='cButton'
						Image='Edit_Task_Outcomes'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ReviewCycleTask'/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCycle' DataObjectPropertyKey='ReviewCycleID' AttributeName='' BaseValue='ReviewCycleID='/>
								<Argument Type='QueryString' TypeKey='CmptType' BaseValue='CmptType='/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>						
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'>
							<!--
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ReviewCycle'/>
							</Parameters>-->					
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndContinue'
						Container='spnSaveAndContinue'
						Type='cButton'
						Image='Save_and_Continue'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='PreReview'/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCycle' DataObjectPropertyKey='ReviewCycleID' AttributeName='' BaseValue='ReviewCycleID='/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ReviewCycle'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>
	</ModuleSection>		
</span>
<!-- End Embedded XML -->
