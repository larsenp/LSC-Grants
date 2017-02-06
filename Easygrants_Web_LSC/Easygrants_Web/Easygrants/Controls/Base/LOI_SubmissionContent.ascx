<%@ Control Language="vb" AutoEventWireup="true" Codebehind="SubmissionContent.ascx.vb" Inherits="EasyGrants.Modules.Application.Controls.Page.cSubmissionContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<br>
<table width='100%' cellpadding='2' cellspacing='0'>
	<tr>
		<td class='SeparatorHdg'>
			Instructions
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<span id='spnOldInvalidText' runat='server' visible='false'>Your Letter of Inquiry is incomplete and cannot be submitted 
at this time. See Validation for details.
</span>

<span id='spnInvalidText' runat='server' visible='false'>
<b>ATTENTION:</b> Your Letter of Inquiry cannot be submitted at this time because it is not complete.  
Review the Validation status of each item below to determine the outstanding requirements.  
Validated or complete requirements are marked with a green checkmark. 
Invalid or incomplete requirements are marked with a red X.  
Once all requirements are validated, the Submit button will be displayed and you can submit your 
Project Summary task to the Granting <%=GetLabel("Organization")%>.
</span>

<span id='spnOldSubmitText' runat='server' visible='false'>
	<br>
	<p>Your letter of inquiry has been completely validated. In order to submit your
	Letter of Inquiry, you must also have generated your Letter of Inquiry document <i>since
	making any edits to the Letter of Inquiry.</i>  If you have not generated your Letter of Inquiry document since your last edit,
	click the <b>Letter of Inquiry Generation</b> link on the left. Please
	proofread your Letter of Inquiry carefully and make any necessary changes prior to
	submitting. You will not be able to revise your Letter of Inquiry after it has been
	submitted.</p>

	<p>If you have generated and reviewed your Letter of Inquiry document, you may 
	click on the button below to submit your Letter of Inquiry.</p>
</span>

<span id='spnSubmitText' runat='server' visible='false'>
    <b>Your Letter of Inquiry is complete.</b>
    <br><br>
    Your Letter of Inquiry is complete and ready for submission.  
    Click <b>Submit</b> (below) to submit your project summary to the Granting <%=GetLabel("Organization")%>.  
    Once you submit, you will receive an e-mail confirmation that the project summary was successfully received, 
    and <b>you will no longer be able to access any of the Submit Project Summary pages</b>. 
    From your Main page, you will be able to access a copy of your final PDF along with program guidelines.
	<!--Your Letter of Inquiry has been validated.<br><br>
	Click <b>Submit</b> below when your Letter of Inquiry is complete. 
	<br><br>
	<b><font color='red'>You will not be able to revise your Letter of Inquiry after it has been submitted.</font></b></p>
	<table width='100%'>
		<tr>
			<td class='SeparatorHdg'>
				Submission
			</td>
		</tr>
	</table>	-->
</span>

<span id='spnAppNotGenerated' runat='server' visible='false'>
	<p><font color='red'><b>Your letter of inquiry document has not been generated. Please see the Letter of Inquiry Document 
	section of the page to generate your letter of inquiry document.</b></font></p>
</span>


<span id='spnSubmitButton' runat='server' visible="false"/>


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
						<Argument PropertyKey='WfTaskStatusID' Value='1' NullDataObject='' />
					</Visible>						
				</Control>	
			</DisplayProperty>
		</DisplayProperties>
	</DataObject>
</ModuleSection>
</span>
