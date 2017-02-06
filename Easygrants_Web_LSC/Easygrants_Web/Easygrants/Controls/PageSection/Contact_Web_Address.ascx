<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<%@ Control Language="vb" AutoEventWireup="true" Codebehind="Contact_Web_Address.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cContact_Web_Address" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server' />
<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Web Address</b></td>
	</tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='5'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WebAddress' DataObjectDefinitionKey='WebAddress'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='EntityID' PropertyKey='EntityID' Value='' Bool='' />
				<Argument Type='DataPresenter' TypeKey='EntityTypeID' PropertyKey='EntityTypeID' Value=''
					Bool='And' />
			</Filters>
			<Sort>
				<Argument PropertyKey='IsPrimary' Direction='Descending' />	
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' Type='cButton' Image='Add' Container='spnAdd'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='WebAddressEditor' />
								<Argument Type='' TypeKey='' AttributeName='' Value='WebAddressID=0' />
								<Argument Type='DataPresenter' TypeKey='EntityID' AttributeName='' BaseValue='EntityID=' />
								<Argument Type='DataPresenter' TypeKey='EntityTypeID' AttributeName='' BaseValue='EntityTypeID=' />
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList' Container='spnDataList' Type='cDataListCtl' DataObjectDefinitionKey='WebAddress'
						SeparatorWidth='2' MaxPerPage='10'>
						<DisplayProperty PropertyKey='IsPrimary' Format='YesNo' ColumnHeader='Primary' Width='20%' />
						<DisplayProperty PropertyKey='WebAddressType.TypeName' ColumnHeader='Type' Width='25%'/>
						<DisplayProperty PropertyKey='WebAddress' ColumnHeader='Web Site Address' Width='30%'>
							<Control ID='ctlLink' Type='cLink'>
								<Action PostBack='False' URL='Web' Target='_blank'></Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center' Width='25%'>
							<Control ID='btnEdit' Type='cButton' Image='Edit'>
								<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='WebAddressEditor' />
										<Argument Type='DataObject' TypeKey='WebAddressID' AttributeName='WebAddressID' BaseValue='WebAddressID=' />
										<Argument Type='DataPresenter' TypeKey='EntityID' AttributeName='EntityID' BaseValue='EntityID=' />
										<Argument Type='DataPresenter' TypeKey='EntityTypeID' AttributeName='EntityTypeID' BaseValue='EntityTypeID=' />
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete' Type='cButton' Image='Delete' Confirmation='Are you sure you want to delete this item?'>
								<Action PostBack='True' Object='EventController' Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='WebAddressID' AttributeName='WebAddressID' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>
