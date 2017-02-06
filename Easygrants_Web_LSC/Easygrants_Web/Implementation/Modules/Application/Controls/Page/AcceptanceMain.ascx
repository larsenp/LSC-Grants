<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.Page.cAcceptanceMain" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' />


<asp:CustomValidator 
	id='valNonAcceptedReason'
	runat='server'
	OnServerValidate='ValidateNonAcceptedReason'
	Enabled='False'
	ErrorMessage='Reason for declining is required.'
	Display='None'/>


<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<span id='spnPageContent' runat='server'/>
<p>
<!--
Congratulations on your award!  Please indicate whether you plan to accept this award below.  
If you choose to decline this award, please provide an explanation.

<br><br>-->
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Acceptance</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>Please indicate your acceptance of this award.  I understand that if funding  
			becomes available from an alternative application, I must choose to keep the grant or accept 
			the alternative award. 
		</td>
	</tr>
	<tr>
		<td><span runat='server' id='spnIsAccepted' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>If declining, please provide an explanation:</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><span runat='server' id='spnNonAcceptedReason' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Save/Complete Acceptance Submission</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>You may go in and out of this submission as often as desired until you finally submit.  
		To save the information and return to your Home page, click on the <b>Save</b> button.  To cancel and 
		return to your Home page, click on the <b>Cancel</b> button.  To submit the Acceptance form, 
		click on the <b>Submit</b> button.  You will not be able to modify your information after submission. 
		</td>
	</tr>
</table>

<br>		
<br>		
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server' id='tblSubmit'>
	<tr>
		<td>
			<span runat='server' id='spnSave'/>
		</td>
		<td width='25%'></td>
		<td>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='20%'>&nbsp;</td>
		<td><span runat='server' id='spnSubmit'/></td>
		<td>&nbsp;</td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' 
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>		
		</DataObject>
			
		
		<DataObject Key='GranteeProjectAHA' DataObjectDefinitionKey='GranteeProjectAHA' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' />
				<Argument Type='ModuleUser' TypeKey='PersonID' 
					PropertyKey='PersonID' Value='' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='WfTaskID' Value='' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskRoleID' PropertyKey='PersonRoleID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='IsAccepted'>
					<Control ID='ctlIsAccepted'
						Container='spnIsAccepted'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Acceptance question is required.'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Accept'/>
							<Parameter StoredValue='False' DisplayValue='Decline'/>
						</Parameters>
						<!-- <Validation Type='Custom' Object='EventController' Method='ValidateNonAcceptedReason' 
							ErrorMessage='Please provide a reason why you are declining.' /> -->
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NonAcceptedReasion'>
					<Control ID='ctlNonAcceptedReason'
						Container='spnNonAcceptedReason'
						Type='cTextArea'
						Rows='5'
						Cols='90'
						MaxLength='2000'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,2000}$' ErrorMessage='Limit your explanation to 2000 characters or less.' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
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
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Cancel'
						Confirmation='Select OK to close the page without saving the data. Select Cancel to return.'>
						<Action PostBack='True' 
								Object='WebSession' 
								Method='RedirectToModule'>
							<Parameters>
								<Argument Type='' TypeKey='' Value='Home' />
								<Argument Type='' TypeKey='' Value='HomeModuleConfig' />
								<Argument Type='' TypeKey='' Value='Home' />
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit'
						Container='spnSubmit'
						Type='cButton'
						Image='Submit'
						Confirmation='Are you sure you want to Submit?  Once you submit, you will not be able to make changes.'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='DataPresenter'
							Method='Submit'>
							<Parameters>
								<Argument Type='' TypeKey='' Value='Home' />
								<Argument Type='' TypeKey='' Value='HomeModuleConfig' />
								<Argument Type='' TypeKey='' Value='Home' />
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
