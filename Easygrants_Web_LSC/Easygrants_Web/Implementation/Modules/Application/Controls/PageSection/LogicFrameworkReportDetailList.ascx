<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.PageSection.cLogicFrameworkReportDetailList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<span id='spnBudgetCategoryID' runat='server'  />

<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server' ID="Table1" >
	<tr>
		<td colspan='2'><span id="spnRowNumber" runat='server'/>.&nbsp;<span id="spnLongTermConservationOutcome" runat='server'/></td>
	</tr>
	<tr>
		<td width='2%'>&nbsp;</td>
		<td>
			<table border='1' BorderColor='black'  width='80%' cellspacing='0' cellpadding='0' runat='server' ID="TblOutcomes" >
				<tr>
					<td align='center'  width='20%'><b>Outcome Indicators</b></td>
					<td align='center'  width='20%' ><b>Baseline</b></td>
					<td align='center'  width='20%'><b>Value at Grant Completion</b></td>
					<td align='center'  width='20%'><b>Long-term Value</b></td>
					<td align='center'  width='20%'><b>Year Long-term Value to be Achieved</b></td>
				</tr>
			</Table>
		</td>
	</tr>
	<tr>
		<td width='2%'>&nbsp;</td>
		<td><b>Major Threats/Opportunities</b></td>
	</tr>
	<tr>
		<td width='2%'>&nbsp;</td>
		<td>&nbsp;&nbsp;&nbsp;<span id="spnThreatsAndOpportunities" runat='server'/></td>
	</tr>
	<tr>
		<td width='2%'>&nbsp;</td>
		<td>
			<table border='1' BorderColor='black'  width='100%' cellspacing='0' cellpadding='0' runat='server' ID="TblThreats" >
				<tr>
					<td align='center' width='16%'><b>Indicator ID</b></td>
					<td align='center' width='16%'><b>Outcome Indicators</b></td>
					<td align='center' width='16%'><b>Baseline</b></td>
					<td align='center' width='16%'><b>Value at Grant Completion</b></td>
					<td align='center' width='16%'><b>Long-term Value</b></td>
					<td align='center'><b>Year Long-term Value to be Achieved</b></td>
				</tr>
			</Table>
		</td>
	</tr>
	<tr>
		<td width='2%'>&nbsp;</td>
		<td><b>Primary Activities</b></td>
	</tr>
	<tr>
		<td width='2%'>&nbsp;</td>
		<td><span runat='server' id='spnProjectActivities'></span></td>
	</tr>
	
</table>
<br>




<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
<!-- End Embedded XML -->
	<ModuleSection>
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='GranteeProjectLogicFramework' Key='GranteeProjectLogicFramework'>		
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlRowNumber'
						Container='spnRowNumber'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='LongTermConservationOutcome'>
					<Control ID='ctlLongTermConservationOutcome'
						Container='spnLongTermConservationOutcome'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='ThreatsAndOpportunities'>
					<Control ID='ctlThreatsAndOpportunities'
						Container='spnThreatsAndOpportunities'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProjectActivities'>
					<Control ID='ctlProjectActivities'
						Container='spnProjectActivities'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='GranteeProjectLogicFrameworkIndicators' DataObjectDefinitionKey='GranteeProjectLogicFrameworkIndicators'>
			<Filters>					
				<Argument Type='DataObjectCollection' TypeKey='GranteeProjectLogicFramework' DataObjectPropertyKey='ProjectLogicFrameworkID' PropertyKey='ProjectLogicFrameworkID' />
				<Argument Type='Data' TypeKey='IndicatorID' PropertyKey='IndicatorID' Value='1'/>								
			</Filters>			
		</DataObject>
		
		<DataObject Key='NFWFGranteeProjectLogicFrameworkIndicatorsThreats' DataObjectDefinitionKey='GranteeProjectLogicFrameworkIndicators'>
			<Filters>					
				<Argument Type='DataObjectCollection' TypeKey='GranteeProjectLogicFramework' DataObjectPropertyKey='ProjectLogicFrameworkID' PropertyKey='ProjectLogicFrameworkID' />
				<Argument Type='Data' TypeKey='IndicatorID' PropertyKey='IndicatorID' Value='2'/>								
			</Filters>				
		</DataObject>	
	</ModuleSection>
</span>


