<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<p>
	<b>LSC Recommendation <span runat='server' id='spnRecommendationReference'/></b><br />
	<span runat='server' id='spnRecommendation' />
</p>
<p>
	<b>Status of Recommendation</b><span style="color:red">*</span>
	<span runat='server' id='spnLscPQVRecommendationStatusID'/>
</p>
<b>Applicant's response to the recommendation and supporting rationale</b><span style="color:red">*</span><br />
<span runat='server' id='spnApplicantComment' />
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
				<DisplayProperty PropertyKey='LscPQVRecommendationStatusID'>
					<Control ID='ctlLscPQVRecommendationStatusID'
						Type='cDropDown'
						Container='spnLscPQVRecommendationStatusID'
						DataObjectDefinitionKey='LscPQVRecommendationStatus'
						StoredValue='LscPQVRecommendationStatusID'
						DisplayValue='Description'/>
				</DisplayProperty>
            <DisplayProperty PropertyKey='ApplicantComment'>
					<Control ID='txtApplicantComment'
						Type='cTextArea'
						Container='spnApplicantComment'
						Rows='5'
						Cols='70' />
				 </DisplayProperty>
			</DisplayProperties>
		</DataObject>


	
	</ModuleSection>
</span>