<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server'/>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
If you do not have any other funding sources for this project, chose No.  
If other funding sources exist for this project, click Yes and provide the 
details of the funding source following the instructions below.
<ul>
	<li>Click the <b>Add</b> button to add a new funding source.</li>
</ul>
For added funding sources:
<ul>
	<li>Click the corresponding <b>Edit</b> button for a funding source to edit that entry.</li>
	<li>Click the corresponding <b>Delete</b> button for a funding source delete that entry.</li>
</ul>
<ul>
	<li>Click the <B>Save and Continue</B> button to move to the next page in the application process.</li>
	<li>Click the <B>Close</B> button to return to the <b>Main</b> page.</li>
</ul>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Funding Sources</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<Core:cUserCtlLoader CtlID='ctlOtherSupport' 
	Src='EasyGrants/Controls/PageSection/OtherSupport_List.ascx'
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
					<Control ID='ctlOtherSupport' Type='cUserCtlLoader'/>
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
								<Argument AttributeName='PageKey' Value='Budget'/>
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
