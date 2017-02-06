<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cOutcomeGranteeProjectEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Grantee Project Outcome Editor</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
<!-- Control Label (for Name information) -->
	<tr	valign="top">
		<td width="120"><b>Funding Cycle:</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='ctlProjectName' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Person:</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='ctlPerson' runat='server'/></td>
	</tr>	
	<tr>
		<td><b><span id='spnProjectOutcome' runat='server'>Outcome: </span></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlProjectOutcome' Type='cDropDown' runat='server'/></td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td>
			<!-- Save Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSaveAndClose'/>
			<!-- Cancel Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnCancel'/>	
			</td>
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignmentDetails' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID' Value='' bool=''>
					<RelatedProperty PropertyKey='WfTaskAssignments' />
				</Argument>	
			</Filters>
			<DisplayProperties>		
				<DisplayProperty PropertyKey='WfProject.WfProjectName'>
					<Control ID='ctlProjectName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>																					
				<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstName'>
					<Control ID='ctlPerson'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		<DataObject Key='GranteeProjectOutcome' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='WfTaskAssignmentDetails' 
					DataObjectPropertyKey='GranteeProjectID'
					PropertyKey='GranteeProjectID' 
					Value='' Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='GranteeID' PropertyKey='GranteeID' Value=''/>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='DataPresenter' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''/>
			</DefaultValues>	
			<DisplayProperties>	
				<DisplayProperty PropertyKey='WfProjectOutcomeID'>
					<Control ID='ctlProjectOutcome'
						Container='spnProjectOutcome'
						Type='cDropDown'
						DataObjectDefinitionKey='GrantOutcome'
						StoredValue='GrantOutcomeID'
						DisplayValue='Description'>
						<Sort>
							<Argument PropertyKey='Description' />
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'>
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
<!-- End Embedded XML -->
</span>