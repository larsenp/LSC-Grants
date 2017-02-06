<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td>
			Do you have any other funding sources for this project? 
			If yes, list all additional funding sources.&nbsp;<font color='red'>*</font>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td>
			<span id='spnIsOtherSupport' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	

	<tr>
		<td colspan='5'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser'
					TypeKey='GranteeProjectID' 
					PropertyKey='AppGranteeProjectID'
					Value=''
					Bool=''/>
			</Filters>
			<DisplayProperties/>
		</DataObject>	
		<DataObject Key='GranteeProjectWHCF' DataObjectDefinitionKey='GranteeProjectWHCF' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection'
					TypeKey='GranteeProject'
					DataObjectPropertyKey='GranteeProjectID'
					PropertyKey='GranteeProjectID'
					Value='' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection'
					TypeKey='GranteeProject'
					DataObjectPropertyKey='GranteeProjectID'
					PropertyKey='GranteeProjectID'
					Value='' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='IsOtherSupport'>
					<Control ID='ctlIsOtherSupport'
						Container='spnIsOtherSupport'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Funding sources question is required.'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='GranteeProjectOtherSupportList' DataObjectDefinitionKey='GranteeProjectOtherSupport'>
			<Filters>
				<Argument Type='DataObjectCollection'
					TypeKey='GranteeProject'
					DataObjectPropertyKey='GranteeProjectID'
					PropertyKey='GranteeProjectID'
					Value='' />
			</Filters>
			<Sort>
				<Argument PropertyKey='FundingInstitution' />	
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								AutoSave='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='OtherSupportEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='GranteeProjectOtherSupportID=0'/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GranteeProjectOtherSupport'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='FundingInstitution' ColumnHeader='Funding Source'/>
						<DisplayProperty PropertyKey='StartDate' ColumnHeader='Start Date' Format='M/d/yyyy'/>
						<DisplayProperty PropertyKey='EndDate' ColumnHeader='End Date' Format='M/d/yyyy'/>
						<DisplayProperty PropertyKey='ProjectTitle' ColumnHeader='Title'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='OtherSupportEditor'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectOtherSupportID' 
											AttributeName='GranteeProjectOtherSupportID' BaseValue='GranteeProjectOtherSupportID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey=''>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='GranteeProjectOtherSupportID' AttributeName='GranteeProjectOtherSupportID'/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
