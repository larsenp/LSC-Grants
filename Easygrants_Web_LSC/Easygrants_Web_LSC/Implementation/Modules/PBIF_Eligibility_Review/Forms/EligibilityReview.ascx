<%@ Control Language="vb" AutoEventWireup="true" Codebehind="HomeContent.ascx.vb" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<div style="width:800px">
	<Core:cUserCtlLoader CtlID='ctlApplicationInfo' 
				Src='Implementation/Modules/PBIF_Eligibility_Review/PageSection/ApplicationInfo.ascx'
				runat='server'/>
	<br />
	<div class="SeparatorHdg" style="width:100%">
		Pro Bono Innovation Fund Eligibility review
	</div>
	<br />
	<table style="width:100%">
		<tr>
			<td colspan='3'>
				<b>Eligibility Review</b>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<b>Current LSC Grantee?</b>
			</td>
			<td>
				<span runat='server' id='spnCurrentLscGrantee'/>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<b>Complete Basic Information, Narrative, and Budget Form?</b>
			</td>
			<td>
				<span runat='server' id='spnCompleteBasicInfo'/>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<b>Project Budget Upload?</b>
			</td>
			<td>
				<span runat='server' id='spnBudgetNarrative'/>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<b>Subgrant and/or Contract Forms, if applicable?</b>
			</td>
			<td>
				<span runat='server' id='spnSubgrantContract'/>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<b>Resumes of Key Staff?</b>
			</td>
			<td>
				<span runat='server' id='spnResumesKeyStaff'/>
			</td>
		</tr>
	</table>
	<div class="SeparatorHdg" style="width:100%">
		Eligibility Determination
	</div>
	<br />
	<b>Does application meet eligibility requirements?</b>&nbsp;
	<span runat='server' id='spnWfTaskOutcomeID'/>
	<br /><br />
	<div style="text-align:center">
		<span runat='server' id='spnSave'/>&nbsp;&nbsp;
		<span runat='server' id='spnSave_and_Continue'/>
	</div>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTaskOutcomeID'> 
					<Control ID='ctlWfTaskOutcomeID'
						Container='spnWfTaskOutcomeID'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome'> 
						<Filters>
							<Argument PropertyKey="WfTaskID" Value='103'/>
							<Argument PropertyKey="WfTaskOutcome" Value='In Process' Operator='NotEqual'/>
						</Filters>
					</Control> 
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							EnterKey='True'>							
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Caption='Save and Continue'
						Save='False'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>	
		
		<DataObject Key='LscProBonoEligibilityReview' DataObjectDefinitionKey='LscProBonoEligibilityReview' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</DefaultValues>
			<DisplayProperties>
			   <DisplayProperty PropertyKey='CurrentLscGrantee'>
					<Control ID='ctlCurrentLscGrantee'
						Container='spnCurrentLscGrantee'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			   <DisplayProperty PropertyKey='CompleteBasicInfo'>
					<Control ID='ctlCompleteBasicInfo'
						Container='spnCompleteBasicInfo'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			   <DisplayProperty PropertyKey='BudgetNarrative'>
					<Control ID='ctlBudgetNarrative'
						Container='spnBudgetNarrative'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			   <DisplayProperty PropertyKey='SubgrantContract'>
					<Control ID='ctlSubgrantContract'
						Container='spnSubgrantContract'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			   <DisplayProperty PropertyKey='ResumesKeyStaff'>
					<Control ID='ctlResumesKeyStaff'
						Container='spnResumesKeyStaff'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
