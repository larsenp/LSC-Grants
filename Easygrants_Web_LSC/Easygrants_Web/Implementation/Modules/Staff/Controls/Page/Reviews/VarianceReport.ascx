<%@ Control Language="vb" AutoEventWireup="true" Codebehind="VarianceReport.ascx.vb" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cVarianceReport" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIABLE CONTENT AREA -->

<br>
<Core:cUserCtlLoader CtlID='ReviewStageInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewStageInfo.ascx'
	runat='server'/>
<table runat='server' width='100%'>
	<tr>
		<td class='SeparatorHdg' colspan='2'>Variance Report</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server'>
	<tr>
		<td>
			<b>Review Stage: <span runat='server' id='spnReviewStage' visible='true'/></b>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table runat='server' width='100%'>
	<tr>
		<td colspan='2'><span runat='server' id='spnList'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table id='tblCloseWindow' visible='true' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr align='center'>
		<td><span runat='server' id='spnClose' visible='true'/></td>
	</tr>	
	<tr>
		<td><span runat='server' id='spnCloseControl' visible='false'/></td>
	</tr>	
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='CalculateMinMaxReviewScores' DataObjectDefinitionKey='CalculateMinMaxReviewScores'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
			</Filters>
		</DataObject>
		
		<DataObject Key='GranteeProjectReviewStage' DataObjectDefinitionKey='GranteeProjectReviewStage'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
				<Argument Type='QueryString' TypeKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID'/>
				<Argument Type='Data' TypeKey='' PropertyKey='Variance' Operator='GreaterThanEqual' Value='2'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName'>
					<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
				</Argument>
				<Argument PropertyKey='FirstName'>
					<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
				</Argument>
				<Argument PropertyKey='MiddleName'>
					<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlList'
						Container='spnList'
						Type='cDataListCtl'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName' ColumnHeader='Participant'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.CommonOrganizationName' ColumnHeader='Participant ~~Organization~~'>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryOrganization'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Variance' ColumnHeader='Variance'>
							<Sortable>
								<Argument PropertyKey='Variance'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='VariantTaskAssignments' ColumnHeader='Reviewers in Variance' List='True'>
							<DisplayProperties>
								<DisplayProperty PropertyKey='Person.LastNameFirstNameMiddleName'/>
							</DisplayProperties>
						</DisplayProperty>
						<DisplayProperty PropertyKey='VariantTaskAssignments' ColumnHeader='Score' List='True'>
							<DisplayProperties>
								<DisplayProperty PropertyKey='ReviewRating'/>
							</DisplayProperties>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='ReviewCycleStage' DataObjectDefinitionKey='ReviewCycleStage'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='WfTask.WfTask'>
					<Control ID='spnReviewStage' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CloseWindow' />
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCloseControl'
						Container='spnCloseControl'
						Type='cCloseWindow' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->



