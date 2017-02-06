<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Organizational Overview</h1></td>
	</tr>
</table>
<br />
<div style='width:600' class='SeparatorHdg'>
	Instructions
</div>
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
 <tr>
	<td><p>LSC requires each Applicant to provide an overview of its organization and delivery system. The overview is to contain a concise description of the geographical and cultural characteristics of the Applicant's service area(s), the scope of legal services provided by the Applicant, and the delivery methods and distinctive characteristics of the Applicant's organization.  LSC may use excerpts from the overviews in publications and presentations.</p></td>
    <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
 </tr>
 <tr><td>&nbsp;</td></tr>
 <tr>
   <td><p>Complete the Overview by addressing the questions below. Each section in the form must be answered before the form can be submitted. Click the save button below once the form is completed.</p></td>
 </tr>
  <tr><td>&nbsp;</td></tr>
 <tr>
   <td><p><strong>Do not upload the Overview.</strong> Email questions pertaining to this form to <a href="mailto:competition@lsc.gov">competition@lsc.gov</a></p></td>
 </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />
<div style='width:600' class='SeparatorHdg'>
	Organizational Overview</div>
<table width="600"  border="0" cellspacing="0" cellpadding="0">	
  <tr><td colspan="4" >&nbsp;</td></tr>
  <tr> 
      <td><p>1. Describe the geographical, demographic and cultural characteristics of the service area. </p></td>
  </tr>
  <tr><td colspan="4" >&nbsp;</td></tr>
  <tr> 
      <td><p>a. Indicate whether the service area is primarily rural, urban, or mixed. Explain which counties or cities (or the number of counties or cities) classify it as such.<Font color='Red'>*</Font> </p></td>
  </tr>
  <tr><td><span runat='server' id='spnRuralUrbanMixed' /></td></tr>
  <tr><td colspan="4" >&nbsp;</td></tr>
  <tr> 
      <td><p>b. If there have been significant changes, explain the changes and how they affect the eligible client population of the service area. If there have been no significant changes, indicate this and explain the characteristics that have consistently affected the eligible client population.<Font color='Red'>*</Font></p></td>
  </tr>
  <tr><td><span runat='server' id='spnAffectOnClients' /></td></tr>
  <tr><td colspan="4" >&nbsp;</td></tr>
  <tr> 
      <td><p>c. Describe the most distinctive characteristics of the service area. Make note of things such as the service area's poverty, changes in population, area-specific legal issues, or other such characteristics. <Font color='Red'>*</Font></p></td>
  </tr>
  <tr><td><span runat='server' id='spnDistinctFeaturesSA' /></td></tr>
  <tr><td colspan="4" >&nbsp;</td></tr>
  <tr><td>2. Describe the scope of legal services to be provided by the Applicant.</td></tr>
  <tr><td colspan="4" >&nbsp;</td></tr>
  <tr> 
      <td><p>a. State whether the Applicant provides a full range of legal services including: limited as well as extended and contested cases; and a full range of case types. State whether the full range of service is extended throughout the service area.<Font color='Red'>*</Font></p></td>
  </tr>
  <tr><td><span runat='server' id='spnFullServiceByApplicant' /></td></tr>
  <tr><td colspan="4" >&nbsp;</td></tr>
  <tr> 
      <td><p>b. Briefly describe the service delivery method(s) employed by the Applicant (e.g., specialized law units, legal helplines, impact litigation, compensated and pro bono private attorney models, pro se).<Font color='Red'>*</Font></p></td>
  </tr>
  <tr><td><span runat='server' id='spnDeliveryMethodsORG' /></td></tr>
   <tr><td colspan="4" >&nbsp;</td></tr>
  <tr> 
      <td><p>c. If the Applicant does not provide a full range of legal services, identify the parts of the service area that will not be served by the Applicant. That will receive limited services by the Applicant, or a sub-set of case types.<Font color='Red'>*</Font></p></td>
  </tr>
  <tr><td><span runat='server' id='spnLimitedServiceByApplicant' /></td></tr>
  <tr><td colspan="4" >&nbsp;</td></tr>
  <tr> 
      <td><p>d. If the Applicant does not provide a full range of legal services, identify other providers the Applicant relies on to ensure a full range of legal services provided by the other provider.<Font color='Red'>*</Font></p></td>
  </tr>
  <tr><td><span runat='server' id='spnOtherProviders' /></td></tr>
   <tr><td colspan="4" >&nbsp;</td></tr>
  <tr><td>3. Describe the most distinctive characteristics of the Applicant's Organization.<Font color='Red'>*</Font></td></tr> 
  <tr><td><span runat='server' id='spnDistinctFeaturesORG' /></td></tr>
</table>
<br />
<br />
<p align="center">
  <span id='spnSave' runat='server' />&nbsp;&nbsp;&nbsp;&nbsp;
  <span id='spnContinue' runat='server' />
</p>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	   <DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
	   </DataObject>
	   
	    <DataObject Key='WfTACompetitionYear' DataObjectDefinitionKey='WfTACompetitionYear' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
	    </DataObject>
	    
	   <DataObject Key='LscApplicantOrgOverview' DataObjectDefinitionKey='LscApplicantOrgOverview' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='RuralUrbanMixed'>
					<Control ID='txtRuralUrbanMixed' 
						Type='cTextArea' 
						Container='spnRuralUrbanMixed' 
						Rows='2' 
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AffectOnClients'>
					<Control ID='txtAffectOnClients' 
						Type='cTextArea' 
						Container='spnAffectOnClients' 
						Rows='2' 
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DistinctFeaturesSA'>
					<Control ID='txtDistinctFeaturesSA' 
						Type='cTextArea' 
						Container='spnDistinctFeaturesSA' 
						Rows='2' 
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FullServiceByApplicant'>
					<Control ID='txtFullServiceByApplicant' 
						Type='cTextArea' 
						Container='spnFullServiceByApplicant' 
						Rows='2' 
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LimitedServiceByApplicant'>
					<Control ID='txtLimitedServiceByApplicant' 
						Type='cTextArea' 
						Container='spnLimitedServiceByApplicant' 
						Rows='2' 
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherProviders'>
					<Control ID='txtOtherProviders' 
						Type='cTextArea' 
						Container='spnOtherProviders' 
						Rows='2' 
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DeliveryMethodsORG'>
					<Control ID='txtDeliveryMethodsORG' 
						Type='cTextArea' 
						Container='spnDeliveryMethodsORG' 
						Rows='2' 
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DistinctFeaturesORG'>
					<Control ID='txtDistinctFeaturesORG' 
						Type='cTextArea' 
						Container='spnDistinctFeaturesORG' 
						Rows='2' 
						Cols='80'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
			
		 <DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action PostBack='True'
							AutoSave='True' />	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Caption='Continue'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	  
	</ModuleSection>
</span>