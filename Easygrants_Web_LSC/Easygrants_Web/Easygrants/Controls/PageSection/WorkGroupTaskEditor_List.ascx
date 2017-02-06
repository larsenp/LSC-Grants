<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Workgroup Task Management</b></td>
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
		<DataObject Key='WorkGroupTaskList' DataObjectDefinitionKey='WorkGroupTaskList'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='WorkGroupID'
					PropertyKey='WorkGroupID'
					Value='' 
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
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='WorkGroupTaskEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='WorkGroupTaskListID=0'/>
									<Argument Type='QueryString' TypeKey='WorkGroupID' BaseValue='WorkGroupID='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WorkGroupTaskList'
						SeparatorWidth='2'
						MaxPerPage='10'>
						
						<DisplayProperty PropertyKey='Description' ColumnHeader='Workgroup Task Name' />
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='WorkGroupTaskEditor'/>
										<Argument Type='DataObject' TypeKey='WorkGroupTaskListID' AttributeName='WorkGroupTaskListID' BaseValue='WorkGroupTaskListID='/>
										<Argument Type='QueryString' TypeKey='WorkGroupID' BaseValue='WorkGroupID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Separator>&nbsp;&nbsp;</Separator>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='WorkGroupTaskListID' AttributeName='WorkGroupTaskListID'/>
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
