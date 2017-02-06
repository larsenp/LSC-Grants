<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Rating</b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server'>
<!-- Control Label (for Organization information) -->
	<tr>
		<td>Please provide a rating for this applicant.</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<span id='spnRating' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align=center>
			<span id='spnSave' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID'
					Value='' 
					bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='WfTask' DataObjectDefinitionKey='WfTask'>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='WfTaskAssignment'
					DataObjectPropertyKey='WfTaskID'
					PropertyKey='WfTaskID'
					Value='' 
					bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='ReviewStage' DataObjectDefinitionKey='ReviewStage'>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='WfTask'
					DataObjectPropertyKey='WfTaskID'
					PropertyKey='WfTaskID'
					Value='' 
					bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='ReviewStage'
					DataObjectPropertyKey='ApplicationWfTaskID'
					PropertyKey='WfTaskID'
					Value='' 
					bool=''/>
				<Argument Type='' 
					TypeKey=''
					PropertyKey='WfTaskRoleID'
					Value='1' 
					bool='And'/>
				<Argument Type='DataObjectCollection' 
					TypeKey='WfTaskAssignment'
					DataObjectPropertyKey='GranteeProjectID'
					PropertyKey='GranteeProjectID'
					Value='' 
					bool='And'/>
			</Filters>
		</DataObject>
		<DataObject Key='WfTaskAssignmentReview' DataObjectDefinitionKey='WfTaskAssignmentReview' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID'
					Value='' 
					bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				<Argument Type='DataObjectCollection' TypeKey='ReviewStage' DataObjectPropertyKey='ReviewStageID' PropertyKey='ReviewStageID' Value='' />
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='AppWfTaskAssignmentID' Value='' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Rating'>
					<Control ID='ctlRating'
						Container='spnRating'
						Type='cTextBox'
						RequiredField='True'
						Size='2'
						MaxLength='10'
						ErrorMessage='Rating is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^(\d{0,2})?(\.)?(\d{0,2})$' ErrorMessage='Enter a valid (numerical) Rating.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'/>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
