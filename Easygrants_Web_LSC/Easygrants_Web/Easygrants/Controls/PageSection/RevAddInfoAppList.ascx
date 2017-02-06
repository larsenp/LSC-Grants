<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Control Label (for Additional information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Additional Information</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td colspan='2'><span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
	<tr>
		<td colspan='2'><span runat='server' id='spnNoRequests'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewAdditionalInformation' DataObjectDefinitionKey='ReviewAdditionalInformation'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='AppWfTaskAssignmentID'
					Value=''/>
				<Argument Type='' 
					TypeKey=''
					PropertyKey='RequestDate'
					Value='not null'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='RequestComment' />	
			</Sort>	
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='lblNoRequests'
						Container='spnNoRequests'
						Type='cLabel'
						LabelText='No Additional Information Requests have been entered.'>
						<Visible>
							<Argument PropertyKey='RequestDate' NullDataObject='True' Operator='Equal' Value='' />
						</Visible>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='ReviewAdditionalInformation'
						SeparatorWidth='2'
						MaxPerPage='10'>
						
						<DisplayProperty PropertyKey='RequestComment' ColumnHeader='Request'/>
						<DisplayProperty PropertyKey='ResponseComment' ColumnHeader='Response'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='RevAddInfoAppEditor'/>
										<Argument Type='DataObject' TypeKey='ReviewAdditionalInformationID' AttributeName='ReviewAdditionalInformationID' BaseValue='ReviewAdditionalInformationID='/>
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
	