<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->

<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Project Timeline</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnAdd' visible='true'></span>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
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
		<DataObject Key='GranteeProjectTimelineList' DataObjectDefinitionKey='GranteeProjectTimeline'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='Milestone' />	
			</Sort>	
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAdd'
						Container='spnAdd'
						Type='cButton'
						Image='Add'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='GrantProjectTimelineEditor'/>
								<Argument Type='QueryString' TypeKey='' BaseValue='ProjectTimelineID=0'/>								
								<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>																	
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GranteeProjectTimeline'
						MaxPerPage='10'
						SeparatorWidth='2'>
									   			
						<DisplayProperty PropertyKey='Milestone' Width='25%' ColumnHeader='Milestone/Activity'>
							<Sortable>
							    <Argument PropertyKey='Milestone'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='TargetDate' Width='13%' ColumnHeader='Expected Date' Format='MM/dd/yyyy'>
							<Sortable>
								<Argument PropertyKey='TargetDate'/>
							</Sortable>
					    </DisplayProperty>
					    <DisplayProperty PropertyKey='ModifiedDate' Width='12%' ColumnHeader='Modified Date' Format='MM/dd/yyyy'>
							<Sortable>
								<Argument PropertyKey='ModifiedDate'/>
							</Sortable>
					    </DisplayProperty>
					    <DisplayProperty PropertyKey='ProjectTimelineStatus.TimelineStatusAbbr' Width='13%' ColumnHeader='Status'>
					    <Sortable>
								<Argument PropertyKey='TimelineStatusAbbr'>
									<RelatedProperty PropertyKey='ProjectTimelineStatus'/>
								</Argument>
							</Sortable>
					    </DisplayProperty>
					    <DisplayProperty PropertyKey='IsDeliverable' Width='12%' ColumnHeader='Deliverable' HeaderAlign='Center' Format='YesNo' DataAlign='Center'>
							<Sortable>
							    <Argument PropertyKey='IsDeliverable'/>
							</Sortable>
						</DisplayProperty>							
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center' Width='25%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GrantProjectTimelineEditor'/>
								<Argument Type='DataObject' TypeKey='ProjectTimelineID' AttributeName='ProjectTimelineID' BaseValue='ProjectTimelineID='/>								
								<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>																	
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
											<Argument Type='DataObject' TypeKey='ProjectTimelineID' AttributeName='ProjectTimelineID'/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
				       </Control>
				      </DisplayProperty> 
			    
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->



