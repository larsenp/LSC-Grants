<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page.cBioMedPanel" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>

<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<font color='red'><%=errMsg%></font>
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- "Content Manager" tags -->
<span id='spnPageContent' runat='server' />
<p>
<!-- Control Label (for Publication upload) -->

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='90%'>
	<tr><td></td>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
      <PageContent />
	
		<DataObject Key='BioMedPanelReviewList' DataObjectDefinitionKey='BioMedPanelReviewList'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ReviewerID' />
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='RevWfTaskID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='ApplicantName'/>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						NoRecordMessage='No reviewer tasks.'
						SeparatorWidth='2'
						MaxPerPage='25'
						IsSaveOnSort='True'
						ShowSubColumnHeaderRow='False'>
						<DisplayProperty PropertyKey='ApplicantName' ColumnHeader='Applicant Name' Width='40%'>
							<Control ID='btnReviewerPDF'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='ViewReviewerPDF'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='AppWftaID' AttributeName='WfTaskAssignmentID='/>
										<Argument Type='DataObject' TypeKey='RevPDFDefinitionID' AttributeName='DefinitionID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewRating' ColumnHeader='Score' HeaderAlign='Center' DataAlign='Center' Width='15%'>
							<Parameters>
								<Argument Value='1'
									ValueKey='RevWfTaskStatusID'
									DisplayValue='Control' PropertyKey='ReviewRating'>
									<Control ID='ctlRating'
										Type='cTextBox'
										Size='3'
										MaxLength='3'
										RequiredField='False'
										ErrorMessage='Score for each applicant is required.'>
										<Validation Type='RegularExpression'
											ValidationExpression='^([1234]{1})(\.)(\d{1})$|^(5\.0)$'
											ErrorMessage='Enter a valid score (i.e., 1.0, 1.2, etc.) that is formatted with one decimal place and is within the range 1.0 to 5.0, inclusive.' />
									</Control>
								</Argument>
							</Parameters>
							<Parameters>
								<Argument Value='2' ValueKey='RevWfTaskStatusID' PropertyKey='ReviewRating'/>
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Comments' HeaderAlign='Center' DataAlign='Center' Width='15%'>
							<Control ID='btnAddComment'
								Type='cButton'
								Image='Add'>
								<Action PostBack='True'
									Object='DataPresenter'
									Method='EditPanelComments'>
									<Parameters>
										<Argument Value='CommentsEditor'/>
										<Argument Type='DataObject' TypeKey='RevWftaID' AttributeName='RevWftaID' Value=''/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' Value=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnEditComment'
								Type='cButton'
								Image='Edit'>
								<Action PostBack='True'
									Object='DataPresenter'
									Method='EditPanelComments'>
									<Parameters>
										<Argument Value='CommentsEditor'/>
										<Argument Type='DataObject' TypeKey='RevWftaID' AttributeName='RevWftaID' Value=''/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' Value=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' HeaderColspan='2' HeaderAlign='Right' DataAlign='Right' ColumnHeader='Options' Width='30%'>
							<Parameters>
								<Argument Value='1'
									ValueKey='RevWfTaskStatusID'
									DisplayValue='Control'>
									<Control ID='btnSubmitComment'
										Type='cButton'
										Image='Submit'>
										<Action PostBack='True'
											Object='DataPresenter'
											Method='SubmitPanelScore'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='RevWftaID' AttributeName='RevWftaID' Value=''/>
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
	</ModuleSection>
</span>
