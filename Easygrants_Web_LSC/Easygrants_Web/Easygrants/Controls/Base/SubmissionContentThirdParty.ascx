<%@ Control Language="vb" AutoEventWireup="true" Codebehind="SubmissionContentThirdParty.ascx.vb" Inherits="EasyGrants.Modules.Application.Controls.Page.cSubmissionContentThirdParty" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<span id='spnInvalidText' runat='server' visible='false'>
	<b>ATTENTION:</b> Your application cannot be submitted at this time because it is not complete.  
	Click the Validation link to the left to view the Validation status of your submission.  
	Following the final validation, the Submit button will be displayed and you can submit 
	your final application to the Foundation.  Once you submit, you will receive an e-mail 
	confirmation that the application was successfully submitted, and you will no longer be 
	able to access any of the application pages.
</span>

<span id='spnSubmitText' runat='server' visible='false'>
	<p>Your application has been completely validated.  Click 
	on the button below to submit your application.</p>
</span>

<span id='spnSubmitButton' runat='server'/>

<span id='spnConfigXML' visible='false' runat='server'>
<ModuleSection>
	<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='True'>
		<Filters>
			<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID'
				PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
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
						<Argument PropertyKey='WfTaskStatusID' Value='1' NullDataObject='' />
					</Visible>						
				</Control>	
			</DisplayProperty>
		</DisplayProperties>
	</DataObject>
</ModuleSection>
</span>
