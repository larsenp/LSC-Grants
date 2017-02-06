<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cEducation_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="AddressEditorb.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' />
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<br>
	Please fill out the Education information below.   All fields marked with an asterisk (<font color='red'>*</font>) are required. 
	<ul>
		<li>Click <b>Save</b> to save the information and return to the main Education page.</li>   
		<li>Click <b>Close</b> to close the Education Editor without saving your entry.</li>
	</ul>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server' ID="Table1">
	<tr>
		<td width='100%' colspan="3" class="SeparatorHdg"><b>Education Editor</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='80%'>
	<tr>
		<td width='15%' nowrap='true'><b>Educational Level</b>&nbsp;<font size='2' color='red'>*</font></td>
		<td colspan='3'><span id='spnEducationalLevel' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Degree</b>&nbsp;<font size='2' color='red'>*</font></td>
		<td><span id='spnDoctoralDegree' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top"><b><%=GetLabel("Organization")%></b>&nbsp;<font color='red'>*</font></td>
		<td><span id='spnOrgSelectLauncher' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td nowrap='true' valign='top'><b>Dates Attended</b>&nbsp;<font size='2' color='red'>*</font></td>
		<td>
			<table width='100%' border='0'>
				<tr>
					<td width='35%' nowrap='true'><span id='spnAttendedStartDate' runat='server'/></td>
					<td width='1%' nowrap='true'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td width='7%' nowrap='true'><b>to</b></td>
					<td nowrap='true'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id='spnAttendedEndDate' runat='server'/></td>
				</tr>
				<tr>
					<td width='35%' class='FieldLabel' nowrap='true'>Start Date</td>
					<td width='1%' nowrap='true'>&nbsp;</td>
					<td width='7%' nowrap='true'>&nbsp;</td>
					<td class='FieldLabel' nowrap='true'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;End Date</td>
				</tr>
				<tr>
					<td width='35%' class='FieldLabel' nowrap='true'>MM/DD/YYYY</td>
					<td width='1%' nowrap='true'>&nbsp;</td>
					<td width='7%' nowrap='true'>&nbsp;</td>
					<td class='FieldLabel' nowrap='true'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MM/DD/YYYY</td>
				</tr>				
			</table>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Conferred Date</b>&nbsp;<font size='2' color='red'>*</font></td>
		<td><span id='spnConferredDate' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class='FieldLabel'>MM/DD/YYYY</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top"><b>Field of Study</b>&nbsp;<font color='red'>*</font></td>
		<td><span id='spnFieldOfStudy' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnClose'/>		
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='Education' DataObjectDefinitionKey='Education' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='EducationID'
					PropertyKey='EducationID'
					Value='' 
					bool=''/>
				<Argument Type='ModuleUser' 
					TypeKey='PersonID' 
					PropertyKey='PersonID' 
					Value=''/>
				<Argument Type='ModuleUser' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' />
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</DefaultValues>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='EducationalLevelID'>
					<Control ID='ctlEducationalLevel'
						Container='spnEducationalLevel'
						Type='cDropDown'
						DataObjectDefinitionKey='EducationalLevel'
						StoredValue='EducationalLevelID'
						DisplayValue='EducationalLevelDesc'	
						RequiredField='True'
						ErrorMessage='Educational Level is required.'>
						<Sort>
							<Argument PropertyKey='EducationalLevelDesc' />
						</Sort>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DoctoralDegreeID'>
					<Control ID='ctlDoctoralDegree'
						Container='spnDoctoralDegree'
						Type='cDropDown'
						DataObjectDefinitionKey='Degree'
						StoredValue='DegreeID'
						DisplayValue='DegreeAbbr'	
						RequiredField='True'
						ErrorMessage='Degree is required.'>
						<Sort>
							<Argument PropertyKey='DegreeAbbr'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Organization.CommonOrganizationName'>
					<Control ID='ctlOrgSelectLauncher' 
					Type='cOrgSelectLauncherNotInList'
					Container='spnOrgSelectLauncher'
					HiddenValueKey='OrganizationID'
					DataObjectDefinitionKey='Organization'
					StoredValue='OrganizationID'
					DisplayValue='CommonOrganizationName'
					RequiredField='True'
					ErrorMessage='~~Organization~~ is required.'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='AttendedStartDate'>
					<Control ID='ctlAttendedStartDate'
						Container='spnAttendedStartDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='The Attended Start Date entered is invalid or not formatted properly.'
						Size='10'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='Attended Start Date is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='AttendedEndDate'>
					<Control ID='ctlAttendedEndDate'
						Container='spnAttendedEndDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='The Attended End Date entered is invalid or not formatted properly.'
						Size='10'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='Attended End Date is required.'>
					</Control>
				</DisplayProperty>																		
				<DisplayProperty PropertyKey='ConferredDate'>
					<Control ID='ctlConferredDate'
						Type='cDateTextBox'
						Container='spnConferredDate'
						Size='10'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='The Conferred Date entered is invalid or not formatted properly.'
						RequiredField='True'
						ErrorMessage='=Conferred Date is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FieldOfStudy'>
					<Control ID='ctlFieldOfStudy'
						Container='spnFieldOfStudy'
						Type='cTextBox'
						Size='25'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Field of Study is required.'>
					</Control>
				</DisplayProperty>																													
			</DisplayProperties>
		</DataObject>
		
					
	<!-- Save and Cancel buttons -->
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
							Object='DataPresenter'
							Method='Save'/>
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
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Education'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>								



	</ModuleSection>
<!-- End Embedded XML -->
</span>

