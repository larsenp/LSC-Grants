<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ProjectAgreement.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cProjectAgreement" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg">Principal Investigator Agreement</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>	
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
<!-- Control Label (for Project information) -->
	<tr>
		<td>
			<span id='spnIsAgree' runat='server'/>&nbsp;&nbsp;
		</td>
		<td colspan="3">
			<font color='red'>*</font>&nbsp;I attest that all information contained in this application
			is true and correct to the best of my knowledge and that I have read the privacy disclosure
			policy.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	

	<tr id='trSaveAndCancel' visible='true'>
		<td align="center">
			<span runat='server' id='spnSave'/> 
			<span runat='server' id='spnCancel'/> 
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	
		<DataObject Key='GranteeProjectWHCF' DataObjectDefinitionKey='GranteeProjectWHCF' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='IsAgree'>
					<Control ID='ctlIsAgree'
						Container='spnIsAgree'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='IsAgree'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action PostBack='True'	AutoSave='True'/>
					</Control>
				</DisplayProperty>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>	
							<Parameters>
								<Argument AttributeName='PageKey' Value='Main'/>
							</Parameters>								
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
