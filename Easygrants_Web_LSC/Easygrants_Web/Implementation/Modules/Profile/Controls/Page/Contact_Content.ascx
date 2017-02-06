<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Profile.Controls.Page.cContact_Content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' />
	
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<P>Enter or edit your contact information in the fields below.  
	All fields marked with an asterisk (<FONT color=red>*</FONT>) are required.</P>
	<ul>
		<li>Click on the <B>Save</B> button to save the information.</li>
		<li>To return to your Home page when finished, click on the <b>Home</b> left navigational link 
		or the <b>Close</b> button at the bottom of the page.</li>
	</ul>

<!-- Page Section - Controls -->
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<!-- Control Label (for Name information) -->
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td width='15%'>
			<b>Prefix</b>
		</td>
		<td>
			<span id='spnPrefix' runat='server'/>
		</td>	
	</tr>
	
	<tr>
		<td><b>First Name</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnFirst' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Middle Name</b> </td>
		<td>
			<span id='spnMiddle' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Last Name</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>
			<span id='spnLast' runat='server'/>			
		</td> 	
	</tr>
	<tr>
		<td><b>Suffix</b></td>	
		<td>
			<span id='spnSuffix' runat='server'/>
		</td>
	</tr>	
	
</table>

<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr><td>&nbsp;</td></tr>	
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSaveAndClose'/>
			<span runat='server' id='spnClose'/>		
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
<br>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
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
						DisplayValue='Prefix'
						DisplayText='Select'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='FirstName'>
					<Control ID='ctlFirst'
						Container='spnFirst'
						Type='cTextBox'
						Size='50'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='First Name is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='MiddleName'>
					<Control ID='ctlMiddle'
						Container='spnMiddle'
						Type='cTextBox'
						Size='50'
						MaxLength='50'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='LastName'>
					<Control ID='ctlLast'
						Container='spnLast'
						Type='cTextBox'
						Size='50'
						MaxLength='50'
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
						DisplayValue='Suffix'
						DisplayText='Select'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
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
						Image='Save' EnterKey='True'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							EnterKey='True'>							
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'>
						<Action PostBack='True' AutoSave='True' Object='ModulePage' Method='RedirectToModule'>
							<Parameters>
								<Argument Type='' TypeKey='' Value='Home' />
								<Argument Type='' TypeKey='' Value='HomeModuleConfig' />
								<Argument Type='' TypeKey='' Value='Home' />
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>					
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action PostBack='True' Object='ModulePage' Method='RedirectToModule'>
							<Parameters>
								<Argument Type='' TypeKey='' Value='Home' />
								<Argument Type='' TypeKey='' Value='HomeModuleConfig' />
								<Argument Type='' TypeKey='' Value='Home' />
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>				
				<!--The following three DisplayProperty nodes will be active when a new person is edited -->
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'
						Confirmation='Select OK to close the page without saving the data. Select Cancel to return.'>
						<Action
							PostBack='True'
							Object='ModulePage'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Type='' TypeKey = '' Value='Home' />
								<Argument Type='' TypeKey = '' Value='HomeModuleConfig' />
								<Argument Type='' TypeKey = '' Value='Home' />
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>	
	</ModuleSection>
</span>
<!-- End Embedded XML -->


