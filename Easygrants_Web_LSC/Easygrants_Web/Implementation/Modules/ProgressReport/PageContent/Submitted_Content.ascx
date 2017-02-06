<%@ Control Language="vb" AutoEventWireup="true" Inherits="EasyGrants.Modules.Application.Controls.Page.cSubmissionContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<br>
<table width='100%' cellpadding='2' cellspacing='0'>
	<tr>
		<td class='SeparatorHdg'>
			Instructions
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<span id='spnInvalidText' runat='server' visible='false'>
<b>ATTENTION:</b> Your progress report cannot be submitted at this time because it is not complete. 
Review the Validation status of each item below to determine the outstanding requirements. 
Validated or complete requirements are marked with a green check mark. Invalid or incomplete 
requirements are marked with a red X.  Once all requirements are validated, the <B>Submit</B> button will be 
displayed and you can submit your application to the foundation.
</span>


<span id='spnSubmitText' runat='server' visible='false'>
    <b>Your progress report is complete.</b>
    <br><br>
    Your progress report is complete and ready for submission. Click <B>Submit</B> (below) to submit your 
    application to the foundation. Once you submit, you will receive an e-mail confirmation that 
    the application was successfully received, and <B>you will no longer be able to access any of the 
    progress report pages</B>. From your Main page, you will be able to access a copy of your final pdf 
    along with program guidelines.
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