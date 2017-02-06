<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />

<div class='SeparatorHdg' width='100%'>
	Instructions
</div>
<br />

<Core:cUserCtlLoader CtlID='ctlAppInfo'
	Src='Implementation/Modules/RenewalReview/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='ctlGrantInfo'
	Src='Implementation/Modules/RenewalReview/Controls/PageSection/GrantInformation.ascx'
	runat='server'/>

<div class='SeparatorHdg' width='100%'>
	 Funding Recommendation
</div>
<br />
<b>Funding Recommendation <%=kDenoteRequiredField %></b>&nbsp;&nbsp;
<span runat='server' id='spnLscRenewalRecommendationID' />
<br /><br />
<p>The grant application evaluation and funding recommendation is based on a review of the documents contained in the grant file and included in the <b>“Grant Renewal Documents Reviewed”</b> listing.</p>
<br />
<table width='100%'>
	<tr>
		<td>
			<b>LSC Staff Reader<%=kDenoteRequiredField %></b>
		</td>
		<td>
			<span runat='server' id='spnPrimaryReaderPersonID' />
		</td>
		<td>
			<b>Date<%=kDenoteRequiredField %></b> 
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
<span runat='server' id='spnRationaleNonRenewal' />--%>
<br /><br />

<table width='100%'>
	<tr>
		<td align=center>
			<span runat='server' id='spnSave' />&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnContinue' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscRenewalRec' DataObjectDefinitionKey='LscRenewalRec' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscRenewalRecommendationID'>
					<Control ID='ctlLscRenewalRecommendationID'
						Type='cDropDown'
						Container='spnLscRenewalRecommendationID'
						DataObjectDefinitionKey='LscRenewalRecommendation'
						StoredValue='LscRenewalRecommendationID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='Funding Recommendation is required.'/>
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='PrimaryReaderPersonID'>
					<Control ID='ctlPrimaryReaderPersonID' 
						Type='cDropDown' 
						Container='spnPrimaryReaderPersonID'
						DisplayValue='Person.FirstNameLastName'
						StoredValue='PersonID'
						DataObjectDefinitionKey='PersonReviewer'>
					</Control>
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='PrimaryReaderPersonID'>
				 	<Control ID='ctlPrimaryReaderPersonID' 
						Type='cDropDown' 
						Container='spnPrimaryReaderPersonID'
						DisplayValue='LastNameFirstName'
						StoredValue='PersonID'
						DataObjectDefinitionKey='EasylistReviewsReviewersView'>
						<Filters>
							<Argument PropertyKey='ReviewCommitteeID' Value='1' />
						</Filters>
						<Sort>
							<Argument PropertyKey='LastName' />
							<Argument PropertyKey='FirstName' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryReaderDate'>
					<Control ID='ctlPrimaryReaderDate' 
						Type='cDateTextBox' 
						Container='spnPrimaryReaderDate'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='Primary Reader Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='Primary Reader Date must be in mm/dd/yyyy format.'
						Size='25'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
			<%--	<DisplayProperty PropertyKey='FurtherReviewComment'>
					<Control ID='txtFurtherReviewComment'
						Type='cTextArea'
						Container='spnFurtherReviewComment'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RationaleNonRenewal'>
					<Control ID='txtRationaleNonRenewal'
						Type='cTextArea'
						Container='spnRationaleNonRenewal'
						Rows='5'
						Cols='100' />
				</DisplayProperty>--%>
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
						GoToNextPage='True'
						Enter='False'
						Caption='Save and Continue'/>
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
		
		<%--<DataObject Key='EasylistReviewsReviewersView' DataObjectDefinitionKey='EasylistReviewsReviewersView' Updatable='True' CreateNew='True'>
			        <Filters>
				        <Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
			        </Filters>
			        
			        
		</DataObject>--%>
		
	</ModuleSection>
</span>
