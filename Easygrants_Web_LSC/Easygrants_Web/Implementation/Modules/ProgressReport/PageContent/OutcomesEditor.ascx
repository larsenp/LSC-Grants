<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr><td class="SeparatorHdg"><b>Instructions</b></td></tr>	
	<tr><td><span id='spnPageContent' runat='server' /></td></tr>	
</table>
<br>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Add or Edit Outcomes</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td width='200'><b>Outcome Type</b>&nbsp;<font color='red'>*</font>&nbsp;&nbsp;</td>
		<td><span id='spnOutcomeType' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Outcome Description</b>&nbsp;<font color='red'>*</font>&nbsp;&nbsp;</td>
		<td><span id='spnOutcomeDescription' runat='server'/></td>
	</tr>
	<tr><td colspan='2'>&nbsp;</td></tr>
	<tr><td colspan='2'>&nbsp;</td></tr>
	<tr><td colspan='2'>&nbsp;</td></tr>
	<tr>
		<td colspan='2' align='center'>
			<span runat='server' id='spnSave'/> 
			<span runat='server' id='spnSaveAndClose'/>
			<span runat='server' id='spnCancel'/> 
		</td>
	</tr>
	<tr><td  colspan='2'>&nbsp;</td></tr>
</table>


<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='GranteeProjectResearchOutcome' DataObjectDefinitionKey='GranteeProjectResearchOutcome' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectResearchOutcomeID' 
					PropertyKey='GranteeProjectResearchOutcomeID' 
					Value='' Bool=''/>
				<Argument Type='ModuleUser' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ResearchOutcomeID'>
					<Control ID='ctlOutcomeType'
						Container='spnOutcomeType'
						Type='cDropDown'
						DataObjectDefinitionKey='ResearchOutcomes'
						StoredValue='ResearchOutcomesID'
						DisplayValue='Description'	
						RequiredField='True'
						DisplayNone='False'
						DisplayText='Select'
						ErrorMessage='Outcome Type is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ResearchDescription'>
					<Control ID='ctlOutcomeDescription'
						Container='spnOutcomeDescription'
						Type='cTextArea'
						Cols='50'
						Rows='3'
						MaxLength='150'
						RequiredField='True'
						ErrorMessage='Outcome Description is required.'>
					</Control>
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
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='GranteeProjectResearchOutcome' DataObjectPropertyKey='GranteeProjectResearchOutcomeID' PropertyKey='GranteeProjectResearchOutcomeID' BaseValue='GranteeProjectResearchOutcomeID='/>
							</Parameters>						
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton' Caption='Save and Close'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>						
						</Action>
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
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>