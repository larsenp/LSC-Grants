<%@ Control Language="vb" AutoEventWireup="True" Inherits="Implementation.Modules.ReviewReport.Controls.Page.cReviewProgressReportWithPayment_Content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'/>

<span id='spnPageContent' runat='server'/>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
	    <td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Grant Summary</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table  cellspacing='0' cellpadding='0' runat='server' border='0' width='70%'>
    <tr>
        <td valign="top"><b><%=GetLabel("GrantId")%></b></td>
        <td><span id='spnNumber' runat='server'/></td>
        <td></td>
        <td><b><%=GetLabel("LegacyGrantId")%></b></td>
        <td><span id='spnLegacyGrantID' runat='server'/></td>
    </tr>
    <tr>
        <td valign="top"><b>Grantee <%=GetLabel("Organization")%></b></td>
        <td><span id='spnPrimaryOrganization' runat='server'/></td>
        <td></td>
        <td><b>Primary Contact/PI</b></td>
        <td><span id='spnPrimaryPerson' runat='server'/></td>
    </tr>
     <tr>
        <td valign="top"><b>Status</b></td>
        <td><span id='SpnStatus' runat='server'/></td>
        <td></td>
        <td><b><%=GetLabel("ProgramName")%></b></td>
        <td><span id='spnProgram' runat='server'/></td>
    </tr>
     <tr>
        <td valign="top"><b><%=GetLabel("FundingOpportunity")%></b></td>
        <td><span id='spnCompetition' runat='server'/></td>
        <td></td>
        <td><b><%=GetLabel("FundingCycleName")%></b></td>
        <td><span id='spnProject' runat='server'/></td>
    </tr>
    <tr>
        <td colspan='5'>&nbsp;</td>
    </tr>
     <tr>
        <td valign="top"><b>Created on</b>&nbsp; <span id='SpnCreatedDate' runat='server'/></td>
        <td align="center"><b>Modified on</b></td>
        <td><span id='spnModifyDate' runat='server'/>&nbsp;&nbsp;&nbsp;</td>
        <td><b>Modified by</b></td>
        <td><span id='spnModifyUser' runat='server'/></td>
    </tr>
	<tr>
	    <td>&nbsp;</td>
	</tr>
</table>
<table id='tbPDF' border='0' cellspacing='0' cellpadding='0' runat='server' visible='true'>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlGrantReportLink' Type='cReportOutputLink' runat='server' />
		</td>
	</tr>
</table>

<table border='0' width='100%' cellspacing='0' cellpadding='3'>
	<tr>
		<td colspan='5'	class='SeparatorHdg'  >
			Report Documents
		</td>
		
	</tr>
	
</table>
<p>To view a documents in its original format, click the corresponding <b>View</b> button.</p>
<table width='100%' border='0' id='tblReportDocuments' runat='server' visible='true'>
	<tr>
		<td width='1%'>&nbsp;</td>
		<td>
			<span id='spnReportDocuments' runat='server'/>
		</td>
	</tr>
</table>

<table width='100%' cellpadding='3'>
  <tr>
		<td colspan='3'	class='SeparatorHdg'  >
			Report Outcome
		</td>
		
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr><td colspan='3'>Select the outcome for the report review.</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>
<a name='Outcome'></a>
<table width='100%' cellpadding='3'>	
	<tr>
		<td width='20%'>
			<b>Report Outcome</b>&nbsp;<%=kDenoteRequiredField%>
		</td>
		
		<td >
			<span runat='server' id='spnReportOutcome'></span>
		</td>
	</tr>
	
	<tr>
		<td valign='top'><b>Report Outcome Comments</b></td>
		<td><span runat='server' id='spnOutcomeComments'/></td>
	</tr>
	
	
	<tr><td></td><td>Enter a comment of up to 500 characters.</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>


<a name='Payment'></a>
<table id='tblRptAccepted_GrantProgress' border='0' width='100%' cellspacing='0' cellpadding='3' runat='server' visible='False'>

  <tr>
		<td colspan='3'	class='SeparatorHdg'  >
			Grant Progress
		</td>
		
	</tr>	
	<!--<tr>
		<td colspan='3'>Select the progress of the grant and recommendation for the payment related to this report. The page will 
		refresh once you have selected the payment recommendation. If the payment is not recommended, you will need to select the
		Grant Recommendation to require a grant amendment, suspend the grant, or recommend canceling the grant.
		</td>
	</tr>
	-->
	<tr><td><a name='Progress'></a>&nbsp;</td></tr>	
	<tr>
		<td width='2%'>&nbsp;</td>
		<td width='20%'><b>Grant Progress</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td >
			<span runat='server' id='spnGrantProgress'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table id='tblCompleteReview' border='0' width='100%' cellspacing='0' cellpadding='3' runat='server' visible='False'>

  <tr>
		<td colspan='3'	class='SeparatorHdg'  >
			Complete Review
		</td>
		
	</tr>	
	<tr>
		<td colspan='3'>You can go in and out of this review task as many times as desired until you are ready to submit. 
		To save the changes and return to the Home page, click on the <B>Save</B> button. To return to the Home page without saving 
		the changes, click the <B>Cancel</B> button. The Review Progress Report task will be displayed in the Personal Tasks 
		section of the Home page until submission. To re-access the review, click on the task name link.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3'>To complete the review, click the <b>Submit</b> button.</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table id='tblButtons' border='0' width='100%' cellspacing='0' cellpadding='3' runat='server' visible='True'>

<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'>
			<span runat='server' id="spnCancel" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id="spnSave" />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'>
			<span runat='server' id="spnSubmit" />
		</td>
	</tr>
</table>	
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProjectID'>
					<Control ID='spnNumber'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryOrganization.CommonOrganizationName' >
							<Control ID='ctlLink1' Container='spnPrimaryOrganization'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
									   <Argument AttributeName='PageKey' Value='OrganizationContact'/>
									    <Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' BaseValue='OrganizationID='/>
									</Parameters>
								</Action>
							</Control>							
						</DisplayProperty> 
				<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstName' >
							<Control ID='ctlLink' Container='spnPrimaryPerson'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
									    <Argument AttributeName='PageKey' Value='PersonContact'/>
									    <Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryPersonID' BaseValue='PersonID='/>
									
									</Parameters>
								</Action>
							</Control>							
						</DisplayProperty> 
				
				<DisplayProperty PropertyKey='GrantStatus.Abbr'>
					<Control ID='spnStatus'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
			    <DisplayProperty PropertyKey='LegacyGrantID'>
					<Control ID='spnLegacyGrantID'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProject.WfCompetition.WfProgram.ProgramDisplayName'>
					<Control ID='spnProgram'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProject.WfCompetition.CompetitionDisplayName'>
					<Control ID='spnCompetition'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>													
				<DisplayProperty PropertyKey='WfProject.WfProjectName'>
					<Control ID='spnProject'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CreateDate' Format='MM/dd/yyyy'>
					<Control ID='spnCreatedDate'
						Type='HtmlGenericControl' >
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ModifiedByUser.Person.LastNameFirstName'>
					<Control ID='spnModifyUser'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ModifyDate' Format='MM/dd/yyyy'>
					<Control ID='spnModifyDate'
						Type='HtmlGenericControl' >
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject><!-- Key='GranteeProject' -->

		<DataObject Key='WfProject' DataObjectDefinitionKey='WfProject'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject'
					DataObjectPropertyKey='WfProjectID' PropertyKey='WfProjectID'
					Value='' bool=''/>
			</Filters>
		</DataObject><!-- Key='WFProject' -->
		
		<DataObject Key='ReportOutputDefinition' DataObjectDefinitionKey='ReportOutputDefinition'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfProject'
					DataObjectPropertyKey='FinalPDFReportKey'
					PropertyKey='Key' Value='' bool=''/>
			</Filters>
		</DataObject>
		
		<DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject'
					DataObjectPropertyKey='GranteeProjectID'
					PropertyKey='GranteeProjectID' Value='' bool=''/>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskRoleID'
					Value='8' bool='And'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGrantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View Report~'
						DisplayStaffReportOutput='False'>
						<Parameters>
							<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='EntityID' Value=''/>
							<Argument PropertyKey='DefinitionID' Value='2'/> 
							<!-- 
							<Argument Type='DataObjectCollection' TypeKey='WfProject' DataObjectPropertyKey='FinalPDFReportKey' PropertyKey='Key' Value=''/>
							-->
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject><!-- Key='AppWfTA' -->
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>
	
		<DataObject Key='WfTaskAssignmentExt' DataObjectDefinitionKey='WfTaskAssignmentExt' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<!--
				<DisplayProperty PropertyKey='PaymentRecommendationID'>
					<Control ID='ctlPaymentRecommendation'
						Container='spnPaymentRecommend'
						Type='cDropDown'
						DataObjectDefinitionKey='PaymentRecommendation'
						RequiredField='True'
						ErrorMessage='You must select a Payment Recommendation.'
						StoredValue='PaymentRecommendationID'
						DisplayText='Select'
						DisplayValue='Description'>
						<Sort>
							<Argument PropertyKey='Description' />
						</Sort>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='ControlPaymentRecommendationSelected'>
							<Parameters>
								<Argument Type='Control' TypeKey = 'ctlPaymentRecommendation' ControlPropertyKey='SelectedValue' Value='' />
								<Argument Type='Control' TypeKey = 'ctlGrantProgress' ControlPropertyKey='SelectedValue' Value='' />
								<Argument Type='URL' TypeKey='PathAndQuery' Value=''/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				-->
				<DisplayProperty PropertyKey='GrantProgressID'>
					<Control ID='ctlGrantProgress'
						Container='spnGrantProgress'
						Type='cDropDown'
						DataObjectDefinitionKey='GrantProgress'
						RequiredField='True'
						ErrorMessage='Grant Progress status is required.'
						StoredValue='GrantProgressID'
						DisplayText='Select'
						DisplayValue='Description'>
						<Sort>
							<Argument PropertyKey='Description' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SelectedOutcomeID'>
					<Control ID='ctlReportOutcome'
						Container='spnReportOutcome'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskSelectedOutcome'
						StoredValue='SelectedOutcomeID'
						DisplayValue='SelectedOutcome.Description'
						DisplayNone='False'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Report Outcome is required.'>
						<Sort>
							<Argument PropertyKey='Description' >
								<RelatedProperty PropertyKey='SelectedOutcome' />
							</Argument>
						</Sort>
						<Filters>
							<Argument PropertyKey='WfTaskID' Value='39'/>							
						</Filters>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='ControlOutcomeSelected'>
							<Parameters>
								<Argument Type='Control' TypeKey = 'ctlReportOutcome' ControlPropertyKey='SelectedValue' Value='' />
								<Argument Type='Control' TypeKey = 'ctlGrantProgress' ControlPropertyKey='SelectedValue' Value='' />
								<Argument Type='URL' TypeKey='PathAndQuery' Value=''/>
							</Parameters>
						</Action>
					</Control>						
				</DisplayProperty>
				
			</DisplayProperties>	
		</DataObject>
	
		<DataObject Key='ReportWfTaskAssignmentExt' DataObjectDefinitionKey='WfTaskAssignmentExt' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value='' >
					
				</Argument>
			</Filters>
		</DataObject>
		<!--
		<DataObject Key='PaymentProbabilityAssessment' DataObjectDefinitionKey='PaymentProbabilityAssessment' CreateNew='False' Updatable='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReportWfTaskAssignmentCR' DataObjectPropertyKey='PaymentID' PropertyKey='PaymentID'/>
				<Argument Type='Data' PropertyKey='Completed' Value='True' />
			</Filters>
			<Sort>
				<Argument PropertyKey='AssessmentDate' Direction='Descending'/>
			</Sort>
		</DataObject>
		
		<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReportWfTaskAssignmentCR' DataObjectPropertyKey='ReportWfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProposalLink'
						Type='cReportOutputLink'
						Caption='View_Report'
						Button='True'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='ReportOutputLink'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID' Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='ReportOutputLink'
								DataObjectPropertyKey='GranteeProject.WfProjectPDF.FinalPDFReportKey'
								PropertyKey='Key' Value=''/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		-->
		<DataObject Key='ListReportDocuments' DataObjectDefinitionKey='SubmittedFile' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID' Value=''>
				</Argument>		
			</Filters>
			<Sort>
				<Argument PropertyKey='Description' />	
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlProjectBudgetList'
						Container='spnReportDocuments'
						Type='cDataListCtl'
						DataObjectDefinitionKey='SubmittedFile'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='Description' ColumnHeader='Description' >
							<Sortable>
								<Argument PropertyKey='Description'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubmitDate' ColumnHeader='Submitted Date' Format='M/d/yyyy'>
							<Sortable>
								<Argument PropertyKey='SubmitDate'/>
							</Sortable>
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='UploadedBy.FirstNameLastName' ColumnHeader='Submitted By'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='UploadedBy'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SourceFileName' ColumnHeader='File Name' >
						<Control ID='btnView'
								Type='cLink' >
									<Action
									PostBack='True'
									Object='DataPresenter'
									Method='DataList_ViewUploadedFile'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID='/>
										</Parameters>
									</Action>
							</Control>
						<Sortable>
								<Argument PropertyKey='SourceFileName'/>
							</Sortable>
						</DisplayProperty>
					<!--	<DisplayProperty PropertyKey='SourceFileDisplayURL' ColumnHeader='Options'> -->
						 <!--	<Control ID='btnView'
								Type='cButton'  DisableControl='False'
								Caption='View'>
								<Action
									PostBack='False'
									Target='_blank'
									URL='WebRelative'>
								</Action>
							</Control> -->
						<!--	<Control ID='btnView'
								Type='cButton' DisableControl='False'
								Image='View'>
									<Action
									PostBack='True'
									Object='DataPresenter'
									Method='DataList_ViewUploadedFile'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID='/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty> -->
					</Control>
				</DisplayProperty>
			</DisplayProperties>					
		</DataObject>
	
		<DataObject Key='WfTaskAssignmentReview' DataObjectDefinitionKey='WfTaskAssignmentReview' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comments'>
					<Control ID='ctlOutcomeComments'
						Container='spnOutcomeComments'
						Type='cTextArea'
						Rows='5'
						Cols='80'
						MaxLength='500'
						TooLongMessage='The Report Outcome Comments must be fewer than 500 characters.'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Cancel'>
						<Action
							PostBack='True'
							Object='WebSession'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Value='Staff'/>
								<Argument Value='ModuleConfig'/>
								<Argument Value='Home'/>
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
							Object='DataPresenter'
							Method='RedirectWithoutQueries'>
						</Action>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit'
						Container='spnSubmit'
						Type='cButton'
						Confirmation='Are you sure you want to submit this review?'
						Image='Submit'>
						<Action
							AutoSave='True'
							PostBack='True'
							Object='DataPresenter'
							Method='Submit' />
					</Control>						
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>	
					
	</ModuleSection>
</span>



