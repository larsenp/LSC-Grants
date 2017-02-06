<%@ Control Language="vb" AutoEventWireup="true" Codebehind="SubmissionContent.ascx.vb" Inherits="EasyGrants.Modules.Application.Controls.Page.cSubmissionContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width='100%' cellpadding='2' cellspacing='0'>
	<tr>
		<td class='SeparatorHdg'>
			Instructions
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<span id='spnInvalidText' runat='server' visible='false'>Your application cannot be submitted at this time
because it is not complete. 
<br>
<br>
<b>See Validation for details.</b>
</span>

<span id='spnSubmitText' runat='server' visible='false'>
	<br>
	<p>Your application has been validated.<br><br>
	Click <b>Submit</b> when your application is complete. 
	<br><br>
	<font color='red'><b>You will not be able to revise your application after it has been submitted.</b></font></p>
	<br>
	<table width='100%'>
		<tr>
			<td class='SeparatorHdg'>
				Submission
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
	</table>	
</span>

<span id='spnAppNotGenerated' runat='server' visible='false'>
	<p><font color='red'><b>Your final application document has not been generated. Please see the Final Application Document
	section of the page to generate your final application document.</b></font></p>
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
