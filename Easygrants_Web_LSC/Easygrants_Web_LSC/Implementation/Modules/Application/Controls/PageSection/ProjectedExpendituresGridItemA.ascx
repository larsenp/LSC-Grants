<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<table width='100%' cellpadding='0' cellspacing='0'>
	<tr>
		<td width='10%'>&nbsp;</td>
		<td width='30%' style="font-weight:bold">
			<span runat='server' id='spnSortOrder' />.&nbsp;<span runat='server' id='spnDescription' /><%=kDenoteRequiredField %>
		</td>
		<td width='20%' align='center'>
			<span runat='server' id='spnAmount' />
		</td>
		<td width='20%' align='center'>
			<span runat='server' id='spnPercent' />
		</td>
		<td width='20%'>&nbsp;</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='LscExpenditureTypeA' Key='LscExpenditureTypeA' DataObjectDefinitionKey='LscExpenditureType' Updatable='False' CreateNew='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SortOrder'>
					<Control ID='spnSortOrder' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='spnDescription' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='LscExpenditureByTypeA' DataObjectDefinitionKey='LscExpenditureByType' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
				<Argument Type='DataObjectCollection' TypeKey='LscExpenditureTypeA' DataObjectPropertyKey='LscExpenditureTypeID' PropertyKey='LscExpenditureTypeID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscExpenditureTypeA' DataObjectPropertyKey='LscExpenditureTypeID' PropertyKey='LscExpenditureTypeID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Amount'>
					<Control ID='txtAmount'
						Type='cMoneyTextBox'
						Container='spnAmount'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The expenditure amount must be a whole number.'
						RegExErrorMessage='The expenditure amount must be a whole number.'
						MaxLength='10'
						Size='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscExpenditureByTypeSecAPercent.PercentByType' Format='#0'>
					<Control ID='spnPercent'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
