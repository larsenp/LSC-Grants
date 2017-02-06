<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

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
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscLegalProblemType' DataObjectPropertyKey='LscLegalProblemTypeID' PropertyKey='LscLegalProblemTypeID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscLegalProblemType' DataObjectPropertyKey='LscLegalProblemTypeID' PropertyKey='LscLegalProblemTypeID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CasesClosedLimitedSvc'>
					<Control ID='txtCasesClosedLimitedSvc'
						Type='cMoneyTextBox'
						Container='spnCasesClosedLimitedSvc'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The value for "Cases Closed after Limited Service" must be a whole number.'
						RegExErrorMessage='The value for "Cases Closed after Limited Service" must be a whole number.'
						MaxLength='8'
						Size='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CasesClosedExtendedSvc'>
					<Control ID='txtCasesClosedExtendedSvc'
						Type='cMoneyTextBox'
						Container='spnCasesClosedExtendedSvc'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The value for "Cases Closed after Extended Service" must be a whole number.'
						RegExErrorMessage='The value for "Cases Closed after Extended Service" must be a whole number.'
						MaxLength='8'
						Size='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientServicesTotals.CasesClosedTotal' Format='#,0'>
					<Control ID='spnCasesClosedTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CasesOpen'>
					<Control ID='txtCasesOpen'
						Type='cMoneyTextBox'
						Container='spnCasesOpen'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The value for "Cases Remaining Open at Year End" must be a whole number.'
						RegExErrorMessage='The value for "Cases Remaining Open at Year End" must be a whole number.'
						MaxLength='8'
						Size='10' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->