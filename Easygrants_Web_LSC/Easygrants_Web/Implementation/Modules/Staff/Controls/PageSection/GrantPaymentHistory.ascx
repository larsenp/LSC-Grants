<%@ Control language="VB" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Payment and Reporting Audit Trail</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' Width='100%'>
	<tr>
		<td><span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='PaymentHistoryList' DataObjectDefinitionKey='PaymentHistory'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' 
					Bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='ModifyDate' Direction='Descending' />
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='Payment'
						SeparatorWidth='2'
						MaxPerPage='10'>
						
						<DisplayProperty PropertyKey='PaymentID' ColumnHeader='Payment ID' Width='14%'>
							<Sortable>
								<Argument PropertyKey='PaymentID'/>								   
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ModifiedByUser.Person.LastNameFirstName' ColumnHeader='Last Modified By' Width='17%'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									    <RelatedProperty PropertyKey='ModifiedByUser.Person'/>
								   </Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='ModifiedByUser.Person'/>
								</Argument> 
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ModifyDate' ColumnHeader='Last Modified Date' Format='MM/dd/yyyy' Width='69%'>
							<Sortable>
								<Argument PropertyKey='ModifyDate'/>								   
							</Sortable>
						</DisplayProperty>
						
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
	