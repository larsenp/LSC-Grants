<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>

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
<div class='SeparatorHdg'>Comments from OPP Director and Vice President</div>
<br />

<div class='MinorSeparatorHdg' width='100%'>
	General Comments
</div>
<div runat='server' id='divOtherGeneralComments' />
<br />
<div class='SeparatorHdg'>President's Review</div>
<br />
<b>President's Decision</b><br />
<span runat='server' id='spnWfTaskOutcomeID'/><br /><br />

<b>President's Comments</b><br />
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
							<Argument PropertyKey='WfTaskID' Value='71' />
							<Argument PropertyKey='WfTaskOutcome' Value='In Process' Operator='NotEqual' />
						</Filters>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
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
								<Argument Value='TIGLOIReview_O_R_WI_President' />
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>


		<DataObject Key='LscExternalReviewApplicationsList' DataObjectDefinitionKey='LscExternalReviewApplicationsList'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument Group='(' Bool='And' />
					<Argument PropertyKey='RevWfTaskID' Value='70' Bool=''/>	
					<Argument PropertyKey='RevWfTaskID' Value='92' Bool='Or'/>
				<Argument Group=')' Bool='' />
				<Argument PropertyKey='RevWfTaskStatusID' Value='3' Operator='NotEqual'/>
			</Filters>
			<DisplayProperties>
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
