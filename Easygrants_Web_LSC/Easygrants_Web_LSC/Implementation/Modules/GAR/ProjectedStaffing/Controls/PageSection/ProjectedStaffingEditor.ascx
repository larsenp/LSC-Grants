<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.GAR.ProjectedStaffing.PageSection.cProjectedStaffingEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div width='100%' class='SeparatorHdg'>
	Detail
</div>
<table width='800' cellpadding='5' cellspacing='0'>
	<tr>
		<td width='30'>&nbsp;</td>
		<td class='MinorSeparatorHdg'>&nbsp;
			
		</td>
		<td class='MinorSeparatorHdg'>
			Full-Time Staff
		</td>
		<td class='MinorSeparatorHdg'>
			Part-Time Staff
		</td>
		<td class='MinorSeparatorHdg'>
			Volunteer Staff
		</td>
		<td class='MinorSeparatorHdg'>
			Totals
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Job Classification</b>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Director
		</td>
		<td>
			<span runat='server' id='spnDirFT' />
		</td>
		<td>
			<span runat='server' id='spnDirPT' />
		</td>
		<td>
			<span runat='server' id='spnDirVlnt' />
		</td>
		<td>
			<span runat='server' id='spnDirTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Deputy Director
		</td>
		<td>
			<span runat='server' id='spnDepDirFT' />
		</td>
		<td>
			<span runat='server' id='spnDepDirPT' />
		</td>
		<td>
			<span runat='server' id='spnDepDirVlnt' />
		</td>
		<td>
			<span runat='server' id='spnDepDirTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Director of Litigation
		</td>
		<td>
			<span runat='server' id='spnDirLtgFT' />
		</td>
		<td>
			<span runat='server' id='spnDirLtgPT' />
		</td>
		<td>
			<span runat='server' id='spnDirLtgVlnt' />
		</td>
		<td>
			<span runat='server' id='spnDirLtgTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Managing Attorney
		</td>
		<td>
			<span runat='server' id='spnMngAttyFT' />
		</td>
		<td>
			<span runat='server' id='spnMngAttyPT' />
		</td>
		<td>
			<span runat='server' id='spnMngAttyVlnt' />
		</td>
		<td>
			<span runat='server' id='spnMngAttyTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Supervising Attorney
		</td>
		<td>
			<span runat='server' id='spnSupvAttyFT' />
		</td>
		<td>
			<span runat='server' id='spnSupvAttyPT' />
		</td>
		<td>
			<span runat='server' id='spnSupvAttyVlnt' />
		</td>
		<td>
			<span runat='server' id='spnSupvAttyTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Staff Attorney
		</td>
		<td>
			<span runat='server' id='spnStaffAttyFT' />
		</td>
		<td>
			<span runat='server' id='spnStaffAttyPT' />
		</td>
		<td>
			<span runat='server' id='spnStaffAttyVlnt' />
		</td>
		<td>
			<span runat='server' id='spnStaffAttyTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Paralegal
		</td>
		<td>
			<span runat='server' id='spnParalegalFT' />
		</td>
		<td>
			<span runat='server' id='spnParalegalPT' />
		</td>
		<td>
			<span runat='server' id='spnParalegalVlnt' />
		</td>
		<td>
			<span runat='server' id='spnParalegalTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			PAI Coordinator
		</td>
		<td>
			<span runat='server' id='spnPaiCoordFT' />
		</td>
		<td>
			<span runat='server' id='spnPaiCoordPT' />
		</td>
		<td>
			<span runat='server' id='spnPaiCoordVlnt' />
		</td>
		<td>
			<span runat='server' id='spnPaiCoordTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Development Director
		</td>
		<td>
			<span runat='server' id='spnDevDirFT' />
		</td>
		<td>
			<span runat='server' id='spnDevDirPT' />
		</td>
		<td>
			<span runat='server' id='spnDevDirVlnt' />
		</td>
		<td>
			<span runat='server' id='spnDevDirTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			IT Staff
		</td>
		<td>
			<span runat='server' id='spnITFT' />
		</td>
		<td>
			<span runat='server' id='spnITPT' />
		</td>
		<td>
			<span runat='server' id='spnITVlnt' />
		</td>
		<td>
			<span runat='server' id='spnITTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Training Responsible Person
		</td>
		<td>
			<span runat='server' id='spnTrngCoordFT' />
		</td>
		<td>
			<span runat='server' id='spnTrngCoordPT' />
		</td>
		<td>
			<span runat='server' id='spnTrngCoordVlnt' />
		</td>
		<td>
			<span runat='server' id='spnTrngCoordTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Financial Professional
		</td>
		<td>
			<span runat='server' id='spnFinProfFT' />
		</td>
		<td>
			<span runat='server' id='spnFinProfPT' />
		</td>	
		<td>
			<span runat='server' id='spnFinProfVlnt' />
		</td>
		<td>
			<span runat='server' id='spnFinProfTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Management Professional
		</td>
		<td>
			<span runat='server' id='spnMngProfFT' />
		</td>
		<td>
			<span runat='server' id='spnMngProfPT' />
		</td>
		<td>
			<span runat='server' id='spnMngProfVlnt' />
		</td>
		<td>
			<span runat='server' id='spnMngProfTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Grants Manager
		</td>
		<td>
			<span runat='server' id='spnGrantsMgrFT' />
		</td>
		<td>
			<span runat='server' id='spnGrantsMgrPT' />
		</td>
		<td>
			<span runat='server' id='spnGrantsMgrVlnt' />
		</td>
		<td>
			<span runat='server' id='spnGrantsMgrTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Law Clerk
		</td>
		<td>
			<span runat='server' id='spnLawClerkFT' />
		</td>
		<td>
			<span runat='server' id='spnLawClerkPT' />
		</td>
		<td>
			<span runat='server' id='spnLawClerkVlnt' />
		</td>
		<td>
			<span runat='server' id='spnLawClerkTotal' />
		</td>
	</tr>
	<%--<tr>
		<td>&nbsp;</td>
		<td>
			Senior Aide
		</td>
		<td>
			<span runat='server' id='spnSrAideFT' />
		</td>
		<td>
			<span runat='server' id='spnSrAidePT' />
		</td>
		<td>
			<span runat='server' id='spnSrAideVlnt' />
		</td>
		<td>
			<span runat='server' id='spnSrAideTotal' />
		</td>
	</tr>--%>
	<tr>
		<td>&nbsp;</td>
		<td>
			Administrative Assistant
		</td>
		<td>
			<span runat='server' id='spnAdmAsstFT' />
		</td>
		<td>
			<span runat='server' id='spnAdmAsstPT' />
		</td>
		<td>
			<span runat='server' id='spnAdmAsstVlnt' />
		</td>
		<td>
			<span runat='server' id='spnAdmAsstTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Secretary/Clerical Person
		</td>
		<td>
			<span runat='server' id='spnSecClerFT' />
		</td>
		<td>
			<span runat='server' id='spnSecClerPT' />
		</td>
		<td>
			<span runat='server' id='spnSecClerVlnt' />
		</td>
		<td>
			<span runat='server' id='spnSecClerTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Other Staff
		</td>
		<td>
			<span runat='server' id='spnOtherFT' />
		</td>
		<td>
			<span runat='server' id='spnOtherPT' />
		</td>
		<td>
			<span runat='server' id='spnOtherVlnt' />
		</td>
		<td>
			<span runat='server' id='spnOtherTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Total</b>
		</td>
		<td>
			<b><span runat='server' id='spnFTTotal' /></b>
		</td>
		<td>
			<b><span runat='server' id='spnPTTotal' /></b>
		</td>
		<td>
			<b><span runat='server' id='spnVlntTotal' /></b>
		</td>
		<td>
			<b><span runat='server' id='spnGrandTotal' /></b>
		</td>
	</tr>
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>

		<DataObject Key='LscProjectedStaff' DataObjectDefinitionKey='LscProjectedStaff' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.TimePeriodID' PropertyKey='TimePeriodID'/>
				<Argument Type='DataPresenter' TypeKey='OffTypeID' PropertyKey='OffTypeID' />
				<Argument PropertyKey='LscGarFormGroupID' Value="3"/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.TimePeriodID' PropertyKey='TimePeriodID'/>
				<Argument Type='DataPresenter' TypeKey='OffTypeID' PropertyKey='OffTypeID' />
				<Argument PropertyKey='LscGarFormGroupID' Value="3"/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DirFT'>
					<Control ID='txtDirFT'
						Type='cMoneyTextBox'
						Container='spnDirFT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DirPT'>
					<Control ID='txtDirPT'
						Type='cMoneyTextBox'
						Container='spnDirPT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DirVlnt'>
					<Control ID='txtDirVlnt'
						Type='cMoneyTextBox'
						Container='spnDirVlnt'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.DirTotal'>
					<Control ID='spnDirTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='DepDirFT'>
					<Control ID='txtDepDirFT'
						Type='cMoneyTextBox'
						Container='spnDepDirFT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DepDirPT'>
					<Control ID='txtDepDirPT'
						Type='cMoneyTextBox'
						Container='spnDepDirPT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DepDirVlnt'>
					<Control ID='txtDepDirVlnt'
						Type='cMoneyTextBox'
						Container='spnDepDirVlnt'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.DepDirTotal'>
					<Control ID='spnDepDirTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='DirLtgFT'>
					<Control ID='txtDirLtgFT'
						Type='cMoneyTextBox'
						Container='spnDirLtgFT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DirLtgPT'>
					<Control ID='txtDirLtgPT'
						Type='cMoneyTextBox'
						Container='spnDirLtgPT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DirLtgVlnt'>
					<Control ID='txtDirLtgVlnt'
						Type='cMoneyTextBox'
						Container='spnDirLtgVlnt'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.DirLtgTotal'>
					<Control ID='spnDirLtgTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='MngAttyFT'>
					<Control ID='txtMngAttyFT'
						Type='cMoneyTextBox'
						Container='spnMngAttyFT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MngAttyPT'>
					<Control ID='txtMngAttyPT'
						Type='cMoneyTextBox'
						Container='spnMngAttyPT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MngAttyVlnt'>
					<Control ID='txtMngAttyVlnt'
						Type='cMoneyTextBox'
						Container='spnMngAttyVlnt'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.MngAttyTotal'>
					<Control ID='spnMngAttyTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='SupvAttyFT'>
					<Control ID='txtSupvAttyFT'
						Type='cMoneyTextBox'
						Container='spnSupvAttyFT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SupvAttyPT'>
					<Control ID='txtSupvAttyPT'
						Type='cMoneyTextBox'
						Container='spnSupvAttyPT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SupvAttyVlnt'>
					<Control ID='txtSupvAttyVlnt'
						Type='cMoneyTextBox'
						Container='spnSupvAttyVlnt'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.SupvAttyTotal'>
					<Control ID='spnSupvAttyTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='StaffAttyFT'>
					<Control ID='txtStaffAttyFT'
						Type='cMoneyTextBox'
						Container='spnStaffAttyFT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StaffAttyPT'>
					<Control ID='txtStaffAttyPT'
						Type='cMoneyTextBox'
						Container='spnStaffAttyPT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StaffAttyVlnt'>
					<Control ID='txtStaffAttyVlnt'
						Type='cMoneyTextBox'
						Container='spnStaffAttyVlnt'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.StaffAttyTotal'>
					<Control ID='spnStaffAttyTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='ParalegalFT'>
					<Control ID='txtParalegalFT'
						Type='cMoneyTextBox'
						Container='spnParalegalFT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ParalegalPT'>
					<Control ID='txtParalegalPT'
						Type='cMoneyTextBox'
						Container='spnParalegalPT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ParalegalVlnt'>
					<Control ID='txtParalegalVlnt'
						Type='cMoneyTextBox'
						Container='spnParalegalVlnt'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.ParalegalTotal'>
					<Control ID='spnParalegalTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='PaiCoordFT'>
					<Control ID='txtPaiCoordFT'
						Type='cMoneyTextBox'
						Container='spnPaiCoordFT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PaiCoordPT'>
					<Control ID='txtPaiCoordPT'
						Type='cMoneyTextBox'
						Container='spnPaiCoordPT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PaiCoordVlnt'>
					<Control ID='txtPaiCoordVlnt'
						Type='cMoneyTextBox'
						Container='spnPaiCoordVlnt'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.PaiCoordTotal'>
					<Control ID='spnPaiCoordTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='DevDirFT'>
					<Control ID='txtDevDirFT'
						Type='cMoneyTextBox'
						Container='spnDevDirFT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DevDirPT'>
					<Control ID='txtDevDirPT'
						Type='cMoneyTextBox'
						Container='spnDevDirPT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DevDirVlnt'>
					<Control ID='txtDevDirVlnt'
						Type='cMoneyTextBox'
						Container='spnDevDirVlnt'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.DevDirTotal'>
					<Control ID='spnDevDirTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='ITFT'>
					<Control ID='txtITFT'
						Type='cMoneyTextBox'
						Container='spnITFT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ITPT'>
					<Control ID='txtITPT'
						Type='cMoneyTextBox'
						Container='spnITPT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ITVlnt'>
					<Control ID='txtITVlnt'
						Type='cMoneyTextBox'
						Container='spnITVlnt'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.ITTotal'>
					<Control ID='spnITTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='TrngCoordFT'>
					<Control ID='txtTrngCoordFT'
						Type='cMoneyTextBox'
						Container='spnTrngCoordFT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TrngCoordPT'>
					<Control ID='txtTrngCoordPT'
						Type='cMoneyTextBox'
						Container='spnTrngCoordPT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TrngCoordVlnt'>
					<Control ID='txtTrngCoordVlnt'
						Type='cMoneyTextBox'
						Container='spnTrngCoordVlnt'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.TrngCoordTotal'>
					<Control ID='spnTrngCoordTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='FinProfFT'>
					<Control ID='txtFinProfFT'
						Type='cMoneyTextBox'
						Container='spnFinProfFT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinProfPT'>
					<Control ID='txtFinProfPT'
						Type='cMoneyTextBox'
						Container='spnFinProfPT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinProfVlnt'>
					<Control ID='txtFinProfVlnt'
						Type='cMoneyTextBox'
						Container='spnFinProfVlnt'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.FinProfTotal'>
					<Control ID='spnFinProfTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='MngProfFT'>
					<Control ID='txtMngProfFT'
						Type='cMoneyTextBox'
						Container='spnMngProfFT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MngProfPT'>
					<Control ID='txtMngProfPT'
						Type='cMoneyTextBox'
						Container='spnMngProfPT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MngProfVlnt'>
					<Control ID='txtMngProfVlnt'
						Type='cMoneyTextBox'
						Container='spnMngProfVlnt'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.MngProfTotal'>
					<Control ID='spnMngProfTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='GrantsMgrFT'>
					<Control ID='txtGrantsMgrFT'
						Type='cMoneyTextBox'
						Container='spnGrantsMgrFT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantsMgrPT'>
					<Control ID='txtGrantsMgrPT'
						Type='cMoneyTextBox'
						Container='spnGrantsMgrPT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantsMgrVlnt'>
					<Control ID='txtGrantsMgrVlnt'
						Type='cMoneyTextBox'
						Container='spnGrantsMgrVlnt'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.GrantsMgrTotal'>
					<Control ID='spnGrantsMgrTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='LawClerkFT'>
					<Control ID='txtLawClerkFT'
						Type='cMoneyTextBox'
						Container='spnLawClerkFT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LawClerkPT'>
					<Control ID='txtLawClerkPT'
						Type='cMoneyTextBox'
						Container='spnLawClerkPT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LawClerkVlnt'>
					<Control ID='txtLawClerkVlnt'
						Type='cMoneyTextBox'
						Container='spnLawClerkVlnt'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.LawClerkTotal'>
					<Control ID='spnLawClerkTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<%--<DisplayProperty PropertyKey='SrAideFT'>
					<Control ID='txtSrAideFT'
						Type='cMoneyTextBox'
						Container='spnSrAideFT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SrAidePT'>
					<Control ID='txtSrAidePT'
						Type='cMoneyTextBox'
						Container='spnSrAidePT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SrAideVlnt'>
					<Control ID='txtSrAideVlnt'
						Type='cMoneyTextBox'
						Container='spnSrAideVlnt'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.SrAideTotal'>
					<Control ID='spnSrAideTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>--%>

				<DisplayProperty PropertyKey='AdmAsstFT'>
					<Control ID='txtAdmAsstFT'
						Type='cMoneyTextBox'
						Container='spnAdmAsstFT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AdmAsstPT'>
					<Control ID='txtAdmAsstPT'
						Type='cMoneyTextBox'
						Container='spnAdmAsstPT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AdmAsstVlnt'>
					<Control ID='txtAdmAsstVlnt'
						Type='cMoneyTextBox'
						Container='spnAdmAsstVlnt'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.AdmAsstTotal'>
					<Control ID='spnAdmAsstTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='SecClerFT'>
					<Control ID='txtSecClerFT'
						Type='cMoneyTextBox'
						Container='spnSecClerFT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SecClerPT'>
					<Control ID='txtSecClerPT'
						Type='cMoneyTextBox'
						Container='spnSecClerPT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SecClerVlnt'>
					<Control ID='txtSecClerVlnt'
						Type='cMoneyTextBox'
						Container='spnSecClerVlnt'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.SecClerTotal'>
					<Control ID='spnSecClerTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='OtherFT'>
					<Control ID='txtOtherFT'
						Type='cMoneyTextBox'
						Container='spnOtherFT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherPT'>
					<Control ID='txtOtherPT'
						Type='cMoneyTextBox'
						Container='spnOtherPT'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherVlnt'>
					<Control ID='txtOtherVlnt'
						Type='cMoneyTextBox'
						Container='spnOtherVlnt'
						MaxInputDecimalPlaces='1'
						DecimalErrorMessage='Entries may contain no more than one decimal place.'
						RegExErrorMessage='All entries must be numeric and contain no more than one decimal place.'
						MaxLength='6'
						Size='6'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.OtherTotal'>
					<Control ID='spnOtherTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>


				<DisplayProperty PropertyKey='LscProjectedStaffTotals.FTTotal'>
					<Control ID='spnFTTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.PTTotal'>
					<Control ID='spnPTTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.VlntTotal'>
					<Control ID='spnVlntTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.GrandTotal'>
					<Control ID='spnGrandTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
