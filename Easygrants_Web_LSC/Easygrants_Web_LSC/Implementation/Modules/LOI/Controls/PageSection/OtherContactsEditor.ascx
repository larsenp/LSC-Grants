<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- Page Content - Controls -->

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Instructions</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>Enter information about your Contacts here.</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>


<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<!-- Control Label (for Name information) -->
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Add or Edit Contacts</b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>	
<table border='0' cellspacing='0' cellpadding='0' runat='server'>
	<tr>
		<td	valign="top" width="120"><b>Name</b> </td>
		<td>
			<span id='spnPrefix' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
		</td>
		<td>Prefix</td>	
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<span id='spnFirst' runat='server'/>
		</td>
		<td>
			<span id='spnMiddle' runat='server'/>
		</td>	
		<td>
			<span id='spnLast' runat='server'/>
		</td> 	
	</tr>
	<tr>
		<td></td>	
		<td>
			First <%=kDenoteRequiredField%>
		</td>	
		<td>Middle</td>
		<td>
			Last <%=kDenoteRequiredField%>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<span id='spnSuffix' runat='server'/>
		</td>
	</tr>
	<tr>		
		<td></td>
		<td>Suffix</td>	
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td	valign="top" width="120"><b>Position/Title</b> <%=kDenoteRequiredField%></td>
		<td>
			<span id='spnRole' runat='server'/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>&nbsp;</td>
	</tr>

	<tr>
		<td><b>Email Address</b> <%=kDenoteRequiredField%></td>
		<td colspan=3>
			<span id='spnEmail' runat='server'/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<!-- Save Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnSave'/><span runat='server' id='spnClose'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Person' DataObjectDefinitionKey='LscWfTaskAssignmentAffiliations' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='LscWfTaskAssignmentAffiliationID' PropertyKey='LscWfTaskAssignmentAffiliationID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='AffiliationTypeID' Value='1' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='AffiliationTypeID' Value='1' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='CreateUser' Update='False' Create='True' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ModifyUser' Update='True' Create='False' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False' />
			</DefaultValues><!--DisplayValue='Description'-->
			<DisplayProperties>
				<DisplayProperty PropertyKey='RoleID'>
					<Control ID='ctlRole'
						Container='spnRole'
						Type='cDropDown'
						DataObjectDefinitionKey='AdditionalContactRole'
						StoredValue='AdditionalContactRoleID'
						DisplayText='Select'
						DisplayValue='Description'
						Required='True'
						ErrorMessage='Position/Title is required'>
						<Sort>
                            <Argument PropertyKey='SortOrder'/>
                        </Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrefixID'>
					<Control ID='ctlPrefix'
						Container='spnPrefix'
						Type='cDropDown'
						DataObjectDefinitionKey='Prefix'
						StoredValue='PrefixID'
						DisplayText='Select'
						DisplayValue='Prefix'>
						<Sort>
                            <Argument PropertyKey='SortOrder'/>
                        </Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='FirstName'>
					<Control ID='ctlFirst'
						Container='spnFirst'
						Type='cTextBox'
						Size='25'
						MaxLength='75'
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
						Size='25'
						MaxLength='75'
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
						DisplayText='Select'
						DisplayValue='Suffix'>
						<Sort>
							<Argument PropertyKey='SortOrder'/>
                        </Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Email'>
					<Control ID='ctlEmail' 
						Type='cEmailTextBox' 
						Container='spnEmail' 
						Size='50' 
						MaxLength='100'
						RequiredField='True' 
						ErrorMessage='Email Address is required.'
						RexErrorMessage='Email Address is incorrectly formatted. Use the following format to enter the email address: test@test.edu or test@test.edu.au.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action 
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							EnterKey='True'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='OtherContacts'/>
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
							Object='EventController' 
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject><!-- Key='Person' -->
	</ModuleSection>
</span>
<!-- End Embedded XML -->
