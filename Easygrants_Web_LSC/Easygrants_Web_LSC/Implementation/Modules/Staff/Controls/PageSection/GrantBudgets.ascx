<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" CodeBehind="GrantBudgets.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>


<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Budget</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table id="Table2" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<%--<td>
			<span runat='server' id='spnAdd'></span>
		</td>--%>
		<td>
			<span runat='server' id='spnEdit'></span>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='2'><span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>	
	
<table id="Table3" cellspacing='0' cellpadding='2' runat='server' border='0' width='100%'>
    <tr>
        <td valign="top" width='20%'><b>Total Budget</b></td>
        <td width='25%'><span id='spnTotalBudget' runat='server'/></td>
        <td width='20%'><b>Amount Contributed by Applicant</b></td>
        <td width='35%'><span id='spnApplicantContri' runat='server'/></td>
    </tr>
	<tr>
        <td valign="top"><b>Amount Contributed by Other LSC Partners</b></td>
        <td><span id='spnLscContri' runat='server'/></td>
        <td><b>Amount Contributed by Others</b></td>
        <td><span id='spnNLscContri' runat='server'/></td>
    </tr>
    <tr>
        <td valign="top"></td>
        <td><b>Final Project Budget</b></td>
        <td><span id='spnFinalBudget' runat='server'/></td>
        <td> </td>
    </tr>
</table>	

<span runat='server' id='spnTIGBudgetReport' />&nbsp;<span runat='server' id='spnTIGBudgetReportBC' />&nbsp;
<span runat='server' id='spnTIGBudgetReportFinal' />
<br /><br />
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='BudgetList' DataObjectDefinitionKey='Budget'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' 
					Bool=''/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
				    <Control ID='btnBudgetEdit'
				            Type='cButton'
				            Image='Edit'
				            Container='spnEdit'>
				                <Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='BudgetEditorTIG'/>
								    <Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
								    <Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
								</Parameters>
								</Action>
				      </Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='Budget'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='BudgetType.Description' ColumnHeader='Budget Version' Width='10%'>
							<Sortable>
								<Argument PropertyKey='Description'>
								    <RelatedProperty PropertyKey='BudgetType'/>
								</Argument> 
							</Sortable>
						</DisplayProperty>		
						<DisplayProperty PropertyKey='Description' ColumnHeader='Description' Width='22%'>
							<Sortable>
								<Argument PropertyKey='Description'/>
							</Sortable>
						</DisplayProperty>	
						<DisplayProperty PropertyKey='Total' ColumnHeader='Total Amount'  Format='c' Width='14%'>
							<Sortable>
								<Argument PropertyKey='Total'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ModifiedByUser.Person.LastNameFirstName' ColumnHeader='Last Modified By'  Width='14%'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									    <RelatedProperty PropertyKey='ModifiedByUser.Person'/>
								</Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='ModifiedByUser.Person'/>
								</Argument> 
							</Sortable>
						</DisplayProperty>	
						<DisplayProperty PropertyKey='ModifyDate' ColumnHeader='Last Modified Date' Format='MM/dd/yyyy' Width='20%'>
							<Sortable>
								<Argument PropertyKey='ModifyDate'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Options' Width='20%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='BudgetEditor'/>
										<Argument Type='DataObject' TypeKey='BudgetID' AttributeName='BudgetID' BaseValue='BudgetID='/>
										<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='' NewCell='false' >
							<Control ID='btnCopy'
								Type='cButton'
								Image='Copy'
								Confirmation='Are you sure you want to copy this item?'>
								<Action
									PostBack='True'
									Object='DataPresenter'
							        Method='CopyBudget'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='BudgetID' AttributeName='BudgetID'/>
										<Argument Type='DataObject' TypeKey='BudgetTypeID' AttributeName='BudgetTypeID'/>
										<Argument Type='DataObject' TypeKey='Description' AttributeName='Description'/>
										<Argument Type='DataObjectRelated' TypeKey='BudgetPeriods.BudgetPeriodName' AttributeName='BudgetPeriods.BudgetPeriodName' Value=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='' NewCell='false'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='BudgetID' AttributeName='BudgetID'/>
											<RelatedDataObjects>
												<RelatedDataObject DataObjectDefinitionKey='BudgetPeriod'>
													<RelationshipProperties>
														<RelationshipProperty parentProperty='BudgetID' childProperty='BudgetID' />
													</RelationshipProperties>
													<RelatedDataObjects>
														<RelatedDataObject DataObjectDefinitionKey='BudgetItem'>
															<RelationshipProperties>
																<RelationshipProperty parentProperty='BudgetPeriodID' childProperty='BudgetPeriodID' />
															</RelationshipProperties>
														</RelatedDataObject>
													</RelatedDataObjects>
												</RelatedDataObject>
											</RelatedDataObjects>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
						
					</Control>
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='vLSCBudgetTIG' DataObjectDefinitionKey='vLSCBudgetTIG' >
		    <Filters>
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' 
					Bool=''/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='Total' Format='$#,0.00'>
				    <Control ID='spnTotalBudget'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProgramProjectTotal' Format='$#,0.00'>
				    <Control ID='spnApplicantContri'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscFundedTotal' Format='$#,0.00'>
				    <Control ID='spnLscContri'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NonLscFundedTotal' Format='$#,0.00'>
				    <Control ID='spnNLscContri'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='Total' Format='$#,0.00'>
				    <Control ID='spnFinalBudget'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>--%>
				
			</DisplayProperties>
		
		</DataObject>
		
		<DataObject Key='LscTigBudget' DataObjectDefinitionKey='LscTigBudget' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnTIGBudgetReport'
						Type='cButton'
						Container='spnTIGBudgetReport'
						Caption='View TIG Budget Report'>
						<Action PostBack='True'
							Object='EventController'
							Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
							<Parameters>
								<Argument Value='TIGGrantBudgetReport' />
								<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID=' />
								<Argument Value='PageFrame=Print' />
							</Parameters>
						</Action>	
						<Visible>
							<Argument PropertyKey='ProgramID' Value='2' NullDataObject='False'>
								<RelatedProperty PropertyKey='GranteeProject.WfProject.WfCompetition'/>
							</Argument>
							<Argument PropertyKey='Abbr' Value='2014' Operator='LessThan'>
								<RelatedProperty PropertyKey='GranteeProject.WfProject.TimePeriod'/>
							</Argument>
						</Visible>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscTigBudgetBC' DataObjectDefinitionKey='LscTigBudget' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnTIGBudgetReportBC'
						Type='cButton'
						Container='spnTIGBudgetReportBC'
						Caption='View TIG Budget Report'>
						<Action PostBack='True'
							Object='EventController'
							Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
							<Parameters>
								<Argument Value='TIGGrantBudgetReportBC' />
								<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID=' />
								<Argument Value='PageFrame=Print' />
							</Parameters>
						</Action>	
						<Visible>
							<Argument PropertyKey='ProgramID' Value='2' NullDataObject='False'>
								<RelatedProperty PropertyKey='GranteeProject.WfProject.WfCompetition'/>
							</Argument>
							<Argument PropertyKey='Abbr' Value='2013' Operator='GreaterThan'>
								<RelatedProperty PropertyKey='GranteeProject.WfProject.TimePeriod'/>
							</Argument>
						</Visible>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
<!-- End Embedded XML -->
</span>
	
