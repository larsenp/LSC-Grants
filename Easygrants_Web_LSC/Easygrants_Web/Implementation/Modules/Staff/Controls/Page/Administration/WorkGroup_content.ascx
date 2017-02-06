<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br/>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Workgroups</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList' visible='true'></span>
		</td>
	</tr>	
	</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='WorkGroup' DataObjectDefinitionKey='WorkGroup' >
			<Filters>
				<Argument Type='' 
					TypeKey=''
					PropertyKey='WorkGroupID' 
					Value='0' 
					bool=''/>
			</Filters>
			
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								AutoSave='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='WorkGroupsEditor'/>
									<Argument Type='DataObjectCollection' TypeKey='WorkGroup' DataObjectPropertyKey='WorkGroupID' AttributeName='' BaseValue='WorkGroupID='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WorkGroupList' DataObjectDefinitionKey='WorkGroup'>
			<Filters>
				<!-- <Argument Type='Data' 
					TypeKey=''
					PropertyKey='WorkGroupID'
					Value='1' 
					Operator='NotEqual'
					bool=''/> -->
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WorkGroup'
						MaxPerPage='10'
						SeparatorWidth='2'>
						
						<DisplayProperty PropertyKey='WorkGroupDescription' ColumnHeader='Workgroup Name' />
						<DisplayProperty PropertyKey='IsPrimary' Format='YesNo' ColumnHeader='Default' />
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Right' DataAlign='Right'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='WorkGroupsEditor'/>
										<Argument Type='DataObject' TypeKey='WorkGroupID' AttributeName='WorkGroupID' BaseValue='WorkGroupID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>						
						<DisplayProperty PropertyKey='' HeaderAlign='Left' DataAlign='Left'>
							<Separator>&nbsp;&nbsp;</Separator>
							<Parameters>
							    <Argument Value='False' ValueKey='IsPrimary'  DisplayValue='Control'>
							        <Control ID='btnDelete'
								        Type='cButton'
								        Image='Delete'
								        Confirmation='Are you sure you want to delete this item?'>
								        <Action
									        PostBack='True'
									        Object='EventController'
									        Method='EventController_Delete'>
									        <Parameters>
										        <Argument Type='DataObject' TypeKey='WorkGroupID' AttributeName='WorkGroupID'/>
											        <RelatedDataObjects>
												        <RelatedDataObject DataObjectDefinitionKey='WorkGroupMember'>
													        <RelationshipProperties>
														        <RelationshipProperty parentProperty='WorkGroupID' childProperty='WorkGroupID' />
													        </RelationshipProperties>
												        </RelatedDataObject>
												        <RelatedDataObject DataObjectDefinitionKey='WorkGroupTaskList'>
													        <RelationshipProperties>
														        <RelationshipProperty parentProperty='WorkGroupID' childProperty='WorkGroupID' />
													        </RelationshipProperties>
												        </RelatedDataObject>
											        </RelatedDataObjects>
									        </Parameters>
								        </Action>
							        </Control>
							    </Argument>
							</Parameters>		
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
