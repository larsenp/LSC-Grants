<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<table width='100%' border='0'>
	<tr>
		<td width='28%'>
			<span runat='server' id='spnLegalProblemType' />
		</td>
		<td width='18%'>
			<span runat='server' id='spnCasesClosedLimitedSvc' />
		</td>
		<td width='18%'>
			<span runat='server' id='spnCasesClosedExtendedSvc' />
		</td>
		<td width='18%'>
			<span runat='server' id='spnCasesClosedTotal' />
		</td>
		<td width='18%'>
			<span runat='server' id='spnCasesOpen' />
		</td>
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='LscLegalProblemType' Key='LscLegalProblemType' DataObjectDefinitionKey='LscLegalProblemType' Updatable='False' CreateNew='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='spnLegalProblemType' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='LscClientServices' DataObjectDefinitionKey='LscClientServices' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscLegalProblemType' DataObjectPropertyKey='LscLegalProblemTypeID' PropertyKey='LscLegalProblemTypeID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscLegalProblemType' DataObjectPropertyKey='LscLegalProblemTypeID' PropertyKey='LscLegalProblemTypeID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CasesClosedLimitedSvc'>
					<Control ID='spnCasesClosedLimitedSvc'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CasesClosedExtendedSvc'>
					<Control ID='spnCasesClosedExtendedSvc'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientServicesTotals.CasesClosedTotal' Format='#,0'>
					<Control ID='spnCasesClosedTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CasesOpen'>
					<Control ID='spnCasesOpen'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->