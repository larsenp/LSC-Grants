<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlReviewInfo' 
	Src='Implementation/Modules/TIG_ApplReview/Forms/ReviewInfo.ascx'
	runat='server'/>
	
<div class='SeparatorHdg'>Statement of Additional Funds</div>
<br />
<b>Please use this section to describe any additional funds your project will receive from other sources. 
If you do not anticipate any additional project funding, please also indicate that in this section.</b>
<br /><br />
<span runat='server' id='spnStmtAdditionalFunds' />  
<br /><br />
<br />
<div class='MinorSeparatorHdg'>Comments from Other Reviewers</div>
<br />
<span runat='server' id='spnStmtAdditionalFundsCommentOther' />
<br />
<div class='MinorSeparatorHdg'>Your Comments</div>
<br />
<span runat='server' id='spnStmtAdditionalFundsComment' />
<br /><br />
<div width='100%' style="text-align:center" >
	<span runat='server' id='spnSave' />
	<span runat='server' id='spnContinue' />
</div>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='41' />
				<Argument PropertyKey='WfTaskStatusID' Value='2' />
			</Filters>
		</DataObject>

		<DataObject Key='LscTigApp' DataObjectDefinitionKey='LscTigApp' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='StmtAdditionalFunds'>
					<Control ID='lblStmtAdditionalFunds'
						Type='cLabel'
						Container='spnStmtAdditionalFunds'/>
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
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscTigReviewOpenRepWebImprOther' DataObjectDefinitionKey='LscTigReviewOpenRepWebImpr' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' >
					<RelatedProperty PropertyKey='WfTaskAssignment' />
				</Argument>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Operator='NotEqual'/>
				<Argument Type='Data' PropertyKey='WfTaskID' Value='43' >
				   <RelatedProperty PropertyKey='WfTaskAssignment' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlStmtAdditionalFundsCommentOther'
						Type='cDataListCtl'
						Container='spnStmtAdditionalFundsCommentOther'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='StmtAdditionalFundsComment' ColumnHeader='Comment' >
							<Control ID='lblStmtAdditionalFundsComment'
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
				<DisplayProperty PropertyKey='StmtAdditionalFundsComment'>
					<Control ID='txtStmtAdditionalFundsComment'
						Type='cTextArea'
						Container='spnStmtAdditionalFundsComment'
						Rows='5'
						Cols='80' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
