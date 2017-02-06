<%@ Control Language="vb" AutoEventWireup="true" Inherits=" Easygrants_Web.Modules.ReviewStage.Controls.PageSection.cReviewSubmissionContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<br>
<br>



<span id='spnInvalidText' runat='server' visible='false'>
	<b>ATTENTION:</b> You may not submit at this time because your task is not complete.  Please see the Submission Status section for details.
</span>

<span id='spnSubmitText' runat='server' visible='false'>
	You have completed the required items for this task.  Click <b>Submit</b> to complete this task.
<br><br>
Once you submit, you will be able to see but not change any of your scores.  You will also receive an e-mail confirmation.
</span>



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
	</DataObject>
</ModuleSection>
</span>

