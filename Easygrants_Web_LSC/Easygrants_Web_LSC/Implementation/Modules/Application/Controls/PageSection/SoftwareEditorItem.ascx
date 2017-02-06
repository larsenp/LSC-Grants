<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.PageSection.cSoftwareTypeEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width='100%'>
	<tr>
		<td width='27%'>
			<span id='spnInUse' runat='server' /> &nbsp;
			<span id='spnProductName' runat='server' />
		</td>
		<td width='18%'>
			<span id='spnVersion' runat='server' />
		</td>
		<td width='5%' />
		<td width='50%'>
			<span id='spnPercentStaff' runat='server' />
		</td>
	</tr>
</table>


<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='LscSoftwareProduct' Key='LscSoftwareProduct' DataObjectDefinitionKey='LscSoftwareProduct' Updatable='False' CreateNew='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='spnProductName' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='LscSoftware' DataObjectDefinitionKey='LscSoftware' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument Type='DataObjectCollection' TypeKey='LscSoftwareProduct' DataObjectPropertyKey='LscSoftwareProductID' PropertyKey='LscSoftwareProductID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Update='False' Create='True' />
				<Argument Type='DataObjectCollection' TypeKey='LscSoftwareProduct' DataObjectPropertyKey='LscSoftwareProductID' PropertyKey='LscSoftwareProductID' Update='False' Create='True' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='InUse'>
					<Control ID='chkInUse'
						Container='spnInUse'
						Type='cCheckBox' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Version'>
					<Control ID='txtVersion'
						Container='spnVersion'
						Type='cTextBox' />
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='PercentStaff'>
					<Control ID='txtPercentStaff'
						Type='cMoneyTextBox'
						Container='spnPercentStaff'  
						DecimalErrorMessage='Percentage Staff, where provided, must be a whole number between 0 and 100.'
						RegExErrorMessage='Percentage Staff, where provided, must be a whole number between 0 and 100.'
						MaxLength='10' >
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='100'
							ErrorMessage='Percentage Staff, where provided, must be a whole number between 0 and 100.' />
					</Control>
				</DisplayProperty>
				<!--
				<DisplayProperty PropertyKey='OtherAttyBylaw'>
					<Control ID='txtOtherAttyBylaw'
						Type='cMoneyTextBox'
						Container='spnOtherAttyBylaw'  
						DecimalErrorMessage='Form fields must be whole numbers.'
						RegExErrorMessage='Form fields must be whole numbers.'
						MaxLength='10'/>
				</DisplayProperty>
								
				<DisplayProperty PropertyKey='PercentStaff'>
					<Control ID='txtPercentStaff'
						Container='spnPercentStaff'
						Type='cTextBox' >
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='100'
							ErrorMessage='Percentage Staff, where provided, must be a whole number between 0 and 100.' />
					</Control>
				</DisplayProperty>
				-->
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
