<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Application.Controls.PageSection.cParticipantOrgEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr><td class="SeparatorHdg"><b>Instructions</b></td></tr>	
	<tr><td><span id='spnPageContent' runat='server' /></td></tr>	
</table>
<br>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlProjectHeader' 
	Src='Implementation/Modules/Application/Controls/PageSection/ProjectInfoHeader.ascx'
	runat='server'/>
<br>
<table id="Table2" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg" colspan='2'><b>Participating <%=GetLabel("Organization")%></b></td>
	</tr>	
	<tr><td  colspan='2'>&nbsp;</td></tr>
	<tr>
		<td width='10%'><%=GetLabel("Organization")%>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnOrgSelectLauncher' runat='server'/></td>
	</tr>	
</table>
<br></br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' ID="Table10">
	<tr align='center'>
		<td>
			<span runat='server' id='spnSave'/><span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
		</DataObject>	
		<DataObject Key='WfProject' DataObjectDefinitionKey='WfProject' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='WfProjectID' PropertyKey='WfProjectID' />
			</Filters>
		</DataObject>			
		<DataObject Key='Budget' DataObjectDefinitionKey='Budget' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' 	Bool=''/>
				<Argument Type='QueryString' TypeKey='BudgetID' PropertyKey='BudgetID' Value='' 	Bool='And'/>
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='2'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='2'/>
				<Argument Type='' TypeKey='' PropertyKey='BudgetTypeID' Value='1'/>
				
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Organization.CommonOrganizationName'>
					<Control ID='ctlOrgSelectLauncher' 
					Type='cOrgSelectLauncherNotInList'
					Container='spnOrgSelectLauncher'
					HiddenValueKey='EntityID'
					DataObjectDefinitionKey='Organization'
					StoredValue='OrganizationID'
					DisplayValue='CommonOrganizationName'
					RequiredField='True' ErrorMessage='~~Organization~~ is required.'	/>
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
								<Argument Type='DataObjectCollection' TypeKey='Budget' DataObjectPropertyKey='BudgetID' PropertyKey='BudgetID' BaseValue='BudgetID='/>									
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton' Caption='Cancel'
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
<!-- End Embedded XML -->







