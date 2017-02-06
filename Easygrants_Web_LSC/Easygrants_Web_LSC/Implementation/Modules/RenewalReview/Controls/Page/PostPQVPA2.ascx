<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
	<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
	<br />
<p>
<div class='SeparatorHdg'>Performance Area Two</div>
<div class="MinorSeparatorHdg">Recommendations</div>
<span runat='server' id='spnNoRecs'/>
<span runat='server' id='spnDPL' /><br />

<div class="MinorSeparatorHdg">Significant Changes</div>
<b>Performance Area Two: </b>Significant changes or major developments in the delivery system since the PQV ended, and those anticipated during the grant year.<span style="color:red">*</span>
<br /><br />
<b>Applicant's response </b><br />
<span runat='server' id='spnPA2ApplicantResponse'/>
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
				<Argument PropertyKey='SortOrder' Value='2' >
					<RelatedProperty PropertyKey='LscPQVRecommendation.LscReviewCriterion.LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
 			    <Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='WfProject.CompetitionID' PropertyKey='CompetitionID' />
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
						LabelText='The Program Quality Visit report contained no Tier 1 recommendations for Performance Area Two'>
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
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey="WfTACompetitionYear"/>
				</Argument>
				<Argument Group='(' Bool='And'/>
				<Argument PropertyKey='WfTaskID' Value='66' Bool=''/>
				<Argument PropertyKey='WfTaskID' Value='67' Bool='Or'/>
				<Argument Group=')' Bool=''/>
			</Filters>
		</DataObject> 
		
		<DataObject Key='LscWftaPostPQVApp' DataObjectDefinitionKey='LscWftaPostPQVApp' Updatable='True' CreateNew='True'>
           <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PA2Response' >
					<Control ID='spnPA2ApplicantResponse'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscWftaReviewPostPQVApp' DataObjectDefinitionKey='LscWftaReviewPostPQVApp' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</DefaultValues>
			<DisplayProperties>
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
								<Argument Value='PostPQVForm' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	  
	</ModuleSection>
</span>