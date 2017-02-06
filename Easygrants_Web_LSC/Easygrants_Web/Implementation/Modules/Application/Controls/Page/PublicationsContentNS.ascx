<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server'/>

<!-- Page Content - Controls -->
<P>
	You can enter <b>up to two publication</b> records.  For each record, you will be asked to supply 
	a Web link to the full publication.  To add information about Publications, click the 
	<b>Add</b> button below.  After you have saved a record for Publications, the <b>Edit</b> and <b>Delete</b> 
	buttons will be displayed to the right of the records to allow modifications to your list. 
</P>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Publications</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<Core:cUserCtlLoader CtlID='ctlPublications' 
	Src='EasyGrants/Controls/PageSection/PublicationsList.ascx'
	runat='server'/>

<center>
	<table>	
		<tr>
			<td>
				<span runat='server' id='spnSave_and_Continue'/>&nbsp;&nbsp;
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
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Budget'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
