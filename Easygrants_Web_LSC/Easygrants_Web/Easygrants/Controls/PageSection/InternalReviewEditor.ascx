<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cInternalReviewEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="InternalReviewEditor.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='Crumb' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>

<br><br>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	
<Crumb:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='' visible='true'
	AutoVDateType='Relative' Key='InternalReviewEditor' LinkTitle='Internal Review Editor' runat='server'/>
	
<Core:cUserCtlLoader CtlID='ctlApplicantInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
	
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
<tr><td>&nbsp;</td></tr>		
<tr>
	<td>
		<span runat='server' id='spnSave0'/>
		<span runat='server' id='spnCancel0'/>		
	</td>
</tr>

</table>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>

<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Internal Comments</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
		If desired, you can enter optional comments regarding your review of this application.  After entering your comments, click the <b>Save</b> button.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td width='10'>&nbsp;</td>
		<td>
			<table>
				<tr>
					<td><span id='spnCmt' runat='server'/></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Request for Additional Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
		You can use the system to optionally request additional information from the applicant by clicking the <b>Add</b> button in this section.  Requests for additional information will be sent via e-mail to the applicant's primary e-mail address. Follow the directions on the page that opens to complete your request for additional information.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td>
			<span id='spnAdd' runat='server'/>
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<span id='spnList' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server' visible='false'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Feedback for Applicant</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' visible='false'>
	<tr>
		<td width='10'>&nbsp;</td>
		<td>
			<table>
				<tr>
					<td><span id='spnNotes' runat='server'/></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Outcome</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
			To set your desired outcome for this round of application review, click the arrow for the drop-down list below and select your desire Outcome.  Click <b>Save</b> to save your changes.  When you are finished with your review, and have made your final outcome, click the <b>Submit</b> button to complete the review.		
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td width='10'>&nbsp;</td>
		<td><b>Outcome</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<table>
				<tr>
					<td><span id='spnOutcome' runat='server'/></td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>

<table id='tbSubmit' visible='true' border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr><td>&nbsp;</td></tr>		
	<tr><td>&nbsp;</td>
		<td>When you have assigned the final outcome for this review, click the <b>Submit</b> button below.</td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td>&nbsp;</td>
		<td>
			<span runat='server' id='spnSubmit'/>		
		</td>
	</tr>		
</table>


<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='Cmt' DataObjectDefinitionKey='ReviewInternalComment' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='RevWfTaskAssignmentID'
					Value='' 
					bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='RevWfTaskAssignmentID' Update='True' Value=''/>
			</DefaultValues>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='ctlCmt'
						Container='spnCmt'
						Type='cTextArea'
						Cols='90'
						Rows='10'
						MaxLength='3000'
						TooLongMessage='The maximum length is 30000 characters (approximately 9450 words).'
						RequiredField='False'
						ErrorMessage='Enter notes.'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Notes' DataObjectDefinitionKey='ReviewFeedbackToApplicant' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='RevWfTaskAssignmentID'
					Value='' 
					bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='RevWfTaskAssignmentID' Update='True' Value=''/>
			</DefaultValues>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='ctlNotes'
						Container='spnNotes'
						Type='cTextArea'
						Cols='90'
						Rows='3'
						MaxLength='200'
						TooLongMessage='The note can not be longer than 200 letters.'
						RequiredField='False'
						ErrorMessage='Enter notes.'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID'
					Value='' 
					bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Update='True' Create='True'/>
			</DefaultValues>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='WfTaskOutcomeID'>
					<Control ID='ctlOutcome'
						Container='spnOutcome'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome'
						DisplayNone='False'
						RequiredField='True'
						ErrorMessage='Select an outcome !'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID' Value=''/>
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTaskOutcome' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit'
						Container='spnSubmit'
						Type='cButton'
						Image='Submit'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='Submit'/>						
						<Visible>
							<Argument PropertyKey='WfTaskStatusID' Value='1' NullDataObject='' />
						</Visible>
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>

		<DataObject Key='ReviewAdditionalInformation' DataObjectDefinitionKey='ReviewAdditionalInformation'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID'
					PropertyKey='RevWfTaskAssignmentID' Value='' bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='Subject' />	
			</Sort>	
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='ReviewAdditionalInformation'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='Subject' ColumnHeader='Subject' />
						<DisplayProperty PropertyKey='RequestDate' ColumnHeader='Request Date' Format='M/d/yyyy'/>
						
						<DisplayProperty PropertyKey='' ColumnHeader='Options' DataAlign='Center' HeaderColspan='1' HeaderAlign='Right'>
							<Parameters>
								
								<Argument ValueKey='IsSend' Value='False' DisplayValue='Control'>
									<Control ID='btnEdit'
										Type='cButton'
										Image='Edit'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey' Value='SendEmail'/>
												<Argument Type='DataObject' TypeKey='ReviewAdditionalInformationID' AttributeName='ReviewAdditionalInformationID' BaseValue='ReviewAdditionalInformationID='/>
												<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='' BaseValue='WfTaskAssignmentID=' bool=''/>
												<Argument Type='QueryString' TypeKey='AppWfTaskAssignmentID' PropertyKey='' BaseValue='AppWfTaskAssignmentID=' bool=''/>
												<Argument Type='QueryString' TypeKey='DefinitionID' PropertyKey='' BaseValue='DefinitionID=' bool=''/>
												<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' Value=''/>
											</Parameters>					
										</Action>
									</Control>
								</Argument>							
								
								<Argument ValueKey='IsSend' Value='True' DisplayValue='Control'>
									<Control ID='btnView'
										Type='cButton'
										Image='View'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey' Value='ViewEmail'/>
												<Argument Type='DataObject' TypeKey='ReviewAdditionalInformationID' AttributeName='ReviewAdditionalInformationID' BaseValue='ReviewAdditionalInformationID='/>
												<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='' BaseValue='WfTaskAssignmentID=' bool=''/>
												<Argument Type='QueryString' TypeKey='AppWfTaskAssignmentID' PropertyKey='' BaseValue='AppWfTaskAssignmentID=' bool=''/>
												<Argument Type='QueryString' TypeKey='DefinitionID' PropertyKey='' BaseValue='DefinitionID=' bool=''/>
												<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' Value=''/>
											</Parameters>					
										</Action>
									</Control>
								</Argument>							

							</Parameters>
						</DisplayProperty>

						<DisplayProperty PropertyKey='' DataAlign='Left'>
							<Parameters>

								<Argument ValueKey='IsSend' Value='False' DisplayValue='Control'>
									<Control ID='btnDelete'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='ReviewAdditionalInformationID' AttributeName='ReviewAdditionalInformationID'/>
											</Parameters>
										</Action>
									</Control>
								</Argument>							

							</Parameters>
						</DisplayProperty>
						
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
<!-- Save and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd'
						Container='spnAdd'
						Type='cButton'
						Image='Add'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='SendEmail'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='ReviewAdditionalInformationID=0'/>
									<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='' BaseValue='WfTaskAssignmentID=' bool=''/>
									<Argument Type='QueryString' TypeKey='AppWfTaskAssignmentID' PropertyKey='' BaseValue='AppWfTaskAssignmentID=' bool=''/>
									<Argument Type='QueryString' TypeKey='DefinitionID' PropertyKey='' BaseValue='DefinitionID=' bool=''/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' Value=''/>
								</Parameters>					
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>								
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave0'
						Container='spnSave0'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel0'
						Container='spnCancel0'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>								
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>								
	</ModuleSection>
</span>
<!-- End Embedded XML -->
