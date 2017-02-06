<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- Page Content - Controls -->
</br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
	<tr>
	  <td><h1>Board Members Editor </h1></td>
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
            <li>Enter your Board Member information below</li>
            <li>The system may have already filled in certain fields based on information previously entered</li>
            <li>Update this information as needed</li>
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
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='600'>
<!-- Control Label (for Name information) -->

	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Add or Edit Board Members</b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>	
<table width="600" border='0' cellpadding='0' cellspacing='0' runat='server'>
	
	<tr>
		<td	valign="top" width="122"><b>Name</b><%=kDenoteRequiredField%></td>
		<td width="193">
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
		<td width="104">
			<span id='spnMiddle' runat='server'/>
		</td>	
		<td width="168">
			<span id='spnLast' runat='server'/>
		</td> 	
		<td width="13">
			
		</td>
	</tr>
	<tr>
		<td></td>	
		<td>
			First<%=kDenoteRequiredField%>
		</td>	
		<td>Middle</td>
		<td>
			Last<%=kDenoteRequiredField%>
		</td>
		<td>&nbsp;</td>	

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
		<td	valign="top" width="122"><b>Status</b><%=kDenoteRequiredField%></td>
		<td>
			<span id='spnStatus' runat='server'/>
		</td>
	</tr>
		<tr>
		<td>&nbsp;<br /></td>
	</tr>
	<tr>
		<td valign="top"><b>Appointing Organization</b><%=kDenoteRequiredField%></td>
		<td colspan='5'>
			<span id='spnAppointingOrganization' runat='server'/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>&nbsp;</td>
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
				<Argument Type='' TypeKey='' PropertyKey='AffiliationTypeID' Value='3' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='OrganizationID' DataObjectPropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='TimePeriodID' DataObjectPropertyKey='TimePeriodID' />
				<Argument Type='' TypeKey='' PropertyKey='AffiliationTypeID' Value='3' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='CreateUser' Update='False' Create='True' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ModifyUser' Update='True' Create='False' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False' />
				<Argument Type='' TypeKey='' PropertyKey='LscBoardInfoSourceID' Value='2' Update='False' Create='True' />
			</DefaultValues>
			<DisplayProperties>
				<!--

				
				<DisplayProperty PropertyKey='ApplicantCategoryID'>
					<Control ID='ctlApplicantCategory'
						Container='spnApplicantCategory'
						Type='cRadioButtonList'
						DataObjectDefinitionKey='ApplicantCategory'
						StoredValue='ApplicantCategoryID'
						DisplayValue='Description'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Applicant Category is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StatusID'>
					<Control ID='ctlStatus'
						Container='spnStatus'
						Type='cTextBox'
						Size='25'
						MaxLength='75'
						RequiredField='True'
						Required='True'
						ErrorMessage='Title is required'>
						<Sort>
                            <Argument PropertyKey='SortOrder'/>
                        </Sort>
					</Control>
				</DisplayProperty>
				
				<Property Key='StatusID' RelationshipType='' DataType='Integer' ColumnSource='status_id' />
				<Property Key='BoardMemberStatus' DataType='cDataObject'>
					<Relationship Type='One' ChildDefinitionKey='BoardMemberStatus'>
						<RelationshipProperties>
							<RelationshipProperty parentProperty='StatusID' childProperty='BoardMemberStatusID' />
						</RelationshipProperties>
					</Relationship>
				</Property>
-->
				
				<DisplayProperty PropertyKey='StatusID'>
					<Control ID='ctlStatus'
						Container='spnStatus'
						Type='cDropDown'
						DataObjectDefinitionKey='BoardMemberStatus'
						StoredValue='BoardMemberStatusID'
						DisplayText='Select'
						DisplayValue='Description'
						Required='True'
						ErrorMessage='Status is required'>
						<Sort>
                            <Argument PropertyKey='SortOrder'/>
                        </Sort>
					</Control>
				</DisplayProperty>
<!--		<Property Key='RoleID' RelationshipType='' DataType='Integer' ColumnSource='role_id' />
				<Property Key='AffiliationRole' DataType='cDataObject'>
					<Relationship Type='One' ChildDefinitionKey='AdditionalContactRole'>
						<RelationshipProperties>
							<RelationshipProperty parentProperty='RoleID' childProperty='AdditionalContactRoleID' />
						</RelationshipProperties>
					</Relationship>
				</Property>
						
				<DisplayProperty PropertyKey='RoleID'>
					<Control ID='ctlStatus'
						Container='spnStatus'
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
-->
				<DisplayProperty PropertyKey='PrefixID'>
					<Control ID='ctlPrefix'
						Container='spnPrefix'
						Type='cDropDown'
						DataObjectDefinitionKey='Prefix'
						StoredValue='PrefixID'
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
						DisplayValue='Suffix'>
						<Sort>
							<Argument PropertyKey='SortOrder'/>
                        </Sort>
					</Control>	
				</DisplayProperty>	
				
				<DisplayProperty PropertyKey='AppointingOrganization'>
					<Control ID='ctlAppointingOrganization'
						Container='spnAppointingOrganization'
						Type='cTextBox'
						Size='25'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Appointing Organization is required.'>
					</Control>
				</DisplayProperty>													

				<DisplayProperty PropertyKey='RelevantExperience'>
					<Control ID='ctlExperience' 
						Type='cTextArea' 
						Container='spnExperience' 
						Rows='10' 
						Cols='55'
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
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
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
