<%@ Control Language="vb" AutoEventWireup="true" Codebehind="HomeContent.ascx.vb" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<div style="width:800px">
	<Core:cUserCtlLoader CtlID='ctlApplicationInfo' 
				Src='Implementation/Modules/PBIF_Risk_Assessment_Review/PageSection/ApplicationInfo.ascx'
				runat='server'/>
	<br />
	<div class="SeparatorHdg" style="width:100%">
		LSC Due Diligence
	</div>
	<br />
	<table width='100%'>
		<tr>
			<td style='width:100px'>
				<b>PAI Waivers</b>
			</td>
			<td style='width:100px'>
				<span runat='server' id='spnPAIWaivers'/>
			</td>
			<td >
				<span runat='server' id='spnPAIWaiversDesc'/>
			</td>
		</tr>
		<tr>
			<td>
				<b>TIG Performance</b>
			</td>
			<td>
				<span runat='server' id='spnTIGPerformance'/>
			</td>
			<td >
				<span runat='server' id='spnTIGPerformanceDesc'/>
			</td>
		</tr>
		<tr>
			<td>
				<b>Special Grant Conditions</b>
			</td>
			<td>
				<span runat='server' id='spnSpecialGrantConditions'/>
			</td>
			<td>
				<span runat='server' id='spnSpecialGrantConditionsDesc'/>
			</td>
		</tr>
		<tr>
			<td>
				<b>OCE Compliance and Fiscal Issues</b>
			</td>
			<td>
				<span runat='server' id='spnOCEComplianceFiscalReviews'/>
			</td>
			<td>
				<span runat='server' id='spnOCEComplianceFiscalReviewsDesc'/>
			</td>
		</tr>
		<tr>
			<td>
				<b>OIG investigation/matters</b>
			</td>
			<td>
				<span runat='server' id='spnOIGInvestigationMatters'/>
			</td>
			<td>
				<span runat='server' id='spnOIGInvestigationMattersDesc'/>
			</td>
		</tr>
		<tr>
			<td>
				<b>Issue with Contractor/Subgrantee</b>
			</td>
			<td>
				<span runat='server' id='spnIssueContractorSubgrantee'/>
			</td>
			<td>
				<span runat='server' id='spnIssueContractorSubgranteeDesc'/>
			</td>
		</tr>
		<tr>
			<td>
				<b>Other Comments</b>
			</td>
			<td>
				
			</td>
			<td>
				<span runat='server' id='spnOtherComments'/>
			</td>
		</tr>
		
		
		
	</table>
	<br /><br />
	<div style="text-align:center">
		<span runat='server' id='spnSave'/>&nbsp;&nbsp;
		<span runat='server' id='spnSave_and_Continue'/>
	</div>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
		
		<DataObject Key='LscProBonoRiskAssessmentReview' DataObjectDefinitionKey='LscProBonoRiskAssessmentReview' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</DefaultValues>
			<DisplayProperties>
				
				<DisplayProperty PropertyKey='PAIWaivers'>
					<Control ID='ctlPAIWaivers'
						Container='spnPAIWaivers'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Vertical'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Issue'/>
							<Parameter StoredValue='False' DisplayValue='No&nbsp;Issue'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PAIWaiversDesc'>
					<Control ID='txtPAIWaiversDesc'
						Type='cTextArea'
						Container='spnPAIWaiversDesc'
						Rows='5'
						Cols='60' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='TIGPerformance'>
					<Control ID='ctlTIGPerformance'
						Container='spnTIGPerformance'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Vertical'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Issue'/>
							<Parameter StoredValue='False' DisplayValue='No&nbsp;Issue'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TIGPerformanceDesc'>
					<Control ID='txtTIGPerformanceDesc'
						Type='cTextArea'
						Container='spnTIGPerformanceDesc'
						Rows='5'
						Cols='60' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SpecialGrantConditions'>
					<Control ID='ctlSpecialGrantConditions'
						Container='spnSpecialGrantConditions'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Vertical'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Issue'/>
							<Parameter StoredValue='False' DisplayValue='No&nbsp;Issue'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SpecialGrantConditionsDesc'>
					<Control ID='txtSpecialGrantConditionsDesc'
						Type='cTextArea'
						Container='spnSpecialGrantConditionsDesc'
						Rows='5'
						Cols='60' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OCEComplianceFiscalReviews'>
					<Control ID='ctlOCEComplianceFiscalReviews'
						Container='spnOCEComplianceFiscalReviews'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Vertical'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Issue'/>
							<Parameter StoredValue='False' DisplayValue='No&nbsp;Issue'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OCEComplianceFiscalReviewsDesc'>
					<Control ID='txtOCEComplianceFiscalReviewsDesc'
						Type='cTextArea'
						Container='spnOCEComplianceFiscalReviewsDesc'
						Rows='5'
						Cols='60' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OIGInvestigationMatters'>
					<Control ID='ctlOIGInvestigationMatters'
						Container='spnOIGInvestigationMatters'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Vertical'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Issue'/>
							<Parameter StoredValue='False' DisplayValue='No&nbsp;Issue'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OIGInvestigationMattersDesc'>
					<Control ID='txtOIGInvestigationMattersDesc'
						Type='cTextArea'
						Container='spnOIGInvestigationMattersDesc'
						Rows='5'
						Cols='60' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IssueContractorSubgrantee'>
					<Control ID='ctlIssueContractorSubgrantee'
						Container='spnIssueContractorSubgrantee'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Vertical'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Issue'/>
							<Parameter StoredValue='False' DisplayValue='No&nbsp;Issue'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IssueContractorSubgranteeDesc'>
					<Control ID='txtIssueContractorSubgranteeDesc'
						Type='cTextArea'
						Container='spnIssueContractorSubgranteeDesc'
						Rows='5'
						Cols='60' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherComments'>
					<Control ID='txtOtherComments'
						Type='cTextArea'
						Container='spnOtherComments'
						Rows='5'
						Cols='60' />
				</DisplayProperty>
				
				
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DisplayProperties>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							EnterKey='True'>							
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Caption='Save and Continue'
						Save='False'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>	
		
	</ModuleSection>
</span>
