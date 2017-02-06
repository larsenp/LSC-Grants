<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="BioMedAssignedApplications.ascx.vb" Inherits="Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page.cBioMedAssignedApplications" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<font color='red'><%=errMsg%></font>
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- "Content Manager" tags -->
<span id='spnPageContent' runat='server' />
<br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Submission</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2">
			You may save your changes, log out, and return to this page as often as desired
			until you are finished.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2">
			When you are finished entering ratings and comments for all applications assigned
			to you, click on the <b>Submit</b> button to submit your reviews to HHMI. Saving
			and/or submitting your information may take several minutes depending on the number
			of applications that are being submitted.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2">
			After submission, you will be able to view other reviewers' <b>Unattributed
			Comments</b> for the applications you reviewed.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><a name='Save1'/><span id='spnSave1' runat='server'/>&nbsp;&nbsp;&nbsp;&nbsp;<span id='spnSubmit1' runat='server'/></td></tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Assigned Applications</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2">
			Click the <b>View PDF</b> button to view each institution's
			<span id='spnMore' runat='server'/>. (Make sure pop-up blockers are turned off).
		</td>
	</tr>
</table>
<p>
<!-- Page Content - Controls -->
<a name='List'/>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td width=1%></td>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>
	<tr>
		<td align='center'>
			<a name='Save'/><span runat='server' id='spnSave' />&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSubmit' />
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
      <PageContent />

		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
			</Filters>
		</DataObject>
		<DataObject Key='ReviewCycleStage' DataObjectDefinitionKey='ReviewCycleStage' Updatable='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
			</Filters>
		</DataObject>
	
		<DataObject Key='BioMedAssignedApplicationsList' DataObjectDefinitionKey='BioMedAssignedApplicationsList' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ReviewerID' Value='' />
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='RevWfTaskID' Value=''/>
				<Argument Type='DataObjectCollection' TypeKey='ReviewCycleStage' DataObjectPropertyKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='CommonOrganizationName'>
					<RelatedProperty PropertyKey='AppPerson.PersonPrimaryAffiliation.Organization'/>
				</Argument>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GradAssignedApplicationsList'
						NoRecordMessage='No reviewer tasks.'
						SeparatorWidth='2'
						MaxPerPage='600'
						IsSaveOnSort='True'
						ShowSubColumnHeaderRow='False'>
						<DisplayProperty PropertyKey='ViewApplicationURL' ColumnHeader='Application' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnViewPDF'
								Type='cButton'  DisableControl='False'
								Image='View_PDF'>
								<Action
									PostBack='False'
									Target='_blank'
									URL='WebRelative'/>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='AppPerson.PersonPrimaryAffiliation.Organization.CommonOrganizationName' ColumnHeader='Organization' NoWrap='true'>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='AppPerson.PersonPrimaryAffiliation.Organization'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ApplicantName' ColumnHeader='Applicant' NoWrap='true'>
							<Sortable>
								<Argument PropertyKey='ApplicantName'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Rating' ColumnHeader='Rating' HeaderAlign='Center' DataAlign='Center' NoWrap='True'>
							<Control ID='ctlOptions'
								Type='cRadioButtonList'
								LoadParam='True'
								RepeatDirection='Horizontal'
								RepeatColumns='0'>
								<Parameters>
									<Parameter StoredValue='1' DisplayValue='A'/>
									<Parameter StoredValue='2' DisplayValue='B'/>
									<Parameter StoredValue='3' DisplayValue='C'/>
									<Parameter StoredValue='4' DisplayValue='D'/>
									<Parameter StoredValue='5' DisplayValue='F'/>
								</Parameters>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Comments' HeaderAlign='Center' DataAlign='Center'>
							<Parameters>
								<Argument Value='' ValueKey='RevWfta.WfTaskAssignmentReview.Comments' Operator='Equal' DisplayValue='Control'>
									<Control ID='btnAddComment'
										Type='cButton'
										Image='Add'>
										<Action
											PostBack='True'
											Object='DataPresenter'
											Method='RedirectToCommentsEditor'>
											<Parameters>
												<Argument Value='CommentsEditor'/>
												<Argument Type='DataObject' TypeKey='RevWftaID' AttributeName='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>
												<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>
												<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' Value=''/>
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='' ValueKey='RevWfta.WfTaskAssignmentReview.Comments' Operator='NotEqual' DisplayValue='Control'>
									<Control ID='btnEditComment'
										Type='cButton'
										Image='Edit'>
										<Action
											PostBack='True'
											Object='DataPresenter'
											Method='RedirectToCommentsEditor'>
											<Parameters>
												<Argument Value='CommentsEditor'/>
												<Argument Type='DataObject' TypeKey='RevWftaID' AttributeName='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>
												<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>
												<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' Value=''/>
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

		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlMore'
						Container='spnMore'
						Type='cTextPopUp'
						PopUpTitle='Application'
						Caption='application'
						Width='600'
						Height='220'>
						<InstructionHtml>
							The application document will be displayed in Adobe Acrobat. For optimal viewing we recommend using Adobe Acrobat Reader version 5.x or higher.						</InstructionHtml>
						<Action PostBack='False'>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save' EnterKey='True'
						ToolTipText='Save and stay on this page'>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='Save'>
							<Parameters>
								<Argument Type='' TypeKey='' AttributeName='Anchor' Value='Save'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave1'
						Container='spnSave1'
						Type='cButton'
						Image='Save'
						ToolTipText='Save and stay on this page'>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='Save'>
							<Parameters>
								<Argument Type='' TypeKey='' AttributeName='Anchor' Value='Save1'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit'
						Container='spnSubmit'
						Type='cButton'
						Image='Submit' 
						ToolTipText='Submit your ratings and comments.'
						Confirmation='Are you sure you want to Submit?  Once you submit, you will not be able to make changes to your Ratings or Comments.'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='Submit'>
							<Parameters>
								<Argument Type='' TypeKey='' AttributeName='CommentsRequired' Value='True'/>
								<Argument Type='' TypeKey='' AttributeName='Anchor' Value='Save'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>							
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit1'
						Container='spnSubmit1'
						Type='cButton' 
						Image='Submit'
						ToolTipText='Submit your ratings and comments.'
						Confirmation='Are you sure you want to Submit?  Once you submit, you will not be able to make changes to your Ratings or Comments.'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='Submit'>
							<Parameters>
								<Argument Type='' TypeKey='' AttributeName='CommentsRequired' Value='True'/>
								<Argument Type='' TypeKey='' AttributeName='Anchor' Value='Save1'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>							
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
