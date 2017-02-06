<%@ Control Language="vb" AutoEventWireup="true" Codebehind="SubmissionContentKatz.ascx.vb" Inherits="Easygrants_Web.Controls.Base.cSubmissionContentKatz" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<br>
<span id='spnPageContent' runat='server'/>
<p>
<span id='spnAppGenerated' runat='server' visible='false'>
	<p><b>Your application PDF has been generated.</b></p>
</span>

<span id='spnAppNotGenerated' runat='server' visible='true'>
	<p><font color='red'><b>Your final application document has not been generated.  
	Return to the <span id='spnValidationPage' runat='server' visible='true'/> 
	to generate your application PDF.
	</b></font></p>
</span>

<span id='spnInvalidText' runat='server' visible='false'>
	<b>ATTENTION:</b> Your application cannot be submitted at this time because it is not complete.  
	Review the Validation status of each item below to determine the outstanding requirements.  
	Validated or complete requirements are marked with a green check mark. Invalid or incomplete 
	requirements are marked with a red X.  Once all requirements are validated, the <b>Submit</b> button 
	will be displayed and you can submit your application to the foundation.  
</span>

<span id='spnSubmitText' runat='server' visible='false'>
	<b>Your application has been successfully validated.</b>
	<br>
	Your application is complete and ready for submission.  Click <b>Submit</b> (below) to submit your 
	application to the foundation.  Once you submit, you will receive an e-mail confirmation that the 
	application was successfully received, and you will no longer be able to access any of the 
	application pages.  From your Main page, you will be able to access a copy of your final pdf 
	along with program guidelines.
</span>

<span id='spnSubmitButton' runat='server'/>

<span id='spnConfigXML' visible='false' runat='server'>
<ModuleSection>
	<PageContent/>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>

				<DisplayProperty PropertyKey=''>
					<Control ID='ctlValidationPage'
						Container='spnValidationPage'
						Type='cLink'
						Caption='Validation Page'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Validation'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit'
						Container='spnSubmitButton'
						Type='cButton'
						Image='Submit'
						Confirmation='Are you sure you want to Submit?  Once you submit, you will not be able to make changes.'>
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
