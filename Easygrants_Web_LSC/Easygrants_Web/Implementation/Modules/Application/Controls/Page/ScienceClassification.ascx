<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cScienceClassification" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="ScienceClassification.ascx.vb" %>
<%@ Register Tagprefix='Easygrants' tagname='Committee' src='../../../../../Easygrants/Controls/PageSection/Committee_Editor.ascx' %>
<%@ Register Tagprefix='Easygrants' tagname='Consortia' src='../../../../../Easygrants/Controls/PageSection/ScienceClassification1.ascx' %>
<%@ Register Tagprefix='Easygrants' tagname='Science' src='../../../../../Easygrants/Controls/PageSection/ScienceClassification2.ascx' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server' />

<asp:RequiredFieldValidator
		runat='server'
		id='valScience1'
		ControlToValidate='ctlGranteeProjectScience1'
		Display='None'
		ErrorMessage='Select at least one Science Classification (1).'/>
		
<asp:RequiredFieldValidator
		runat='server'
		id="Requiredfieldvalidator1"
		ControlToValidate='ctlGranteeProjectScience2'
		Display='None'
		ErrorMessage='Select at least one Science Classification (2).'/>

<br>
<span id='spnPageContent' runat='server'/>
Please provide the science classifications for your application.  Use the instructions below as a guide.  Click here for
<span runat='server' id='spnGuide'/>
<ul>
<li>Click <b>Save</b> to save the information and remain on this page.
</ul>
<!-- On June 24, 2005, Basil Eliopoulos changed the navigation URL from "/Easygrants_v4_WHCF_r1/...."  to  "/Easygrants_v4_AHA_r1/...."  per QA task.  --> 

<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->

<p>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Science Classification</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td colspan='2'>For both of the following science classification sections, follow these steps:<br>
<br>1. Select the Major Science Classification from the drop-down list.  The page will refresh with a list of sub-classifications.
<br>2. Select up to six sub-classifications by clicking in the checkbox to the left of the sub-classification.
<br>3. Click <b>Save</b>.<br>
<br>Repeat these steps for the second science classification question.</td>
	</tr>
</table>
<br>
<a name='Class1'></a>
<p><b><font color='red'>*</font>&nbsp;Major Science Classification (1):</b>&nbsp;&nbsp;
		<span id='spnClass1' runat='server'/>
<p><b>Sub-Classifications (choose at least one and up to six):</b>

<table border='0' cellpadding='0' cellspacing='0' width='100%'>
	<tr>
		<td>
			<span runat='server' id='spnGranteeProjectScience1'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<a name='Class2'></a>
<p><b><font color='red'>*</font>&nbsp;Major Science Classification (2):</b>&nbsp;&nbsp;
		<span id='spnClass2' runat='server'/>
<p><b>Sub-Classifications (choose at least one and up to six):</b>


<table border='0' cellpadding='0' cellspacing='0' width='100%'>
	<tr>
		<td>
			<span runat='server' id='spnGranteeProjectScience2'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>


<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center' ID="Table2">		
<tr>
	<td>
		<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnSave'/>	
		<!-- Cancel Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnSave_and_Continue'/>	
	</td>
</tr>
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
			<DataObject Key='Class' DataObjectDefinitionKey='GranteeProjectInfo' Updatable='True' CreateNew='True' >
				<Filters>
					<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				</Filters>
				<DefaultValues>
					<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				</DefaultValues>
				<DisplayProperties>																		
					<DisplayProperty PropertyKey='ScienceClassificationID'>
						<Control ID='ctlClass1'
							Container='spnClass1'
							Type='cDropDown'
							DataObjectDefinitionKey='ScienceClassification'
							StoredValue='ScienceClassificationID'
							DisplayValue='Description'>
							<Sort>
								<Argument PropertyKey='Description'/>
							</Sort>
						</Control>
					</DisplayProperty>		
					<DisplayProperty PropertyKey='ScienceClassification2ID'>
						<Control ID='ctlClass2'
							Container='spnClass2'
							Type='cDropDown'
							DataObjectDefinitionKey='ScienceClassification'
							StoredValue='ScienceClassificationID'
							DisplayValue='Description'>
							<Sort>
								<Argument PropertyKey='Description'/>
							</Sort>
						</Control>
					</DisplayProperty>		
																			
				</DisplayProperties>
			</DataObject>
			
		<DataObject Key='Science1' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProjectScience1'>
					<Control ID='ctlGranteeProjectScience1'
						Container='spnGranteeProjectScience1'
						Type='cDoubleListBox2'
						DataObjectDefinitionKey='Science'
						DisplayValue='Description'
						StoredValue='ScienceID'
						StoredDisplayValue='Science.Description' 
						Height='9'
						Sort='True'
						MaxSelected='6'
						TooManyMessage='You can only choose up to six Sub-Classifications.'
						DisplayNone='False'
						DisplayMoveAll='True'>
						<DefaultValues>
							<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
						</DefaultValues>
						<Filters>
							<Argument Type='QueryString' 
								TypeKey='Class1'
								PropertyKey='ClassID' 
								Value='' 
								bool=''>
							</Argument>
						</Filters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
			
		<DataObject Key='Science2' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProjectScience2'>
					<Control ID='ctlGranteeProjectScience2'
						Container='spnGranteeProjectScience2'
						Type='cDoubleListBox2'
						DataObjectDefinitionKey='Science'
						DisplayValue='Description'
						StoredValue='ScienceID'
						StoredDisplayValue='Science.Description' 
						Height='9'
						Sort='True'
						MaxSelected='6'
						TooManyMessage='You can only choose up to six Sub-Classifications.'
						DisplayNone='False'
						DisplayMoveAll='True'>
						<DefaultValues>
							<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
						</DefaultValues>
						<Filters>
							<Argument Type='QueryString' 
								TypeKey='Class2'
								PropertyKey='ClassID' 
								Value='' 
								bool=''>
							</Argument>
						</Filters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>			
			
			<DataObject Key='Base' DataObjectDefinitionKey=''>
				<DisplayProperties>
					<DisplayProperty PropertyKey=''>
						<Control ID='ctlGuide'
							Container='spnGuide'
							Type='cLink'
							Caption='a comprehensive list of available science classifications.'>
							<Action PostBack='False'
								Target='_blank'
								URL='/Easygrants_v4_AHA_r1/Implementation/Modules/Application/Help/AHA_Stroke_Classifications.aspx'/>
						</Control>
					</DisplayProperty>		
					<!-- <DisplayProperty PropertyKey=''>
						<Control ID='ctlConsortia'
							Type='Consortia'/>
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='ctlScience'
							Type='Science'/>
					</DisplayProperty> -->
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
							<Action
								PostBack='True'
								AutoSave='True'/>
						</Control>
					</DisplayProperty>
				</DisplayProperties>
			</DataObject>
	</ModuleSection>		
<!-- End Embedded XML -->
</span>
