<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<p>
	<b>LSC Recommendation <span runat='server' id='spnRecommendationReference'/></b><br />
	<span runat='server' id='spnRecommendation' />
</p>
<p>
	<b>Recommendation Status: </b> <span runat='server' id='spnLscPQVRecommendationStatus'/>
</p>
<b>Applicant's response to the recommendation and supporting rationale</b><br />
<span runat='server' id='spnApplicantComment' />
<br />
<p><b>LSC staff's evaluation of recommendation status: </b> <span runat='server' id='spnLscPQVRecommendationStatusIDReviewer'/></p>
<p><b>LSC staff's comment on Applicant response </b><span style="color:red">*</span><br /><span runat='server' id='spnReviewerComment' /></p>
<br /><br />
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	    <DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='LscPQVRecommendationServArea' Key='LscPQVRecommendationServArea' Updatable='True'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscPQVRecommendation.Recommendation'>
					<Control ID='spnRecommendation'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPQVRecommendation.RecommendationReference'>
					<Control ID='spnRecommendationReference'
						Type='HtmlGenericControl' />
				</DisplayProperty>
            <DisplayProperty PropertyKey='LscPQVRecommendationStatus.Description'>
					<Control ID='spnLscPQVRecommendationStatus'
						Type='HtmlGenericControl' />
				</DisplayProperty>
            <DisplayProperty PropertyKey='ApplicantComment'>
					<Control ID='spnApplicantComment'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReviewerComment'>
					<Control ID='txtReviewerComment'
						Type='cTextArea'
						Container='spnReviewerComment'
						Rows='5'
						Cols='70' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPQVRecommendationStatusIDReviewer'>
					<Control ID='ctlLscPQVRecommendationStatusIDReviewer'
						Type='cDropDown'
						Container='spnLscPQVRecommendationStatusIDReviewer'
						DataObjectDefinitionKey='LscPQVRecommendationStatus'
						StoredValue='LscPQVRecommendationStatusID'
						DisplayValue='Description'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
	</ModuleSection>
</span>