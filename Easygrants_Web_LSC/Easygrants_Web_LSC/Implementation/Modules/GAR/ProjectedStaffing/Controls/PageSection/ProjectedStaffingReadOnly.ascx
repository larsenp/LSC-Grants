<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.GAR.ProjectedStaffing.PageSection.cProjectedStaffingEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div width='100%' class='SeparatorHdg'>
	Detail
</div>
<table width='800' cellpadding='5' cellspacing='0'>
	<tr>
		<td width='30'>&nbsp;</td>
		<td class='MinorSeparatorHdg'>
			&nbsp;
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

		<DataObject Key='LscProjectedStaff' DataObjectDefinitionKey='LscProjectedStaff' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.TimePeriodID' PropertyKey='TimePeriodID'/>
				<Argument Type='DataPresenter' TypeKey='OffTypeID' PropertyKey='OffTypeID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DirFT'>
					<Control ID='spnDirFT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DirPT'>
					<Control ID='spnDirPT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DirVlnt'>
					<Control ID='spnDirVlnt'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.DirTotal'>
					<Control ID='spnDirTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='DepDirFT'>
					<Control ID='spnDepDirFT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DepDirPT'>
					<Control ID='spnDepDirPT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DepDirVlnt'>
					<Control ID='spnDepDirVlnt'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.DepDirTotal'>
					<Control ID='spnDepDirTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='DirLtgFT'>
					<Control ID='spnDirLtgFT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DirLtgPT'>
					<Control ID='spnDirLtgPT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DirLtgVlnt'>
					<Control ID='spnDirLtgVlnt'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.DirLtgTotal'>
					<Control ID='spnDirLtgTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='MngAttyFT'>
					<Control ID='spnMngAttyFT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MngAttyPT'>
					<Control ID='spnMngAttyPT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MngAttyVlnt'>
					<Control ID='spnMngAttyVlnt'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.MngAttyTotal'>
					<Control ID='spnMngAttyTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='SupvAttyFT'>
					<Control ID='spnSupvAttyFT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SupvAttyPT'>
					<Control ID='spnSupvAttyPT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SupvAttyVlnt'>
					<Control ID='spnSupvAttyVlnt'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.SupvAttyTotal'>
					<Control ID='spnSupvAttyTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='StaffAttyFT'>
					<Control ID='spnStaffAttyFT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StaffAttyPT'>
					<Control ID='spnStaffAttyPT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StaffAttyVlnt'>
					<Control ID='spnStaffAttyVlnt'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.StaffAttyTotal'>
					<Control ID='spnStaffAttyTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='ParalegalFT'>
					<Control ID='spnParalegalFT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ParalegalPT'>
					<Control ID='spnParalegalPT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ParalegalVlnt'>
					<Control ID='spnParalegalVlnt'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.ParalegalTotal'>
					<Control ID='spnParalegalTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='PaiCoordFT'>
					<Control ID='spnPaiCoordFT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PaiCoordPT'>
					<Control ID='spnPaiCoordPT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PaiCoordVlnt'>
					<Control ID='spnPaiCoordVlnt'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.PaiCoordTotal'>
					<Control ID='spnPaiCoordTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='ITFT'>
					<Control ID='spnITFT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ITPT'>
					<Control ID='spnITPT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ITVlnt'>
					<Control ID='spnITVlnt'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.ITTotal'>
					<Control ID='spnITTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='TrngCoordFT'>
					<Control ID='spnTrngCoordFT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TrngCoordPT'>
					<Control ID='spnTrngCoordPT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TrngCoordVlnt'>
					<Control ID='spnTrngCoordVlnt'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.TrngCoordTotal'>
					<Control ID='spnTrngCoordTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='FinProfFT'>
					<Control ID='spnFinProfFT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinProfPT'>
					<Control ID='spnFinProfPT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinProfVlnt'>
					<Control ID='spnFinProfVlnt'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.FinProfTotal'>
					<Control ID='spnFinProfTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='MngProfFT'>
					<Control ID='spnMngProfFT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MngProfPT'>
					<Control ID='spnMngProfPT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MngProfVlnt'>
					<Control ID='spnMngProfVlnt'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.MngProfTotal'>
					<Control ID='spnMngProfTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='LawClerkFT'>
					<Control ID='spnLawClerkFT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LawClerkPT'>
					<Control ID='spnLawClerkPT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LawClerkVlnt'>
					<Control ID='spnLawClerkVlnt'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.LawClerkTotal'>
					<Control ID='spnLawClerkTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

			<%--	<DisplayProperty PropertyKey='SrAideFT'>
					<Control ID='spnSrAideFT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SrAidePT'>
					<Control ID='spnSrAidePT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SrAideVlnt'>
					<Control ID='spnSrAideVlnt'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.SrAideTotal'>
					<Control ID='spnSrAideTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>--%>

				<DisplayProperty PropertyKey='AdmAsstFT'>
					<Control ID='spnAdmAsstFT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AdmAsstPT'>
					<Control ID='spnAdmAsstPT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AdmAsstVlnt'>
					<Control ID='spnAdmAsstVlnt'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.AdmAsstTotal'>
					<Control ID='spnAdmAsstTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='SecClerFT'>
					<Control ID='spnSecClerFT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SecClerPT'>
					<Control ID='spnSecClerPT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SecClerVlnt'>
					<Control ID='spnSecClerVlnt'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscProjectedStaffTotals.SecClerTotal'>
					<Control ID='spnSecClerTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='OtherFT'>
					<Control ID='spnOtherFT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherPT'>
					<Control ID='spnOtherPT'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherVlnt'>
					<Control ID='spnOtherVlnt'
						Type='HtmlGenericControl'/>
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
