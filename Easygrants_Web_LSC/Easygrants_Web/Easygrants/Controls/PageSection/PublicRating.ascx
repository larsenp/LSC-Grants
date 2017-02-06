<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' Type='cValidationSummary' runat='server'/>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Instructions</b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
Click the <b>View PDF</b> button to view the full application. Adobe Acrobat Reader version 5.x is recommended for optimal viewing of this document. 
<p>
For rating purposes, please select A, B, C, D or F for each sub-section.  Also provide an overall score of A, B, C, D or F for the application.
<p>
Click <b>Save</b> to save your changes, or <b>Close</b> to return to the previous page. See the Reviewer Instructions for more information. 
<p>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Applicant</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td/><td><b>Applicant</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span id='spnApplicantName' runat='server'/></td>
	</tr>
	<tr>
		<td/>
		<td>
			<Core:cUserCtlLoader CtlID='ctlApplicantReportLink' Type='cReportOutputLink' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="ModuleHdg"><b>Research Type/Stage:</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='30%'><b>Is the proposed research translational?</b></td>
		<td><span id='spnResearchTypeTranslational' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>What stage is the research?</b></td>
		<td><span id='spnResearchTypeStage' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>Research Type/Stage Grade</b></td>
		<td><span id='spnResearchTypeRating' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="ModuleHdg"><b>Research Plan/Science:</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>Is the science sound - based on good principles?</b></td>
		<td><span id='spnResearchPlanSound' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>Is the research plan feasible?</b></td>
		<td><span id='spnResearchPlanFeasible' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>Is the research plan appropriate - clearly presented, good models, good statistics?</b></td>
		<td><span id='spnResearchPlanAppropriate' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>Research Plan/Science Grade</b></td>
		<td><span id='spnResearchPlanGrade' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="ModuleHdg"><b>Clinical Impact:</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>If successfully completed, would the research outcome?</b></td>
		<td><span id='spnClinicalImpactOutcome' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>If a product based on this research makes it to clinical use, would it most likely be characterized as</b></td>
		<td><span id='spnClinicalImpactCharacter' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>Clinical Impact Grade</b></td>
		<td><span id='spnClinicalImpactGrade' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="ModuleHdg"><b>Collaboration:</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>Does the application include collaboration with a clinical investigator who interacts with patients?</b></td>
		<td><span id='spnCollaborationClinicalInvestigator' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>Is the collaborating clinical investigator’s involvement in the project substantive? </b></td>
		<td><span id='spnCollaborationSubstantive' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>Does the collaborating clinical investigator possess the requisite experience and skills to contribute effectively to the proposed project?</b></td>
		<td><span id='spnCollaborationExperience' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>Collaboration Grade</b></td>
		<td><span id='spnCollaborationGrade' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="ModuleHdg"><b>Intellectual Property:</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>Regarding the intellectual property associated with this proposal:</b></td>
		<td><span id='spnIntellectual' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>	
	<tr valign='top'>
		<td><b>If no IP activity yet, the IP potential is assessed as:</b></td>
		<td><span id='spnIntellectualPotential' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>If not patentable (e.g., software), is other proprietary protection likely?</b></td>
		<td><span id='spnIntellectualProprietary' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>Intellectual Property Grade</b></td>
		<td><span id='spnIntellectualGrade' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="ModuleHdg"><b>Commercialization Potential:</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>Does the proposed research envision a commercial product?</b></td>
		<td><span id='spnCommercePotentialEnvision' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>What is the stage of the commercialization activity?</b></td>
		<td><span id='spnCommercePotentialStage' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>Do any of the co-PI's have experience with commercial products resulting from their research?</b></td>
		<td><span id='spnCommercePotentialExperience' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>What is the most likely path to commercialization?</b></td>
		<td><span id='spnCommercePotentialPath' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>What is the earliest likely timeframe that a product resulting from this research could make it to market?</b></td>
		<td><span id='spnCommercePotentialTime' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>Commercialization Potential Grade</b></td>
		<td><span id='spnCommercePotentialGrade' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="ModuleHdg"><b>Intangibles:</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>Intangibles Grade</b></td>
		<td><span id='spnIntangibles' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td colspan="4" class="ModuleHdg"><b>Overall:</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>Overall Grade</b></td>
		<td><span id='spnOverallGrade' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
		<tr valign='top'>
		<td><b>Comments</b></td>
		<td><span id='spnOverallComments' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>	
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstName'>
					<Control ID='spnApplicantName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='ReportOutputLink'
								DataObjectPropertyKey='GranteeProject.ApplWfTaskAssignments.WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='ReportOutputLink'
								DataObjectPropertyKey='WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'
								Value=''/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>
			<!--
				<DisplayProperty PropertyKey='ReviewRating'>
					<Control ID='ctlOverallGrade'
						Container='spnOverallGrade'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='You must select an Overall Grade.'>
						<Parameters>
							<Parameter StoredValue='4' DisplayValue='A'/>
							<Parameter StoredValue='3' DisplayValue='B'/>
							<Parameter StoredValue='2' DisplayValue='C'/>
							<Parameter StoredValue='1' DisplayValue='D'/>
							<Parameter StoredValue='0' DisplayValue='F'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			-->
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTaskAssignmentReview' DataObjectDefinitionKey='WfTaskAssignmentReview' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID'
					Value='' 
					bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='TranslationalAnswerID'>
					<Control ID='ctlResearchTypeTranslational'
						Container='spnResearchTypeTranslational'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='False'
						ErrorMessage='Answer is required.'
						DataObjectDefinitionKey='TranslationalAnswer'
						StoredValue='TranslationalAnswerID'
						DisplayValue='Answer'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ResearchStageID'>
					<Control ID='ctlResearchTypeStage'
						Container='spnResearchTypeStage'
						Type='cRadioButtonList'
						RepeatDirection='vertical'
						RepeatColumns='0'
						RequiredField='False'
						ErrorMessage='Stage is required.'
						DataObjectDefinitionKey='ResearchStage'
						StoredValue='ResearchStageID'
						DisplayValue='Stage'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Rating'>
					<Control ID='ctlResearchTypeRating'
						Container='spnResearchTypeRating'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Rating is required.'>
						<Parameters>
							<Parameter StoredValue='A' DisplayValue='A'/>
							<Parameter StoredValue='B' DisplayValue='B'/>
							<Parameter StoredValue='C' DisplayValue='C'/>
							<Parameter StoredValue='D' DisplayValue='D'/>
							<Parameter StoredValue='F' DisplayValue='F'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ResearchPlanSound'>
					<Control ID='ctlResearchPlanSound'
						Container='spnResearchPlanSound'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Sound option is required.'>
						<Parameters>
							<Parameter StoredValue='Yes' DisplayValue='Yes'/>
							<Parameter StoredValue='No' DisplayValue='No'/>
							<Parameter StoredValue='Questionable' DisplayValue='Questionable'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='ResearchPlanFeasible'>
					<Control ID='ctlResearchPlanFeasible'
						Container='spnResearchPlanFeasible'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Feasibility option is required.'>
						<Parameters>
							<Parameter StoredValue='Yes' DisplayValue='Yes'/>
							<Parameter StoredValue='No' DisplayValue='No'/>
							<Parameter StoredValue='Questionable' DisplayValue='Questionable'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='ResearchPlanAppropriate'>
					<Control ID='ctlResearchPlanAppropriate'
						Container='spnResearchPlanAppropriate'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Appropriate option is required.'>
						<Parameters>
							<Parameter StoredValue='Yes' DisplayValue='Yes'/>
							<Parameter StoredValue='No' DisplayValue='No'/>
							<Parameter StoredValue='Questionable' DisplayValue='Questionable'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='ResearchPlanGrade'>
					<Control ID='ctlResearchPlanGrade'
						Container='spnResearchPlanGrade'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Plan Grade is required.'>
						<Parameters>
							<Parameter StoredValue='A' DisplayValue='A'/>
							<Parameter StoredValue='B' DisplayValue='B'/>
							<Parameter StoredValue='C' DisplayValue='C'/>
							<Parameter StoredValue='D' DisplayValue='D'/>
							<Parameter StoredValue='F' DisplayValue='F'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ClinicalImpactOutcome'>
					<Control ID='ctlClinicalImpactOutcome'
						Container='spnClinicalImpactOutcome'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Impact Outcome is required.'>
						<Parameters>
							<Parameter StoredValue='address a significant unmet clinical need' DisplayValue='address a significant unmet clinical need'/>
							<Parameter StoredValue='address an under-met clinical need' DisplayValue='address an under-met clinical need'/>
							<Parameter StoredValue='better address a need that is currently met' DisplayValue='better address a need that is currently met'/>
							<Parameter StoredValue='does not really address an existing clinical need' DisplayValue='does not really address an existing clinical need'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='ClinicalImpactCharacter'>
					<Control ID='ctlClinicalImpactCharacter'
						Container='spnClinicalImpactCharacter'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Clinical Impact Characteristic is required.'>
						<Parameters>
							<Parameter StoredValue='revolutionary' DisplayValue='revolutionary'/>
							<Parameter StoredValue='evolutionary' DisplayValue='evolutionary'/>
							<Parameter StoredValue='generic' DisplayValue='generic'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ClinicalImpactGrade'>
					<Control ID='ctlClinicalImpactGrade'
						Container='spnClinicalImpactGrade'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Clinical Impact Grade is required.'>
						<Parameters>
							<Parameter StoredValue='A' DisplayValue='A'/>
							<Parameter StoredValue='B' DisplayValue='B'/>
							<Parameter StoredValue='C' DisplayValue='C'/>
							<Parameter StoredValue='D' DisplayValue='D'/>
							<Parameter StoredValue='F' DisplayValue='F'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='CollaborateClinicalInvestigator'>
					<Control ID='ctlCollaborationClinicalInvestigator'
						Container='spnCollaborationClinicalInvestigator'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Collaboration Clinical Investigator option is required.'>
						<Parameters>
							<Parameter StoredValue='Yes' DisplayValue='Yes'/>
							<Parameter StoredValue='No' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CollaborateSubstantive'>
					<Control ID='ctlCollaborationSubstantive'
						Container='spnCollaborationSubstantive'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Collaboration Substantive option is required.'>
						<Parameters>
							<Parameter StoredValue='Yes' DisplayValue='Yes'/>
							<Parameter StoredValue='No' DisplayValue='No'/>
							<Parameter StoredValue='Unclear' DisplayValue='Unclear'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='CollaborateExperience'>
					<Control ID='ctlCollaborationExperience'
						Container='spnCollaborationExperience'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Collaboration Experience Option is required.'>
						<Parameters>
							<Parameter StoredValue='Yes' DisplayValue='Yes'/>
							<Parameter StoredValue='No' DisplayValue='No'/>
							<Parameter StoredValue='Unclear' DisplayValue='Unclear'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CollaborateGrade'>
					<Control ID='ctlCollaborationGrade'
						Container='spnCollaborationGrade'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Collaboration Grade is required.'>
						<Parameters>
							<Parameter StoredValue='A' DisplayValue='A'/>
							<Parameter StoredValue='B' DisplayValue='B'/>
							<Parameter StoredValue='C' DisplayValue='C'/>
							<Parameter StoredValue='D' DisplayValue='D'/>
							<Parameter StoredValue='F' DisplayValue='F'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Intellectual'>
					<Control ID='ctlIntellectual'
						Container='spnIntellectual'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Intellectual Property option is required.'>
						<Parameters>
							<Parameter StoredValue='patents already exist' DisplayValue='patents already exist'/>
							<Parameter StoredValue='patent applications have been filed' DisplayValue='patent applications have been filed'/>
							<Parameter StoredValue='invention disclosures have been submitted' DisplayValue='invention disclosures have been submitted'/>
							<Parameter StoredValue='no IP activity yet' DisplayValue='no IP activity yet'/>
							<Parameter StoredValue='status unclear' DisplayValue='status unclear'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IntellectualPotential'>
					<Control ID='ctlIntellectualPotential'
						Container='spnIntellectualPotential'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Intellectual Property Potential is required.'>
						<Parameters>
							<Parameter StoredValue='very likely patentable' DisplayValue='very likely patentable'/>
							<Parameter StoredValue='probably patentable' DisplayValue='probably patentable'/>
							<Parameter StoredValue='probably not patentable' DisplayValue='probably not patentable'/>
							<Parameter StoredValue='very likely not patentable' DisplayValue='very likely not patentable'/>
							<Parameter StoredValue='unclear' DisplayValue='unclear'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='IntellectualProprietary'>
					<Control ID='ctlIntellectualProprietary'
						Container='spnIntellectualProprietary'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Propreitary Protection is required.'>
						<Parameters>
							<Parameter StoredValue='Yes' DisplayValue='Yes'/>
							<Parameter StoredValue='No' DisplayValue='No'/>
							<Parameter StoredValue='Unclear' DisplayValue='Unclear'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IntellectualGrade'>
					<Control ID='ctlIntellectualGrade'
						Container='spnIntellectualGrade'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Intellectual Property Grade is required.'>
						<Parameters>
							<Parameter StoredValue='A' DisplayValue='A'/>
							<Parameter StoredValue='B' DisplayValue='B'/>
							<Parameter StoredValue='C' DisplayValue='C'/>
							<Parameter StoredValue='D' DisplayValue='D'/>
							<Parameter StoredValue='F' DisplayValue='F'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CommercePotentialEnvision'>
					<Control ID='ctlCommercePotentialEnvision'
						Container='spnCommercePotentialEnvision'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Commercialization Envision option is required.'>
						<Parameters>
							<Parameter StoredValue='Yes' DisplayValue='Yes'/>
							<Parameter StoredValue='No' DisplayValue='No'/>
							<Parameter StoredValue='Unclear' DisplayValue='Unclear'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CommercePotentialStage'>
					<Control ID='ctlCommercePotentialStage'
						Container='spnCommercePotentialStage'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Commercialation Stage option is required.'>
						<Parameters>
							<Parameter StoredValue='no activity' DisplayValue='no activity'/>
							<Parameter StoredValue='consideration, or strategy; some strategic consideration' DisplayValue='consideration, or strategy; some strategic consideration'/>
							<Parameter StoredValue='clear plan developed, but no activity yet' DisplayValue='clear plan developed, but no activity yet'/>
							<Parameter StoredValue='commercialization discussions ongoing with potential partners' DisplayValue='commercialization discussions ongoing with potential partners'/>
							<Parameter StoredValue='already licensed or optioned' DisplayValue='already licensed or optioned'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='CommercePotentialExperience'>
					<Control ID='ctlCommercePotentialExperience'
						Container='spnCommercePotentialExperience'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Commercialiation Experience Option is required.'>
						<Parameters>
							<Parameter StoredValue='Yes' DisplayValue='Yes'/>
							<Parameter StoredValue='No' DisplayValue='No'/>
							<Parameter StoredValue='Unclear' DisplayValue='Unclear'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CommercePotentialPath'>
					<Control ID='ctlCommercePotentialPath'
						Container='spnCommercePotentialPath'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Commercialization Potential Path is required.'>
						<Parameters>
							<Parameter StoredValue='License' DisplayValue='License'/>
							<Parameter StoredValue='Startup' DisplayValue='Startup'/>
							<Parameter StoredValue='Unclear' DisplayValue='Unclear'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='CommercePotentialTime'>
					<Control ID='ctlCommercePotentialTime'
						Container='spnCommercePotentialTime'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Product Timeframe option is required.'>
						<Parameters>
							<Parameter StoredValue='Less Than 3 years' DisplayValue='Less Than 3 years'/>
							<Parameter StoredValue='3-5 years' DisplayValue='3-5 years'/>
							<Parameter StoredValue='5-7 years' DisplayValue='5-7 years'/>
							<Parameter StoredValue='Greater Than 7 years' DisplayValue='Greater Than 7 years'/>
							<Parameter StoredValue='Unknown' DisplayValue='Unknown'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CommercePotentialGrade'>
					<Control ID='ctlCommercePotentialGrade'
						Container='spnCommercePotentialGrade'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Commercialiation Potential Grade is required.'>
						<Parameters>
							<Parameter StoredValue='A' DisplayValue='A'/>
							<Parameter StoredValue='B' DisplayValue='B'/>
							<Parameter StoredValue='C' DisplayValue='C'/>
							<Parameter StoredValue='D' DisplayValue='D'/>
							<Parameter StoredValue='F' DisplayValue='F'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Intangibles'>
					<Control ID='ctlIntangibles'
						Container='spnIntangibles'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Intangible grade is required.'>
						<Parameters>
							<Parameter StoredValue='A' DisplayValue='A'/>
							<Parameter StoredValue='B' DisplayValue='B'/>
							<Parameter StoredValue='C' DisplayValue='C'/>
							<Parameter StoredValue='D' DisplayValue='D'/>
							<Parameter StoredValue='F' DisplayValue='F'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OverallGrade'>
					<Control ID='ctlOverallGrade'
						Container='spnOverallGrade'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Overall Grade is required.'>
						<Parameters>
							<Parameter StoredValue='A' DisplayValue='A'/>
							<Parameter StoredValue='B' DisplayValue='B'/>
							<Parameter StoredValue='C' DisplayValue='C'/>
							<Parameter StoredValue='D' DisplayValue='D'/>
							<Parameter StoredValue='F' DisplayValue='F'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OverallComments'>
					<Control ID='ctlOverallComments'
						Container='spnOverallComments'
						Type='cTextArea'
						Rows='3'
						Cols='50'
						MaxLength='1000'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,1000}$' ErrorMessage='Limit your Overall Comments to 1000 characters or less.' />
					</Control>
				</DisplayProperty>
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
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
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
