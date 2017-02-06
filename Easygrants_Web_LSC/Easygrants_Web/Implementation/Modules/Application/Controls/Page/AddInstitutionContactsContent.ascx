<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="AddInstitutionContactsContent.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br><br>
Please provide information about the additional institutional contacts for this project.  
Each contact must be entered separately.
	<ul>
		<li>Click the <b>Add</b> button to add a new Institutional Contact to this application.</li>
	</ul>
		For added contacts:
	<ul>
		<li>Click the <b>Edit</b> button for the corresponding Contact to edit the information currently listed.</li>
		<li>Click the <b>Delete</b> button for the corresponding Contact to delete the Co-Investigator from being listed with this application.</li>
	</ul>
	<ul>
		<li>Click the <b>Save and Continue</b> button to move to the next page in the application process.</li>
		<li>Click the <b>Close</b> button to return to the <b>Main</b> page.</li>
	</ul>

<!-- Page Content - Controls -->

<Core:cUserCtlLoader CtlID='ctlPrincipalEditor' 
	Src='EasyGrants/Controls/PageSection/InstitutionContacts_List.ascx'
	runat='server'/>
<center>
<table>	
	<tr>
		<td>
			<span runat='server' id='spnSave_and_Continue'/>
		</td>
		<td>
			<span runat='server' id='spnClose'/>
		</td>
	</tr>	
	
</table>
</center>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Image='Save_and_Continue'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ProjectInformation'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'
						Confirmation='Select OK to close the page without saving the data. Select Cancel to return.'>
						<Action
							PostBack='True'
							AutoSave='False'
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
