<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIIABLE CONTENT AREA -->

<span id="Span1" runat='server'/>
<p>

<!-- Page Content - Controls -->
<br>
<span id='spnPageContent' runat='server'/>
<p>

<Core:cUserCtlLoader CtlID='ctlAddressInfoEditorList' 
	Src='EasyGrants/Controls/PageSection/AddressInfoEditor_List.ascx'
	runat='server' />
<br><br>

<center>
	<table>	
		<tr>
			<td>
				<span runat='server' id='spnSave_and_Continue'/>
			</td>
		</tr>	
	</table>
</center>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
			<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
				<DisplayProperties>
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
									<Argument AttributeName='PageKey' Value='PersonalData'/>
								</Parameters>
							</Action>
						</Control>	
					</DisplayProperty>
					</DisplayProperties>
			</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
