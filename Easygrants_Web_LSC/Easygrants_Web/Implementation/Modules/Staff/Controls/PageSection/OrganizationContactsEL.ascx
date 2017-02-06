<%@ Control Language="vb" AutoEventWireup="true" Codebehind="OrganizationContactsEL.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cOrganizationContactsEL" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->

<table width='100%' runat='server'>
	<tr>
		<td class='SeparatorHdg' colspan='2'>
			Easylist
		</td>
	</tr>
	
	<tr><td>&nbsp;</td></tr>
	<tr id='trNoResults' visible='false'>
		<td colspan='2'>
			<font color='red'><b>
				No results were found matching your search criteria.
			</font></b>
			<br><br>
		</td>
	</tr>
	<tr>
		<td>
			Last Name
		</td>
		<td>
			<span runat='server' id='spnLastName'/>
		</td>
	</tr>
	<tr>
		<td>
			First Name
		</td>
		<td>
			<span runat='server' id='spnFirstName'/>
		</td>
	</tr>
	<tr>
		<td>
			Middle Name/Initial
		</td>
		<td>
			<span runat='server' id='spnMiddleName'/>
		</td>
	</tr>
	<tr>
		<td>
			E-mail
		</td>
		<td>
			<span runat='server' id='spnEmail'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' align='center'>
			<span runat='server' id='spnFind'/>
		</td>
	</tr>
	<tr>
		<td colspan='5'>
			<span runat='server' id='spnPersonOrg'></span>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnList'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	<DataObject Key='Filter' DataObjectDefinitionKey='' Updatable='False'>
			<Filters>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtLastName'
						Type='cTextBox'
						Container='spnLastName'
						FilterProperty='LastName'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtFirstName'
						Type='cTextBox'
						Container='spnFirstName'
						FilterProperty='FirstName'/>
				</DisplayProperty>			
				<DisplayProperty PropertyKey=''>
					<Control ID='txtMiddleName'
						Type='cTextBox'
						Container='spnMiddleName'
						FilterProperty='MiddleName'/>
				</DisplayProperty>			
				<DisplayProperty PropertyKey=''>
					<Control ID='txtEmail'
						Type='cTextBox'
						Container='spnEmail'
						FilterProperty='PersonPrimaryEMail.ContactValue1'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnFind'
						Type='cButton'
						Container='spnFind'
						Image='Find'>
						<Action
							PostBack='True'
							Object='ModulePageContent'
							Method='FilterListDataPresenter_Find'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlPersonOrg'
						Container='spnPersonOrg'
						Type='cDropDown'
						ParamList='PersonEditor|Person~OrganizationEditor|Organization'
						Separator='~'
						SubSeparator='|'
						DisplayValue='ActionName'
						DisplayNone='False'>
						<SelectedValue>
							<Argument Type='QueryString' TypeKey='Page' PropertyKey='PageKey'/>
						</SelectedValue>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								Object='DataPresenter'
								Method='NavigateToModulePageKey'>
								<Parameters>
									<Argument Type='Control' TypeKey = 'ctlPersonOrg' ControlPropertyKey='SelectedValue' Value='' />
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>											
					
			</DisplayProperties>
		</DataObject>
		<DataObject Key='List' DataObjectDefinitionKey='Person' Updatable='False' GetData='False'>
			<Filters>
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName' Direction='Ascending'>
				</Argument>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Type='cDataListCtl'
						Container='spnList'
						DataObjectDefinitionKey='Person'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<HeaderHtml>
							Search Results
						</HeaderHtml>
						<DisplayProperty PropertyKey='' ColumnHeader='Action'>
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='EasylistAction'
								StoredValue='EasylistActionID'
								DisplayValue='EasylistAction'>
								<Filters>
									<Argument Type='DataPresenter' TypeKey='DataObjectDefinitionKey' PropertyKey='DataObjectDefinitionKey' Value='Contact'>
										<RelatedProperty PropertyKey='EasylistActionType'/>
									</Argument>
								</Filters>
								<Sort>
									<Argument PropertyKey="EasylistAction" />
								</Sort>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnGo'
								Type='cButton'
								Image='Go'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='Execute_Action'>
									<Parameters>
										<Argument Type='Object' ObjectType='CoreControl'/>
										<Argument Type='Object' ObjectType='EventSource'/>
										<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='LastNameFirstName' ColumnHeader='Name'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>	
		
	</ModuleSection>
	<!-- End Embedded XML -->
</span>