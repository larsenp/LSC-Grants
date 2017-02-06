<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg">
			<b>Trip</b>
		</td>
	</tr>
	<tr>
		<td>
			To upload a document to this grant file, click <B>Add</B>. To view a document in its original file format, 
			click the corresponding <B>View</B> button. To delete a document from the grant file, click the 
			corresponding <B>Delete</B> button.
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='80%'>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAdd'></span>
		</td>		
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnTripsList'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='GranteeProjectTrip' DataObjectDefinitionKey='GranteeProjectTrip'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='Reference' />	
			</Sort>	
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='GrantTripEditor'/>
									<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
									<Argument Type='' TypeKey='GranteeProjectTripID' AttributeName='GranteeProjectTripID' Value='GranteeProjectTripID=0'/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlTripsList'
						Container='spnTripsList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GranteeProjectTrip'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='Reference' ColumnHeader='Trip Reference'>
							<Sortable>
								<Argument PropertyKey='Reference'>	
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='TripType.Description' ColumnHeader='Type'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='TripType' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='TripStatus.Description' ColumnHeader='Status'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='TripStatus' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='StartDate' ColumnHeader='Start Date' Format='MM/dd/yyyy'>
							<Sortable>
								<Argument PropertyKey='StartDate'>	
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='EndDate' ColumnHeader='End Date' Format='MM/dd/yyyy'>
							<Sortable>
								<Argument PropertyKey='EndDate'>	
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='MediaCode.Description' ColumnHeader='Media Code'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='MediaCode' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='3' HeaderAlign='Center' Width='100'>
							<Control ID='btnUpload'
								Type='cButton'
								Image='Upload'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GrantTripReportEditor'/>
										<Argument Type='' TypeKey='FileTypeID' AttributeName='FileTypeID' Value='FileTypeID=58'/>
										<Argument Type='DataObject' TypeKey='UploadID' AttributeName='UploadID' BaseValue='SubmittedFileID='/>
										<Argument Type='DataObject' TypeKey='GranteeProjectTripID' AttributeName='GranteeProjectTripID' BaseValue='GranteeProjectTripID='/>
										<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='false'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GrantTripEditor'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectTripID' AttributeName='GranteeProjectTripID' BaseValue='GranteeProjectTripID='/>
										<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='false'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='GranteeProjectTripID' AttributeName='GranteeProjectTripID'/>
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