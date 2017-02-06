<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ProjectAssurancesRenewal.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cProjectAssurancesRenewal" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Compliance</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td>
			Does your research involve Animal Subjects?&nbsp;<font color='red'>*</font>&nbsp;
			<span id='spnIsAnimal' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td>
			Does your research involve Human Subjects?&nbsp;<font color='red'>*</font>&nbsp;
			<span id='spnIsHuman' runat='server'/>
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
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser'
					TypeKey='GranteeProjectID' 
					PropertyKey='AppGranteeProjectID'
					Value=''
					Bool=''/>
			</Filters>
			<DisplayProperties/>
		</DataObject>
		<DataObject Key='GranteeProjectWHCF' DataObjectDefinitionKey='GranteeProjectWHCF' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection'
					TypeKey='GranteeProject'
					DataObjectPropertyKey='GranteeProjectID'
					PropertyKey='GranteeProjectID'
					Value='' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection'
					TypeKey='GranteeProject'
					DataObjectPropertyKey='GranteeProjectID'
					PropertyKey='GranteeProjectID'
					Value='' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='IsHumanSubject'>
					<Control ID='ctlIsHuman'
						Container='spnIsHuman'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Human Subjects question is required.'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsAnimalSubject'>
					<Control ID='ctlIsAnimal'
						Container='spnIsAnimal'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Animal Subjects question is required.'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
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
