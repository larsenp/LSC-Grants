<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.ReviewStage.Controls.PageSection.cReviewStageSubmission_Button" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>



<span id='spnSubmitButton' runat='server'/>


<span id='spnConfigXML' visible='false' runat='server'>
<ModuleSection>
	<DataObject Key='ExternalReviewApplicationsList' DataObjectDefinitionKey='ExternalReviewApplicationsList'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ReviewerID' />
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='RevWfTaskID' />				
			</Filters>
	</DataObject>
	<DataObject Key='RevWfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='True'>
		<Filters>
			<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' />
			<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='WfTaskID' />
			<Argument Type='DataObjectCollection' TypeKey='ExternalReviewApplicationsList' DataObjectPropertyKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
			<Argument Group='('/>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskStatusID' Value='1' Bool='' />								
				<Argument Type='' TypeKey='' PropertyKey='WfTaskStatusID' Value='4' Bool='Or' />					
				<Argument Group=')' Bool=''/>
		</Filters>
	</DataObject>			
	<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='True'>
		<Filters>
			<Argument Type='ModuleUser' 
				TypeKey='WfTaskAssignmentID'
				PropertyKey='WfTaskAssignmentID'
				Value='' 
				bool=''/>
		</Filters>
		<DisplayProperties>
			<DisplayProperty PropertyKey=''>
				<Control ID='btnSubmit'
					Container='spnSubmitButton'
					Type='cButton'
					Confirmation='Are you sure you want to submit? Once you submit, you will not be able to make changes.'
					Image='Submit'>
					<Action
						PostBack='True'
						Object='DataPresenter'
						Method='SubmissionContent_Submit'/>
					<Visible>
						<Argument PropertyKey='WfTaskStatusID' Value='1' NullDataObject='' Bool='Or' />
						<Argument PropertyKey='WfTaskStatusID' Value='4' NullDataObject='' Bool='Or' />
					</Visible>						
				</Control>	
			</DisplayProperty>
		</DisplayProperties>
	</DataObject>
</ModuleSection>
</span>
