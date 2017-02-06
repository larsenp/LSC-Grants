<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cOrganizationContent"  TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>
<br>
      <span id='spnPageContent' runat='server' />
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table2">
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Contact</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server' ID="Table3" width='100%'>
	<tr>
		<td	width='20%'><b>Name</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td colspan='3'><span id='spnPrefix' runat='server'/></td>
	</tr>
	<tr>
		<td></td>
		<td  colspan='3'>Prefix</td>	
	</tr>
	<tr><td colspan='4'>&nbsp;</td></tr>
	<tr>
		<td></td>
		<td><span id='spnFirst' runat='server'/></td>
		<td><span id='spnMiddle' runat='server'/></td>
		<td><span id='spnLast' runat='server'/></td> 	
	</tr>
	<tr>
		<td></td>	
		<td>First&nbsp;<%=kDenoteRequiredField%></td>
		<td>Middle</td>
		<td>Last&nbsp;<%=kDenoteRequiredField%></td>
	</tr>
	
	<tr><td  colspan='4'>&nbsp;</td></tr>
	<tr>
		<td></td>
		<td  colspan='3'><span id='spnSuffix' runat='server'/></td>
	</tr>
	<tr>		
		<td></td>
		<td  colspan='3'>Suffix</td>	
	</tr>
	<tr><td  colspan='4'>&nbsp;</td></tr>
	<tr>
		<td></td>
		<td  colspan='3'><span id='spnTitle' runat='server'/></td>
	</tr>
	<tr>		
		<td></td>
		<td  colspan='3'>Title</td>	
	</tr>	
	<tr><td  colspan='4'>&nbsp;</td></tr>	
	<tr visible='true' runat='server' ID="Tr1" NAME="Tr1">
		<td><b><%=GetLabel("Organization")%>&nbsp;</b><%=kDenoteRequiredField%>&nbsp;&nbsp;&nbsp;</td>
		<td  colspan='3'> <span id='spnOrgSelectLauncher' runat='server'/></td>
	</tr>
	<tr><td  colspan='4'>&nbsp;</td></tr>
</table>



<br</br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' ID="Table10">
	<tr align='center'>
		<td>
			<span runat='server' id='spnSave'/>			
		</td>
	</tr>
</table>
<br></br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Address</b></td>
	</tr>
</table>

<br>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='5'>
			<span runat='server' id='spnAddAddress'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAddressDataList' visible='true'></span>
		</td>
	</tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Phone and Fax</b></td>
	</tr>	
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td >
			<span runat='server' id='spnAddPhone'></span>
		</td>
	</tr>
	<tr>
		<td >
			<span runat='server' id='spnPhoneDataList'></span>	
		</td>
	</tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>E-mail</b></td>
	</tr>	
</table> <!--
Click <b>Add</b> to enter an e-mail address for this contact.  Click the <b>Edit</b> or <b>Delete</b> option buttons 
to edit/delete these records. -->
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td >
			<span runat='server' id='spnAddEmail'></span>
		</td>
	</tr>
	<tr>
		<td ><span runat='server' id='spnEmailDataList'></span>	
		</td>
	</tr>
</table>
	

<br</br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' >
	<tr align='center'>
		<td>			
			<span runat='server' id='spnSave_and_Continue'/>
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='PrimaryAddress' DataObjectDefinitionKey='Address' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
				<Argument Type='Data' TypeKey='' PropertyKey='IsPrimary' Value='True'/>
			</Filters>
		</DataObject>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryOrganization.CommonOrganizationName'>
					<Control ID='ctlOrgSelectLauncher' 
					Type='cOrgSelectLauncherNotInList'
					Container='spnOrgSelectLauncher'
					HiddenValueKey='PrimaryOrganizationID'
					DataObjectDefinitionKey='Organization'
					StoredValue='OrganizationID'
					DisplayValue='CommonOrganizationName'
					RequiredField='True'
					ErrorMessage='~~Organization~~ is required.'	/>
				</DisplayProperty>			
			</DisplayProperties>
		</DataObject>	
		
		
			
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrefixID'>
					<Control ID='ctlPrefix'
						Container='spnPrefix'
						Type='cDropDown'
						DataObjectDefinitionKey='Prefix'
						StoredValue='PrefixID'
						DisplayValue='Prefix'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='FirstName'>
					<Control ID='ctlFirst'
						Container='spnFirst'
						Type='cTextBox'
						Size='25'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='First Name is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='MiddleName'>
					<Control ID='ctlMiddle'
						Container='spnMiddle'
						Type='cTextBox'
						Size='10'
						MaxLength='75'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='LastName'>
					<Control ID='ctlLast'
						Container='spnLast'
						Type='cTextBox'
						Size='30'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Last Name is required.'>
					</Control>
				</DisplayProperty>																		
				<DisplayProperty PropertyKey='SuffixID'>
					<Control ID='ctlSuffix'
						Container='spnSuffix'
						Type='cDropDown'
						DataObjectDefinitionKey='Suffix'
						StoredValue='SuffixID'
						DisplayValue='Suffix'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='Title'>
					<Control ID='ctlTitle'
						Container='spnTitle'
						Type='cTextBox'
						Size='25'
						MaxLength='75'>
					</Control>
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject><!-- Key='Person' -->		
		

	<DataObject Key='Address' DataObjectDefinitionKey='Address'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' Value=''/>				
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1' Bool='And'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='IsPrimary' Direction='Descending' />	
			</Sort>	
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAddAddress' 
						Type='cButton' 
						Image='Add'
						Container='spnAddAddress'>
							<Action
								PostBack='True'
								AutoSave='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='AddressEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='AddressID=0'/>									
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlAddressDataList'
						Container='spnAddressDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='Address'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='IsPrimary' Format='YesNo' ColumnHeader='Primary'  Width='10%'/>
						<DisplayProperty PropertyKey='AddressType.AddressAbbr' ColumnHeader='Type' Width='10%'/>
						<DisplayProperty PropertyKey='Address1' ColumnHeader='Address' Width='15%'/>
						<DisplayProperty PropertyKey='City' Width='15%'/>
						<DisplayProperty PropertyKey='State.StateAbbr' ColumnHeader='State/Province' Width='5%'/>
						<DisplayProperty PropertyKey='Zip' ColumnHeader='Zip/Postal Code'  Width='10%'/>
						<DisplayProperty PropertyKey='Country.CountryDesc' ColumnHeader='Country' Width='10%'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'  Width='25%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>								
								<Action
									PostBack='True'
									AutoSave='True'
									Object='DataPresenter'
									Method='DataPresenter_Save_And_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='AddressEditor'/>
										<Argument Type='DataObject' TypeKey='AddressID' AttributeName='AddressID' BaseValue='AddressID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
										<Argument Type='' TypeKey='' PropertyKey='' BaseValue=''/>
										<Argument Type='' TypeKey='' PropertyKey='' BaseValue=''/>
										<Argument Type='' TypeKey='' PropertyKey='' BaseValue=''/>
										<Argument Type='' TypeKey='' PropertyKey='' BaseValue=''/>										
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='AddressID' AttributeName='AddressID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Phone' DataObjectDefinitionKey='Phone'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' Value=''/>				
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1' Bool='And'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='IsPrimary' Direction='Descending' />	
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAddPhone' 
						Type='cButton' 
						Image='Add'
						Container='spnAddPhone'>
							<Action
								PostBack='True'
								AutoSave='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='PhoneEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='PhoneID=0'/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPhoneDataList'
						Container='spnPhoneDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='Phone'
						SeparatorWidth='2'
						MaxPerPage='10' Width='70%'>
						<DisplayProperty PropertyKey='IsPrimary' Format='YesNo' ColumnHeader='Primary'  Width='10%'/>
						<DisplayProperty PropertyKey='PhoneType.TypeName' ColumnHeader='Type'  Width='10%'/>
						<DisplayProperty PropertyKey='vFormattedPhone.PhoneNumber' ColumnHeader='Number'  Width='55%'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'  Width='25%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>													
								<Action	
									PostBack='True'
									AutoSave='True'
									Object='DataPresenter'
									Method='DataPresenter_Save_And_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='PhoneEditor'/>
										<Argument Type='DataObject' TypeKey='PhoneID' AttributeName='PhoneID' BaseValue='PhoneID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
										<Argument Type='' TypeKey='' PropertyKey='' BaseValue=''/>
										<Argument Type='' TypeKey='' PropertyKey='' BaseValue=''/>
										<Argument Type='' TypeKey='' PropertyKey='' BaseValue=''/>
										<Argument Type='' TypeKey='' PropertyKey='' BaseValue=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='PhoneID' AttributeName='PhoneID'/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Email' DataObjectDefinitionKey='Email'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' Value=''/>				
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1' Bool='And'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='IsPrimary' Direction='Descending' />	
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAddEmail' 
						Type='cButton' 
						Image='Add'
						Container='spnAddEmail'>
							<Action
								PostBack='True'
								AutoSave='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='EmailEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='EmailID=0'/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlEmailDataList'
						Container='spnEmailDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='Email'
						SeparatorWidth='2'
						MaxPerPage='10' Width='70%'>
						<DisplayProperty PropertyKey='IsPrimary' Format='YesNo' ColumnHeader='Primary' Width='10%'/>
						<DisplayProperty PropertyKey='EmailType.TypeName' ColumnHeader='Type'  Width='10%'/>
						<DisplayProperty PropertyKey='ContactValue1' ColumnHeader='E-mail Address'  Width='55%'>
							<Control ID='ctlLink'
								Type='cLink'>
								<Action
									PostBack='False'
									URL='Email'>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'  Width='25%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>								
								<Action
									PostBack='True'
									AutoSave='True'
									Object='DataPresenter'
									Method='DataPresenter_Save_And_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='EmailEditor'/>
										<Argument Type='DataObject' TypeKey='EmailID' AttributeName='EmailID' BaseValue='EmailID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
										<Argument Type='' TypeKey='' PropertyKey='' BaseValue=''/>
										<Argument Type='' TypeKey='' PropertyKey='' BaseValue=''/>
										<Argument Type='' TypeKey='' PropertyKey='' BaseValue=''/>
										<Argument Type='' TypeKey='' PropertyKey='' BaseValue=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='EmailID' AttributeName='EmailID'/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		

		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							EnterKey='True'>							
						</Action>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Caption='Continue'
						Save='True'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>		
	</ModuleSection>
</span>
<!-- End Embedded XML -->
