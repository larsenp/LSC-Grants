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
					<Control ID='txtCasesClosedLimitedSvc'
						Type='cTextBox'
						Container='spnCasesClosedLimitedSvc'
						MaxLength='6'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='The value for "Cases Closed after Limited Service" must be a whole number zero or greater with no commas.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CasesClosedExtendedSvc'>
					<Control ID='txtCasesClosedExtendedSvc'
						Type='cTextBox'
						Container='spnCasesClosedExtendedSvc'
						MaxLength='6'
						Size='10' >
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='The value for "Cases Closed after Extended Service" must be a whole number zero or greater with no commas.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientServicesTotals.CasesClosedTotal' Format='#,0'>
					<Control ID='spnCasesClosedTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CasesOpen'>
					<Control ID='txtCasesOpen'
						Type='cTextBox'
						Container='spnCasesOpen'
						MaxLength='6'
						Size='10' >
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='The value for "Cases Remaining Open at Year End" must be a whole number zero or greater with no commas.'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->