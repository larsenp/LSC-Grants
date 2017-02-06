<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->
<br/>
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Label Manager</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnAdd' visible='true'></span>
		</td>
	</tr>
	
	<tr>
		<td>
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>
<br/>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='HeaderLabel' DataObjectDefinitionKey='HeaderLabel'>
			<Filters>
				
			</Filters>
			<Sort>
				<Argument PropertyKey='LabelName' Direction='Ascending' />	
			</Sort>
			
			<DisplayProperties>				
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						MaxPerPage='10'
						SeparatorWidth='2'>                    
						    <DisplayProperty PropertyKey='LabelDisplayName'  ColumnHeader='Default Label Name'>
						        <Sortable>
								    <Argument PropertyKey='LabelDisplayName'/>
								</Sortable>
						    </DisplayProperty>
						      <DisplayProperty PropertyKey='LabelText'  ColumnHeader='Preferred Label Name'>
						        <Sortable>
								    <Argument PropertyKey='LabelText'/>
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
										<Argument AttributeName='PageKey' Value='ConfigurableHeaderEditor'/>
										<Argument Type='DataObject' TypeKey='HeaderLabelID' AttributeName='HeaderLabelID' BaseValue='HeaderLabelID='/>																									
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
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


