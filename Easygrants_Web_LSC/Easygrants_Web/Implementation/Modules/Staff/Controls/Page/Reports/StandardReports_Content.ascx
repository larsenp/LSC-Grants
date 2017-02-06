<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Core_Web.Controls.Base.cDataPresenterCtl"%>
<br><br>
<p>
Listed below are the available custom reports.&nbsp;&nbsp;Click on a report to go to the filter page 
for that report.
</p>
<!-- USER MODIFIABLE CONTENT AREA -->
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>	
<tr>
	<td><span id='spnReport' runat='server'/></td>
</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
		
		<!--ELIGIBILITY -->
		<DataObject Key='Report' DataObjectDefinitionKey='Report'>
			<Filters>
				<Argument Type='' TypeKey='' PropertyKey='Active'  Value='1' />
			</Filters>
			<Sort>
				<Argument PropertyKey='ReportName' />
			</Sort>
			<DisplayProperties>			
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlReport'
						Container='spnReport'
						Type='cDataListCtl'
						DataObjectDefinitionKey='Report'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<HeaderHtml>
							Custom Reports
						</HeaderHtml>
						<InstructionHtml>
						</InstructionHtml>
						<DisplayProperty PropertyKey='ReportName' ColumnHeader=' '> 
							<Control 
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Type='DataObject' TypeKey='PageKey'/>
										<Argument Type='DataObject' TypeKey='ReportID' AttributeName='ReportID' BaseValue='ReportID='/>
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