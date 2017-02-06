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
<div class='SeparatorHdg'>Performance Area Four</div><br />
<div class="MinorSeparatorHdg">Recommendations</div>
<span runat='server' id='spnNoRecs'/>
<span runat='server' id='spnDPL' />

<div style="text-align:center">
	<span runat='server' id='spnSaveb4Signifi'/>
</div>
<br />

<div class="MinorSeparatorHdg">Significant Changes</div>
<b>Performance Area Four: </b>Significant changes or major developments in the delivery system since the PQV ended, and those anticipated during the grant year.
<br /><br />
<b>Applicant's response </b><br />
<span runat='server' id='spnPA4ApplicantResponse'/>
<br /><br />

<div style="text-align:center">
	<span runat='server' id='spnSaveb4WebForms'/>
</div>
<br />

<div class="MinorSeparatorHdg">Relevant Web Forms</div>
<p><span style="color:red"><b>IMPORTANT</b></span>: Click one of the <span style="color:red">Save</span> buttons on the page before opening a Web Form to avoid losing data.</p>
<span runat='server' id='spnBoardPoliciesForm' />
<br /><br />
<span runat='server' id='spnContinuityForm' />
<br /><br />
<span runat='server' id='spnAccomplishOtherProviders' />
<br /><br />


<div class="MinorSeparatorHdg">Supplemental Inquiries</div><br />
Describe Applicant's systems and procedures that ensure compliance and enforcement of LSC’s policies and regulatory requirements, identify staff training provided and the frequency of Applicant’s internal compliance reviews.
<br /><br />
<b>Applicant's response </b><br />
	<span runat='server' id='spnApplicantSystemsProcedures'/>
<br /><br />


<div class="MinorSeparatorHdg">Overall Staff Analysis and  Assessment</div></p>
<br />
<span runat='server' id='spnCategory11'/>
<table width='100%' cellpadding=0 cellspacing=0>
	<tr>
	    <td width='53%'><b>LSC Staff's Comment on this Performance Area Category<span style="color:red">*</span> </b></td>
	    <td width='47%'align='left'><span runat='server' id='spnCategoryScore11'/><span style="color:red">*</span></td>
	</tr>
</table>
<span runat='server' id='spnCategory11Comment'/>
<br /><br />
<br /><br />
<span runat='server' id='spnCategory12'/>
<table width='100%' cellpadding=0 cellspacing=0>
	<tr>
	    <td width='53%'><b>LSC Staff's Comment on this Performance Area Category<span style="color:red">*</span> </b></td>
	    <td width='47%'align='left'><span runat='server' id='spnCategoryScore12'/><span style="color:red">*</span></td>
	</tr>
</table>
<span runat='server' id='spnCategory12Comment'/>
<br /><br />
<br /><br />
<span runat='server' id='spnCategory13'/>
<table width='100%' cellpadding=0 cellspacing=0>
	<tr>
	    <td width='53%'><b>LSC Staff's Comment on this Performance Area Category<span style="color:red">*</span> </b></td>
	    <td width='47%'align='left'><span runat='server' id='spnCategoryScore13'/><span style="color:red">*</span></td>
	</tr>
</table>
<span runat='server' id='spnCategory13Comment'/>
<br /><br />
<br /><br />
<span runat='server' id='spnCategory14'/>
<table width='100%' cellpadding=0 cellspacing=0>
	<tr>
	    <td width='53%'><b>LSC Staff's Comment on this Performance Area Category<span style="color:red">*</span> </b></td>
	    <td width='47%'align='left'><span runat='server' id='spnCategoryScore14'/><span style="color:red">*</span></td>
	</tr>
</table>
<span runat='server' id='spnCategory14Comment'/>
<br /><br />
<br /><br />
<span runat='server' id='spnCategory15'/>
<table width='100%' cellpadding=0 cellspacing=0>
	<tr>
	    <td width='53%'><b>LSC Staff's Comment on this Performance Area Category<span style="color:red">*</span> </b></td>
	    <td width='47%'align='left'><span runat='server' id='spnCategoryScore15'/><span style="color:red">*</span></td>
	</tr>
</table>
<span runat='server' id='spnCategory15Comment'/>
<br /><br />
<br /><br />
<span runat='server' id='spnCategory16'/>
<table width='100%' cellpadding=0 cellspacing=0>
	<tr>
	    <td width='53%'><b>LSC Staff's Comment on this Performance Area Category<span style="color:red">*</span> </b></td>
	    <td width='47%'align='left'><span runat='server' id='spnCategoryScore16'/><span style="color:red">*</span></td>
	</tr>
</table>
<span runat='server' id='spnCategory16Comment'/>
<br /><br />
<br /><br />
<span runat='server' id='spnCategory17'/>
<table width='100%' cellpadding=0 cellspacing=0>
	<tr>
	    <td width='53%'><b>LSC Staff's Comment on this Performance Area Category<span style="color:red">*</span> </b></td>
	    <td width='47%'align='left'><span runat='server' id='spnCategoryScore17'/><span style="color:red">*</span></td>
	</tr>
</table>
<span runat='server' id='spnCategory17Comment'/>
<br /><br />
<br /><br />
<span runat='server' id='spnCategory18'/>
<table width='100%' cellpadding=0 cellspacing=0>
	<tr>
	    <td width='53%'><b>LSC Staff's Comment on this Performance Area Category<span style="color:red">*</span> </b></td>
	    <td width='47%'align='left'><span runat='server' id='spnCategoryScore18'/><span style="color:red">*</span></td>
	</tr>
</table>
<span runat='server' id='spnCategory18Comment'/>
<br /><br />

<div style="text-align:center">
	<span runat='server' id='spnSave'/>&nbsp;
	<%--<span runat='server' id='spnSaveContinue'/>&nbsp;--%>
	<span runat='server' id='spnSaveClose'/>
	<span runat='server' id='spnClose'/>
</div>
<br /><br />



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
				<Argument PropertyKey='SortOrder' Value='4' >
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
						LabelText='The Program Quality Visit report contained no Tier 1 recommendations for Performance Area Four'>
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
				<DisplayProperty PropertyKey='PA4Response' >
					<Control ID='spnPA4ApplicantResponse'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SystemsProcedures' >
					<Control ID='spnApplicantSystemsProcedures'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfTACompetitionYear' DataObjectDefinitionKey='WfTACompetitionYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
		</DataObject>

		<DataObject Key='LscReviewCategory11' DataObjectDefinitionKey='LscReviewCriterion' Updatable='False' CreateNew='False'>
			<Filters>
			    <Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='4' >
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='1' >
					<RelatedProperty PropertyKey='LscReviewCategory' />
				</Argument>
            </Filters>
            <DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCategory11'
						Type='cDataListCtl'
						Container='spnCategory11'
						DataObjectDefinitionKey='LscReviewCriterion'>
						<DisplayProperty PropertyKey='Abbr' ColumnHeader='Criterion' Width='20' />
						<DisplayProperty PropertyKey='Description' ColumnHeader=' ' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewCategory12' DataObjectDefinitionKey='LscReviewCriterion' Updatable='False' CreateNew='False'>
			<Filters>
			    <Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='4' >
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='2' >
					<RelatedProperty PropertyKey='LscReviewCategory' />
				</Argument>
            </Filters>
            <DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCategory12'
						Type='cDataListCtl'
						Container='spnCategory12'
						DataObjectDefinitionKey='LscReviewCriterion'>
						<DisplayProperty PropertyKey='Abbr'   ColumnHeader='Criterion' Width='20' />
						<DisplayProperty PropertyKey='Description' ColumnHeader=' ' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewCategory13' DataObjectDefinitionKey='LscReviewCriterion' Updatable='False' CreateNew='False'>
			<Filters>
			    <Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='4' >
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='3' >
					<RelatedProperty PropertyKey='LscReviewCategory' />
				</Argument>
            </Filters>
            <DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCategory13'
						Type='cDataListCtl'
						Container='spnCategory13'
						DataObjectDefinitionKey='LscReviewCriterion'>
						<DisplayProperty PropertyKey='Abbr'   ColumnHeader='Criterion' Width='20' />
						<DisplayProperty PropertyKey='Description' ColumnHeader=' ' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewCategory14' DataObjectDefinitionKey='LscReviewCriterion' Updatable='False' CreateNew='False'>
			<Filters>
			    <Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='4' >
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='4' >
					<RelatedProperty PropertyKey='LscReviewCategory' />
				</Argument>
            </Filters>
            <DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCategory14'
						Type='cDataListCtl'
						Container='spnCategory14'
						DataObjectDefinitionKey='LscReviewCriterion'>
						<DisplayProperty PropertyKey='Abbr'   ColumnHeader='Criterion' Width='20' />
						<DisplayProperty PropertyKey='Description' ColumnHeader=' ' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewCategory15' DataObjectDefinitionKey='LscReviewCriterion' Updatable='False' CreateNew='False'>
			<Filters>
			    <Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='4' >
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='5' >
					<RelatedProperty PropertyKey='LscReviewCategory' />
				</Argument>
            </Filters>
            <DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCategory15'
						Type='cDataListCtl'
						Container='spnCategory15'
						DataObjectDefinitionKey='LscReviewCriterion'>
						<DisplayProperty PropertyKey='Abbr'   ColumnHeader='Criterion' Width='20' />
						<DisplayProperty PropertyKey='Description' ColumnHeader=' ' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewCategory16' DataObjectDefinitionKey='LscReviewCriterion' Updatable='False' CreateNew='False'>
			<Filters>
			    <Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='4' >
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='6' >
					<RelatedProperty PropertyKey='LscReviewCategory' />
				</Argument>
            </Filters>
            <DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCategory16'
						Type='cDataListCtl'
						Container='spnCategory16'
						DataObjectDefinitionKey='LscReviewCriterion'>
						<DisplayProperty PropertyKey='Abbr'   ColumnHeader='Criterion' Width='20' />
						<DisplayProperty PropertyKey='Description' ColumnHeader=' ' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewCategory17' DataObjectDefinitionKey='LscReviewCriterion' Updatable='False' CreateNew='False'>
			<Filters>
			    <Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='4' >
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='7' >
					<RelatedProperty PropertyKey='LscReviewCategory' />
				</Argument>
            </Filters>
            <DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCategory17'
						Type='cDataListCtl'
						Container='spnCategory17'
						DataObjectDefinitionKey='LscReviewCriterion'>
						<DisplayProperty PropertyKey='Abbr'   ColumnHeader='Criterion' Width='20' />
						<DisplayProperty PropertyKey='Description' ColumnHeader=' ' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewCategory18' DataObjectDefinitionKey='LscReviewCriterion' Updatable='False' CreateNew='False'>
			<Filters>
			    <Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='4' >
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='9' >
					<RelatedProperty PropertyKey='LscReviewCategory' />
				</Argument>
            </Filters>
            <DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCategory18'
						Type='cDataListCtl'
						Container='spnCategory18'
						DataObjectDefinitionKey='LscReviewCriterion'>
						<DisplayProperty PropertyKey='Abbr'   ColumnHeader='Criterion' Width='20' />
						<DisplayProperty PropertyKey='Description' ColumnHeader=' ' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewAssignmentCategory11' DataObjectDefinitionKey='LscReviewAssignmentCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscReviewCategory11' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' />
			</Filters>
			<DefaultValues>
                <Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Update='False' Create='True'/>
			    <Argument Type='DataObjectCollection' TypeKey='LscReviewCategory11' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' Update='False' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtCategory11Comment'
						Type='cTextArea'
						Container='spnCategory11Comment'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewInquiryScoreID'>
					<Control ID='ctlCategoryScore11'
						Type='cDropDown'
						Container='spnCategoryScore11'
						DataObjectDefinitionKey='LscReviewInquiryScore'
						StoredValue='LscReviewInquiryScoreID'
						DisplayValue='Value' 
						DisplayText='Select'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewAssignmentCategory12' DataObjectDefinitionKey='LscReviewAssignmentCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscReviewCategory12' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' />
			</Filters>
			<DefaultValues>
                <Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Update='False' Create='True'/>
			    <Argument Type='DataObjectCollection' TypeKey='LscReviewCategory12' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' Update='False' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtCategory12Comment'
						Type='cTextArea'
						Container='spnCategory12Comment'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewInquiryScoreID'>
					<Control ID='ctlCategoryScore12'
						Type='cDropDown'
						Container='spnCategoryScore12'
						DataObjectDefinitionKey='LscReviewInquiryScore'
						StoredValue='LscReviewInquiryScoreID'
						DisplayValue='Value' 
						DisplayText='Select'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

        <DataObject Key='LscReviewAssignmentCategory13' DataObjectDefinitionKey='LscReviewAssignmentCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscReviewCategory13' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' />
			</Filters>
			<DefaultValues>
                <Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Update='False' Create='True'/>
			    <Argument Type='DataObjectCollection' TypeKey='LscReviewCategory13' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' Update='False' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtCategory13Comment'
						Type='cTextArea'
						Container='spnCategory13Comment'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewInquiryScoreID'>
					<Control ID='ctlCategoryScore13'
						Type='cDropDown'
						Container='spnCategoryScore13'
						DataObjectDefinitionKey='LscReviewInquiryScore'
						StoredValue='LscReviewInquiryScoreID'
						DisplayValue='Value' 
						DisplayText='Select'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
        
        <DataObject Key='LscReviewAssignmentCategory14' DataObjectDefinitionKey='LscReviewAssignmentCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscReviewCategory14' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' />
			</Filters>
			<DefaultValues>
                <Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Update='False' Create='True'/>
			    <Argument Type='DataObjectCollection' TypeKey='LscReviewCategory14' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' Update='False' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtCategory14Comment'
						Type='cTextArea'
						Container='spnCategory14Comment'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewInquiryScoreID'>
					<Control ID='ctlCategoryScore14'
						Type='cDropDown'
						Container='spnCategoryScore14'
						DataObjectDefinitionKey='LscReviewInquiryScore'
						StoredValue='LscReviewInquiryScoreID'
						DisplayValue='Value' 
						DisplayText='Select'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewAssignmentCategory15' DataObjectDefinitionKey='LscReviewAssignmentCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscReviewCategory15' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' />
			</Filters>
			<DefaultValues>
                <Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Update='False' Create='True'/>
			    <Argument Type='DataObjectCollection' TypeKey='LscReviewCategory15' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' Update='False' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtCategory15Comment'
						Type='cTextArea'
						Container='spnCategory15Comment'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewInquiryScoreID'>
					<Control ID='ctlCategoryScore15'
						Type='cDropDown'
						Container='spnCategoryScore15'
						DataObjectDefinitionKey='LscReviewInquiryScore'
						StoredValue='LscReviewInquiryScoreID'
						DisplayValue='Value' 
						DisplayText='Select'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewAssignmentCategory16' DataObjectDefinitionKey='LscReviewAssignmentCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscReviewCategory16' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' />
			</Filters>
			<DefaultValues>
                <Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Update='False' Create='True'/>
			    <Argument Type='DataObjectCollection' TypeKey='LscReviewCategory16' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' Update='False' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtCategory16Comment'
						Type='cTextArea'
						Container='spnCategory16Comment'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewInquiryScoreID'>
					<Control ID='ctlCategoryScore16'
						Type='cDropDown'
						Container='spnCategoryScore16'
						DataObjectDefinitionKey='LscReviewInquiryScore'
						StoredValue='LscReviewInquiryScoreID'
						DisplayValue='Value' 
						DisplayText='Select'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
        
        <DataObject Key='LscReviewAssignmentCategory17' DataObjectDefinitionKey='LscReviewAssignmentCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscReviewCategory17' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' />
			</Filters>
			<DefaultValues>
                <Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Update='False' Create='True'/>
			    <Argument Type='DataObjectCollection' TypeKey='LscReviewCategory17' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' Update='False' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtCategory17Comment'
						Type='cTextArea'
						Container='spnCategory17Comment'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewInquiryScoreID'>
					<Control ID='ctlCategoryScore17'
						Type='cDropDown'
						Container='spnCategoryScore17'
						DataObjectDefinitionKey='LscReviewInquiryScore'
						StoredValue='LscReviewInquiryScoreID'
						DisplayValue='Value' 
						DisplayText='Select'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewAssignmentCategory18' DataObjectDefinitionKey='LscReviewAssignmentCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscReviewCategory18' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' />
			</Filters>
			<DefaultValues>
                <Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Update='False' Create='True'/>
			    <Argument Type='DataObjectCollection' TypeKey='LscReviewCategory18' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' Update='False' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtCategory18Comment'
						Type='cTextArea'
						Container='spnCategory18Comment'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewInquiryScoreID'>
					<Control ID='ctlCategoryScore18'
						Type='cDropDown'
						Container='spnCategoryScore18'
						DataObjectDefinitionKey='LscReviewInquiryScore'
						StoredValue='LscReviewInquiryScoreID'
						DisplayValue='Value' 
						DisplayText='Select'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
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
					<Control ID='ctlBoardPoliciesForm' Container='spnBoardPoliciesForm' Type='cLink' Caption='Click to view the Board Policies and Practices Form'>
					  <Action PostBack='True' Object='EventController' Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
						<Parameters>			
							<Argument Value='PV_Board_Policies'/>					
				        <Argument Value='PageFrame=Print' />
						</Parameters>
					  </Action>
					</Control>
		       </DisplayProperty>
		       <DisplayProperty PropertyKey=''>
					<Control ID='ctlContinuityForm' Container='spnContinuityForm' Type='cLink' Caption='Click to view the Continuity of Operations Planning Form'>
					  <Action PostBack='True' Object='EventController' Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
						<Parameters>			
							<Argument Value='PV_Continuity_Oper' />				
				        <Argument Value='PageFrame=Print' />
						</Parameters>
					  </Action>
					</Control>
		       </DisplayProperty>
		        <DisplayProperty PropertyKey=''>
					<Control ID='ctlAccomplishOtherProviders' Container='spnAccomplishOtherProviders' Type='cLink' Caption='Click to view the Accomplishments for Clients with Other Providers Form'>
					  <Action PostBack='True' Object='EventController' Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
						<Parameters>			
							<Argument Value='PV_Accomplish_Other_Services' />				
				        <Argument Value='PageFrame=Print' />
						</Parameters>
					  </Action>
					</Control>
		       </DisplayProperty>
			</DisplayProperties>
		</DataObject>
	  
	</ModuleSection>
</span>