<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ProjectComponents.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cProjectComponents" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Assurances</b>&nbsp;<%=kDenoteRequiredField%></td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
<!-- Control Label (for Project information) -->
	<tr>
		<td>
			<span id='spnIsHuman' runat='server'/>Human Subjects
		</td>
	</tr>
	<tr>
		<td>
			<span id='spnIsAnimal' runat='server'/>Animal Subjects
		</td>
	</tr>
	<tr>
		<td>
			<span id='spnIsBiosafety' runat='server'/>Biosafety
		</td>
	</tr>
	<tr>
		<td>
			<span id='spnIsForeign' runat='server'/>Foreign Components
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
		<DataObject Key='GranteeProjectEMF' DataObjectDefinitionKey='GranteeProjectEMF' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='IsHumanSubject'>
					<Control ID='ctlIsHuman'
						Container='spnIsHuman'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='IsHuman'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsAnimalSubject'>
					<Control ID='ctlIsAnimal'
						Container='spnIsAnimal'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='IsAnimal'>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='IsForeignComponent'>
					<Control ID='ctlIsForeign'
						Container='spnIsForeign'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='IsForeign'>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='IsBiosafety'>
					<Control ID='ctlIsBiosafety'
						Container='spnIsBiosafety'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='IsBiosafety'>
					</Control>	
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
