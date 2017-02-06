<%@ Control Language="vb" AutoEventWireup="true" Codebehind="Submission_Button.ascx.vb" Inherits="EasyGrants.Modules.Application.Controls.Page.cSubmission_ButtonImpl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>



<span id='spnSubmitButton' runat='server'/>


<span id='spnConfigXML' visible='false' runat='server'>
<ModuleSection>
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
