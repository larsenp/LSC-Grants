<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ResearchClassification.ascx.vb" Inherits="Implementation.Modules.Application.Controls.Page.cResearchClassification" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Easygrants' tagname='ResearchCategory' src='../../../../../Easygrants/Controls/PageSection/ResearchCategory.ascx' %>


<span id='spnPageContent' runat='server' />
<p>
	<Easygrants:ValSumm id='ctlValSumm' runat='server' />
	<asp:CustomValidator id='valProject' runat='server' OnServerValidate='ValidateInterest' ErrorMessage='Select at least one Current Area of Interest.'
		Enabled='False' Display='None' />
	<br>
<p>
	<table>
		<tr>
			<td>
				Please complete each of the following classifications as they may relate to your research.  The classifications are independent of each other, and 
				<br> the classification of your research will not affect the peer review of your application.  
				<br>
				<ul>
				<li>Click <b>Save</b> to save the information and remain on this page.
				<li>Click <b>Save and Continue</b> to save the information and proceed to the next page.
				</ul>
			</td>
		</tr>
	</table>
	<!-- Page Content - Controls -->
	<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' visible='false'>
		<tr>
			<td colspan="4" class="SeparatorHdg"><b>Research Classification</b></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
		<tr>
			<td colspan="4" class="SeparatorHdg"><b>Current Areas of Interest</b></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<!-- On June 24, 2005, Basil Eliopoulos added a red asterisk next to the text "Please select one or both of the following".  -->
	<table border='0' cellspacing='0' cellpadding='0' runat='server'>
		<tr>
			<td colspan='2'>Please select one or both of 
				the following.</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><span id='spnPopulation' runat='server' />&nbsp;&nbsp;To improve population and/or behavioral 
			methods or develop novel methods to advance primary and/or secondary prevention goals of the foundation.
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><span id='spnTherapy' runat='server' />&nbsp;&nbsp;To improve the effectiveness of therapy, 
			quality of care and systems of healthcare delivery goals of the foundation.
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' visible='false'>
		<tr>
			<td colspan="4" class="SeparatorHdg"><b>Stroke Classification Instructions</b></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>The following list of stroke terms may assist you in making your CVD/Stroke 
				classification above. As a general rule, stroke includes projects involving brain blood vessels, brain tissue, or 
				cerebral ischemia. Projects broadly related to stroke include those involving 
				vascular biology in other vascular beds and coagulation control systems.</td>
		</tr>
	</table>
	<table runat='server' visible='false'>
		<tr>
			<td><b>Closely Related to Stroke:</b></td>
			<td width='50%'></td>
			<td><b>Broadly Related to Stroke:</b></td>
		</tr>
		<tr>
			<td>Crebellum</td>
			<td>Cerebral Infarction</td>
			<td>Blood pressure control</td>
		</tr>
		<tr>
			<td>Crebrovascular disorders</td>
			<td>Cerebral ischemia, transient...</td>
			<td>Blood vessel growth &amp; development</td>
		</tr>
		<tr>
			<td>Carotid artery diseases</td>
			<td></td>
			<td>Hypertension</td>
		</tr>
		<tr>
			<td>Carotid artery atherisclerosis</td>
			<td></td>
			<td>Hypoxia</td>
		</tr>
		<tr>
			<td>Carotid artery thrombosis</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>Carotid stenosis</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>Crebral amyloid...</td>
			<td></td>
			<td></td>
		</tr>
	</table>
	<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
		<tr>
			<td colspan="4" class="SeparatorHdg"><b>Types of Research</b></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<table border='0' cellspacing='0' cellpadding='0' runat='server'>
		<tr>
			<td><span id='spnBiomedical' runat='server' />&nbsp;&nbsp;<b><u>Basic Biomedical Research</u></b>
				is conducted to increase understanding of fundamental life processes.</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><span id='spnClinical' runat='server' />&nbsp;&nbsp;<b><u>Clinical Research</u></b>
				addresses important questions of normal function and disease using human 
				subjects.</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><span id='spnPopulationHealth' runat='server' />&nbsp;&nbsp;<b><u>Population Health 
						Research</u></b> is the science and art of studying the distribution 
				and determinants of health status as influenced by social, economic, and 
				physical environments, human biology, health policy and services and of 
				preventing disease, prolonging life and promoting health at the population 
				level.</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
		<tr>
			<td colspan="4" class="SeparatorHdg"><b>Research Categories (select <i>all</i> that 
					apply)</b></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<a name='ResearchCategory'></a>
<p><Easygrants:ResearchCategory id='ctlResearchCategories' runat='server' />
	<table align='center'>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2" align='center'>
				<span runat='server' id='spnSave' />&nbsp;&nbsp; <span runat='server' id='spnSave_and_Continue' />
			</td>
		</tr>
	</table>
	<!-- Embedded XML Page Functionality - please do not edit -->
	<span id='spnConfigXML' visible='false' runat='server'>
		<ModuleSection>
			<PageContent />
			<DataObject Key='GranteeProjectInfo' DataObjectDefinitionKey='GranteeProjectInfo' Updatable='True'
				CreateNew='True'>
				<Filters>
					<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''
						Bool='' />
				</Filters>
				<DefaultValues>
					<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				</DefaultValues>
				<DisplayProperties>
					<DisplayProperty PropertyKey='HasPopulationInterest'>
						<Control ID='ctlPopulation' Container='spnPopulation' Type='cCheckBox' StoredValue='1' DisplayValue='Primary'></Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey='HasTherapyInterest'>
						<Control ID='ctlTherapy' Container='spnTherapy' Type='cCheckBox' StoredValue='1' DisplayValue='Primary'></Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey='HasBiomedicalResearch'>
						<Control ID='ctlBiomedical' Container='spnBiomedical' Type='cCheckBox' StoredValue='1' DisplayValue='Primary'></Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey='HasClinicalResearch'>
						<Control ID='ctlClinical' Container='spnClinical' Type='cCheckBox' StoredValue='1' DisplayValue='Primary'></Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey='HasPopulationHealthResearch'>
						<Control ID='ctlPopulationHealth' Container='spnPopulationHealth' Type='cCheckBox' StoredValue='1'
							DisplayValue='Primary'></Control>
					</DisplayProperty>
					<!-- <DisplayProperty PropertyKey=''>
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
							Type='cSaveContinueButton'/>
					</DisplayProperty> -->
				</DisplayProperties>
			</DataObject>
			<DataObject Key='Base' DataObjectDefinitionKey=''>
				<DisplayProperties>
					<DisplayProperty PropertyKey=''>
						<Control ID='ctlResearchCategories' Type='ResearchCategory' />
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='btnSave' Container='spnSave' Type='cButton' Image='Save'>
							<Action PostBack='True' AutoSave='True' />
						</Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='btnSave_and_Continue' Container='spnSave_and_Continue' Type='cButton' GoToNextPage='True' >
							<Action
								PostBack='True'
								AutoSave='True'/>
						</Control>
					</DisplayProperty>
				</DisplayProperties>
			</DataObject>
		</ModuleSection>
	</span>
	<!-- End Embedded XML --></p>













































