<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<style type='text/css' media='screen'>
	.commlist {
			position: relative;
			left: 30px;
			padding-top: 5px;
	}
</style>
<br />
  <Core:cUserCtlLoader 
		ID="CUserCtlLoader2" 
		CtlID='ctlTIGLOIInfo' 
		Src='Implementation/Modules/TIG_LOI_Review/Forms/TIGLOIInfo.ascx' 
		runat='server' />

<div class='SeparatorHdg' width='100%'>
	Comments
</div>
<br />



<div class='MinorSeparatorHdg' width='100%'>
	Project Description
</div>
<p><b>Applicant Response</b><br /> <span runat='server' id='spnProjectDescription' /></p>
<b>Comments from Other Reviewers</b><br />
<div runat='server' id='divProjectDescriptionOthercomments' class='commlist' />
<b>Reviewer Comments</b><br />
<span runat='server' id='spnProjectDescriptionComment' />
<br /><br />

<div class='MinorSeparatorHdg' width='100%'>
	Benefits
</div>
<p></p><b>Applicant Response</b><br /> <span runat='server' id='spnBenefits' /></p>
<b>Comments from Other Reviewers</b><br />
<div runat='server' id='spnBenefitsOtherComments' class='commlist' />
<b>Reviewer Comments</b><br />
<span runat='server' id='spnBenefitsComment' />
<br /><br />

<div class='MinorSeparatorHdg' width='100%'>
	Costs
</div>
<p><b>Applicant Response</b><br /> <span runat='server' id='spnCosts' /></p>
<b>Comments from Other Reviewers</b><br />
<div runat='server' id='divCostsOtherComments' class='commlist' />
<b>Reviewer Comments</b><br />
<span runat='server' id='spnCostsComment' />
<br /><br />

<div class='MinorSeparatorHdg' width='100%'>
	Partners
</div>
<p><b>Applicant Response</b><br /> <span runat='server' id='spnPartners' /></p>
<b>Comments from Other Reviewers</b><br />
<div runat='server' id='divPartnersOtherComments' class='commlist' />
<b>Reviewer Comments</b><br />
<span runat='server' id='spnPartnersComment' />
<br /><br />

<div class='MinorSeparatorHdg' width='100%'>
	Innovation
</div>
<p><b>Applicant Response</b><br /> <span runat='server' id='spnInnovation' /></p>
<b>Comments from Other Reviewers</b><br />
<div runat='server' id='divInnovationOtherComments' class='commlist' />
<b>Reviewer Comments</b><br />
<span runat='server' id='spnInnovationComment' />
<br /><br />

<div class='MinorSeparatorHdg' width='100%'>
	General Comments
</div>
<b>Comments from Other Reviewers</b><br />
<div runat='server' id='divOtherGeneralComments' class='commlist' />
<b>Recommendation</b>&nbsp;
<span runat='server' id='spnWfTaskOutcomeID'/><br /><br />
<b>Reviewer Comments</b><br />
<span runat='server' id='spnComments' />
<br /><br />

<div style="width:100%; text-align: center">
	<span runat="server" id='spnSave' />
	<span runat="server" id='spnSaveContinue' />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTaskOutcomeID'>
					<Control ID='ctlWfTaskOutcomeID'
						Type='cDropDown'
						Container='spnWfTaskOutcomeID'
						DataObjectDefinitionKey='WfTaskOutcome'
						DisplayValue='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'>
						<Filters>
							<Argument PropertyKey='WfTaskID' Value='39'/>
							<Argument PropertyKey='WfTaskOutcome' Value='In Process' Operator='NotEqual'/>
							<Argument PropertyKey='WfTaskOutcome' Value='Submitted' Operator='NotEqual'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscTigLoiReviewOpp' DataObjectDefinitionKey='LscTigLoiReviewOpp' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ProjectDescriptionComment'>
					<Control ID='txtProjectDescriptionComment'
						Type='cTextArea'
						Container='spnProjectDescriptionComment'
						Rows='6'
						Cols='75' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='BenefitsComment'>
					<Control ID='txtBenefitsComment'
						Type='cTextArea'
						Container='spnBenefitsComment'
						Rows='6'
						Cols='75' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CostsComment'>
					<Control ID='txtCostsComment'
						Type='cTextArea'
						Container='spnCostsComment'
						Rows='6'
						Cols='75' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PartnersComment'>
					<Control ID='txtPartnersComment'
						Type='cTextArea'
						Container='spnPartnersComment'
						Rows='6'
						Cols='75' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='InnovationComment'>
					<Control ID='txtInnovationComment'
						Type='cTextArea'
						Container='spnInnovationComment'
						Rows='6'
						Cols='75' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave' 
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveContinue'
						Type='cButton'
						Container='spnSaveContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LSCTIGLOIReadOnly' DataObjectDefinitionKey='LSCTIGLOIReadOnly' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ProjectDesc' HtmlEncode='False'>
					<Control ID='spnProjectDescription'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Benefits' HtmlEncode='False'>
					<Control ID='spnBenefits'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Costs' HtmlEncode='False'>
					<Control ID='spnCosts'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Partners' HtmlEncode='False'>
					<Control ID='spnPartners'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Innovation' HtmlEncode='False'>
					<Control ID='spnInnovation'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscExternalReviewApplicationsListOther' DataObjectDefinitionKey='LscExternalReviewApplicationsList'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LSCTIGLOIReadOnly' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='AppWftaID' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ReviewerID' Operator='NotEqual'/>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder'>
					<RelatedProperty PropertyKey='RevWfta.ReviewAssignmentType'/>
				</Argument>
				<Argument PropertyKey='LastName'>
					<RelatedProperty PropertyKey='RevWfta.Person'/>
				</Argument>
				<Argument PropertyKey='FirstName'>
					<RelatedProperty PropertyKey='RevWfta.Person'/>
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlProjectDescriptionOthercomments'
						Type='cDataListCtl'
						Container='divProjectDescriptionOthercomments'
						DataObjectDefinitionKey='ExternalReviewApplicationsList'>
						<DisplayProperty PropertyKey='RevWfta.Person.FirstNameLastName' ColumnHeader='Reviewer' Width='20%'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='RevWfta.Person' />
								</Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='RevWfta.Person' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RevWfta.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'>
							<Sortable>
								<Argument PropertyKey='SortOrder'>
									<RelatedProperty PropertyKey='RevWfta.ReviewAssignmentType'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RevWfta.LscTigLoiReviewOppReadOnly.ProjectDescriptionComment' ColumnHeader='Comments'/>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlBenefitsOtherComments'
						Type='cDataListCtl'
						Container='spnBenefitsOtherComments'
						DataObjectDefinitionKey='ExternalReviewApplicationsList'>
						<DisplayProperty PropertyKey='RevWfta.Person.FirstNameLastName' ColumnHeader='Reviewer' Width='20%'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='RevWfta.Person' />
								</Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='RevWfta.Person' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RevWfta.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'>
							<Sortable>
								<Argument PropertyKey='SortOrder'>
									<RelatedProperty PropertyKey='RevWfta.ReviewAssignmentType'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RevWfta.LscTigLoiReviewOppReadOnly.BenefitsComment' ColumnHeader='Comments'/>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlCostsOtherComments'
						Type='cDataListCtl'
						Container='divCostsOtherComments'
						DataObjectDefinitionKey='ExternalReviewApplicationsList'>
						<DisplayProperty PropertyKey='RevWfta.Person.FirstNameLastName' ColumnHeader='Reviewer' Width='20%'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='RevWfta.Person' />
								</Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='RevWfta.Person' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RevWfta.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'>
							<Sortable>
								<Argument PropertyKey='SortOrder'>
									<RelatedProperty PropertyKey='RevWfta.ReviewAssignmentType'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RevWfta.LscTigLoiReviewOppReadOnly.CostsComment' ColumnHeader='Comments'/>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlPartnersOtherComments'
						Type='cDataListCtl'
						Container='divPartnersOtherComments'
						DataObjectDefinitionKey='ExternalReviewApplicationsList'>
						<DisplayProperty PropertyKey='RevWfta.Person.FirstNameLastName' ColumnHeader='Reviewer' Width='20%'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='RevWfta.Person' />
								</Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='RevWfta.Person' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RevWfta.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'>
							<Sortable>
								<Argument PropertyKey='SortOrder'>
									<RelatedProperty PropertyKey='RevWfta.ReviewAssignmentType'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RevWfta.LscTigLoiReviewOppReadOnly.PartnersComment' ColumnHeader='Comments'/>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlInnovationOtherComments'
						Type='cDataListCtl'
						Container='divInnovationOtherComments'
						DataObjectDefinitionKey='ExternalReviewApplicationsList'>
						<DisplayProperty PropertyKey='RevWfta.Person.FirstNameLastName' ColumnHeader='Reviewer' Width='20%'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='RevWfta.Person' />
								</Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='RevWfta.Person' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RevWfta.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'>
							<Sortable>
								<Argument PropertyKey='SortOrder'>
									<RelatedProperty PropertyKey='RevWfta.ReviewAssignmentType'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RevWfta.LscTigLoiReviewOppReadOnly.InnovationComment' ColumnHeader='Comments'/>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlOtherGeneralComments'
						Type='cDataListCtl'
						Container='divOtherGeneralComments'
						DataObjectDefinitionKey='ExternalReviewApplicationsList'>
						<DisplayProperty PropertyKey='RevWfta.Person.FirstNameLastName' ColumnHeader='Reviewer' Width='20%'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='RevWfta.Person' />
								</Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='RevWfta.Person' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RevWfta.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'>
							<Sortable>
								<Argument PropertyKey='SortOrder'>
									<RelatedProperty PropertyKey='RevWfta.ReviewAssignmentType'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RevWfta.WfTaskOutcome.WfTaskOutcome' ColumnHeader='Recommendation'/>
						<DisplayProperty PropertyKey='RevWfta.WfTaskAssignmentReview.Comments' ColumnHeader='Comments'/>
					</Control>
				</DisplayProperty>

			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfTaskAssignmentReview' DataObjectDefinitionKey='WfTaskAssignmentReview' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comments'>
					<Control ID='txtComments'
						Type='cTextArea'
						Container='spnComments'
						Rows='6'
						Cols='75' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
