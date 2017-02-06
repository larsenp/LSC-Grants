<%@ Control Language="vb" AutoEventWireup="true" Codebehind="Person_Editor.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cPerson_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"  EnableViewState="false"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- Page Content - Controls -->
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<!-- Control Label (for Name information) -->
	<tr id='trName' visible='true'>
		<td	valign="top" width="120"><b>Existing Name Like</b> <%=LastName%>, <%=FirstName%></td>
		<td>
			<span id='spnName' runat='server'/><span id='spnGo' runat='server'/>
		</td>
		<td></td>
		<td>
			<span id='spnNewPerson' runat='server'/>
		</td>
	</tr>
	<tr >
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
		<td>
			<span id='spnFirst' runat='server'/>			
		</td>
	</tr>
	<tr>
		<td><b>Middle Name</b> </td>
		<td>
			<span id='spnMiddle' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Last Name</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnLast' runat='server'/></td> 	
	</tr>
	<tr>
		<td><b>Suffix</b></td>	
		<td>
			<span id='spnSuffix' runat='server'/>
		</td>
	</tr>
	
	
</table>

<table id="TblAdminOnly" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr id='trInformalName' visible='true'>
		<td width='15%'><b>Informal Name</b></td>	
		<td>
			<span id='spnInformalName' runat='server'/>
		</td>
	</tr>
	<tr>	
		<td width='15%'>
			<b>E-mail Address</b>&nbsp;<%=kDenoteRequiredField%>
		</td>
		<td ><span id='spnEmail' runat='server'/></td>
	</tr>
	<tr>	
		<td>
			&nbsp;
		</td>
		<td >Limited to 100 characters for the e-mail address.</td>
	</tr>
	<tr id='trGender' visible='true'>
		<td><b>Gender</b></td>	
		<td>
			<span id='spnGender' runat='server'/>
		</td>
	</tr>
	<tr>
		<td colspan='2'>&nbsp;</td>	
	</tr>
	<tr>
		<td><b>Do Not Contact</b></td>	
		<td>
			<span id='spnDoNotContact' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Deceased</b></td>	
		<td>
			<span id='spnDeceased' runat='server'/>
		</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr><td>&nbsp;</td></tr>	
	<tr><td>&nbsp;</td></tr>		
	<tr id='trEditButtons'>
		<td>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSaveAndClose'/>
			<span runat='server' id='spnClose'/>		
		</td>
	</tr>
	<tr id='trAddButtons'>
		<td>
			<span runat='server' id='spnSaveContinue'/>
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>
<br>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<!--	Key: index into cDataPresenter.mDataObjHash
				DataObjectDefinitionKey: index into DataDefinition.xml
		-->
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataPresenter' 
					TypeKey='EntityID' 
					PropertyKey='PersonID' 
					Value='' 
					Bool=''/>
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
				<DisplayProperty PropertyKey='PreferredFirstName'>
					<Control ID='ctlInformalName'
						Container='spnInformalName'
						Type='cTextBox'
						Size='50'
						MaxLength='50'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='GenderID'>
					<Control ID='ctlGender'
						Container='spnGender'
						Type='cDropDown'
						DataObjectDefinitionKey='Gender'
						StoredValue='GenderID'
						DisplayValue='Gender'
						DisplayText='Select'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsDoNotContact'>
					    <Control ID='ctlIsDoNotContact'
						    Container='spnDoNotContact'
						    Type='cCheckBox'>
					    </Control>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='IsDeceased'>
					    <Control ID='ctlIsDeceased'
						    Container='spnDeceased'
						    Type='cCheckBox'>
					    </Control>
				 </DisplayProperty>
			</DisplayProperties>
		</DataObject><!-- Key='Person' -->
		
		<DataObject Key='Email' DataObjectDefinitionKey='Email' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataPresenter' 
					TypeKey='EntityID'
					PropertyKey='EntityID'
					Value='' 
					bool=''/>
				<Argument Type='' 
					TypeKey=''
					PropertyKey='EntityTypeID'
					Value='1' 
					bool='And'/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
				<Argument Type='' TypeKey='' PropertyKey='EmailTypeID' Value='1'/>
				<Argument Type='' TypeKey='' PropertyKey='IsPrimary' Value='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='ContactValue1'>
					<Control ID='ctlEmail'
						Type='cEmailTextBox'
						Container='spnEmail'
						Size='70'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='E-mail Address is required.'
						RexErrorMessage='E-mail Address is incorrectly formatted. Use the following format to enter the e-mail address: test@test.edu or test@test.edu.au.'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlName'
						Container='spnName'
						Type='cDropDown'
						DataObjectDefinitionKey='Person'
						StoredValue='PersonID'
						DisplayValue='LastNameFirstName'>
						<Filters>
							<Argument Type='QueryString' TypeKey='first' Operator='Like' PropertyKey='FirstName'/>
							<Argument Type='QueryString' TypeKey='last' Operator='Like' PropertyKey='LastName'/>									
						</Filters>
						<Sort>
							<Argument PropertyKey='LastName'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGo' 
						Type='cButton' 
						Image='Go'
						Container='spnGo'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument Type='' TypeKey = '' Value='Contact' />
									<Argument Type='Control' TypeKey = 'ctlName' ControlPropertyKey='SelectedValue' BaseValue='PersonID=' />
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlNewPerson'
						Container='spnNewPerson'
						Type='cLink'
						Caption='Create New Person'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='NewPersonEditor'/>
								<Argument Type='' TypeKey='' AttributeName='' Value='PersonID=0'/>
								<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<!--The following two DisplayProperty nodes will be active when an existing person is edited -->
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save' EnterKey='True'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' BaseValue='PersonID='/>
								<%--<Argument Type='QueryString' TypeKey='ReturnURL'/>--%>
							</Parameters>						
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='Cancel'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='DataPresenter'
							Method='Cancel'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>

				
				<!--The following three DisplayProperty nodes will be active when a new person is edited -->
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveContinue'
						Container='spnSaveContinue'
						Confirmation='Are you sure you want to add this contact?'
						Type='cButton'
						Image='Save and Continue' >
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='SaveRedirect'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' BaseValue=''/>
								<Argument Type='QueryString' TypeKey='ReturnURL'/>
							</Parameters>						
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnspnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='DataPresenter'
							Method='Cancel'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>						
						</Action>
					</Control>	
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>



