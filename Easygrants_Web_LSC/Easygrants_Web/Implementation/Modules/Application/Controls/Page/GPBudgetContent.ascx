<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
Enter the project budget including the budget total requirements.  Download the Early Career Translational Research Award Budget Excel download to complete the budget requirements.  Once you have completed the budget, upload the completed Excel worksheet following the instructions below.
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Controls -->

<Core:cUserCtlLoader CtlID='ctlGPBudget' 
	Src='EasyGrants/Controls/PageSection/GPBudget.ascx'
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
				<DisplayProperty PropertyKey='' >
					<Control ID='ctlGPBudget' Type='cUserCtlLoader'/>
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
								<Argument AttributeName='PageKey' Value='CVUploads'/>
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



