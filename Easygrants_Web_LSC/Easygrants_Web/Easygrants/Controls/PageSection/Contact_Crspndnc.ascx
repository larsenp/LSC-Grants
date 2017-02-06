<%@ Control Language="vb" AutoEventWireup="true" Codebehind="Contact_Crspndnc.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cContact_Crspndnc" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Correspondence E-mails</b></td>
	</tr>	
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr id='trLoggedEmailsMessage'>
		<td>Following are all logged e-mails sent to this person from Easygrants. Click <b>View</b> to see the message.
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnDataList' visible='true'></span>
		</td>
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='EmailLogList' DataObjectDefinitionKey='EmailLog'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='RecipientPersonID' Value='' Bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='CreateDate' Direction='Descending'/>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						NoRecordMessage='This person contact has not been sent any logged e-mails from Easygrants.'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='CreateDate' Format='M/d/yyyy' ColumnHeader='Date Sent' Width='15%'>
							<Sortable>
								<Argument PropertyKey='CreateDate'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='CorrespondenceFrom' ColumnHeader='From' Width='20%'>
							<Sortable>
								<Argument PropertyKey='CorrespondenceFrom'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Subject' ColumnHeader='E-mail Subject' Width='20%'>
							<Sortable>
								<Argument PropertyKey='Subject'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ResentDate' Format='M/d/yyyy' ColumnHeader='Last Date Resent' NullDisplay='N/A' Width='20%'>
							<Sortable>
								<Argument PropertyKey='ResentDate'/>
							</Sortable>
							
						</DisplayProperty>						
						<DisplayProperty PropertyKey='' ColumnHeader='Option'  Width='25%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='View'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='CrspndncEditor'/>
										<Argument Type='DataObject' TypeKey='EmailLogID' AttributeName='EmailLogID' BaseValue='EmailLogID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
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