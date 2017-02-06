<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- Page Content - Controls -->
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr><td class="SeparatorHdg"><b>Instructions</b></td></tr>	
	<tr><td><span id='spnPageContent' runat='server' /></td></tr>	
</table>
<br>
<table id="Table2" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td  class="SeparatorHdg"><b>Project Timeline</b></td></tr>	
	<tr><td>&nbsp;</td></tr>
	<tr><td><span runat='server' id='spnAdd' visible='true'></span></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><span runat='server' id='spnDataList'></span></td></tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>	
	<tr>
		<td align='center'><span runat='server' id='spnSave_and_Continue'/></td>
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='List' DataObjectDefinitionKey='GranteeProjectTimeline'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<Sort><Argument PropertyKey='Milestone' /></Sort>	
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
								<Argument AttributeName='PageKey' Value='ProjectTimelineEditor'/>
								<Argument Type='QueryString' TypeKey='' BaseValue='ProjectTimelineID=0'/>								
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
					    <DisplayProperty PropertyKey='ModifiedDate' Width='13%' ColumnHeader='Modified Date' Format='MM/dd/yyyy'>
							<Sortable>
								<Argument PropertyKey='ModifiedDate'/>
							</Sortable>
					    </DisplayProperty>
					    <DisplayProperty PropertyKey='ProjectTimelineStatus.TimelineStatusDesc' Width='13%' ColumnHeader='Status'>
							<Sortable>
								<Argument PropertyKey='TimelineStatusDesc'>
									<RelatedProperty PropertyKey='ProjectTimelineStatus' />
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
										<Argument AttributeName='PageKey' Value='ProjectTimelineEditor'/>
								        <Argument Type='DataObject' TypeKey='ProjectTimelineID' AttributeName='ProjectTimelineID' BaseValue='ProjectTimelineID='/>								
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
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
						<Control ID='btnSave_and_Continue'
							Container='spnSave_and_Continue'
							Type='cButton' Image='Continue' GoToNextPage='True' >
						</Control>	
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>			
	</ModuleSection>
</span>
<!-- End Embedded XML -->

