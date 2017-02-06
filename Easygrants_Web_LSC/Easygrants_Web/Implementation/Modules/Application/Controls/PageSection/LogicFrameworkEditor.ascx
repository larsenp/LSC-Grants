<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.Page.cLogicFrameworkEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>


<font color='red'><b><span id='spnPageValidation' runat='server' /></b></font>
	
<br>
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>
<br>
      <span id='spnPageContent' runat='server' />
<br>
<br>	
<table id="Table2" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg" colspan='3'><b>Long-term Outcome Description</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr align='Center'>
		<td colspan='3'>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSave_and_Continue'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='25%' valign="Top"><b>Long-term Project Outcome</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnLongTermConservationOutcome' />
			<asp:RequiredFieldValidator id='ValongTermConservationOutcome' runat='server'
				ControlToValidate='ctlLongTermConservationOutcome'
				ErrorMessage='Long-term Project Outcome is required.' Enabled='False'
				Display='none'/>
		</td>
	</tr>
	<tr>
		<td width='25%'>&nbsp;</td>
		<td class='FieldLabel'>Limit to 200 characters, including spaces.</td>
	</tr>
</table>
<br>

<table id="Table3" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg" colspan='6'><b>Outcome Indicator(s) and Units of Measure</b></td>
	</tr>	
	<tr>
		<td colspan='6'>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='6'><font color='red'><b><span id='spnValidatorOutcomes' runat='server' /></b></font></td>
	</tr>
	<tr>
	    <td width='5%'>&nbsp;</td>
		<td width='35%'><b>Indicator and Units of Measure</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='15%'><b> Baseline</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='15%'><b>Value at Grant Completion</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='15%'><b>Long-term Value</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='15%'><b>In What Year will Long-term Value to be Achieved?</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='5%'>&nbsp;</td>
	</tr>
	<tr>
	    <td width='5%'><span runat='server' id='spnAddOutcomes1'/></td>
		<td width='35%'><span runat='server' id='spnOutcomeIndicators'/></td>
		<td width='15%'><span runat='server' id='spnBaseline'/></td>
		<td width='15%'><span runat='server' id='spnGrantcompletion'/></td>
		<td width='15%'><span runat='server' id='spnLongTerm'/></td>
		<td width='15%'><span runat='server' id='spnYearLongTerm'/></td>
		<td width='5%'><span runat='server' id='spnAddOutcomes'/></td>
	</tr>
	<tr>
	    <td width='5%'>&nbsp;</td>
		<td colspan='6'><span runat='server' id='spnOther'/></td>
	</tr>
	<tr>
	    <td width='5%'>&nbsp;</td>
		<td colspan='6' class='FieldLabel'>If "Other" is selected above, enter indicator and units.</td>
	</tr>
	<tr>
		<td colspan='6'><hr></td>
	</tr>
	<tr>
		<td colspan='6'>
			<span runat='server' id='spnDataListOutcomes'></span>	
		</td>
	</tr>
</table>


<table id="Table4" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg" colspan='6'><b>Threats and Opportunities</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='25%' valign="Top"><b>Major Threats/Opportunities  Description</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnThreatsAndOpportunities' />
			<asp:RequiredFieldValidator id='ValThreatsAndOpportunities' runat='server'
				ControlToValidate='ctlThreatsAndOpportunities'
				ErrorMessage='Threats/Opportunities is required.' Enabled='False'
				Display='none'/>
		</td>
	</tr>
	<tr>
		<td width='25%'>&nbsp;</td>
		<td class='FieldLabel'>Limit to 500 characters, including spaces.  Number the threats/opportunities listed and use the number in the Threat/Opportunity ID field below.</td>
	</tr>
</table>

<table id="Table5" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg" colspan='7'><b>Threat/Opportunity Indicators</b></td>
	</tr>	
	<tr>
		<td colspan='7'>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='7'><font color='red'><b><span id='spnValidatorThreats' runat='server' /></b></font></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td width='1%'><b>Threat/Opportunity ID</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='34%'><b>Indicator and Units of Measure</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='15%'><b> Baseline</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='15%'><b>Value at Grant Completion</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='15%'><b>Long-term Value</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='15%'><b>In What Year will Long-term Value to be Achieved?</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='5%'>&nbsp;</td>
	</tr>
	<tr>
	    <td width='5%'><span runat='server' id='spnAddThreats1'/></td>
		<td width='1%'><span runat='server' id='spnThreatID'/></td>
		<td width='34%'><span runat='server' id='spnThreatIndicators'/></td>
		<td width='15%'><span runat='server' id='spnBaselineThreats'/></td>
		<td width='15%'><span runat='server' id='spnGrantcompletionThreats'/></td>
		<td width='15%'><span runat='server' id='spnLongTermThreats'/></td>
		<td width='15%'><span runat='server' id='spnYearLongTermThreats'/></td>
		<td width='5%'><span runat='server' id='spnAddThreats'/></td>
	</tr>
	<tr>
		<td width='1%'>&nbsp;</td>
		<td colspan='6'><span runat='server' id='spnOtherThreats'/></td>
	</tr>
	<tr>
		<td width='1%'>&nbsp;</td>
		<td colspan='6' class='FieldLabel'>If "Other" is selected above, enter indicator and units.</td>
	</tr>
	<tr>
		<td colspan='7'><hr></td>
	</tr>
	<tr>
		<td colspan='7'>
			<span runat='server' id='spnDataListThreats'></span>	
		</td>
	</tr>
</table>

<table id="Table6" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg" colspan='2'><b>Project Activities</b></td>
	</tr>	
	<tr><td colspan='2'>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>&nbsp;</td>
	</tr>
	<tr><td colspan='2'>&nbsp;</td></tr>
	<tr>
		<td width='25%' valign="Top"><b>Primary Activities</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnProjectActivities' />
			<asp:RequiredFieldValidator id='ValProjectActivities' runat='server'
				ControlToValidate='ctlProjectActivities'
				ErrorMessage='Activity is required.' Enabled='False'
				Display='none'/>
		</td>
	</tr>
	<tr>
		<td width='25%'>&nbsp;</td>
		<td class='FieldLabel'>Limit to 1000 characters, including spaces.</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr align='Center'>
		<td colspan='2'>
			<span runat='server' id='spnSaveBottom'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSave_and_ContinueBottom'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnCancelBottom'/>		
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='GranteeProjectLogicFramework' DataObjectDefinitionKey='GranteeProjectLogicFramework' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ProjectLogicFrameworkID' PropertyKey='ProjectLogicFrameworkID' Value='' Bool=''/>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' 	Bool='AND'/>
			</Filters>
			<DefaultValues>
			    <Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' 	Bool=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LongTermConservationOutcome'>
					<Control ID='ctlLongTermConservationOutcome'
						Container='spnLongTermConservationOutcome'
						Type='cTextArea'
						Rows='5'
						Cols='80'
						MaxLength='200'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ThreatsAndOpportunities'>
					<Control ID='ctlThreatsAndOpportunities'
						Container='spnThreatsAndOpportunities'
						Type='cTextArea'
						Rows='8'
						Cols='80'
						MaxLength='500'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProjectActivities'>
					<Control ID='ctlProjectActivities'
						Container='spnProjectActivities'
						Type='cTextArea'
						Rows='8'
						Cols='80'
						MaxLength='1000'/>
				</DisplayProperty>
		   </DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'  Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value='' 	Bool=''/>
			</Filters>
		</DataObject>
		
		<DataObject Key='NFWFGranteeProjectLogicFrameworkIndicators1' DataObjectDefinitionKey='GranteeProjectLogicFrameworkIndicators'>
			<Filters>
				<Argument Type='QueryString' TypeKey='LogicFrameworkIndicatorsID' PropertyKey='LogicFrameworkIndicatorsID' Value='' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='IndicatorTypeID'>
					<Control ID='ctlOutcomeIndicators' 
						Container='spnOutcomeIndicators' 
						Type='cDropDown' 
						DataObjectDefinitionKey='IndicatorsType'
						StoredValue='IndicatorTypeID' 
						DisplayValue='Description' 
						DisplayText='Select'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfProjectTask.WfProject.CompetitionID' PropertyKey='CompetitionID' />							
						</Filters>
						<Sort>
							<Argument PropertyKey='SortOrder' Direction='Ascending' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Baseline'>
					<Control ID='ctlBaseline' 
						Type='cTextBox' 
						Container='spnBaseline' 
						Size='15' 
						MaxLength='50'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Grantcompletion'>
					<Control ID='ctlGrantcompletion' 
						Type='cTextBox' 
						Container='spnGrantcompletion' 
						Size='15' 
						MaxLength='50'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LongTerm'>
					<Control ID='ctlLongTerm' 
						Type='cTextBox' 
						Container='spnLongTerm' 
						Size='15' 
						MaxLength='50'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='YearLongTerm'>
					<Control ID='ctlYearLongTerm' 
						Type='cTextBox' 
						Container='spnYearLongTerm' 
						Size='15' 
						AllowNumbersOnly='True'
						MaxLength='4'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other'>
					<Control ID='ctlOther' 
						Type='cTextBox' 
						Container='spnOther' 
						Size='50' 
						MaxLength='100'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAddOutcomes' 
						Type='cButton' 
						Image='Add'						
						Container='spnAddOutcomes'>
							<Action
								PostBack='True'
								AutoSave='True'
								Object='DataPresenter'
								Method='AddLogicFrameworkIndicators'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='OutcomesandIndicatorsEditor'/>
									<Argument Type='QueryString' TypeKey='LogicFrameworkIndicatorsID' PropertyKey='LogicFrameworkIndicatorsID'  />
									<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
									<Argument Type='DataObjectCollection' TypeKey='GranteeProjectLogicFramework' DataObjectPropertyKey='ProjectLogicFrameworkID' PropertyKey='ProjectLogicFrameworkID' Value=''/>								
									<Argument AttributeName='IndicatorID' Value='1' />											
									<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  />											
								</Parameters>	
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAddOutcomes1' 
						Type='cButton' 
						Image='Add'						
						Container='spnAddOutcomes1'>
							<Action
								PostBack='True'
								AutoSave='True'
								Object='DataPresenter'
								Method='AddLogicFrameworkIndicators'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='OutcomesandIndicatorsEditor'/>
									<Argument Type='QueryString' TypeKey='LogicFrameworkIndicatorsID' PropertyKey='LogicFrameworkIndicatorsID'  />
									<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
									<Argument Type='DataObjectCollection' TypeKey='GranteeProjectLogicFramework' DataObjectPropertyKey='ProjectLogicFrameworkID' PropertyKey='ProjectLogicFrameworkID' Value=''/>								
									<Argument AttributeName='IndicatorID' Value='1' />											
									<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  />											
								</Parameters>	
							</Action>
					</Control>
				</DisplayProperty>
		   </DisplayProperties>
		</DataObject>
		
		<DataObject Key='NFWFGranteeProjectLogicFrameworkIndicatorsList' DataObjectDefinitionKey='GranteeProjectLogicFrameworkIndicators'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ProjectLogicFrameworkID' PropertyKey='ProjectLogicFrameworkID' Value='' Bool=''/>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' 	Bool='AND'/>
				<Argument Type='Data' TypeKey='IndicatorID' PropertyKey='IndicatorID' Value='1' Bool='AND' />
			</Filters>		
			<DisplayProperties>												
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataListOutcomes'
						Container='spnDataListOutcomes'
						Type='cDataListCtl'						
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='NFWFIndicatorsTypeDesc' ColumnHeader='Indicator and Units of Measure' Width='30%'>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Baseline' ColumnHeader='Baseline' Width='15%'/>
						<DisplayProperty PropertyKey='Grantcompletion' ColumnHeader='Value at Grant Completion'  Width='15%'/>
						<DisplayProperty PropertyKey='LongTerm' ColumnHeader='Long-term Value'  Width='15%' />	
						<DisplayProperty PropertyKey='YearLongTerm' ColumnHeader='Year long-term value to be achieved'  Width='15%' />												
						<DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center' Width='10%'>
							<Control ID='btnEditOA'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									AutoSave='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='OutcomesandIndicatorsEditor'/>
										<Argument Type='DataObject' TypeKey='LogicFrameworkIndicatorsID' AttributeName='LogicFrameworkIndicatorsID' BaseValue='LogicFrameworkIndicatorsID='/>
										<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' BaseValue='GranteeProjectID=' />
										<Argument Type='QueryString' TypeKey='ProjectLogicFrameworkID' PropertyKey='ProjectLogicFrameworkID' BaseValue='ProjectLogicFrameworkID=' />										
										<Argument Type='DataObject' TypeKey='IndicatorID' AttributeName='IndicatorID' BaseValue='IndicatorID='/>
										<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  BaseValue='ReturnURL='/>
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
											<Argument Type='DataObject' TypeKey='LogicFrameworkIndicatorsID' AttributeName='LogicFrameworkIndicatorsID'/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
						
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='NFWFGranteeProjectLogicFrameworkIndicators2' DataObjectDefinitionKey='GranteeProjectLogicFrameworkIndicators'>
			<Filters>
				<Argument Type='QueryString' TypeKey='LogicFrameworkIndicatorsID' PropertyKey='LogicFrameworkIndicatorsID' Value='' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ID'>
					<Control ID='ctlThreatID' 
						Type='cTextBox' 
						Container='spnThreatID' 
						Size='10' 
						MaxLength='50'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IndicatorTypeID'>
					<Control ID='ctlThreatIndicators' 
						Container='spnThreatIndicators'
						Type='cDropDown' 
						DataObjectDefinitionKey='IndicatorsType'
						StoredValue='IndicatorTypeID' 
						DisplayValue='Description' 
						DisplayText='Select'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfProjectTask.WfProject.CompetitionID' PropertyKey='CompetitionID' />							
						</Filters>
						<Sort>
							<Argument PropertyKey='SortOrder' Direction='Ascending' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Baseline'>
					<Control ID='ctlBaselineThreats' 
						Type='cTextBox' 
						Container='spnBaselineThreats' 
						Size='15' 
						MaxLength='50'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Grantcompletion'>
					<Control ID='ctlGrantcompletionThreats' 
						Type='cTextBox' 
						Container='spnGrantcompletionThreats' 
						Size='15' 
						MaxLength='50'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LongTerm'>
					<Control ID='ctlLongTermThreats' 
						Type='cTextBox' 
						Container='spnLongTermThreats' 
						Size='15' 
						MaxLength='50'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='YearLongTerm'>
					<Control ID='ctlYearLongTermThreats' 
						Type='cTextBox' 
						Container='spnYearLongTermThreats' 
						Size='15' 
						AllowNumbersOnly='True'
						MaxLength='4'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other'>
					<Control ID='ctlOtherThreats' 
						Type='cTextBox' 
						Container='spnOtherThreats' 
						Size='50' 
						MaxLength='100'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAddThreats' 
						Type='cButton' 
						Image='Add'						
						Container='spnAddThreats'>
							<Action
								PostBack='True'
								AutoSave='True'
								Object='DataPresenter'
								Method='AddLogicFrameworkIndicatorsThreats'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='OutcomesandIndicatorsEditor'/>
									<Argument Type='QueryString' TypeKey='LogicFrameworkIndicatorsID' PropertyKey='LogicFrameworkIndicatorsID'  />
									<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
									<Argument Type='DataObjectCollection' TypeKey='GranteeProjectLogicFramework' DataObjectPropertyKey='ProjectLogicFrameworkID' PropertyKey='ProjectLogicFrameworkID' Value=''/>								
									<Argument AttributeName='IndicatorID' Value='2' />											
									<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  />											
								</Parameters>	
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAddThreats1' 
						Type='cButton' 
						Image='Add'						
						Container='spnAddThreats1'>
							<Action
								PostBack='True'
								AutoSave='True'
								Object='DataPresenter'
								Method='AddLogicFrameworkIndicatorsThreats'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='OutcomesandIndicatorsEditor'/>
									<Argument Type='QueryString' TypeKey='LogicFrameworkIndicatorsID' PropertyKey='LogicFrameworkIndicatorsID'  />
									<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
									<Argument Type='DataObjectCollection' TypeKey='GranteeProjectLogicFramework' DataObjectPropertyKey='ProjectLogicFrameworkID' PropertyKey='ProjectLogicFrameworkID' Value=''/>								
									<Argument AttributeName='IndicatorID' Value='2' />											
									<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  />											
								</Parameters>	
							</Action>
					</Control>
				</DisplayProperty>				
		   </DisplayProperties>
		</DataObject>
		
		<DataObject Key='NFWFGranteeProjectLogicFrameworkIndicatorsList1' DataObjectDefinitionKey='GranteeProjectLogicFrameworkIndicators'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ProjectLogicFrameworkID' PropertyKey='ProjectLogicFrameworkID' Value='' Bool=''/>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' 	Bool='AND'/>
				<Argument Type='Data' TypeKey='IndicatorID' PropertyKey='IndicatorID' Value='2' Bool='AND' />
			</Filters>		
			<DisplayProperties>												
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataListThreats'
						Container='spnDataListThreats'
						Type='cDataListCtl'						
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='ID' ColumnHeader=' Threat/Opportunity ID' Width='3%'/>
						<DisplayProperty PropertyKey='NFWFIndicatorsTypeDesc' ColumnHeader='Indicator and Units of Measure' Width='35%'>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Baseline' ColumnHeader='Baseline' Width='12%'/>
						<DisplayProperty PropertyKey='Grantcompletion' ColumnHeader='Value at Grant Completion'  Width='13%'/>
						<DisplayProperty PropertyKey='LongTerm' ColumnHeader='Long-term Value'  Width='15%' />	
						<DisplayProperty PropertyKey='YearLongTerm' ColumnHeader='Year long-term value to be achieved'  Width='12%' />												
						<DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center' Width='15%'>
							<Control ID='btnEditOA1'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									AutoSave='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='OutcomesandIndicatorsEditor'/>
										<Argument Type='DataObject' TypeKey='LogicFrameworkIndicatorsID' AttributeName='LogicFrameworkIndicatorsID' BaseValue='LogicFrameworkIndicatorsID='/>
										<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' BaseValue='GranteeProjectID=' />
										<Argument Type='QueryString' TypeKey='ProjectLogicFrameworkID' PropertyKey='ProjectLogicFrameworkID' BaseValue='ProjectLogicFrameworkID=' />										
										<Argument Type='DataObject' TypeKey='IndicatorID' AttributeName='IndicatorID' BaseValue='IndicatorID='/>
										<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete1'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='LogicFrameworkIndicatorsID' AttributeName='LogicFrameworkIndicatorsID'/>
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
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'
						EnterKey='True'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>							
							        <Argument AttributeName='PageKey' Value='OutcomesandIndicatorsEditor'/>
									<Argument Type='' TypeKey='ProjectLogicFrameworkID' AttributeName='ProjectLogicFrameworkID' BaseValue='ProjectLogicFrameworkID='/>
									<Argument Type='DataObjectCollection' TypeKey='GranteeProjectLogicFramework' DataObjectPropertyKey='ProjectLogicFrameworkID' PropertyKey='ProjectLogicFrameworkID' BaseValue='ProjectLogicFrameworkID='/>
									<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  BaseValue='ReturnURL='/>
							</Parameters>							    					
						</Action>
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>
				 <DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Image='Save and Close'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='OutcomesandIndicators'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveBottom'
						Container='spnSaveBottom'
						Type='cButton'
						Image='Save'
						EnterKey='True'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>							
							        <Argument AttributeName='PageKey' Value='OutcomesandIndicatorsEditor'/>
									<Argument Type='' TypeKey='ProjectLogicFrameworkID' AttributeName='ProjectLogicFrameworkID' BaseValue='ProjectLogicFrameworkID='/>
									<Argument Type='DataObjectCollection' TypeKey='GranteeProjectLogicFramework' DataObjectPropertyKey='ProjectLogicFrameworkID' PropertyKey='ProjectLogicFrameworkID' BaseValue='ProjectLogicFrameworkID='/>
									<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  BaseValue='ReturnURL='/>
							</Parameters>							    					
						</Action>
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancelBottom'
						Container='spnCancelBottom'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>
				 <DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_ContinueBottom'
						Container='spnSave_and_ContinueBottom'
						Type='cButton'
						Image='Save and Close'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='OutcomesandIndicators'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>	
	</ModuleSection>
</span>
<!-- End Embedded XML -->