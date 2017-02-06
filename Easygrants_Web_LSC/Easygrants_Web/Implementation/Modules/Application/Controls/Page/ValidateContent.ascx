<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>

<br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Instructions</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
</table>
<table width='100%' cellpadding='2' cellspacing='0'>
	<tr>
		<td>The status of all of the required items is shown below.  If you
		need to make changes, you can click the appropriate page link to return to that page.  Once all items are validated (i.e., completed), click <b>Save and Continue</b> 
		to go to the Submission page to submit.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg'>
			Validation
		</td>
	</tr>	
	<tr>
		<td>
			<Core:cValidate id='ctlValidate' DisplayFormat='Detail' runat='server'/>
		</td>
	</tr>		
</table>

<table border='0' cellspacing='0' cellpadding='0' width='100%' runat='server'>	
	<tr><td>&nbsp;</td></tr>
	<tr align='center'>
		<td><span runat='server' id='spnSave_and_Continue'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

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
								<Argument AttributeName='PageKey' Value='Submission'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>