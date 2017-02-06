<%@ Control Language="vb" AutoEventWireup="true" Codebehind="SubmissionContent.ascx.vb" Inherits="EasyGrants.Modules.Application.Controls.Page.cSubmissionContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<br>
<table width='100%' cellpadding='2' cellspacing='0'>
	<tr>
		<td class='SeparatorHdg'>Submission</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>



<span id='spnInvalidText' runat='server' visible='false'>
	<b>ATTENTION:</b>  Your application cannot be submitted at this time because it is not complete.  Review the Validation status of each item below to determine the outstanding requirements.  Validated or complete requirements are marked with a green check mark. Invalid or incomplete requirements are marked with a red X.  Once all requirements are validated, the
	 <b>Submit</b> 	button will be displayed and you can submit your application.  

</span>

<span id='spnSubmitText' runat='server' visible='false'>
	<b>Your application is complete.</b>
	<br></br>
	Your application is complete and ready for submission.  Click <b>Submit</b> (below) to submit your application.  Once you submit, you will receive an email confirmation that the submission was successfully received, and 
	<b>you will no longer be able to access any of the pages.</b>  From your Main page, you will be able to access a copy of your final PDF along with program guidelines.

</span>
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
	</DataObject>
</ModuleSection>
</span>
