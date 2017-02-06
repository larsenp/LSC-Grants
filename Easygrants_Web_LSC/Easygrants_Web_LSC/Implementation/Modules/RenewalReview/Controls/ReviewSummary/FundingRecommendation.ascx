<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<div class='SeparatorHdg' width='100%'>
	Funding Recommendation
</div>
<br />
<b>Funding Recommendation: <%=kDenoteRequiredField %></b>&nbsp;&nbsp;
<span runat='server' id='spnLscRenewalRecommendationID' />
<br /><br />
<table>
	<tr>
		<td>
			<b>LSC Staff Reader:<%=kDenoteRequiredField %></b>
		</td>
		<td align="left">
			<span runat='server' id='spnPrimaryReaderPersonID' />
		</td>
		<td>&nbsp;&nbsp;</td>
		<td>&nbsp;&nbsp;</td>
		<td>&nbsp;&nbsp;</td>
		<td>&nbsp;&nbsp;</td>
		<td>
			<b>Date</b> 
			<span runat='server' id='spnPrimaryReaderDate' />
		</td>
	</tr>
</table>	
	
<%--<div class='SeparatorHdg' width='100%'>
	Part II: Further Review
</div>
<p>Discuss any further review undertaken by LSC in addition to review of the renewal application and LSC documentation. 
Use the comment box below to describe the reasons for undertaking further review and the outcomes of the review. </p>
<span runat='server' id='spnFurtherReviewComment' />
<br />

<div class='SeparatorHdg' width='100%'>
	Part III: Rationale for Not Renewing a Grant
</div>
<p>Explain the rationale for recommending that LSC not renew the grant for this applicant: 
Use the comment box below to describe the rationale for not renewing the grant.</p>
<span runat='server' id='spnRationaleNonRenewal' />
<br /><br />
--%>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscRenewalRec' DataObjectDefinitionKey='LscRenewalRec' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscRenewalRecommendation.Description'>
					<Control ID='spnLscRenewalRecommendationID'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='LscRenewalRecHtml.FurtherReviewComment' HtmlEncode='False'>
					<Control ID='spnFurtherReviewComment'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscRenewalRecHtml.RationaleNonRenewal' HtmlEncode='False'>
					<Control ID='spnRationaleNonRenewal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='PrimaryReaderPerson.FirstNameLastName'>
					<Control ID='spnPrimaryReaderPersonID' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryReaderDate' Format='M/d/yyyy'>
					<Control ID='spnPrimaryReaderDate' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
