<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- Page Content - Controls -->
</br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='600'>
<!-- Control Label (for Name information) -->
	<tr>
	  <td><h1>
      Key Staff Members Editor </h1></td>
  </tr>
	<tr>
	  <td><table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
        <tr>
          <td colspan="4" class="SeparatorHdg">Instructions</td>
        </tr>
        <tr>
          <td colspan="4" >&nbsp;</td>
        </tr>
        <tr>
          <td valign="top" ><ul>
            <li>Enter your Key Staff Member information below</li>
            <li>The system may have already filled in certain fields based on information previously entered. Update this information as needed</li>
            <li>All fields marked with an asterisk (*) are required</li>
            <li>To save the data, click <strong>Save</strong></li>
            <li>To return to the previous page, click <strong>Close</strong></li>
          </ul>        
          </td>
          <td >&nbsp;</td>
          <td >&nbsp;</td>
          <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
        </tr>
        <tr>
          <td valign="top" >&nbsp;</td>
          <td >&nbsp;</td>
          <td >&nbsp;</td>
          <td valign="top" >&nbsp;</td>
        </tr>
      </table></td>
  </tr>
	<tr>
		<td class="SeparatorHdg">Add or Edit Key Staff Members</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>	
<table width="600" border='0' cellpadding='0' cellspacing='0' runat='server'>
	
	<tr>
		<td	valign="top" width="129"><b>Name</b></td>
		<td width="191">
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
		<td width="105">
			<span id='spnMiddle' runat='server'/>
		</td>	
		<td width="229">
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
		<td width="6">&nbsp;</td>	

	</tr>
	<tr>
	  <td></td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
  </tr>
	<tr>
	  <td></td>
	  <td><span id='spnSuffix' runat='server'/></td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
  </tr>
	<tr>
	  <td></td>
	  <td>Suffix</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
  </tr>
	
	<tr>
		<td>&nbsp;</td>
	</tr>
  	<tr>
		<td	valign="top" width="129"><b>Position/Title</b><%=kDenoteRequiredField%></td>
		<td>
			<span id='spnTitle' runat='server'/>
		</td>
	</tr>
		<tr>
		<td>&nbsp;<br /></td>
	</tr>
	<tr>
		<td valign="top"><b>Relevant Experience</b><%=kDenoteRequiredField%></td>
		<td colspan='5'>
			<span id='spnExperience' runat='server'/>
		</td>
	</tr>


	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' >
	<tr align='center'>
		<td>			
			<!-- Save Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnSave'/><span runat='server' id='spnClose'/>
		</td>
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='vLSCCompWftaOrgServareaYear' DataObjectDefinitionKey='vLSCCompWftaOrgServareaYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
		</DataObject>
		<DataObject Key='Person' DataObjectDefinitionKey='LscWfTaskAssignmentAffiliations' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='LscWfTaskAssignmentAffiliationID' PropertyKey='LscWfTaskAssignmentAffiliationID' Value=''/>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='OrganizationID' DataObjectPropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='TimePeriodID' DataObjectPropertyKey='TimePeriodID' />
				<Argument Type='' TypeKey='' PropertyKey='AffiliationTypeID' Value='2' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='OrganizationID' DataObjectPropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='TimePeriodID' DataObjectPropertyKey='TimePeriodID' />
				<Argument Type='' TypeKey='' PropertyKey='AffiliationTypeID' Value='2' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='CreateUser' Update='False' Create='True' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ModifyUser' Update='True' Create='False' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False' />
			</DefaultValues>

				<!--DisplayProperty PropertyKey='RoleID'>
					<Control ID='ctlRole'
						Container='spnRole'
						Type='cTextBox'
						Size='25'
						MaxLength='75'
						RequiredField='True'
						ErrorMessage='Title is required.'>
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
				</DisplayProperty-->

			<DisplayProperties>
				<DisplayProperty PropertyKey='RoleID'>
					<Control ID='ctlTitle'
						Container='spnTitle'
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
				<DisplayProperty PropertyKey='RelevantExperience'>
					<Control ID='ctlExperience' 
						Type='cTextArea' 
						Container='spnExperience' 
						Rows='10' 
						Cols='55'
						MaxLength='300'
						TooLongMessage='Relevant Experience must be limited to 300 characters.'
						RequiredField='True' 
						ErrorMessage='Relevant Experience is required.'
						RexErrorMessage='Relevant Experience is incorrectly formatted.'>
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
								<Argument AttributeName='PageKey' Value='KeyStaffMembers'/>
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
