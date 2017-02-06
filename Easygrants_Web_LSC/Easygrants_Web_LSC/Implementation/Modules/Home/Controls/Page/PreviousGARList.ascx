<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
  
  <table width='100%' border="0" cellpadding='2' cellspacing='0'>
 	<tr id="Tr1" visible='true' runat='server'>
		 <td colspan="4" class="SeparatorHdg"><span id='spncycle' runat='server'/></td>
	</tr>
    <tr>
	     <td colspan="4" >&nbsp;</td>
    </tr>
	<tr>
		<td><span id='spnformdesc' runat='server'/></td>
		<%--<td><span id='spnPrint' runat='server'/></td>--%>
	</tr>
	 <tr>
	     <td colspan="4" >&nbsp;</td>
    </tr>
  </table>


<span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
			<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='ToDoListPrevGarCycleList' Key='ToDoListPrevGarCycleList'>
				<DisplayProperties>
					<DisplayProperty PropertyKey='LscGarCycle'>
						<Control ID='spncycle'
							Type='HtmlGenericControl' />
					</DisplayProperty>
			    </DisplayProperties>
			</DataObject>
			
			<DataObject Key='PriOrganization' DataObjectDefinitionKey='PersonOrganizationAffiliation'>
				<Filters>
			           <Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
			           <Argument PropertyKey='IsPrimaryOrganizationContact' Value='True'/>
		         </Filters>
		   </DataObject>
			
			<DataObject Key='ToDoListPrevGar' DataObjectDefinitionKey='ToDoListPrevGar'>
				<Filters>
			            <Argument Type='DataObjectCollection' TypeKey='ToDoListPrevGarCycleList' DataObjectPropertyKey='LscGarCycleID'  PropertyKey='LscGarCycleID'/>
			             <Argument Type='DataObjectCollection' TypeKey='ToDoListPrevGarCycleList' DataObjectPropertyKey='PriOrgID' PropertyKey='PriOrgID'/>
		         </Filters>
		          <Sort>
			            <Argument PropertyKey='Description' />
		         </Sort>
		        <DisplayProperties>
					<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
				          <Control ID='ctlGarList'
				                   Type='cDataListCtl'
				                   Container='spnformdesc'
				                   DataObjectDefinitionKey = 'ToDoListPrevGar'
				                   SeparatorWidth ='2'
				                   MaxPerPage = '25'>
					            <HeaderHtml>

					            </HeaderHtml>
					            <InstructionHtml>

					            </InstructionHtml>
					            <DisplayProperty PropertyKey='Description' ColumnHeader='Task' Width='25%' />
									<DisplayProperty PropertyKey='ServiceArea' ColumnHeader='Service Area' Width='10%' />
				               <DisplayProperty PropertyKey='WfTAYear' ColumnHeader='Year' Width='10%' />
				               <DisplayProperty PropertyKey=''>
										<Parameters>
											<Argument Value='' 
												ValueKey='WfTaskAssignment.WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
												CompareKey=''
												Operator='Equal'
												DisplayValue='Control'>
												<Control ID='btnPrint'
													Type='cLink'
													Container='spnPrint'
													Caption='Printable View'>
													<Action PostBack='True'
															  Object='DataPresenter'
															  Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
															  <Parameters>
																	<Argument AttributeName='PVPageKey' Type='DataObject' TypeKey='PVPageKey' BaseValue='Page=' />
																	<Argument AttributeName='WfTaskAssignmentID' Type='DataObject' TypeKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' />
																	<Argument AttributeName='PageFrame' Value='PageFrame=Print' />
															  </Parameters>
													  </Action>
											  </Control>
											</Argument>
											<Argument Value='' 
												ValueKey='WfTaskAssignment.WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
												CompareKey=''
												Operator='NotEqual'
												DisplayValue='Control'>
												<Control ID='btnView'
													Type='cButton'
													Caption='View PDF'>
													<Action PostBack='True'
														Object='DataPresenter' 
														Method='LSC_EventController_NavigateToURL_NewWindowOpener'>
														<Parameters>
															<Argument Value='/Easygrants_Web_LSC/Core/Controls/Base/pgReportOutputReader.aspx' />
															<Argument AttributeName='WfTaskAssignmentID' Type='DataObject' TypeKey='WfTaskAssignmentID' BaseValue='EntityID=' Value='' />
															<Argument Type='DataObjectRelated'
																TypeKey='WfTaskAssignment.WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
																AttributeName='ReportOutputDefinitionID'
																BaseValue='DefinitionID='/>
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
</span>