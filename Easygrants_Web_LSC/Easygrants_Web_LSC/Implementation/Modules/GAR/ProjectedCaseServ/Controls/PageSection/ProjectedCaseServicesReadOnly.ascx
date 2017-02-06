<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width='100%' cellpadding='5' cellspacing='0'>
	<tr>
		<td class='SeparatorHdg' colspan='5'>
			Detail
		</td>
	</tr>
	<tr class='MinorSeparatorHdg'>
		<td width='28%'>&nbsp;
			
	  </td>
		<td width='18%'>
			Cases Closed after Limited Service
		</td>
		<td width='18%'>
			Cases Closed after Extended Service
		</td>
		<td width='18%'>
			Total Projected Case Services</td>
		<td width='18%'>
			Cases Remaining Open on June 30
		</td>
	</tr>
	<tr>
		<td colspan='5'>
			<span runat='server' id='spnClientServicesList' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style="font-weight:bold;border-bottom-style:solid;border-bottom-width:1px">
			Total All Cases
		</td>
		<td style="font-weight:bold;border-bottom-style:solid;border-bottom-width:1px">
			<span runat='server' id='spnCasesClosedLimitedSvc' >&nbsp;</span>
		</td>
		<td style="font-weight:bold;border-bottom-style:solid;border-bottom-width:1px">
			<span runat='server' id='spnCasesClosedExtendedSvc' >&nbsp;</span>
		</td>
		<td style="font-weight:bold;border-bottom-style:solid;border-bottom-width:1px">
			<span runat='server' id='spnCasesClosedTotal' >&nbsp;</span>
		</td>
		<td style="font-weight:bold;border-bottom-style:solid;border-bottom-width:1px">
			<span runat='server' id='spnCasesOpen' >&nbsp;</span>
		</td>
	</tr>
	
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscLegalProblemType' DataObjectDefinitionKey='LscLegalProblemType' Updatable='True' CreateNew='False'>
			<Sort>
				<Argument PropertyKey='SortOrder'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlClientServicesList' 
						Type='cDataPresenterList'
						Container='spnClientServicesList'
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/GAR/ProjectedCaseServ/Controls/PageSection/ProjectedCaseServicesItemReadOnly.ascx'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='LscClientServicesWfTATotals' DataObjectDefinitionKey='LscClientServicesWfTATotals'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CasesClosedLimitedSvc' Format='#,0'>
					<Control ID='spnCasesClosedLimitedSvc'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CasesClosedExtendedSvc' Format='#,0'>
					<Control ID='spnCasesClosedExtendedSvc'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CasesClosedTotal' Format='#,0'>
					<Control ID='spnCasesClosedTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CasesOpen' Format='#,0'>
					<Control ID='spnCasesOpen'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
