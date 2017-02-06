<%@ Control Language="vb" AutoEventWireup="true" Codebehind="Submission_Button_LSC.ascx.vb" Inherits="EasyGrants.Modules.Application.Controls.Page.cSubmission_Button_LSC" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>


<table width='100%'>
	<tr align="Center">
		<td>
			<span id='spnSubmitButton' runat='server'/>
		</td>
	</tr>
</table>

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
					Image='Submit'
					Confirmation='Are you sure you want to complete this submission?'>
					<Action
						PostBack='True'
						Object='DataPresenter'
						Method='SubmissionContent_Submit_LSC'/>
					<Visible>
						<Argument PropertyKey='WfTaskStatusID' Value='1' NullDataObject='' />
					</Visible>						
				</Control>	
			</DisplayProperty>
		</DisplayProperties>
	</DataObject>
</ModuleSection>
</span>
