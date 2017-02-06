<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cPercentAreas_List" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

	
<!-- Page Content - Controls -->
<table runat='server' WIDTH='100%' border='0' cellspacing='0' cellpadding='0'>	
	<tr>		
		<td id='tdPercentAreas' runat='server' width='40%'><span id='spnPercentAreas' runat='server'/></td><td><span id='spnPercentage' runat='server'/>&nbsp;%</td>
	</tr>
</table>


<!-- END USER MODIFIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	
					
		<DataObject DataObjectSource='DataPresenterList' 
			DataObjectSourceKey='PercentAreas'
			Key='PercentAreas'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PercentAreasDesc'>
					<Control ID='ctlPercentAreas'
						Container='spnPercentAreas'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>																																					
			</DisplayProperties>
		</DataObject>				

		<DataObject Key='GranteeProjectAreaPercentages' DataObjectDefinitionKey='GranteeProjectAreaPercentages' CreateNew='False' Updatable='False'>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='PercentAreas' 
					DataObjectPropertyKey='PercentAreasID' 
					PropertyKey='PercentAreasID'
					Value=''/>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='DataObjectCollection' 
					TypeKey='PercentAreas' 
					DataObjectPropertyKey='PercentAreasID' 
					PropertyKey='PercentAreasID'
					Value=''/>
			</DefaultValues>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='Total'>
					<Control ID='ctlPercentage'
						Container='spnPercentage'
						Type='cMoneyTextBox'
						MaxLength='3'
						Format='#,0'
						Size='3'
						RequiredField='False'
						MaxInputDecimalPlaces='0'
						RegExErrorMessage='Percentage Time Spent on Area amount must contain only digits.'
						DecimalErrorMessage='Percentage Time Spent on Area amount cannot include decimals.'
						CommaErrorMessage='Percentage Time Spent on Area amount cannot include commas.'
						ErrorMessage='Percentage Time Spent on Area amount is required.'/>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{1,13}\s?$' ErrorMessage='You may only enter up to 12 digits (no other characters).' />
				</DisplayProperty>							
			</DisplayProperties>
		</DataObject>


	</ModuleSection>
</span>
