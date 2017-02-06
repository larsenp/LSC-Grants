<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cProjectInfo_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' />

<asp:CustomValidator 
	id='valAccredited'
	runat='server'
	OnServerValidate='ValidateAccredited'
	ErrorMessage='Animal Subjects is required.'
	Display='None'/>
<asp:CustomValidator 
	id='valCurrentAssurance'
	runat='server'
	OnServerValidate='ValidateCurrentAssurance'
	ErrorMessage='Animal Subjects is required.'
	Display='None'/>
<asp:CustomValidator 
	id='valPercentAreas'
	runat='server'
	OnServerValidate='ValidatePercentAreas'
	ErrorMessage=''
	Display='None'/>	
<asp:CustomValidator 
	id='valApplicationID'
	runat='server'
	OnServerValidate='ValidateApplicationID'
	ErrorMessage='Application ID is required when resubmission is yes.'
	Display='None'/>		
	

<!-- Page Content - Controls -->
<font color='red'><span id='spnLabel' visible='false' runat='server'>Total percentage cannot exceed 100%.</span></font>


<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Project Information</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>



<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td width='15%' nowrap='true'><b>Is this a resubmission?</b>&nbsp;<font color='red'>*</font></td>
		<td width='10%'><span id='spnResubmissionAnswer' runat='server'/></td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td width='28%' nowrap='true'>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td nowrap='true' valign='top'><b>Project Title</b>&nbsp;<font color='red'>*</font></td>
		<td colspan='4'><span id='spnProjectTitle' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td><td colspan='4'>(Enter a maximum of 50 characters)</td></tr>  
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td nowrap='true' valign='top'><b>Project Summary</b>&nbsp;<font color='red'>*</font></td>
		<td colspan='4'><span id='spnProjectSummary' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td><td colspan='4'>(Enter a maximum of 500 characters)</td></tr>  
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='5'>
			<table width='100%' border='0' cellpadding='0' cellspacing='0'>
				<tr>
					<td width='45%' nowrap='true'><b>Please indicate the percentage of time you will be devoted to this project:</b>&nbsp;<font color='red'>*</font></td>
					<td id='tdPerTimeDevoted' runat='server'><span id='spnPerTimeDevoted' runat='server'/>&nbsp;%</td>
				</tr>
			</table>
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'><b>Indicate the percent of time you spend on the following  (The total of percentages must equal 100%):</b>&nbsp;<font color='red'>*</font></td>
	</tr>
	<tr>
		<td colspan='4'><b>All fields are required.  If the item does not apply to your project, enter "0" (zero).</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4' id='tdPercentAreasList' runat='server'><span id='spnPercentAreasList' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr visible='true' runat='server'>
		<td colspan='5'>
			<table width='70%' border='0'>
				<tr>
					<td width='1%'>Total</td>
					<td width='2%' nowrap='true></td>
					<td width='7%'>&nbsp;&nbsp;&nbsp;&nbsp;<span id='spnSumTotal' runat='server'/></td>
					<td visible='false' runat='server'>&nbsp;&nbsp;&nbsp;&nbsp;<asp:label id='lblValidationMessage' forecolor='red' runat='server' /></td>
					
				</tr>
			</table>
		</td>		
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td colspan='4'><b>Please indicate whether your research involves the following:</b>&nbsp;<font color='red'>*</font></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='5'>
			<table width='100%' border='0'>
				<tr>
					<td width='50%'>Recombinant DNA&nbsp;<font color='red'>*</font></td>
					<td colspan='4'><span id='spnIsRecombinantList' runat='server'/></td>
				</tr>
				<tr>
					<td>Biohazards (other than recombinant DNA)&nbsp;<font color='red'>*</font></td>
					<td colspan='4'><span id='spnIsBiohazardsList' runat='server'/></td>
				</tr>
				<tr>
					<td>Human Subjects&nbsp;<font color='red'>*</font></td>
					<td colspan='4'><span id='spnIsHumanSubjectsList' runat='server'/></td>
				</tr>
				<tr>
					<td>Adult human stem cells&nbsp;<font color='red'>*</font></td>
					<td colspan='4'><span id='spnIsAdultStemCellsList' runat='server'/></td>
				</tr>
				<tr>
					<td>Human embryonic or fetal stem cells&nbsp;<font color='red'>*</font></td>
					<td colspan='4'><span id='spnIsFetalStemCellsList' runat='server'/></td>
				</tr>
				<tr>
					<td>Human fetal tissue&nbsp;<font color='red'>*</font></td>
					<td colspan='4'><span id='spnIsFetalTissueList' runat='server'/></td>
				</tr>
				<tr>
					<td>Cloning&nbsp;<font color='red'>*</font></td>
					<td colspan='4'><span id='spnIsCloningList' runat='server'/></td>
				</tr>
				<tr>
					<td>Animal Subjects&nbsp;<font color='red'>*</font></td>
					<td colspan='4'><span id='spnIsAnimalSubjectsList' runat='server'/></td>
				</tr>
				<tr><td colspan='5'>&nbsp;</td></tr>
				<tr>
				    <td><b>If you selected Yes for Animal Subjects, you must answer the questions below.</b></td>
				    <td colspan='4'>&nbsp;</td>
				</tr>
				<tr>
					<td>If using animals, is your <%=GetLabel("Organization")%> accredited by AAALAC?</td>
					<td width='12%'><span id='spnIsAccreditedList' runat='server'/></td>
					<td width='10%'>Effective Date</td>
					<td><span id='spnAccreditedEffectiveDate' runat='server'/></td>
				</tr>
				<tr>
					<td>If using animals, does your <%=GetLabel("Organization")%> have a current PHS Animal Welfare Assurance?</td>
					<td><span id='spnHasCurrentAssuranceList' runat='server'/></td>
					<td>ID Number</td>
					<td><span id='spnIDNumber' runat='server'/></td>
				</tr>

			</table>
		</td>
	</tr>
	
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr runat='server' visible='false'>
		<td align='center' colspan='5'>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSave_and_Continue'/>&nbsp;&nbsp;
		</td>
	</tr>
</table>



<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value='' />
			</Filters>
			<DisplayProperties>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='PrevWfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PrevWfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value='' />
			</Filters>
			<DisplayProperties>
			</DisplayProperties>
		</DataObject>


	<!--	<DataObject Key='PrevGranteeProjectInfo' DataObjectDefinitionKey='GranteeProjectInfo'>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='PrevWfTaskAssignment' 
					DataObjectPropertyKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID'/>
			</Filters>
			<DisplayProperties>
			</DisplayProperties>
		</DataObject>
-->
					
		<DataObject Key='GranteeProjectInfo' DataObjectDefinitionKey='GranteeProjectInfo' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool=''/>
				<Argument Type='DataObjectCollection' 
					TypeKey='PrevWfTaskAssignment' 
					DataObjectPropertyKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID'
					Bool='Or'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ResubmissionAnswerID'>
					<Control ID='ctlResubmissionAnswer'
						Container='spnResubmissionAnswer'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Resubmission question is required.'>
						<Parameters>
							<Parameter StoredValue='1' DisplayValue='Yes'/>
							<Parameter StoredValue='0' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProjectTitle'>
					<Control ID='ctlProjectTitle'
						Type='cTextBox'
						Container='spnProjectTitle'
						Size='30'
						MaxLength='50'
						TooLongMessage='Limit your Project Title to 50 characters.'
						RequiredField='True'
						ErrorMessage='Project Title is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlProjectSummary'
						Container='spnProjectSummary'
						Type='cTextArea'
						Rows='5'
						Cols='70'
						MaxLength='500'
						TooLongMessage='Limit your Project Summary to 500 characters or less, including spaces and punctuation.'
						RequiredField='True'
						ErrorMessage='Project Summary is required.'>
					</Control>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='PercentageTimeDevoted'>
					<Control ID='ctlPerTimeDevoted'
						Type='cTextBox'
						Container='spnPerTimeDevoted'
						Size='4'
						MaxLength='3'
						RequiredField='True'
						ErrorMessage='Percent Time Devoted is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{1,13}\s?$' ErrorMessage='Enter only digits (no other characters) for percentage of time you be devoted to this project.' />
					</Control>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='IsRecombinant'>
					<Control ID='ctlIsRecombinantList'
						Container='spnIsRecombinantList'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DisplayNone='True'
						RequiredField='True'
						ErrorMessage='Recombinant DNA research question is required.'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsBiohazards'>
					<Control ID='ctlIsBiohazardsList'
						Container='spnIsBiohazardsList'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DisplayNone='True'
						RequiredField='True'
						ErrorMessage='Biohazards research question is required.'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='IsHumanSubjects'>
					<Control ID='ctlIsHumanSubjectsList'
						Container='spnIsHumanSubjectsList'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DisplayNone='True'
						RequiredField='True'
						ErrorMessage='Human Subjects research question is required.'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='IsAdultStemCells'>
					<Control ID='ctlIsAdultStemCellsList'
						Container='spnIsAdultStemCellsList'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DisplayNone='True'
						RequiredField='True'
						ErrorMessage='Adult Stem Cells research question is required.'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='IsFetalStemCells'>
					<Control ID='ctlIsFetalStemCellsList'
						Container='spnIsFetalStemCellsList'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DisplayNone='True'
						RequiredField='True'
						ErrorMessage='Fetal Stem Cells research question is required.'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='IsFetalTissue'>
					<Control ID='ctlIsFetalTissueList'
						Container='spnIsFetalTissueList'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DisplayNone='True'
						RequiredField='True'
						ErrorMessage='Fetal Tissue research question is required.'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsCloning'>
					<Control ID='ctlIsCloningList'
						Container='spnIsCloningList'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DisplayNone='True'
						RequiredField='True'
						ErrorMessage='Cloning research question is required.'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsAnimalSubjects'>
					<Control ID='ctlIsAnimalSubjectsList'
						Container='spnIsAnimalSubjectsList'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DisplayNone='True'
						RequiredField='True'
						ErrorMessage='Animal Subjects research question is required.'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='IsAccredited'>
					<Control ID='ctlIsAccreditedList'
						Container='spnIsAccreditedList'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DisplayNone='True'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='HasCurrentAssurance'>
					<Control ID='ctlIHasCurrentAssuranceList'
						Container='spnHasCurrentAssuranceList'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DisplayNone='True'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AccreditedEffectiveDate'>
					<Control ID='ctlAccreditedEffectiveDate'
						Type='cDateTextBox'
						Container='spnAccreditedEffectiveDate'
						Size='10'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='IDNumber'>
					<Control ID='ctlIDNumber'
						Type='cTextBox'
						Container='spnIDNumber'
						Size='10'
						MaxLength='12'>
					</Control>
				</DisplayProperty>																
			</DisplayProperties>
		</DataObject>
				
		<DataObject Key='PercentAreas' DataObjectDefinitionKey='PercentAreas'>
			<Filters>
			</Filters>
			<Sort>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPercentAreasList' Container='spnPercentAreasList' Type='cDataPresenterList' DataPresenterID='DPL' DataPresenterURL='Easygrants/Controls/PageSection/PercentAreas_List.ascx' />
				</DisplayProperty>													
			</DisplayProperties>
		</DataObject>		
		
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlSumTotal'
						Container='spnSumTotal'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>																																					
			</DisplayProperties>
		</DataObject>	

	</ModuleSection>
</span>
<!-- End Embedded XML -->
