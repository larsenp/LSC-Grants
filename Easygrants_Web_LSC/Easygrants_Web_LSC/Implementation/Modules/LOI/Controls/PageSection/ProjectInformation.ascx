<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br>
<span id='spnPageContent' runat='server' />


<table border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
	<tr>
	  <td><h1>Project Information </h1></td>
  </tr>
</table>


<table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
  <tr>
    <td colspan="4" class="SeparatorHdg">Instructions</td>
  </tr>
  <tr>
    <td colspan="4" >&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" ><p>The <strong>Project Information</strong> page allows the applicant to review information about the project including Service Area and Estimated Grant Amount.</p>
      <ul>
        <li>All fields marked with an asterisk (*) are required</li>
        <li>To save the data, click <strong>Save</strong></li>
        <li>To go to the next page, click <strong>Continue</strong></li>
      </ul></td>
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
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
	<tr>
		<td colspan="4" class="SeparatorHdg">Project Details</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
	<tr>
		<td width="432"><b>Service Area</b></td>
		<td width="15">&nbsp;</td>
		<td width="148"><span id='spnSAname' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>		
		<td><strong>Estimated Grant Amount</strong></td>
		<td>&nbsp;</td>
		<td><span id='spnAmount' runat='server'/></td>	
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>	
	<tr>
		 <td><b>Will 25 percent or more of the LSC grant award will be allocated by subgrant,
		 or is a subgrant  proposed for delivering a full range of services to a specific geographic area within 
		 the applicant's service area?</b><%=kDenoteRequiredField%></td>
		 <td>&nbsp;</td>
		 <td><span id='spnAllocatedBySubgrants' runat='server'/></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>	
	<tr>
		<td><b>If you answered 'Yes' to the above, identify the number of subgrants being proposed that meet the above conditions.</b>&nbsp;&nbsp;&nbsp;</td>
		<td>&nbsp;</td>
		<td><span id='spnNumberOfSubgrants' runat='server'/></td>
		<td width="5">&nbsp;</td>
	</tr>	
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr align='center'>
	  <td>&nbsp;</td>
  </tr>
	<tr align='center'>
		<td>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSave_and_Continue'/>
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
			</DisplayProperties>
		</DataObject><!-- Key='Person' -->
		
		<!-- Data Object for Service Area field -->
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='WfProject.WfProjectName'>
					<Control ID='spnSAname' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProject.Fund.FundAmount' Format='$#,##0'>
					<Control ID='spnAmount' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<!-- End Data Object for Service Area field -->
		
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
			<!-- 12/10/07 Sonny added line RequiredField='True' for validation -->
			<DisplayProperties>
				
				<DisplayProperty PropertyKey='AllocatedBySubgrants'>
					<Control ID='ctlAllocatedBySubgrants'
						Container='spnAllocatedBySubgrants'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NumberOfSubgrants'>
					<Control ID='ctlNumberOfSubgrants'
						Container='spnNumberOfSubgrants'
						Type='cTextBox'
						Size='10'
						MaxLength='10'
						>
						>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='100000'
							ErrorMessage='The field "How many phone numbers do you publish for intake in your service area(s)?" must be a whole number, 0 inclusive.'/>
					
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
				
				<ValidationSection Key='ProjectInformation' DisplayName='Project Information' PageKey='ProjectInformation'>
					<ValidationItem Type='Method'>
						<Action
								Object='ModulePage'
								Method='ValidateSubGrants'>
						</Action>
						<Results>
							<Result
								ResultCode='3'
								Message='The number of subgrants is required, if 25% or more of the LSC grant award will be allocated by subgrant.'
								MaxCount='0'/>
						</Results>
					</ValidationItem>
				</ValidationSection>
		
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
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Caption='Continue'
						Save='False'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->