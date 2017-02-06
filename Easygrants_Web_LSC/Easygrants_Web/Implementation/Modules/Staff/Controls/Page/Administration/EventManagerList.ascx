<%@ Control Language="vb" AutoEventWireup="true" Codebehind="EventManagerList.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.cEventManagerList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false"%>
<!-- Page Content - Controls -->
<br/>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Events</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td  align="Center">
			<span runat='server' id='spnClose'/>
		</td>
	</tr>
</table>
<br/>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='EventManagerEvents' DataObjectDefinitionKey='EventManagerEvents' Updatable='False' CreateNew='False'>
			<Sort>
				<Argument PropertyKey='EventName'/>	
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						MaxPerPage='10'
						SeparatorWidth='2'>                    
					    <DisplayProperty PropertyKey='EventName'  ColumnHeader='Event' Width='30%'>
					        <Sortable>
							    <Argument PropertyKey='EventName'/>
							</Sortable>
					    </DisplayProperty>
						<DisplayProperty PropertyKey='EventManagerEventType.Description'  ColumnHeader='Event Type' Width='15%'>
					        <Sortable>
							    <Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='EventManagerEventType' />
							    </Argument>
							</Sortable>
					    </DisplayProperty>
					    <DisplayProperty PropertyKey='ProcessType.Description'  ColumnHeader='Process Type' Width='15%'>
					        <Sortable>
							    <Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='ProcessType' />
							    </Argument>
							</Sortable>
					    </DisplayProperty>
					    <DisplayProperty PropertyKey='IsActive' ColumnHeader='Active' Width='15%'>
					        <Sortable>
							    <Argument PropertyKey='IsActive'/>
							</Sortable>
					    </DisplayProperty>
					    <DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center' Width='5%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='EventManagerEditor'/>
										<Argument Type='DataObject' TypeKey='EventManagerEventsID' AttributeName='EventManagerEventsID' BaseValue='EventManagerEventsID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey=''>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='EventManagerEventsID' AttributeName='EventManagerEventsID' Value=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
				    </Control>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey=''>
					<Control ID='btnClose' 
						Container='spnClose' 
						Type='cButton' 
						Image='Close'>
						<Action PostBack='True' 
							Object='EventController' 
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
							   	<Argument AttributeName='PageKey' Value='SystemSettings'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->