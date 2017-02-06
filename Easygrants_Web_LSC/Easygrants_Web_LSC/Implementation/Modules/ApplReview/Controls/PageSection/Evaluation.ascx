<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.ApplReview.Controls.PageSection.cEvaluation" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<b>Performance Area <span runat='server' id='spnPA' /></b><br />
Criterion <span runat='server' id='spnCID' />: <span runat='server' id='spnCDesc' /> (<span runat='server' id='spnCWeight' />%)<br />

<div width='100%' class='SeparatorHdg'>
	Instructions
</div>
<p>
	To be determined.
</p>
<div width='100%' class='SeparatorHdg'>
	Applicant Information
</div>
<table width='100%'>
	<tr>
		<td>
			<b>Applicant ID</b> <span runat='server' id='spnApplicantID' />
		</td>
		<td>&nbsp;</td>
		<td>
			<b>Applicant Name</b> <span runat='server' id='spnApplicantName' />
		</td>
		<td>&nbsp;</td>
		<td>
			<b>Service Area</b> <span runat='server' id='spnServiceArea' />
		</td>
		<td>&nbsp;</td>
		<td>
			<b>Year</b> <span runat='server' id='spnYear' />
		</td>
	</tr>
	<tr>
		<td>
			<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/>
		</td>
	</tr>
</table>

<div width='100%' class='SeparatorHdg'>
	Score
</div>
<table width='100%' cellpadding=0 cellspacing=0>
	<tr>
		<td valign='top'>
			<span runat='server' id='spnQID' />&nbsp;
		</td>
		<td valign='top'>
			<span runat='server' id='spnQDesc' />
			<span runat='server' id='spnSubtopics' />
		</td>
		<td align='right' valign='top'>
			<span runat='server' id='spnScore' />
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table>
  <tr>
     <td><span runat='server' id='spnFormButton' /></td>
  </tr>
</table>
<br />
<div width='50%' class='MinorSeparatorHdg'>
	Applicant Response
</div>
<span runat='server' id='spnApplicantResponse' />
<br />
<br />
<div width='100%' class='SeparatorHdg'>
	Strong Elements
</div>
<br />
<p>Check all that apply.</p>
<span runat='server' id='spnStrongElements' />

<div width='100%' class='SeparatorHdg'>
	Weak Elements
</div>
<br />
<p>Check all that apply.</p>
<span runat='server' id='spnWeakElements' />

<div width='100%' class='SeparatorHdg'>
	Comments
</div>
<br />
<p>Enter an optional comment.</p>
<span runat='server' id='spnComment' />

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
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
		</DataObject>
		<DataObject Key='LscReviewInquiry' DataObjectDefinitionKey='LscReviewInquiry' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey='LscReviewCriterion.LscReviewPerformanceArea' />
				</Argument>
				<Argument Type='DataPresenter' TypeKey='PA' PropertyKey='SortOrder'>
					<RelatedProperty PropertyKey='LscReviewCriterion.LscReviewPerformanceArea' />
				</Argument>
				<Argument Type='DataPresenter' TypeKey='C' PropertyKey='Abbr'>
					<RelatedProperty PropertyKey='LscReviewCriterion' />
				</Argument>
				<Argument Type='DataPresenter' TypeKey='Q' PropertyKey='Abbr'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscReviewCriterion.LscReviewPerformanceArea.SortOrder' >
					<Control ID='spnPA'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewCriterion.Abbr' >
					<Control ID='spnCID'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewCriterion.Description' >
					<Control ID='spnCDesc'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewCriterion.Weighting' >
					<Control ID='spnCWeight'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Abbr' >
					<Control ID='spnQID'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description' HtmlEncode='False' >
					<Control ID='spnQDesc'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					 <Control ID='btnForm'
						      Type='cButton'
						      Container='spnFormButton'
						      Caption='View Form'>
						     <Visible>
							        <Argument PropertyKey='FormPageKey' Value='' Operator='NotEqual'/>
						     </Visible>
						     <Action PostBack='True' 
							        Object='EventController'
							        Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
							        <Parameters>			
								        <Argument Type='DataObjectCollection' TypeKey='LscReviewInquiry' DataObjectPropertyKey='FormPageKey' />	
								        <Argument Value='' />
							        </Parameters>
						     </Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='ReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewWfTA' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryOrganization.LegacyOrganizationID'>
					<Control ID='spnApplicantID'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryOrganization.OrganizationName'>
					<Control ID='spnApplicantName'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProject.WfCompetition.CompetitionDisplayName'>
					<Control ID='spnServiceArea'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProject.TimePeriod.Description'>
					<Control ID='spnYear'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewWfTA' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='2' />
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='AppWfTA'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='AppWfTA'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
		
		
		
		<DataObject Key='LscReviewSubtopic' DataObjectDefinitionKey='LscReviewSubtopic' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscReviewInquiry' DataObjectPropertyKey='LscReviewInquiryID' PropertyKey='LscReviewInquiryID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='Abbr' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlSubtopics'
						Type='cDataListCtl'
						Container='spnSubtopics'
						DataObjectDefinitionKey='LscReviewSubtopic'
						ShowColumnHeaderRow='False'>
						<DisplayProperty PropertyKey='Abbr' />
						<DisplayProperty PropertyKey='Description' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewAssignmentInquiry' DataObjectDefinitionKey='LscReviewAssignmentInquiry' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscReviewInquiry' DataObjectPropertyKey='LscReviewInquiryID' PropertyKey='LscReviewInquiryID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Update='False' Create='True'/>
				<Argument Type='DataObjectCollection' TypeKey='LscReviewInquiry' DataObjectPropertyKey='LscReviewInquiryID' PropertyKey='LscReviewInquiryID' Update='False' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscReviewInquiryScoreID'>
					<Control ID='ctlScore'
						Type='cDropDown'
						Container='spnScore'
						DataObjectDefinitionKey='LscReviewInquiryScore'
						StoredValue='LscReviewInquiryScoreID'
						DisplayValue='Value' 
						DisplayText='Select'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtComment'
						Type='cTextArea'
						Container='spnComment'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='StrongElements' DataObjectDefinitionKey='LscReviewInquiryElement' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscReviewInquiry' DataObjectPropertyKey='LscReviewInquiryID' PropertyKey='LscReviewInquiryID' />
				<Argument PropertyKey='LscReviewElementTypeID' Value='1' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlStrongElements'
						Container='spnStrongElements' 
						Type='cDataPresenterList' 
						DataPresenterID='DPLStrong' 
						DataPresenterURL='Implementation/Modules/ApplReview/Controls/PageSection/StrongElementGridItem.ascx' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WeakElements' DataObjectDefinitionKey='LscReviewInquiryElement' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscReviewInquiry' DataObjectPropertyKey='LscReviewInquiryID' PropertyKey='LscReviewInquiryID' />
				<Argument PropertyKey='LscReviewElementTypeID' Value='2' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlWeakElements'
						Container='spnWeakElements' 
						Type='cDataPresenterList' 
						DataPresenterID='DPLWeak' 
						DataPresenterURL='Implementation/Modules/ApplReview/Controls/PageSection/WeakElementGridItem.ascx' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
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
		
		
		
		<DataObject Key='AppWfTAResponse' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewWfTA' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='2' />
			</Filters>
		</DataObject>
		
		<DataObject Key='LscReviewAssignmentInquiryResponse' DataObjectDefinitionKey='LscReviewAssignmentInquiry' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTAResponse' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscReviewInquiry' DataObjectPropertyKey='LscReviewInquiryID' PropertyKey='LscReviewInquiryID' />
			</Filters>
			<DisplayProperties>	
			   <DisplayProperty PropertyKey='Comment'>
					<Control ID='spnApplicantResponse'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		
		 
		<%--<DataObject Key='LscReviewInquiry' DataObjectDefinitionKey='LscReviewInquiry'  Updatable='False' CreateNew='False'>
            <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		    <DisplayProperties>
		             <DisplayProperty PropertyKey=''>
					 <Control ID='btnForm'
						      Type='cButton'
						      Container='spnFormButton'
						      Caption='Form'>
						     <Action PostBack='True' 
							        Object='EventController'
							        Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
							        <Parameters>			
								        <Argument Type='' TypeKey='' Value='Page=PV_LEP'/>					
							        </Parameters>
						       </Action>
					</Control>
				</DisplayProperty>
		     </DisplayProperties>
		 </DataObject>--%>
	</ModuleSection>
</span>
