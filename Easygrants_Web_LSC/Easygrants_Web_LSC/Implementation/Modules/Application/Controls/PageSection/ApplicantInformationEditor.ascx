<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br>
<span id='spnPageContent' runat='server' />
<table  border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
	<tr>
	  <td colspan="4"><h1>Applicant Information Editor</h1></td>
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
            <li><strong><font color="#990000">All fields marked with an asterisk (*) are required. </font></strong></li>
            <li>The system may have already filled in certain fields based on information previously entered. Update this information as needed. </li>
            <li>To save the data, click <strong>Save</strong>. </li>
            <li>To return to the previous page, click <strong>Close</strong></li>
          </ul>
            <p>Within the Applicant Category, the definition of Private Attorney(s), Groups of Attorneys or Law Firms is as follows:</p>
            <ul>
              <li>A group of attorneys (not a law firm) can compete for LSC grants under two options:
                  <ol>
                    <li>it can choose to compete as a non-incorporated body, as long as it complies with the requirements set forth in 45 C.F.R. 1607; or</li>
                    <li>it can elect to incorporate as a non-profit and apply for federal tax-exempt status as a non-profit.</li>
                  </ol>
              </li>
            </ul>
            <p>If the group elects the second option, the group of attorneys does not have to be fully incorporated and does not have to already have its tax-exempt status to file a Notice of Intent to Compete. However, the group must be incorporated as a non-profit, have its governing body in place and have already filed with the IRS for its tax-exempt status by the time it submits its completed grant application. </p>            <p>&nbsp;</p>
          </td>
          <td >&nbsp;</td>
          <td >&nbsp;</td>
          <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
        </tr>
      </table></td>
  </tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Add or Edit Applicant Information</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td	width='20%'><b>Organization</b></td>
		<td colspan='3'><span id='spnOrgName' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	width='20%'><b>Name</b><%=kDenoteRequiredField%></td>
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
		<td>First<%=kDenoteRequiredField%></td>
		<td>Middle</td>
		<td>Last<%=kDenoteRequiredField%></td>
	</tr>
	
	<tr><td  colspan='4'>&nbsp;</td></tr>
	
    <tr>
		<td></td>
		<td><span id='spnSuffix' runat='server'/></td>
		<td><span id='spnTitle' runat='server'/></td>
        <td>
        <!--
        <span id='spnNickName' runat='server'/>
        -->
        </td>
	</tr>
	<tr>		
		<td></td>
		<td>Suffix</td>
		<td>Position/Title<%=kDenoteRequiredField%></td>	
        <td></td>
	</tr>
    <tr><td  colspan='4'>&nbsp;</td></tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><strong>Applicant Category</strong><%=kDenoteRequiredField%></td>
		<td colspan='3'>(Choose from one of the following):</td>
	</tr>
	<tr>
		<td></td>
		<td colspan='3'><span id='spnApplicantCategory' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr align='center'>
		<td>
			<span runat='server' id='spnSave'/>&nbsp;<span runat="server" id='spnClose'/>
		</td>
	</tr>
</table>


<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ModifyUser' Update='True' Create='False'/>
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
						Size='25'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='You must provide a first name.'>
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
						ErrorMessage='You must provide a last name.'>
					</Control>
				</DisplayProperty>																		
				<DisplayProperty PropertyKey='NickName'>
					<Control ID='ctlNickName'
						Container='spnNickName'
						Type='cTextBox'
						Size='25'
						MaxLength='50'>
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
<!--				<DisplayProperty PropertyKey='Title'>
					<Control ID='ctlTitle'
						Container='spnTitle'
						Type='cDropDown'
						DataObjectDefinitionKey='AdditionalContactRole'
						StoredValue='AdditionalContactRoleID'
						DisplayText='Select'
						DisplayValue='Description'>
						<Sort>
                            <Argument PropertyKey='SortOrder'/>
                        </Sort>
					</Control>
				</DisplayProperty>-->
				<!--
				<DisplayProperty PropertyKey='Title'>
					<Control ID='ctlTitle'
						Container='spnTitle'
						Type='cTextBox'
						Size='25'
						MaxLength='75'>
					</Control>
				</DisplayProperty>
				-->
			</DisplayProperties>
		</DataObject><!-- Key='Person' -->

		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryOrganization.OrganizationName'>
					<Control ID='spnOrgName' 
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>			
			</DisplayProperties>
		</DataObject>

		<DataObject Key='PersonOrganizationAffiliation' DataObjectDefinitionKey='PersonOrganizationAffiliation' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Title'>
					<Control ID='ctlTitle'
						Container='spnTitle'
						Type='cTextBox'
						MaxLength='50'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscGranteeProjectInfo' DataObjectDefinitionKey='LscGranteeProjectInfo' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='CreateUser' Update='False' Create='True' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ModifyUser' Update='True' Create='False' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ApplicantCategoryID'>
					<Control ID='ctlApplicantCategory'
						Container='spnApplicantCategory'
						Type='cRadioButtonList'
						DataObjectDefinitionKey='ApplicantCategory'
						StoredValue='ApplicantCategoryID'
						DisplayValue='Description'
						RepeatDirection='Vertical'
						RepeatColumns='0'>
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
		</DataObject>
		
	</ModuleSection>
</span>


<!-- End Embedded XML -->