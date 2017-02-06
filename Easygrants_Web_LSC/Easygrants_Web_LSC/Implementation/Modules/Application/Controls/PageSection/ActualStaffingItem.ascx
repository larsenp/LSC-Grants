<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width='100%'>
	<tr>
		<td width='32%'>
			<span runat='server' id='spnStaffCategory' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='16%'>
			<span runat='server' id='spnSupervisingAttys' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='16%'>
			<span runat='server' id='spnOtherAttys' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='16%'>
			<span runat='server' id='spnParalegals' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='16%'>
			<span runat='server' id='spnOtherStaff' />
		</td>
	</tr>
</table>


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='LscStaffCategory' Key='LscStaffCategory' DataObjectDefinitionKey='LscStaffCategory' Updatable='False' CreateNew='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='spnStaffCategory' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='LscActualStaffing' DataObjectDefinitionKey='LscActualStaffing' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscStaffCategory' DataObjectPropertyKey='LscStaffCategoryID' PropertyKey='LscStaffCategoryID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscStaffCategory' DataObjectPropertyKey='LscStaffCategoryID' PropertyKey='LscStaffCategoryID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SupervisingAttys'>
					<Control ID='txtSupervisingAttys'
						Type='cMoneyTextBox'
						Container='spnSupervisingAttys'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The value for "Supervising Attorneys" must be a whole number.'
						RegExErrorMessage='The value for "Supervising Attorneys" must be a whole number.'
						MaxLength='6'
						Size='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherAttys'>
					<Control ID='txtOtherAttys'
						Type='cMoneyTextBox'
						Container='spnOtherAttys'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The value for "Other Attorneys" must be a whole number.'
						RegExErrorMessage='The value for "Other Attorneys" must be a whole number.'
						MaxLength='6'
						Size='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Paralegals'>
					<Control ID='txtParalegals'
						Type='cMoneyTextBox'
						Container='spnParalegals'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The value for "Paralegals" must be a whole number.'
						RegExErrorMessage='The value for "Paralegals" must be a whole number.'
						MaxLength='6'
						Size='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherStaff'>
					<Control ID='txtOtherStaff'
						Type='cMoneyTextBox'
						Container='spnOtherStaff'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The value for "Other Staff" must be a whole number.'
						RegExErrorMessage='The value for "Other Staff" must be a whole number.'
						MaxLength='6'
						Size='10' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
