<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server'/>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<span id='spnPageContent' runat='server'/>
<p>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Applicant Information</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td	valign="top" width='23%'><b><%=GetLabel("Organization")%></b>&nbsp;<font color='red'>*</font></td>
		<td width='20%' colspan='3'><span id='spnOrgSelectLauncher' runat='server'/></td>
		<td width='30%'>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top"><b>Title</b>&nbsp;<font color='red'>*</font></td>
		<td><span id='spnTitle' runat='server'/></td>
		<td width='13%'>&nbsp;</td>
		<td><span id='spnAwardTitle' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Current</td>
		<td>&nbsp;</td>
		<td>at Award Activation</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top"><b>Academic Position</b>&nbsp;<font color='red'>*</font></td>
		<td><span id='spnCurrentAcademicPosition' runat='server'/></td>
		<td>&nbsp;</td>
		<td><span id='spnAwardAcademicPosition' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Current</td>
		<td>&nbsp;</td>
		<td>at Award Activation</td>
	</tr>

	<tr><td>&nbsp;</td></tr>
	<tr visible='false' runat='server'>
		<td	valign="top"><b>Career Stage</b>&nbsp;<font color='red'>*</font></td>
		<td colspan='3'><span id='spnCareerStage' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td colspan='3'><b>First full-time faculty/staff appointment:</b>&nbsp;<font color='red'>*</font></td>
		<td><span id='spnFirstAppointment' runat='server'/></td>
	</tr>
	<tr>
		<td colspan='3'>&nbsp;</td>
		<td>MM/DD/YYYY</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td colspan='3'><b>First full-time faculty/staff appointment as assistant professor (or equivalent) level:</b>&nbsp;<font color='red'>*</font></td>
		<td><span id='spnAssistFirstAppt' runat='server'/></td>
	</tr>
	<tr>
		<td colspan='3'>&nbsp;</td>
		<td>MM/DD/YYYY</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Postdoctoral Training or Experience</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td nowrap><b>Number of Years</b>&nbsp;<font color='red'>*</font></td>
		<td colspan='3'><span id='spnYears' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td nowrap><b>Number of Months</b>&nbsp;<font color='red'>*</font></td>
		<td colspan='3'><span id='spnMonths' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>			
</table>



	
	<span id='spnPIContactInfoText' runat='server' visible='false'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top"><b>1st Doctoral Degree</b></td>
		<td><span id='spnY1DoctoralDegree' runat='server'/></td>
		<td colspan='2'><b>Date Earned</b>&nbsp;&nbsp;<span id='spnY1DoctoralDegreeDateEarned' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top"><b>Specialty (1st degree)</b></td>
		<td colspan='3'><span id='spnY1SpecialtyDegree' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top"><b>2nd Doctoral Degree</b></td>
		<td><span id='spnY2DoctoralDegree' runat='server'/></td>
		<td colspan='2'><b>Date Earned</b>&nbsp;&nbsp;<span id='spnY2DoctoralDegreeDateEarned' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top"><b>Specialty (2nd degree)</b></td>
		<td colspan='3'><span id='spnY2SpecialtyDegree' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top" colspan='4'><b>If you have not received a doctoral degree, please indicate the following:</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'><b>Date of actual or expected completion of required course work:</b></td>
		<td>&nbsp;</td>
		<td><span id='spnCourseCompletionDate' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'><b>Date of actual or expected admission to doctoral degree candidacy:</b></td>
		<td>&nbsp;</td>
		<td><span id='spnDegreeAdmissionDate' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Country of Citizenship</b>&nbsp;<font color='red'>*</font></td>
		<td colspan='3'><span id='spnCountryCitizenship' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td><b>Immigration (Status/Visa)</b>&nbsp;<font color='red'>*</font></td>
		<td colspan='3'><span id='spnImmigrationStatusVisa' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td colspan='4'>Please indicate the length of postdoctoral research training or experience 
		(including clinical training - internship and residency) as of award activation date.  Enter 
		zero if you do not have any research training or experience.</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td><b>Number of Years - Research</b>&nbsp;<font color='red'>*</font></td>
		<td colspan='3'><span id='spnResearchYears' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td><b>Number of Months - Research</b>&nbsp;<font color='red'>*</font></td>
		<td colspan='3'><span id='spnResearchMonths' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td><b>Number of Years - Clinical</b>&nbsp;<font color='red'>*</font></td>
		<td colspan='3'><span id='spnClinicalYears' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td><b>Number of Months - Clinical</b>&nbsp;<font color='red'>*</font></td>
		<td colspan='3'><span id='spnClinicalMonths' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	
	</span>	




<table width='100%' border='0'>	
	<tr>
		<td align='center'>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;
			<span runat='server' id='spnSave_and_Continue'/>&nbsp;&nbsp;
			<span runat='server' id='spnClose'/> 
		</td>
	</tr>
</table>


<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		
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
					ErrorMessage='~~Organization~~ is required.'/>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		
			<DataObject Key='GranteeProjectPI' DataObjectDefinitionKey='GranteeProjectPI' Updatable='True' CreateNew='True'>
				<Filters>
					<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
					<Argument Type='Data' TypeKey='' PropertyKey='PITypeID' Value='1'/>
				</Filters>
				<DefaultValues>
					<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
					<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
					<Argument Type='' TypeKey='' PropertyKey='PITypeID' Value='1'/>
				</DefaultValues>
				<DisplayProperties>
					<!-- <DisplayProperty PropertyKey='Organization.OrganizationName'>
						<Control ID='ctlOrgSelectLauncher' 
						Type='cOrgSelectLauncherNotInList'
						Container='spnOrgSelectLauncher'
						HiddenValueKey='OrganizationID'
						DataObjectDefinitionKey='Organization'
						StoredValue='OrganizationID'
						DisplayValue='OrganizationName'
						RequiredField='True'
						ErrorMessage='You must indicate an Institution.'/>
					</DisplayProperty>	-->
					<DisplayProperty PropertyKey='Title'>
						<Control ID='ctlTitle'
							Container='spnTitle'
							Type='cTextBox'
							Size='20'
							MaxLength='100'
							RequiredField='True'
							ErrorMessage='Current Title is required.'>
						</Control>
					</DisplayProperty>	
					<DisplayProperty PropertyKey='AwardTitle'>
						<Control ID='ctlAwardTitle'
							Container='spnAwardTitle'
							Type='cTextBox'
							Size='20'
							MaxLength='100'
							RequiredField='True'
							ErrorMessage='Title at Award Activation is required.'>
						</Control>
					</DisplayProperty>	
					<DisplayProperty PropertyKey='CurrentAcademicPositionID'>
						<Control ID='ctlCurrentAcademicPosition'
							Container='spnCurrentAcademicPosition'
							Type='cDropDown'
							DataObjectDefinitionKey='AcademicPosition'
							StoredValue='AcademicPositionID'
							DisplayValue='AcademicPositionDesc'
							RequiredField='True'
							ErrorMessage='Current Academic Position is required.'>
							<Sort>
							    <Argument PropertyKey='SortOrder' />
						    </Sort>
						</Control>	
					</DisplayProperty>	
					<DisplayProperty PropertyKey='AwardAcademicPositionID'>
						<Control ID='ctlAwardAcademicPosition'
							Container='spnAwardAcademicPosition'
							Type='cDropDown'
							DataObjectDefinitionKey='AcademicPosition'
							StoredValue='AcademicPositionID'
							DisplayValue='AcademicPositionDesc'
							RequiredField='False'
							ErrorMessage='Academic Position at Award Activation is required.'>
							<Sort>
							    <Argument PropertyKey='SortOrder' />
						    </Sort>
						</Control>	
					</DisplayProperty>	
					<!-- <DisplayProperty PropertyKey='CareerStageID'>
						<Control ID='ctlCareerStage'
							Container='spnCareerStage'
							Type='cDropDown'
							DataObjectDefinitionKey='CareerStage'
							StoredValue='CareerStageID'
							DisplayValue='Description'
							RequiredField='True'
							ErrorMessage='You must select a Career Stage.'>
						</Control>	
					</DisplayProperty> -->
					<DisplayProperty PropertyKey='FacultyAppointmentStartDate'>
						<Control ID='ctlFirstAppointment'
							Container='spnFirstAppointment'
							Type='cDateTextBox'
							Size='10'
							MaxLength='10'
							Calendar='True'
							DateFormat='MM/dd/yyyy'
							RequiredField='True'
							ErrorMessage='Date of your First full-time faculty/staff appointment is required.'>
						</Control>
					</DisplayProperty>	
					<DisplayProperty PropertyKey='AssistantApptDate'>
						<Control ID='ctlAssistFirstAppt'
							Container='spnAssistFirstAppt'
							Type='cDateTextBox'
							Size='10'
							MaxLength='10'
							Calendar='True'
							DateFormat='MM/dd/yyyy'
							RequiredField='True'
							ErrorMessage='Date of your First full-time faculty/staff appointment as an assistant professor (or equivalent) level is required.'>
						</Control>
					</DisplayProperty>			
					<!-- 
					<DisplayProperty PropertyKey='Y1DoctoralDegreeID'>
						<Control ID='ctlY1DoctoralDegree'
							Container='spnY1DoctoralDegree'
							Type='cDropDown'
							DataObjectDefinitionKey='DoctoralDegree'
							StoredValue='DoctoralDegreeID'
							DisplayValue='DoctoralDegreeDesc'>
						</Control>	
					</DisplayProperty>	
					<DisplayProperty PropertyKey='Y1DoctoralDegreeDateEarned'>
						<Control ID='ctlY1DoctoralDegreeDateEarned'
							Container='spnY1DoctoralDegreeDateEarned'
							Type='cDateTextBox'
							Calendar='True'
							DateFormat='MM/dd/yyyy'
							Size='25'
							MaxLength='10'>
						</Control>
					</DisplayProperty>		
					<DisplayProperty PropertyKey='Y1SpecialtyDegreeID'>
						<Control ID='ctlY1SpecialtyDegree'
							Container='spnY1SpecialtyDegree'
							Type='cDropDown'
							DataObjectDefinitionKey='SpecialtyDegree'
							StoredValue='SpecialtyDegreeID'
							DisplayValue='SpecialtyDegreeDesc'>
						</Control>	
					</DisplayProperty>					
					<DisplayProperty PropertyKey='Y2DoctoralDegreeID'>
						<Control ID='ctlY2DoctoralDegree'
							Container='spnY2DoctoralDegree'
							Type='cDropDown'
							DataObjectDefinitionKey='DoctoralDegree'
							StoredValue='DoctoralDegreeID'
							DisplayValue='DoctoralDegreeDesc'>
						</Control>	
					</DisplayProperty>
					<DisplayProperty PropertyKey='Y2DoctoralDegreeDateEarned'>
						<Control ID='ctlY2DoctoralDegreeDateEarned'
							Container='spnY2DoctoralDegreeDateEarned'
							Type='cDateTextBox'
							Calendar='True'
							DateFormat='MM/dd/yyyy'
							Size='25'
							MaxLength='10'>
						</Control>
					</DisplayProperty>			
					<DisplayProperty PropertyKey='Y2SpecialtyDegreeID'>
						<Control ID='ctlY2SpecialtyDegree'
							Container='spnY2SpecialtyDegree'
							Type='cDropDown'
							DataObjectDefinitionKey='SpecialtyDegree'
							StoredValue='SpecialtyDegreeID'
							DisplayValue='SpecialtyDegreeDesc'>
						</Control>	
					</DisplayProperty>					
					<DisplayProperty PropertyKey='CourseCompletionDate'>
						<Control ID='ctlCourseCompletionDate'
							Container='spnCourseCompletionDate'
							Type='cDateTextBox'
							Calendar='True'
							DateFormat='MM/dd/yyyy'
							Size='25'
							MaxLength='10'>
						</Control>
					</DisplayProperty>		
					<DisplayProperty PropertyKey='DegreeAdmissionDate'>
						<Control ID='ctlDegreeAdmissionDate'
							Container='spnDegreeAdmissionDate'
							Type='cDateTextBox'
							Calendar='True'
							DateFormat='MM/dd/yyyy'
							Size='25'
							MaxLength='10'>
						</Control>
					</DisplayProperty>		
					<DisplayProperty PropertyKey='CountryID'>
						<Control ID='ctlCountryCitizenship'
							Container='spnCountryCitizenship'
							Type='cDropDown'
							DataObjectDefinitionKey='Country'
							StoredValue='CountryID'
							DisplayValue='CountryDesc'
							DisplayNone='True'
							RequiredField='True'
							ErrorMessage='You must select a Country of Citizenship.'>
							<Filters>
							</Filters>
							<Sort>
								<Argument PropertyKey='SequenceNumber'/>
							</Sort>
						</Control>	
					</DisplayProperty>	
					<DisplayProperty PropertyKey='ImmigrationID'>
						<Control ID='ctlImmigrationStatusVisa'
							Container='spnImmigrationStatusVisa'
							Type='cDropDown'
							DataObjectDefinitionKey='Immigration'
							StoredValue='ImmigrationID'
							DisplayValue='ImmigrationDesc'
							DisplayNone='True'
							RequiredField='True'
							ErrorMessage='You must select an Immigration Status/Visa.'>
							<Filters>
							</Filters>
						</Control>	
					</DisplayProperty>	
					-->
					<DisplayProperty PropertyKey='ResearchYears'>
						<Control ID='ctlYears'
							Container='spnYears'
							Type='cTextBox'
							Size='2'
							MaxLength='2'
							RequiredField='True'
							ErrorMessage='Number of Years of Postdoctoral Experience or Training is required. (Enter whole numbers).'>
							<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{1,}\s?$' ErrorMessage='Enter whole numbers only for Number of Years of Postdoctoral Experience or Training.' />
						</Control>
					</DisplayProperty>	
					<DisplayProperty PropertyKey='ResearchMonths'>
						<Control ID='ctlMonths'
							Container='spnMonths'
							Type='cTextBox'
							Size='2'
							MaxLength='2'
							RequiredField='True'
							ErrorMessage='Number of Months of Postdoctoral Experience or Training is required. (Enter whole numbers).'>
							<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{1,12}\s?$' ErrorMessage='Enter whole numbers only for Number of Months of Postdoctoral Experience or Training.' />
						</Control>
					</DisplayProperty>	
					
					<!--
					<DisplayProperty PropertyKey='ClinicalYears'>
						<Control ID='ctlClinicalYears'
							Container='spnClinicalYears'
							Type='cTextBox'
							Size='2'
							MaxLength='4'
							RequiredField='True'
							ErrorMessage='You must enter Number of Years - Clinical.'>
						</Control>
					</DisplayProperty>	
					<DisplayProperty PropertyKey='ClinicalMonths'>
						<Control ID='ctlClinicalMonths'
							Container='spnClinicalMonths'
							Type='cTextBox'
							Size='2'
							MaxLength='4'
							RequiredField='True'
							ErrorMessage='You must enter Number of Months - Clinical.'>
						</Control>
					</DisplayProperty>	
					-->
					
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
								AutoSave='True'/>
						</Control>
					</DisplayProperty>			
					<DisplayProperty PropertyKey=''>
						<Control ID='btnSave_and_Continue'
							Container='spnSave_and_Continue'
							Type='cButton' GoToNextPage='True' >
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
									<Argument AttributeName='PageKey' Value='Main'/>
								</Parameters>
							</Action>
						</Control>
					</DisplayProperty>
				</DisplayProperties>
			</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
