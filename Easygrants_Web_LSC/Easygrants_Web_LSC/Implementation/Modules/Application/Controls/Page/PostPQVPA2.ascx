<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.Page.cPostPQVPA" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<div style='width:600' class='SeparatorHdg'>
	Instructions
</div>
<div style='width:600' >
	<table width='100%'>
		<tr>
			<td>
			<p>In the <b>Performance Area Two form</b>, Applicants respond to each of the LSC Tier 1 recommendations, and describe significant changes or major developments in the delivery system that have occurred since the PQV ended, and those that are anticipated during the grant year.  <b>All inquiries are required</b>.  See page 17 of the LSC Post PQV RFP for guidance on responding to Tier 1 recommendations and describing changes and developments in the delivery system.</p>
			<p>If there are no recommendations for Performance Area Two, the form will state, “The Program Quality Visit report contained no recommendations for Performance Area Two.” </p>
			</td>
			<td width="160" valign="top" >
				<Core:cUserCtlLoader CtlID='ctlQuickLinks' 
					Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
					runat='server'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan="2">
				<ul>
					<li>To save data, click <b>Save</b></li>
					<li>To save data and continue to the next form, click <b>Save and Continue</b></li>
					<li>To continue without saving data, click <b>Continue Without Saving</b></li>
					<li>To return to the PQV main page, click <b>Close</b>.</li>
				</ul>
				<b>Follow the steps below for assistance on this form:</b>
				<ul>
					<li>Submit inquiries pertaining to technical issues, using the website application, and uploading files to <a href='mailto:techsupport@lsc.gov'>techsupport@lsc.gov</a>.</li>
					<li>Submit all other inquiries regarding this form or the grants process to the LSC Competition Service Desk at <a href='mailto:competition@lsc.gov'>competition@lsc.gov</a>.</li>
					<li>Contact Reginald Haley at <a href='mailto:haleyr@lsc.gov'>haleyr@lsc.gov</a> if you do not receive a response from either service desk within 48 hours.</li>
				</ul>
			</td>
		</tr>
	</table>
	<br />
	<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
	<br />
<p>
<div class='SeparatorHdg'>Performance Area Two</div>
<i>Effectiveness in engaging and serving the low-income population throughout the service area (i.e., dignity and sensitivity; engagement with the low-income population; intake  and access and utilization by the low-income population). </i>
</p>
<div class="MinorSeparatorHdg">Recommendations</div>
<span runat='server' id='spnNoRecs'/>
<span runat='server' id='spnDPL' /><br />

<div class="MinorSeparatorHdg">Significant Changes</div>
<b>Performance Area Two: </b>Significant changes or major developments in the delivery system since the PQV ended, and those anticipated during the grant year.<span style="color:red">*</span>
<br /><br />
<span runat='server' id='spnPA2Response'/>
<br /><br />
<span runat='server' id='spnCharts'/>
<br /><br />
<div style="text-align:center">
	<span runat='server' id='spnSave'/>&nbsp;
	<span runat='server' id='spnSaveContinue'/>&nbsp;
	<span runat='server' id='spnSaveClose'/>
</div>
<br /><br />
<div style="text-align:center">
	<span runat='server' id='spnContinue'/>&nbsp;
	<span runat='server' id='spnClose'/>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False'  >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
		</DataObject>

	    <DataObject Key='LscPQVRecommendationVisitData' DataObjectDefinitionKey='LscPQVRecommendationVisitData' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
			</Filters>
			<Sort>
			   <Argument PropertyKey='VisitDate' Direction='Descending'/>
			</Sort>
	   </DataObject>
	
		<DataObject Key='vLSCCompWftaOrgServareaYear' DataObjectDefinitionKey='vLSCCompWftaOrgServareaYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
		</DataObject>
	
	  <DataObject Key='LscPQVRecommendationServArea' DataObjectDefinitionKey='LscPQVRecommendationServArea' Updatable='True' CreateNew='False' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscPQVRecommendationVisitData' DataObjectPropertyKey='LscPQVReportID' PropertyKey='LscPQVReportID' >
					<RelatedProperty PropertyKey='LscPQVRecommendation'/>
				</Argument>
				<Argument Group='('/>
					<Argument PropertyKey='SortOrder' Value='2' Bool=''>
						<RelatedProperty PropertyKey='LscPQVRecommendation.LscReviewCriterion.LscReviewPerformanceArea' />
					</Argument>
					<Argument PropertyKey='SortOrder' Value='2' Bool='Or'>
						<RelatedProperty PropertyKey='LscPQVRecommendation.LscReviewCriterion.LscReviewCategory.LscReviewPerformanceArea' />
					</Argument>
				<Argument Group=')' Bool=''/>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='CompetitionID' DataObjectListIndex='0' PropertyKey='CompetitionID'/>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='TimePeriodID' DataObjectListIndex='0' PropertyKey='TimePeriodID'/>
			</Filters>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDPL' 
						Container='spnDPL' 
						Type='cDataPresenterList' 
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/Application/Controls/PageSection/PostPQVChild.ascx' />
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='lblNoRecs'
						Container='spnNoRecs'
						Type='cLabel'
						LabelText='The Program Quality Visit report contained no Tier 1 recommendations for Performance Area Two'>
						<Visible>
							<Argument PropertyKey='LscPQVRecommendationServAreaID' Value='True' NullDataObject='True'/>
						</Visible>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscWftaPostPQVApp' DataObjectDefinitionKey='LscWftaPostPQVApp' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PA2Response'>
					<Control ID='txtPA2Response'
						Type='cTextArea'
						Container='spnPA2Response'
						Rows='5'
						Cols='70'/>
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
						Caption='Save and Continue'
						Container='spnSaveContinue'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PostPQVPA3' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClose'
						Type='cButton'
						Caption='Save and Close'
						Container='spnSaveClose'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PQV' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Caption='Continue Without Saving'
						Container='spnContinue'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PostPQVPA3' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Type='cButton'
						Caption='Close'
						Container='spnClose'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PQV' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	  
		<DataObject Key='InquiryForm' DataObjectDefinitionKey='LscReviewInquiry' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey='LscReviewCriterion.LscReviewCategory.LscReviewPerformanceArea'/>
				</Argument>
				<Argument PropertyKey='SortOrder' Value='2'>
					<RelatedProperty PropertyKey='LscReviewCriterion.LscReviewCategory.LscReviewPerformanceArea'/>
				</Argument>
				<Argument PropertyKey='Abbr' Value='F' Operator='Like'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder' >
					<RelatedProperty PropertyKey='LscReviewCriterion.LscReviewCategory.LscReviewPerformanceArea'/>
				</Argument>
				<Argument PropertyKey='Abbr' >
					<RelatedProperty PropertyKey='LscReviewCriterion'/>
				</Argument>
				<Argument PropertyKey='SortOrder' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='lstCharts'
						Type='cDataListCtl'
						Container='spnCharts'
						NoRecordMessage='There are no RFP charts associated with this performance area.'
						ShowColumnHeaderRow='False'>
						<HeaderHtml>
							RFP Charts Related To Performance Area Two
						</HeaderHtml>
						<DisplayProperty PropertyKey='Description' ColumnHeader='Form' >
							<Control ID='lnkForm'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='EventController_Save'/>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='FormPageKey' AttributeName='PageKey' />
										<Argument Type='DataObject' TypeKey='LscReviewCriterionID' AttributeName='LscReviewCriterionID' BaseValue='LscReviewCriterionID='/>
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