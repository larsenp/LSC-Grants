<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>

<style type='text/css' media='screen'>
	.commlist {
			position: relative;
			left: 30px;
			padding-top: 5px;
	}
</style>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader 
	ID="CUserCtlLoader2" 
	CtlID='ctlTIGLOIInfo' 
	Src='Implementation/Modules/TIG_LOI_Review/Forms/TIGLOIInfo.ascx' 
	runat='server' />
<span runat='server' id='spnReturn' />
<br /><br />
<div class='SeparatorHdg'>Comments from OPP Staff Reviewers</div>
<br />
<div class='MinorSeparatorHdg' width='100%'>
	Project Description
</div>
<div runat='server' id='divProjectDescriptionStaffComments' class='commlist' />
<br /><br />

<div class='MinorSeparatorHdg' width='100%'>
	Benefits
</div>
<div runat='server' id='spnBenefitsStaffComments' class='commlist' />
<br /><br />

<div class='MinorSeparatorHdg' width='100%'>
	Costs
</div>
<div runat='server' id='divCostsStaffComments' class='commlist' />
<br /><br />

<div class='MinorSeparatorHdg' width='100%'>
	Partners
</div>
<div runat='server' id='divPartnersStaffComments' class='commlist' />
<br /><br />

<div class='MinorSeparatorHdg' width='100%'>
	Innovation
</div>
<div runat='server' id='divInnovationStaffComments' class='commlist' />
<br /><br />

<div class='MinorSeparatorHdg' width='100%'>
	General Comments
</div>
<div runat='server' id='divOtherGeneralComments' class='commlist' />
<b>OPP Director Recommendation</b><br />
<span runat='server' id='spnWfTaskOutcomeID'/><br /><br />

<b>OPP Director Comments</b><br />
<span runat='server' id='spnComments' />
<br /><br />
<div style='text-align:center'>
	<span runat='server' id='spnSave'/>&nbsp;<span runat='server' id='spnSaveContinue'/>
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
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome'>
						<Filters>
							<Argument PropertyKey='WfTaskID' Value='70' />
							<Argument PropertyKey='WfTaskOutcome' Value='In Process' Operator='NotEqual' />
						</Filters>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscExternalReviewApplicationsList' DataObjectDefinitionKey='LscExternalReviewApplicationsList'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='RevWfTaskID' Value='39'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder'>
					<RelatedProperty PropertyKey='RevWfta.ReviewAssignmentType'/>
				</Argument>
				<Argument PropertyKey='LastName'>
					<RelatedProperty PropertyKey='RevWfta.Person' />
				</Argument>
				<Argument PropertyKey='FirstName'>
					<RelatedProperty PropertyKey='RevWfta.Person' />
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkReturn'
						Type='cLink'
						Container='spnReturn'
						Caption='Return to Review Assignment List'>
						<Action PostBack='True'
							Object='WebSession'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Value='Staff' />
								<Argument Value='ModuleConfig' />
								<Argument Value='TIGLOIReview_O_R_WI_OPPDir' />
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlProjectDescriptionStaffComments'
						Type='cDataListCtl'
						Container='divProjectDescriptionStaffComments'
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
					<Control ID='ctlBenefitsStaffComments'
						Type='cDataListCtl'
						Container='spnBenefitsStaffComments'
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
					<Control ID='ctlCostsStaffComments'
						Type='cDataListCtl'
						Container='divCostsStaffComments'
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
					<Control ID='ctlPartnersStaffComments'
						Type='cDataListCtl'
						Container='divPartnersStaffComments'
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
					<Control ID='ctlInnovationStaffComments'
						Type='cDataListCtl'
						Container='divInnovationStaffComments'
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
						<DisplayProperty PropertyKey='RevWfta.WfTaskOutcome.WfTaskOutcome' ColumnHeader='Recommendation'>
							<Sortable>
								<Argument PropertyKey='WfTaskOutcome'>
									<RelatedProperty PropertyKey='RevWfta.WfTaskOutcome'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RevWfta.WfTaskAssignmentReview.Comments' ColumnHeader='Comments'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>

		</DataObject>


		<DataObject Key='WfTaskAssignmentReview' DataObjectDefinitionKey='WfTaskAssignmentReview' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comments'>
					<Control ID='txtComments'
						Type='cTextArea'
						Container='spnComments'
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

	</ModuleSection>
</span>
