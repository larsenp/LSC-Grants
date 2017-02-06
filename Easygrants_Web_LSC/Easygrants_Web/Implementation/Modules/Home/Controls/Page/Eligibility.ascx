<%@ Control Language="vb" AutoEventWireup="true" Codebehind="Eligibility.ascx.vb" Inherits="Easygrants_Web.Modules.Home.Controls.Page.cEligibility" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->

<!-- Page Content - Controls -->
<table runat='server' width='100%'>
	<tr>
		<td colspan='2'>
			The Early Career Translational Research Awards in Biomedical Engineering are designed to support 
			biomedical engineering research that is translational in nature, and to encourage and assist 
			eligible biomedical engineering investigators as they establish themselves in academic research 
			careers that involve translational research. 				
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			Answer each question below to determine your eligibility for the Early Career Translational Research Award.
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			All information is required.  Once all questions have been answered:
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<ul>
				<li>Click the <b>Submit</b> button to submit your information.</li>
			</ul>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellpadding='0' cellspacing='0' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Early Career Translational Research Award Eligibility</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>

	<tr>
		<td width="20%"><b>Name</b></td>
		<td><span id='ctlName' runat='server' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	
	<tr>
		<td width="20%"><b><%=GetLabel("Organization")%></b></td>
		<td><span id='ctlOrganization' runat='server' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>

	<tr>
		<td colspan="4">Are you a full-time tenure-track or equivalent faculty member?</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4"><span id='spnIsTenure' runat='server' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>

	<tr>
		<td colspan="4">
			Is your primary appointment in a Biomedical Engineering Department (or other similarly-constituted, 
			permanently-established biomedical/bio-engineering academic program)?  At least 50% of your salary must 
			come from the department in order for it to be your primary appointment.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4"><span id='spnIsBiomedical' runat='server' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4">If no, list your primary appointment.</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4"><span id='spnPrimaryDepartment' runat='server' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>

	<tr>
		<td colspan="4">In what year did you receive your doctoral degree? Enter the year only, e.g., 2000.</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4"><span id='spnDegreeYear' runat='server' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>

	<tr>
		<td colspan="4">What is your current academic rank?  Chose your rank from the drop-down list.</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4"><span id='spnRankType' runat='server' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>		
	<tr>
		<td align='center'>
			<span runat='server' id='spnSubmit'/>
		</td>
		<td align='center'>
			<span runat='server' id='spnCancel'/>			
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

		<DataObject Key='WfProject' DataObjectDefinitionKey='WfProject'>
			<Filters>
				<Argument Type='CurrentDateTime' TypeKey='Date' 
					Operator='LessThanEqual' PropertyKey='StartDate'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' 
					Operator='GreaterThanEqual' PropertyKey='EndDate'/>
				<Argument Type='' TypeKey='' PropertyKey='ProjectTypeID' Value='1'/>
			</Filters>
		</DataObject>

		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' 
					PropertyKey='PersonID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='LastNameFirstName'>
					<Control ID='ctlName' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PersonPrimaryAffiliation.Organization.CommonOrganizationName'>
					<Control ID='ctlOrganization' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='PersonEligibility' DataObjectDefinitionKey='PersonEligibility' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='EligibilityStatusID' Value='0'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='IsTenure'>
					<Control ID='ctlIsTenure'
						Container='spnIsTenure'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Faculty member question is required.'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsBiomedical'>
					<Control ID='ctlIsBiomedical'
						Container='spnIsBiomedical'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Primary appointment question is required.'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
						<Validation Type='Custom' Object='EventController' Method='ValidatePrimaryDepartment' 
							ErrorMessage='Primary appointment is required.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryDepartment'>
					<Control ID='ctlPrimaryDepartment'
						Container='spnPrimaryDepartment'
						Type='cTextBox'
						Size='50'
						MaxLength='250'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DegreeYear'>
					<Control ID='ctlDegreeYear'
						Container='spnDegreeYear'
						Type='cTextBox'
						Size='10'
						MaxLength='4'
						RequiredField='True'
						ErrorMessage='Doctoral degree year is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='RankTypeID'>
					<Control ID='ctlRankType'
						Container='spnRankType'
						Type='cDropDown'
						DataObjectDefinitionKey='FacultyRankType'
						StoredValue='FacultyRankTypeID'
						DisplayValue='Abbr'
						RequiredField='True'
						ErrorMessage='You must choose a Rank.'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort> 
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit'
						Container='spnSubmit'
						Type='cButton'
						Image='Submit'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='Submit'>
							<Parameters>
								<!--
								<Argument Type='Object' ObjectType = 'DataObject' ObjectKey='WfProject' />
								<Argument Type='Control' TypeKey = 'ctlWfProject' ControlPropertyKey='SelectedValue' Value='' />
								<Argument Type='Control' TypeKey = 'ctlGrantTitle' ControlPropertyKey='Value' Value='' />
								-->
								<Argument Type='' TypeKey = '' Value='Home' />
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument Value='Home'/>
									<Argument Type='DataObject' TypeKey='WfProjectID' AttributeName='WfProjectID' BaseValue='WfProjectID=' Value=''/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' Value=''/>
								</Parameters>						
						</Action>
					</Control>	
				</DisplayProperty>		
			</DisplayProperties>
		</DataObject>
	</ModuleSection>	
</span>
<!-- End Embedded XML -->
