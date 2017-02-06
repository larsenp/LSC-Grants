<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br/>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Grant Funds</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>
<!-- Page Content - Controls -->
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnDataList' visible='true'></span>
		</td>
	</tr>	
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='Fund' DataObjectDefinitionKey='Fund'>
			<Filters>				
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
									<Argument AttributeName='PageKey' Value='FundsEditor'/>
									<Argument Type='DataObjectCollection' TypeKey='FundID' DataObjectPropertyKey='FundID' AttributeName='' BaseValue='FundID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						SeparatorWidth='2'						
						MaxPerPage='10'>
						
						<DisplayProperty PropertyKey='FundName' ColumnHeader='Fund Name' Width='25%'>
						     <Sortable>
								    <Argument PropertyKey='FundName'/>
							</Sortable>
						</DisplayProperty>		
						<DisplayProperty PropertyKey='FundAccountNumber' ColumnHeader='FundNumber' Width='15%' ConfigurableHeader='True'>
						       <Sortable>
								    <Argument PropertyKey='FundAccountNumber'/>
							</Sortable>
						</DisplayProperty>	
						<DisplayProperty PropertyKey='FundDescription' ColumnHeader='Fund Description' Width='20%'>
						       <Sortable>
								    <Argument PropertyKey='FundDescription'/>
							</Sortable>
						</DisplayProperty>	
						<DisplayProperty PropertyKey='FundAmount' ColumnHeader='Fund Amount' Format='c' Width='10%'>
						      <Sortable>
								    <Argument PropertyKey='FundAmount'/>
							</Sortable>
						</DisplayProperty>	
						<DisplayProperty PropertyKey='FundStartDate' ColumnHeader='Start Date' Format='MM/dd/yyyy' Width='5%'>
						      <Sortable>
								    <Argument PropertyKey='FundStartDate'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='FundEndDate' ColumnHeader='End Date' Format='MM/dd/yyyy' Width='5%' >
						     <Sortable>
								    <Argument PropertyKey='FundEndDate'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey=''>
						    <Control ID='btnEdit' Type='cButton' Image='Edit'>
						        <Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
								        <Parameters>
									        <Argument AttributeName='PageKey' Value='FundsEditor' />									        
									        <Argument Type='DataObject' TypeKey='FundID' AttributeName='FundID' BaseValue='FundID=' />    
									        <Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								        </Parameters>
						        </Action>
						    </Control>
				        </DisplayProperty>
				        <DisplayProperty  PropertyKey=''  ColumnHeader='' HeaderColspan='1' HeaderAlign='Left' DataAlign='Left' Width='25%'>
							<Parameters>
								<Argument Value='' ValueKey='WfProjects.FundID' Operator='NotEqual' DisplayValue=''/>	
								<Argument Value='' ValueKey='WfProjects.FundID' DisplayValue='Control'>	
									<Control ID='btnDelete'
							            Type='cButton'
							            Image='Delete'
							            Confirmation='Are you sure you want to delete this item?'>
							            <Action
								            PostBack='True'
								            Object='EventController'
								            Method='EventController_Delete'>
								            <Parameters>
									            <Argument Type='DataObject' TypeKey='FundID' AttributeName='FundID'/>
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
