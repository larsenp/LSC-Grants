<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.ThirdParty.PageContent.cSPOBudgetApproval" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>

<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<!-- 
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>
			The Fellow-To-Faculty Transition Award provides funding for trainees with 
			outstanding potential for careers as physician-scientists in cardiovascular 
			or stroke research during the crucial period of career development that spans 
			the completion of research training through the early years of the first 
			faculty/staff position. 
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			You were identified as the Grant Officer from the Sponsored Programs Office 
			for the application below.  Your approval is required before the application 
			is considered complete.  Please review the application PDF by clicking on the 
			<b>View PDF</b> button below.  Once you have reviewed the application select the 
			<b>Yes</b> or <b>No</b> radio button to indicate whether or not you approve of this application.
			  When you are finished, click <b>Submit</b> to send your decision to the .  Once 
			  you submit, you will be redirected to your Home page.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			IMPORTANT: Once you click the <b>Submit</b> button below, your decision will be 
			finalized and communicated to .  If you would like to change your desicion 
			after submission, contact the foundation using the information at the bottom 
			of the page.  Click the <b>Cancel</b> button to cancel return to your Home page.	
		</td>
	</tr>	
	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Principal Investigator Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
-->

<br>
<span id='spnPageContent' runat='server'/>
<p>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Principal Investigator Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td width='15%'><b>Principal Investigator</b></td>
		<td><span id='spnApplicantName' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='15%'><b>Competition</b></td>
		<td><span id='spnCompetition' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td colspan='4'><span id='spnViewApp' runat='server'/></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>SPO Grant Officer Approval</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
			<table width='100%'>
				<tr>
					<td>I have
  reviewed and approved the Initial Budget for the Principal Investigator shown
  above.</td>
					<td><span id='spnIsApproved' runat='server'/></td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td colspan='2'>If No, please enter a comments/instructions for the
  Principal Investigator so they can make changes to their application.</td>
				</tr>
				<tr><td colspan='2'><span id='spnNonApprovalReason' runat='server'/></td></tr>
			</table>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<br>		
<br>		
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server' id='tblSubmit'>
	<tr>
		<td>
			<span runat='server' id='spnSubmit'/>
		</td>
		<td width='20%'>&nbsp;</td>
		<td>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>
	
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' 
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstName'>
					<Control ID='spnApplicantName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.WfProject.WfProjectName'>
					<Control ID='spnCompetition'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>		
		</DataObject>
			
		<DataObject Key='ViewAppPDF' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<!-- <DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='ReportOutputLink'
								DataObjectPropertyKey='GranteeProject.ApplWfTaskAssignments.WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='ReportOutputLink'
								DataObjectPropertyKey='WfTask.WfTaskModule.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'
								Value=''/>
						</Parameters>
					</Control>
				</DisplayProperty> -->
				<DisplayProperty PropertyKey=''>
					<Control ID='btnView'
						Type='cButton'
						Container='spnViewApp'
						Image='view_pdf'>
							<Action
							PostBack='True'
							Object='DataPresenter'
							Method='ViewAppPDF'>
								<Parameters>
									<Argument Type='DataObjectCollection'
										TypeKey='ViewAppPDF'
										DataObjectPropertyKey='GranteeProject.ApplWfTaskAssignments.WfTaskAssignmentID'
										PropertyKey='EntityID'
										BaseValue=''/>
									<Argument Type='DataObjectCollection'
										TypeKey='ViewAppPDF'
										DataObjectPropertyKey='WfTask.WfTaskModule.ReportOutputDefinitionID'
										PropertyKey='DefinitionID'
										BaseValue=''/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='GranteeProjectAHA' DataObjectDefinitionKey='GranteeProjectAHA' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' />
				<Argument Type='ModuleUser' TypeKey='PersonID' 
					PropertyKey='PersonID' Value='' />
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='WfTaskID' Value='' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='WfTaskID' Value='' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskRoleID' PropertyKey='PersonRoleID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='IsApproved'>
					<Control ID='ctlIsApproved'
						Container='spnIsApproved'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Approval question is required.'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
						<Validation Type='Custom' Object='EventController' Method='ValidateNonApprovalReason' 
							ErrorMessage='Non-aproval reason is required.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NonApprovalReasion'>
					<Control ID='ctlNonApprovalReason'
						Container='spnNonApprovalReason'
						Type='cTextArea'
						Rows='5'
						Cols='90'
						MaxLength='2000'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,2000}$' ErrorMessage='Limit your Reason to 2000 characters or less.' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
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
							AutoSave='True'
							Object='EventController' 
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
<!-- End Embedded XML -->
