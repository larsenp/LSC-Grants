<%@ Control Language="vb" AutoEventWireup="true" Codebehind="SubmissionContentPR.ascx.vb" Inherits="EasyGrants.Modules.Application.Controls.Page.cSubmissionContentPR" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<span id='spnAppGenerated' runat='server' visible='false'>
	<p><b>Your report PDF has been generated.</b></p>
</span>

<span id='spnAppNotGenerated' runat='server' visible='true'>
	<p><font color='red'><b>Your final report document has not been generated.  
	Return to the <span id='spnValidationPage' runat='server' visible='true'/> 
	to generate your report PDF.
	</b></font></p>
</span>

<span id='spnInvalidText' runat='server' visible='false'>
	<b>ATTENTION:</b> Your report cannot be submitted at this time because it is not complete.  
	Click the Validation link to the left to view the Validation status of your submission.  
	Following the final validation, the Submit button will be displayed and you can submit 
	your final report to the Foundation.  Once you submit, you will receive an e-mail 
	confirmation that the report was successfully submitted, and you will no longer be 
	able to access any of the report pages.  From the Main page, you will be able to 
	access a copy of your full report PDF.  
</span>

<span id='spnSubmitText' runat='server' visible='false'>
	<p>Your report has been completely validated. In order to submit your report, 
	you must also have generated your final report document <i>since making any edits 
	to the report</i>. If you have not generated your final report document since 
	your last edit, please see the <b>Final Report Generation</b> at the top of the 
	Validation page. <font color='red'>WARNING:</font> Please proofread your report 
	carefully and make any necessary changes prior to submitting. You will not be able to 
	revise your report after it has been submitted.</p>
	<p>If you have generated and reviewed your final report document, you may click 
	on the button below to submit your report.</p>
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
