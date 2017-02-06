<%@ Control Language="vb" AutoEventWireup="true" Codebehind="SubmissionContent.ascx.vb" Inherits="EasyGrants.Modules.Application.Controls.Page.cSubmissionContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<table width='100%' cellpadding='2' cellspacing='0'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg'>
			Instructions
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<span id='spnInvalidText' runat='server' visible='false'>Your Letter of Inquiry is incomplete and cannot be submitted at this time. 
<br>
<br>
<b>See Validation for details.</b>
</span>


<span id='spnSubmitText' runat='server' visible='false'>
	Your Letter of Inquiry has been validated.<br><br>
	Click <b>Submit</b> below when your Letter of Inquiry is complete. 
	<br><br>
	<b><font color='red'>You will not be able to revise your Letter of Inquiry after it has been submitted.</font></b></p>
	<table width='100%'>
		<tr>
			<td class='SeparatorHdg'>
				Submission
			</td>
		</tr>
	</table>	
</span>

<span id='spnAppNotGenerated' runat='server' visible='false'>
	<p><font color='red'><b>Your letter of inquiry document has not been generated. Please see the Letter of Inquiry Document 
	section of the page to generate your letter of inquiry document.</b></font></p>
</span>

<br>
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
						<Argument PropertyKey='WfTaskStatusID' Value='1' NullDataObject='' />
					</Visible>						
				</Control>	
			</DisplayProperty>
			
		</DisplayProperties>
	</DataObject>
</ModuleSection>
</span>
