<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.ApplReview.Controls.Page.Hierarchy.cCategory" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>

<b>RFP</b>
<br />
<div class="SeparatorHdg" >Instructions</div>
<p>TBD</p>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>
<br />
<div class="SeparatorHdg" >Categories</div>
<span runat='server' id='spnDatalist' /><br />



<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
	  <DataObject Key='WfTACompetitionYear' DataObjectDefinitionKey='WfTACompetitionYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
		</DataObject>
		
		<DataObject Key='List' DataObjectDefinitionKey='LscCategoryWithInquiries'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'/>
			    <Argument Type='DataPresenter' TypeKey='PA' PropertyKey='PA' />
			    <Argument Type='DataPresenter' TypeKey='Cat' PropertyKey='Cat' />
			</Filters>
			<Sort>
				<Argument PropertyKey='CriterionAbbr'/>
				<Argument PropertyKey='Q'/>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='LscCategoryWithInquiries'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='PA'/>
						<DisplayProperty PropertyKey='CriterionAbbr' ColumnHeader='Criterion'/>
						<DisplayProperty PropertyKey='InquiryAbbr' ColumnHeader='Inquiry'/>
						<DisplayProperty PropertyKey='InquiryDesc' ColumnHeader='Description'>
							<Control ID='lnkInquiry'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ReviewInquiry'/>
										<Argument Type='DataObject' TypeKey='InquiryID' AttributeName='InquiryID' BaseValue='LscReviewInquiryID='/>
										<Argument Type='QueryString' TypeKey='Page' AttributeName='ReturnPageKey' BaseValue='ReturnPageKey='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
			
	</ModuleSection>
</span>
