<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cContact_Phone" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Telephone/Fax</b></td>
	</tr>	
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td >
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td >
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Phone' DataObjectDefinitionKey='Phone'>
			<Filters>
				<Argument Type='DataPresenter' 
					TypeKey='EntityID' 
					PropertyKey='EntityID' 
					Value='' 
					Bool=''/>
				<Argument Type='DataPresenter' 
					TypeKey='EntityTypeID' 
					PropertyKey='EntityTypeID' 
					Value='' 
					Bool='And'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='IsPrimary' Direction='Descending' />	
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='' ID='Add'>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
					    AutoSave='True'	
						Container='spnAdd'>
							<Action
							    ID='Add'
								PostBack='True'
								Object='ModulePage'
								Method='Save'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='PhoneEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='PhoneID=0'/>
									<Argument Type='DataPresenter' TypeKey='EntityID' AttributeName='' BaseValue='EntityID='/>
									<Argument Type='DataPresenter' TypeKey='EntityTypeID' AttributeName='' BaseValue='EntityTypeID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='Phone'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='IsPrimary' Format='YesNo' ColumnHeader='Primary'  Width='20%'/>
						<DisplayProperty PropertyKey='PhoneType.TypeName' ColumnHeader='Type'  Width='25%'/>
						<DisplayProperty PropertyKey='vFormattedPhone.PhoneNumber' ColumnHeader='Number'  Width='30%'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'  Width='25%' ID='Edit'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
								    ID='Edit'
									PostBack='True'
								    AutoSave='True'	
                                    Object='ModulePage'
                                    Method='Save'>							    								
									<Parameters>
										<Argument AttributeName='PageKey' Value='PhoneEditor'/>
										<Argument Type='DataObject' TypeKey='PhoneID' AttributeName='PhoneID' BaseValue='PhoneID='/>
										<Argument Type='DataPresenter' TypeKey='EntityID' AttributeName='EntityID' BaseValue='EntityID='/>
										<Argument Type='DataPresenter' TypeKey='EntityTypeID' AttributeName='' BaseValue='EntityTypeID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>										
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='PhoneID' AttributeName='PhoneID'/>
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
	