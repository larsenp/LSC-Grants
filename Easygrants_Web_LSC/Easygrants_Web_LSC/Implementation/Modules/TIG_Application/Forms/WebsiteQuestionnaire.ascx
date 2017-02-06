<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<div style="width:600px">
	<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGranteeInfo' 
		Src='Implementation/Modules/TIG_Application/Forms/ApplicationInfo.ascx'
		runat='server'/>
	<br />
	<div style="width:100%" class="SeparatorHdg">
		Instructions
	</div>
	<br />
	<div class='SeparatorHdg'>
		Website Questionnaire
	</div>
	<br />
	1. Provide the name and contact information of the staff person responsible for the website.<font color='red'>*</font><br />
	<span runat='server' id='spnWebsiteContact'/><br /><br />
	2. Describe how the state provides personnel with the technical expertise to maintain the Website.<font color='red'>*</font> <br />
	<span runat='server' id='spnTechnicalExpertise'/><br /><br />
	3. Describe how the website will be maintained and updated after the term of LSC grant.<font color='red'>*</font> <br />
	<span runat='server' id='spnWebsiteMaintenance'/><br /><br />
	4. Describe how you plan to sustain both the website and the staff to manage content of the site after the end of the grant.<font color='red'>*</font><br />
	<span runat='server' id='spnSustainWebsite'/><br /><br />
	5. Describe how the website impacts the client community and how you plan to make it accessible.<font color='red'>*</font> <br />
	<span runat='server' id='spnClientCommunityImpact'/><br /><br />
	6. Describe how the website helps clients with limited literacy or limited English proficiency.<font color='red'>*</font> <br />
	<span runat='server' id='spnLimitedLanguageProficiency'/><br /><br />
	<div style="text-align:center">
		<span runat='server' id='spnSave' />
		<span runat='server' id='spnContinue' />
	</div>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscTigApp' DataObjectDefinitionKey='LscTigApp' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WebsiteContact'>
					<Control ID='txtWebsiteContact'
						Type='cTextArea'
						Container='spnWebsiteContact'
						Rows='5'
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TechnicalExpertise'>
					<Control ID='txtTechnicalExpertise'
						Type='cTextArea'
						Container='spnTechnicalExpertise'
						Rows='5'
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WebsiteMaintenance'>
					<Control ID='txtWebsiteMaintenance'
						Type='cTextArea'
						Container='spnWebsiteMaintenance'
						Rows='5'
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SustainWebsite'>
					<Control ID='txtSustainWebsite'
						Type='cTextArea'
						Container='spnSustainWebsite'
						Rows='5'
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ClientCommunityImpact'>
					<Control ID='txtClientCommunityImpact'
						Type='cTextArea'
						Container='spnClientCommunityImpact'
						Rows='5'
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LimitedLanguageProficiency'>
					<Control ID='txtLimitedLanguageProficiency'
						Type='cTextArea'
						Container='spnLimitedLanguageProficiency'
						Rows='5'
						Cols='80'/>
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
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>