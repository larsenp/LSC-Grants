<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br/>
<table id="Table1" width='100%' runat='server' cellpadding='2' cellspacing='0'>
	<tr>
		<td class="SeparatorHdg"><b>Grant Notes</b></td>
	</tr>
	<tr>
		<td><br>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnDPL'></span>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span runat='server' id='spnConfigXML' visible='false'>
	<ModuleSection>
		<DataObject Key='Notes' DataObjectDefinitionKey='Notes' Updatable='True'>
			<Filters>
				<!--<Argument Type='DataPresenter' TypeKey='EntityID' PropertyKey='EntityID' Value='' Bool='' />-->
				<!--Argument Type='DataPresenter' TypeKey='EntityTypeID' PropertyKey='EntityTypeID' Value='' Bool='And' /-->
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='EntityID' Value='' Bool=''/>
				<Argument Type='Data' PropertyKey='EntityTypeID' Value='3' Bool='And'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='CreateDate' Direction='Descending' />
				<Argument PropertyKey='NotesID' Direction='Descending' />
			</Sort>
			<DisplayProperties>
			
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDPL' Container='spnDPL' Type='cDataPresenterList' DataPresenterID='DPL' DataPresenterURL='Easygrants/Controls/PageSection/Grant_Notes_View.ascx' />
				</DisplayProperty>
			
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' Type='cButton' Image='Add' Container='spnAdd'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='GrantNotesEditor' />
								<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID=' />
								<Argument Type='' TypeKey='' Value='NotesID=0' />
								<Argument Type='' TypeKey='' Value='EntityTypeID=3' />
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
