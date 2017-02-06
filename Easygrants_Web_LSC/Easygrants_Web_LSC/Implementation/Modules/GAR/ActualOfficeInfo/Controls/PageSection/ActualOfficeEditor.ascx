<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.GAR.ActualOfficeInfo.Controls.PageSection.cActualOfficeEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width='800'>
	<tr>
		<td class='SeparatorHdg' colspan='2'>
			Office
		</td>
	</tr>
	<tr>
		<td width='20%'>
			Office Type
		</td>
		<td>
			<span runat="server" id='spnOfficeType' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Office #<span runat='server' id='spnOffID' /></b>
		</td>
	</tr>
	<tr>
		<td>
			Office Name&nbsp;<font color='red'>*</font>
		</td>
		<td>
			<span runat="server" id='spnOffName' />
		</td>
	</tr>
	<tr>
		<td>
			Office Address&nbsp;<font color='red'>*</font>
		</td>
		<td>
			<span runat="server" id='spnAddr1Off' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;
			
		</td>
		<td>
			<span style="font-size:smaller">Address Line 1</span>
		</td>
	</tr>
	<tr>
		<td>&nbsp;
			
		</td>
		<td>
			<span runat="server" id='spnAddr2Off' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;
			
		</td>
		<td>
			<span style="font-size:smaller">Address Line 2</span>
		</td>
	</tr>
	<tr>
		<td>
			City&nbsp;<font color='red'>*</font>
		</td>
		<td>
			<span runat="server" id='spnCityOff' />&nbsp;&nbsp;
			State&nbsp;<font color='red'>*</font>&nbsp;
			<span runat="server" id='spnStateProvinceIDOff' />&nbsp;&nbsp;
			Zip&nbsp;<font color='red'>*</font>&nbsp;
			<span runat="server" id='spnZipOff' />
		</td>
	</tr>
	<tr>
		<td>
			Person in Charge&nbsp;<font color='red'>*</font>
		</td>
		<td>
			<span runat="server" id='spnPersonInCharge' />
		</td>
	</tr>
	<tr>
		<td>
			E-mail Address&nbsp;<font color='red'>*</font>
		</td>
		<td>
			<span runat="server" id='spnEmail' />
		</td>
	</tr>
	<tr>
		<td>
			Telephone Number&nbsp;<font color='red'>*</font>
		</td>
		<td>
			<span runat="server" id='spnPhone' />&nbsp;&nbsp;
			Fax Number&nbsp;<font color='red'>*</font> 
			<span runat="server" id='spnFax' />
		</td>
	</tr>
	<tr>
		<td>
			Regular Full Time Work Week&nbsp;<font color='red'>*</font>
		</td>
		<td>
			<span runat="server" id='spnWorkWeek' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;
			
		</td>
		<td>
			<span style="font-size:smaller">Number of Hours</span>
		</td>
	</tr>
	<tr>
		<td>
			Open Date
		</td>
		<td>
			<span runat="server" id='spnOpenDate' />
			<asp:CustomValidator id='valCusOpenDate'
				runat='server'
				OnServerValidate='ValidateOpenDate'
				ErrorMessage='You must provide an open date for a new office.'
				Display="none" />
			<asp:RangeValidator id='valRngOpenDate'
				runat='server'
				ControlToValidate='txtOpenDate'
				Type='Date'
				MinimumValue='1900-1-1'
				MaximumValue='2015-12-31'
				Display='none'
				ErrorMessage='Open Date must be no later than December 31, 2015.'/>
		</td>
	</tr>
	<tr>
		<td>
			Close Date
		</td>
		<td>
			<span runat="server" id='spnCloseDate' />
			<asp:RangeValidator id='valRngCloseDate'
				runat='server'
				ControlToValidate='txtCloseDate'
				Type='Date'
				MinimumValue='1900-1-1'
				MaximumValue='2015-12-31'
				Display='none'
				ErrorMessage='Close Date must be no later than December 31, 2015.'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' align='center'>
			<span runat='server' id='spnSave' />&nbsp;&nbsp;
			<span runat='server' id='spnClose' />
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
		
		<DataObject Key='OfficeType' DataObjectDefinitionKey='OfficeType' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='OffTypeID' PropertyKey='OfficeTypeID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='spnOfficeType'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscOffice' DataObjectDefinitionKey='LscOffice' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='LscOfficeID' PropertyKey='LscOfficeID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.TimePeriodID' PropertyKey='TimePeriodID'/>
				<Argument Type='QueryString' TypeKey='OffTypeID' PropertyKey='OffTypeID' />
				      
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='OffName'>
					<Control ID='txtOffName'
						Type='cTextBox'
						Container='spnOffName'
						Size='40'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Office Name is required.'/>
					</DisplayProperty>
				<DisplayProperty PropertyKey='OffID'>
					<Control ID='spnOffID'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Addr1Off'>
					<Control ID='txtAddr1Off'
						Type='cTextBox'
						Container='spnAddr1Off'
						Size='40'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Office Address Line 1 is required.'/>
					</DisplayProperty>
				<DisplayProperty PropertyKey='Addr2Off'>
					<Control ID='txtAddr2Off'
						Type='cTextBox'
						Container='spnAddr2Off'
						Size='40'
						MaxLength='50'/>
					</DisplayProperty>
				<DisplayProperty PropertyKey='CityOff'>
					<Control ID='txtCityOff'
						Type='cTextBox'
						Container='spnCityOff'
						Size='20'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='City is required.'/>
					</DisplayProperty>
				<DisplayProperty PropertyKey='StateProvinceIDOff'>
					<Control ID='ctlStateProvinceIDOff'
						Type='cDropDown'
						Container='spnStateProvinceIDOff'
						DataObjectDefinitionKey='State'
						StoredValue='StateID'
						DisplayValue='StateAbbr'
						DisplayText='Select' 
						RequiredField='True'
						ErrorMessage='State is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ZipOff'>
					<Control ID='txtZipOff'
						Type='cTextBox'
						Container='spnZipOff'
						Size='10'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Zip is required.'/>
					</DisplayProperty>
				<DisplayProperty PropertyKey='PersonInCharge'>
					<Control ID='txtPersonInCharge'
						Type='cTextBox'
						Container='spnPersonInCharge'
						Size='20'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Person in Charge is required.'/>
					</DisplayProperty>
				<DisplayProperty PropertyKey='Email'>
					<Control ID='txtEmail'
						Type='cEmailTextBox'
						Container='spnEmail'
						Size='20'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='E-mail Address is required.'
						RexErrorMessage='E-mail Address is incorrectly formatted. Use the following format to enter the e-mail address: test@test.edu or test@test.edu.au.'/>
					</DisplayProperty>
				<DisplayProperty PropertyKey='Phone'>
					<Control ID='txtPhone'
						Type='cTextBox'
						Container='spnPhone'
						Size='20'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Phone is required.'/>
					</DisplayProperty>
				<DisplayProperty PropertyKey='Fax'>
					<Control ID='txtFax'
						Type='cTextBox'
						Container='spnFax'
						Size='20'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Fax is required.'/>
					</DisplayProperty>
				<DisplayProperty PropertyKey='WorkWeek'>
					<Control ID='txtWorkWeek'
						Type='cTextBox'
						Container='spnWorkWeek'
						Size='5'
						MaxLength='4'
						RequiredField='True'
						ErrorMessage='Regular Full Time Work Week is required.'>
						<Validation Type='RegularExpression'
							ValidationExpression='^[0-9][0-9](.[0-9][0-9]?)?$'
							ErrorMessage='Regular Full Time Work Week must be between 10 and 99, with no more than two decimal places.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OpenDate'>
					<Control ID='txtOpenDate'
						Type='cDateTextBox'
						Container='spnOpenDate'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='Open Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='Open Date must be in mm/dd/yyyy format.'
						Size='25'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CloseDate'>
					<Control ID='txtCloseDate'
						Type='cDateTextBox'
						Container='spnCloseDate'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='Close Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='Close Date must be in mm/dd/yyyy format.'
						Size='25'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True' 
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>	
							<Parameters>
								<Argument Type='QueryString' TypeKey='Page' />
								<Argument Type='DataObjectCollection' TypeKey='LscOffice' DataObjectPropertyKey='LscOfficeID' BaseValue='LscOfficeID=' />
								<Argument Type='QueryString' TypeKey='OffTypeID' BaseValue='OffTypeID=' />
								<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Type='cButton'
						Container='spnClose'
						Caption='Close'
						Confirmation='Click OK to leave the Actual Office Editor without saving your data. Click Cancel to return to the Actual Office Editor.'>
						<Action PostBack='True'
							Object='EventController'
                            Method='EventController_NavigateToModulePageKey'>	
							<Parameters>
								<Argument Value='Form_E0' />
								<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
