<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<table width='100%' runat='server' cellpadding='2' cellspacing='0'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Add or Edit Note</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	
	<tr>
		<td>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
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
				<Argument Type='DataPresenter' TypeKey='EntityID' PropertyKey='EntityID' Value='' Bool='' />
				<Argument Type='DataPresenter' TypeKey='EntityTypeID' PropertyKey='EntityTypeID' Bool='And'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='CreateDate' Direction='Descending' />
			</Sort>
			<DisplayProperties>
			
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDPL' Container='spnDPL' Type='cDataPresenterList' DataPresenterID='DPL' DataPresenterURL='Easygrants/Controls/PageSection/Contact_Notes_View.ascx' />
				</DisplayProperty>
			
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' Type='cButton' Image='Add' Container='spnAdd'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='NotesEditor' />
								<Argument Type='' TypeKey='' Value='NotesID=0' />
								<Argument Type='DataPresenter' TypeKey='EntityID' BaseValue='EntityID=' />
								<Argument Type='DataPresenter' TypeKey='EntityTypeID' BaseValue='EntityTypeID=' />
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
