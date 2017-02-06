<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<h1>RFP Criteria</h1>
<div width='100%' class='SeparatorHdg'>
	Instructions
</div>
<p>
	Applicants will respond to all RFP Inquiries and Charts through this online application system. 
</p>
<p>
	The RFP Inquiries and Charts are organized according to the Performance Criteria. To begin responding to the RFP Inquiries and Charts, click on the link for any of the Performance Criteria in the listing below. The system will open the page for that criterion, and display all of the RFP Inquiries and Charts associated with that criterion. 
</p>
<p>
	<em>Note that Performance Area One, Criterion 3 and Performance Area Four, Criterion 8, do not appear in the list. The RFP addresses those topics elsewhere, and there are no RFP Inquiries or Charts for either of those criteria. </em>
</p>
<div width='100%' class='SeparatorHdg'>
	References
</div>
	<ul>
		<li>
			<a target='_blank' href='http://www.lsc.gov/about/laws-regulations/lsc-regulations-cfr-45-part-1600-et-seq'>LSC Regulations</a>
		</li>
		<li>
			<a target='_blank' href='http://www.lsc.gov/sites/default/files/Grants/civillegalaidstds2006.pdf'>ABA Standards</a>
		</li>
		<li>
			<a target='_blank' href=' http://www.lsc.gov/media-center/publications/lsc-performance-criteria'>LSC Performance Criteria</a>
		</li>
		<li>
			<a target='_blank' href=' http://www.lsc.gov/grants-grantee-resources/resources'>LRI - LSC Resource Information</a>
		</li>
		<li>
			<a target='_blank' href=' http://grants.archive.lsc.gov/assistance/faqs'>Frequently Asked Questions (FAQs)</a>
		</li>
		<li>
			<a target='_blank' href=' http://grants.archive.lsc.gov/assistance/responding-rfp-inquiries'>Suggestions for Responding to RFP Inquiries</a>
		</li>
		<li>
			<a target='_blank' href='http://grants.lsc.gov/assistance/applicant-informational-session'>Applicant Informational Session</a>
		</li>
	</ul>
	<p>For additional help, send an email to the <a href='mailto:competition@lsc.gov'>LSC Competition Service Desk</a> (general inquiries) or the <a href='mailto:techsupport@lsc.gov'>Technical Assistance Service Desk</a> (technical support).</p>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
	
<div width='100%' class='SeparatorHdg'>
	Criteria
</div>
<span runat='server' id='spnDatalist' /><br />



<table width='100%'>
	<tr>
		<td colspan='2' align='center'>
			<span runat='server' id='spnSave' />&nbsp;
			<span runat='server' id='spnContinue' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
	   <DataObject Key='WfTACompetitionYear' DataObjectDefinitionKey='WfTACompetitionYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
		</DataObject>
		
		<DataObject Key='List' DataObjectDefinitionKey='LscCriteriaWithInquiries'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='PA'/>
				<Argument PropertyKey='C'/>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='LscCriteriaWithInquiries'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='PA'/>
						<DisplayProperty PropertyKey='C'/>
						<DisplayProperty PropertyKey='Criterion' >
							<Control ID='lnkCriterion'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='AppFormByCriterion'/>
										<Argument Type='DataObject' TypeKey='CriterionID' AttributeName='CriterionID' BaseValue='LscReviewCriterionID='/>
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
