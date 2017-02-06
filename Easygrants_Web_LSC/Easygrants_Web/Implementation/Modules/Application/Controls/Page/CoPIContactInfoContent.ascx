<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server'/>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
	Please complete all required information for the primary co-investigator's contact information.  
	All fields marked with an asterisk (<font color='red'>*</font>) are required.
	<ul>
		<li>Click on the <b>Save and Continue</b> button to save the information.</li>
		<li>Click on the <b>Close</b> button to close the <b>Primary Co-Investigator Information Editor</b> page 
			and return to the <b>Main</b> page.</li>
	</ul>
<br>

<!-- Page Content - Controls -->
<Core:cUserCtlLoader CtlID='ctlPrincipal' 
	Src='EasyGrants/Controls/PageSection/CoPrincipal_Editor.ascx'
	runat='server'/>

<center>
<table>	
	<tr>
		<td>
			<span runat='server' id='spnSave_and_Continue'/>&nbsp;&nbsp;
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
				<DisplayProperty PropertyKey='' >
					<Control ID='ctlPrincipal' Type='cUserCtlLoader'/>
				</DisplayProperty>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Image='Save_and_Continue'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='AddCoPIContactInfo'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Confirmation='Select OK to close the page without saving the data. Select Cancel to return.'
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
