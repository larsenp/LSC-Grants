<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br>
      <span id='spnPageContent' runat='server' />
<br>

<table id="Table1" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Instructions</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>Enter information about your Contacts here.</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Contacts</b></td>
	</tr>	
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td >
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td ><span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' >
	<tr align='center'>
		<td>			
			<span runat='server' id='spnSave_and_Continue'/>
		</td>
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='List' DataObjectDefinitionKey='LscWfTaskAssignmentAffiliations'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskAssignmentID' 
					PropertyKey='WfTaskAssignmentID' 
					Value='' 
					Bool=''/>
				<Argument Type='' 
					TypeKey='' 
					PropertyKey='AffiliationTypeID' 
					Value='1' />
			</Filters>
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
									<Argument AttributeName='PageKey' Value='OtherContactsEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='LscWfTaskAssignmentAffiliationID=0'/>
									<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' AttributeName='' BaseValue='WfTaskAssignmentID='/>
									<Argument Type='' TypeKey='' AttributeName='' BaseValue='AffiliationTypeID=1'/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='LscWfTaskAssignmentAffiliations'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='AffiliationRole.Description' ColumnHeader='Position/Title' Width='20%'/>
						<DisplayProperty PropertyKey='FirstNameLastName' ColumnHeader='Name'  Width='25%'/>
						<DisplayProperty PropertyKey='Email' ColumnHeader='Email Address'  Width='30%'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'  Width='25%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='OtherContactsEditor'/>
										<Argument Type='DataObject' TypeKey='LscWfTaskAssignmentAffiliationID' AttributeName='LscWfTaskAssignmentAffiliationID' BaseValue='LscWfTaskAssignmentAffiliationID='/>
										<Argument Type='' TypeKey='' AttributeName='' Value='AffiliationTypeID=1'/>
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
											<Argument Type='DataObject' TypeKey='LscWfTaskAssignmentAffiliationID' AttributeName='LscWfTaskAssignmentAffiliationID'/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Caption='Continue'
						Save='False'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>