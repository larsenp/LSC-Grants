<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<table runat='server' width='100%' borders='0'>
	<tr>
		<td colspan='2'>
			<p>
			You have tried to edit an application after it has been submitted. Please click on the Close button 
			below to go to your Home page.			
			</p>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' align='center'>			
			<span id='spnClose' runat='server'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>								
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose' 
						Type='cButton' 
						Container='spnClose'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Home'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
	</ModuleSection>		
<!-- End Embedded XML -->
</span>
