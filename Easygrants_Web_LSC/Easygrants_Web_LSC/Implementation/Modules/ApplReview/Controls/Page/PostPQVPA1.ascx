<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:cNewWindowOpener runat='server' id='ctlNewWindowOpener'/>
<br />
	<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/PPQVApplicantInformation.ascx'
	runat='server'/>
	<br />
<p>
<div class='SeparatorHdg'>Performance Area One</div><br />
<div class="MinorSeparatorHdg">Recommendations</div>
<span runat='server' id='spnNoRecs'/>
<span runat='server' id='spnDPL' />
<br />

<div style="text-align:center">
	<span runat='server' id='spnSaveb4Signifi'/>
</div>
<br />

<div class="MinorSeparatorHdg">Significant Changes</div>
<b>Performance Area One: </b>Significant changes or major developments in the delivery system since the PQV ended, and those anticipated during the grant year.<span style="color:red">*</span>
<br /><br />
<b>Applicant's response </b><br />
<span runat='server' id='spnPA1ApplicantResponse'/>
<br /><br />
<div style="text-align:center">
	<span runat='server' id='spnSaveb4WebForms'/>
</div>
<br />

<div class="MinorSeparatorHdg">Relevant Web Forms</div>
<p><span style="color:red"><b>IMPORTANT</b></span>: Click <span style="color:red">Save</span> at the bottom of the page before opening a Web Form to avoid losing data.</p>
<span runat='server' id='spnDataMethodsForm' />
<br /><br />
<span runat='server' id='spnDataSourcesForm' />
<br /><br />
<span runat='server' id='spnPrioritiesForm' />
<br /><br />
<div class="MinorSeparatorHdg">Overall Staff Analysis and  Assessment</div></p>
<br />
<span runat='server' id='spnCategory1'/>
<table width='100%' cellpadding=0 cellspacing=0>
	<tr>
	    <td width='53%'><b>LSC Staff's Comment on this Performance Area Category<span style="color:red">*</span> </b></td>
	    <td width='47%'align='left'><span runat='server' id='spnCategoryScore1'/><span style="color:red">*</span></td>
	</tr>
</table>
<span runat='server' id='spnCategory1Comment'/>
<br /><br /><br /><br />
<span runat='server' id='spnCategory2'/>
<table width='100%' cellpadding=0 cellspacing=0>
	<tr>
	    <td width='53%'><b>LSC Staff's Comment on this Performance Area Category<span style="color:red">*</span> </b></td>
	    <td width='47%'align='left'><span runat='server' id='spnCategoryScore2'/><span style="color:red">*</span></td>
	</tr>
</table>
<span runat='server' id='spnCategory2Comment'/>
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
					<RelatedProperty PropertyKey='LscPQVRecommendation' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='1' >
					<RelatedProperty PropertyKey='LscPQVRecommendation.LscReviewCriterion.LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='CompetitionID' DataObjectListIndex='0' PropertyKey='CompetitionID'/>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='TimePeriodID' DataObjectListIndex='0' PropertyKey='TimePeriodID'/>
			</Filters>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDPL' 
						Container='spnDPL' 
						Type='cDataPresenterList' 
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/RenewalReview/Controls/Page/PostPQVChild.ascx' />
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='lblNoRecs'
						Container='spnNoRecs'
						Type='cLabel'
						LabelText='The Program Quality Visit report contained no Tier 1 recommendations for Performance Area One'>
						<Visible>
							<Argument PropertyKey='LscPQVRecommendationServAreaID' Value='True' NullDataObject='True'/>
						</Visible>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		 <DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='66' />
			</Filters>
		</DataObject> 
		
		<DataObject Key='LscWftaPostPQVApp' DataObjectDefinitionKey='LscWftaPostPQVApp' Updatable='False' CreateNew='False'>
           <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PA1Response' >
					<Control ID='spnPA1ApplicantResponse'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfTACompetitionYear' DataObjectDefinitionKey='WfTACompetitionYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
		</DataObject>

		<DataObject Key='LscReviewCategory1' DataObjectDefinitionKey='LscReviewCriterion' Updatable='False' CreateNew='False'>
			<Filters>
			    <Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='1' >
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='1' >
					<RelatedProperty PropertyKey='LscReviewCategory' />
				</Argument>
            </Filters>
            <DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCategory1'
						Type='cDataListCtl'
						Container='spnCategory1'
						DataObjectDefinitionKey='LscReviewCriterion'>
						<DisplayProperty PropertyKey='Abbr' ColumnHeader='Criterion' />
						<DisplayProperty PropertyKey='Description' ColumnHeader=' ' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewCategory2' DataObjectDefinitionKey='LscReviewCriterion' Updatable='False' CreateNew='False'>
			<Filters>
			    <Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='1' >
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='2' >
					<RelatedProperty PropertyKey='LscReviewCategory' />
				</Argument>
            </Filters>
            <DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCategory2'
						Type='cDataListCtl'
						Container='spnCategory2'
						DataObjectDefinitionKey='LscReviewCriterion'>
						<DisplayProperty PropertyKey='Abbr'   ColumnHeader='Criterion' Width='20%' />
						<DisplayProperty PropertyKey='Description' ColumnHeader=' ' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewAssignmentCategory1' DataObjectDefinitionKey='LscReviewAssignmentCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscReviewCategory1' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' />
			</Filters>
			<DefaultValues>
                <Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Update='False' Create='True'/>
			    <Argument Type='DataObjectCollection' TypeKey='LscReviewCategory1' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' Update='False' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtCategory1Comment'
						Type='cTextArea'
						Container='spnCategory1Comment'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewInquiryScoreID'>
					<Control ID='ctlCategoryScore1'
						Type='cDropDown'
						Container='spnCategoryScore1'
						DataObjectDefinitionKey='LscReviewInquiryScore'
						StoredValue='LscReviewInquiryScoreID'
						DisplayValue='Value' 
						DisplayText='Select'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewAssignmentCategory2' DataObjectDefinitionKey='LscReviewAssignmentCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscReviewCategory2' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' />
			</Filters>
			<DefaultValues>
                <Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Update='False' Create='True'/>
			    <Argument Type='DataObjectCollection' TypeKey='LscReviewCategory2' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' Update='False' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtCategory2Comment'
						Type='cTextArea'
						Container='spnCategory2Comment'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewInquiryScoreID'>
					<Control ID='ctlCategoryScore2'
						Type='cDropDown'
						Container='spnCategoryScore2'
						DataObjectDefinitionKey='LscReviewInquiryScore'
						StoredValue='LscReviewInquiryScoreID'
						DisplayValue='Value' 
						DisplayText='Select'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>


		<%--<DataObject Key='LscWftaReviewPostPQVApp' DataObjectDefinitionKey='LscWftaReviewPostPQVApp' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PA1Response'>
					<Control ID='txtPA1Response'
						Type='cTextArea'
						Container='spnPA1StaffResponse'
						Rows='5'
						Cols='70'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>--%>
		
				
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
			    <DisplayProperty PropertyKey=''>
					<Control ID='btnSave1'
						Type='cButton'
						Caption='Save'
						Container='spnSaveb4Signifi'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave2'
						Type='cButton'
						Caption='Save'
						Container='spnSaveb4WebForms'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
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
								<Argument Value='PostPQVPA2' />
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
								<Argument Value='PostPQVForm' />
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
								<Argument Value='PostPQVPA2' />
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
								<Argument Value='PostPQVForm' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlDataMethodsForm' Container='spnDataMethodsForm' Type='cLink' Caption='Click to view the Data Collection Methods Form'>
					  <Action PostBack='True' 
				        Object='EventController'
				        Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
						<Parameters>			
							<Argument Value='PV_Data_Methods'/>					
				        <Argument Value='PageFrame=Print' />
						</Parameters>
					  </Action>
					</Control>
		       </DisplayProperty>
		       <DisplayProperty PropertyKey=''>
					<Control ID='ctlDataSourcesForm' Container='spnDataSourcesForm' Type='cLink' Caption='Click to view the Data Sources and Tools Form'>
					  <Action PostBack='True' Object='EventController' Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
						<Parameters>			
							<Argument Value='PV_Data_Sources' />				
				        <Argument Value='PageFrame=Print' />
						</Parameters>
					  </Action>
					</Control>
		       </DisplayProperty>
		        <DisplayProperty PropertyKey=''>
					<Control ID='ctlPrioritiesForm' Container='spnPrioritiesForm' Type='cLink' Caption='Click to view the Priorities, Goals, Strategies and Desired Outcomes Form'>
					  <Action PostBack='True' Object='EventController' Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
						<Parameters>			
							<Argument Value='PV_Priorities' />				
				        <Argument Value='PageFrame=Print' />
						</Parameters>
					  </Action>
					</Control>
		       </DisplayProperty>
			</DisplayProperties>
		</DataObject>
	  
	</ModuleSection>
</span>