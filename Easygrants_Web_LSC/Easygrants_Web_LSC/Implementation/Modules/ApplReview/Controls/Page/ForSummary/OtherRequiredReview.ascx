<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl"  TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />

<div class='SeparatorHdg' width='100%'>
	Other Required Review
</div>
<br />	
<p><b>A. Claims against the Applicant and/or Conflicts of Interest</b></p>

<table  width='600'>
     <tr>
        <td >1. Review the "requisite attachments" included at the end of the proposal narrative for a listing of claims made 
        against the Applicant or any of its attorneys during the past thirty-six months. Does the Applicant list any 
        claims?<%=kDenoteRequiredField %></td>
        <td >
			<span runat="server" id='spnrequisiteattachments' />
		</td>
     </tr>
     <tr><td>&nbsp;</td></tr>
     <tr>
		<td>2. Review the "other requirements" included at the end of the proposal narrative for a description of any actual or 
		potential conflicts of interest. Does the Applicant disclose any actual or potential conflicts of interest?<%=kDenoteRequiredField %></b>
		</td>
		<td>
			<span runat="server" id='spnotherrequirements' />
		</td>
	</tr>
</table>

<p><b>B. Follow-up activity proposed for applicants with potential weaknesses or issues</b></p>

<p><i>Note: A Score of 55 or below suggests that there may be potential program weaknesses or issues, and that further review or an onsite assessment may be required. 
      A funding recommendation for an applicant with a score of 55 or below shall not be presented to the Executive Office until appropriate staff follow up is completed. 
      Additionally, follow up is required for Applicants with potential quality and/or performance issues even if the application score is greater than 55.</i></p>


<p>Check the appropriate box below to indicate the type of follow-up activity proposed for Applicants with potential weaknesses or issues.
 <u>If there are no potential weaknesses or issues that require follow up, check the last box.</u><%=kDenoteRequiredField %></p>
<span runat='server' id='spnChkIA' /> A On-Site Capabilities Assessment<br />
<br />
<span runat='server' id='spnChkIB' /> B LSC Staff formal communications with Applicant to obtain additional information or clarification<br />
<br />
<span runat='server' id='spnChkIC' /> C Application score is greater than 55 and further review is not required<br />
<br />
<br />
<b>Funding Term<%=kDenoteRequiredField %></b>&nbsp;&nbsp;
<span runat='server' id='spnFundingTerm' />
<br />
<br />
<p>The Grant Application evaluation and Funding term recommendation is based on a review of the documents contained in the grant
 file and identified in the "Competitive Grant Documents Reviewed" listing.</p>
<table width='600'>
	<tr>
		<td><b>LSC Staff Reader<%=kDenoteRequiredField %></b></td>
		<td>
			<span runat='server' id='spnStaffReaderPersonID' />
		</td>
		<td>
			<b>Date<%=kDenoteRequiredField %></b> 
			<span runat='server' id='spnStaffReaderDate' />
		</td>
	</tr>
</table>
<br />
<br />
<table  width='100%'>
	<tr>
		<td><b>Evaluation Comments</b></td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnEvaluationComments' />
		</td>
	</tr>
</table>
<br />
<hr style="height:5px;width:100%;color:#888888"/>
<br />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
		<DataObject Key='LscReviewApplication' DataObjectDefinitionKey='LscReviewApplication' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Create='True' Update='False'/>
			</DefaultValues>
			<DisplayProperties>
		         <DisplayProperty PropertyKey='Claims' Format='YesNo'>
					<Control ID='spnrequisiteattachments'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Conflicts1' Format='YesNo'>
					<Control ID='spnotherrequirements'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscFundingTermDesc.Description'> 
					<Control ID='spnFundingTerm'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
				<DisplayProperty PropertyKey='EvaluationComments'>
					<Control ID='spnEvaluationComments'
						 Type='HtmlGenericControl'/>
				</DisplayProperty>
		   </DisplayProperties>
        </DataObject>
        
        <DataObject Key='LscOA1' DataObjectDefinitionKey='LscOA1' Updatable='false' CreateNew='false'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Create='True' Update='False'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ChkIA'>
					<Control ID='chkIA'
						Type='cCheckBox'
						Container='spnChkIA' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ChkIB'>
					<Control ID='chkIB'
						Type='cCheckBox'
						Container='spnChkIB' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ChkIC'>
					<Control ID='chkIC'
						Type='cCheckBox'
						Container='spnChkIC' />
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='StaffReaderPersonID'>
					<Control ID='ctlStaffReaderPerson' 
						Type='cDropDown' 
						Container='spnStaffReaderPersonID'
						DisplayValue='Person.FirstNameLastName'
						StoredValue='PersonID'
						DataObjectDefinitionKey='PersonReviewer'>
					</Control>
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='StaffReaderPerson.FirstNameLastName'> 
					<Control ID='spnStaffReaderPersonID'
						Type='HtmlGenericControl' />
			    </DisplayProperty>
				<DisplayProperty PropertyKey='StaffReaderDate'>
					<Control ID='spnStaffReaderDate' 
				            Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
			
       
        	
    </ModuleSection>
</span>        			