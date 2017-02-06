<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width='100%' cellpadding='0' cellspacing='0'>
	<tr>
		<td width='10%'>&nbsp;</td>
		<td align='center' width='30%' class='MinorSeparatorHdg'>
			<span runat='server' id='spnAbbrA' style='text-decoration:underline' /><br />
			<span runat='server' id='spnDescriptionA'/>
		</td>
		<td align='center' width='20%' class='MinorSeparatorHdg'>
			<b>Expenditures ($)</b>
		</td>
		<td align='center' width='20%' class='MinorSeparatorHdg'>
			<b>% of Total</b>
		</td>
		<td width='20%'>&nbsp;</td>
	</tr>
	
</table>
<span runat='server' id='spnExpendituresA' /><br />
<table width='100%' cellpadding='0' cellspacing='0'>
	<tr>
		<td width='10%'>&nbsp;</td>
		<td align='left' width='30%' style='border-bottom-style:solid;border-bottom-width:1px'>
			<b>4. Total</b><br />
			<i>(Total should equal total LSC expenses from Form D-12)</i>
		</td>
		<td align='center' width='20%' style='border-bottom-style:solid;border-bottom-width:1px;font-weight:bold'>
			<span runat='server' id='spnTotalA' />
		</td>
		<td align='center' width='20%' style='border-bottom-style:solid;border-bottom-width:1px;font-weight:bold'>
			<span runat='server' id='spnPercentOfItem' />
		</td>
		<td width='20%'>&nbsp;</td>
	</tr>
</table>
<br /><br />

<table width='100%' cellpadding='0' cellspacing='0'>
	<tr>
		<td width='10%'>&nbsp;</td>
		<td align='center' width='30%' class='MinorSeparatorHdg'>
			<span runat='server' id='spnAbbrB' style='text-decoration:underline' /><br />
			<span runat='server' id='spnDescriptionB'/>
		</td>
		<td align='center' width='20%' class='MinorSeparatorHdg'>
			<b>Expenditures ($)</b>
		</td>
		<td align='center' width='20%' class='MinorSeparatorHdg'>
			<b>% of Total</b>
		</td>
		<td width='20%'>&nbsp;</td>
	</tr>
	
</table>
<span runat='server' id='spnExpendituresB' />
<table width='100%' cellpadding='0' cellspacing='0'>
	<tr>
		<td width='10%'>&nbsp;</td>
		<td align='left' width='30%' style='border-bottom-style:solid;border-bottom-width:1px'>
			<b>11. Total Case Funding</b><br />
			<i>(The Total Case Funding must equal the amount for Cases only, shown in Section A, Row 1, Column 1)</i>
		</td>
		<td align='center' width='20%' style='border-bottom-style:solid;border-bottom-width:1px;font-weight:bold'>
			<span runat='server' id='spnTotalB' />
		</td>
		<td align='center' width='20%' style='border-bottom-style:solid;border-bottom-width:1px;font-weight:bold'>
			<span runat='server' id='spnPercentOfCases' />
		</td>
		<td width='20%'>&nbsp;</td>
	</tr>
</table>
<br /><br />
<table width='100%'>
	<tr>
		<td align='center'>
			<span runat='server' id='spnSave_and_Calculate'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnContinue' />
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscExpenditureTypeA' DataObjectDefinitionKey='LscExpenditureType' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument PropertyKey='LscExpenditureSectionID' Value='1' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscExpenditureSection.Abbr'>
					<Control ID='spnAbbrA'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscExpenditureSection.Description'>
					<Control ID='spnDescriptionA'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlExpendituresA'
						Type='cDataPresenterList'
						Container='spnExpendituresA'
						DataPresenterID='DPL_A' 
						DataPresenterURL='Implementation/Modules/Application/Controls/PageSection/ProjectedExpendituresGridItemA.ascx'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscExpenditureByTypeSecATotal' DataObjectDefinitionKey='LscExpenditureByTypeSecATotal' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ExpenditureTypeTotal'>
					<Control ID='spnTotalA'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PercentOfItem' Format='#0'>
					<Control ID='spnPercentOfItem'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscExpenditureTypeB' DataObjectDefinitionKey='LscExpenditureType' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument PropertyKey='LscExpenditureSectionID' Value='2' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscExpenditureSection.Abbr'>
					<Control ID='spnAbbrB'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscExpenditureSection.Description'>
					<Control ID='spnDescriptionB'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlExpendituresB'
						Type='cDataPresenterList'
						Container='spnExpendituresB'
						DataPresenterID='DPL_B' 
						DataPresenterURL='Implementation/Modules/Application/Controls/PageSection/ProjectedExpendituresGridItemB.ascx'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscExpenditureByTypeSecBTotal' DataObjectDefinitionKey='LscExpenditureByTypeSecBTotal' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='AmountByType'>
					<Control ID='spnTotalB'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PercentOfCases' Format='#0'>
					<Control ID='spnPercentOfCases'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<!--
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Image='Save'>
						<Action PostBack='True'
							AutoSave='True' />	
					</Control>
				</DisplayProperty>
				-->
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Calculate'
						Container='spnSave_and_Calculate'
						Caption='Save and Calculate'
						Type='cButton'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Image='Continue'>
						<Action PostBack='True'
							AutoSave='True' 
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Technology' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

<!-- End Embedded XML -->
