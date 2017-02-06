<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlReviewInfo' 
	Src='Implementation/Modules/TIG_ApplReview/Forms/ReviewInfo.ascx'
	runat='server'/>
	
<div class='SeparatorHdg'>Prior TIG Awards</div>
<br />
<span runat='server' id='spnDPL' /><br />
<div class='MinorSeparatorHdg'>Applicant's Comments</div>
<br />
<span runat='server' id='spnPriorTigAwards' />
<br /><br />
<div class='MinorSeparatorHdg'>Comments from Other Reviewers</div>
<br />
<span runat='server' id='spnPriorTigGrantsCommentOther' />
<br />
<div class='MinorSeparatorHdg'>Your Comments</div>
<br />
<span runat='server' id='spnPriorTigGrantsComment' />
<br /><br />
<div style="text-align:center">
	<span runat='server' id='spnSave' />
	<span runat='server' id='spnSaveContinue' />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='CurrentGranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
		</DataObject>

		<DataObject Key='PriorTIGAwards' DataObjectDefinitionKey='GranteeProject' Updatable='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='CurrentGranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='PrimaryOrganizationID' />
				<Argument PropertyKey='ProgramID' Value='2'>
					<RelatedProperty PropertyKey='WfProject.WfCompetition' />
				</Argument>
				<Argument Group='(' Bool='And' />
					<Argument PropertyKey='GrantStatusID' Value='1' Bool='' />
					<Argument PropertyKey='GrantStatusID' Value='4' Bool='Or' />
				<Argument Group=')' Bool='' />
			</Filters>
			<Sort>
				<Argument PropertyKey='LegacyGrantID' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDPL' Container='spnDPL' Type='cDataPresenterList' DataPresenterID='DPL' DataPresenterURL='Implementation/Modules/TIG_Application/Forms/PriorTIGAwardsChild.ascx' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscTigReviewOpenRepWebImprOther' DataObjectDefinitionKey='LscTigReviewOpenRepWebImpr' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' >
					<RelatedProperty PropertyKey='WfTaskAssignment' />
				</Argument>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Operator='NotEqual'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPriorTigGrantsCommentOther'
						Type='cDataListCtl'
						Container='spnPriorTigGrantsCommentOther'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='PriorTigGrantsComment' ColumnHeader='Comment' >
							<Control ID='lblPriorTigGrantsComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscTigReviewOpenRepWebImpr' DataObjectDefinitionKey='LscTigReviewOpenRepWebImpr' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PriorTigGrantsComment'>
					<Control ID='txtPriorTigGrantsComment'
						Type='cTextArea'
						Container='spnPriorTigGrantsComment'
						Rows='5'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save'
						Container='spnSave'>
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

		<DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='41' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscTigApp.PriorTigAwards'>
					<Control ID='lblPriorTigAwards'
						Type='cLabel'
						Container='spnPriorTigAwards'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
