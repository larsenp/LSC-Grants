<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.Page.cKatzScienceClass" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"  %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server' />

<asp:CustomValidator 
	id='valSubCategory'
	runat='server'
	OnServerValidate='ValidateSubCategory'
	ErrorMessage='If you select a Category from the drop down, you must select a category from list.'
	Display='None'/>
	
<!-- On June 27, 2005, Basil Eliopoulos change the navigation URL from "/Easygrants_v4_WHCF_r1/Easygrants/...."  to  "/Easygrants_v4_AHA_r1/Easygrants/" as part of a QA request.  -->
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<br>
To assist the in assigning your application to the 
correct peer review committee, please provide the category for your application. The category should be 
the same category you selected during your abstract submission process.  You may select only one category. 
When you are finished, click the <b>Save</b> button to save and remain on this page, or <b>Save and Continue</b> to save 
the information on this page and navigate to the next page.
<p>
<p>
<span id='spnHelp' runat='server'/>
<p>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Science Classification</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
For both of the following science classification sections, follow these steps:
<br>1. Select the Category from the drop-down list.  The page will refresh with a list of categories  
<br>2. Select one category by clicking in the radio button to the left of the category.  
<br>3. Click the <b>Save</b> button.
<p>
<table>
	<tr>
		<td><b>Category</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id='spnCategory' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><b>Select one:</b></td></tr>
	<tr>
		<td>
			<span runat='server' id='spnScience'/>
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
		<DataObject Key='GranteeProjectInfo' DataObjectDefinitionKey='GranteeProjectInfo' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control Container='spnHelp' 
						ID='ctlHelp'
						Type='cLink'
						Caption='Click here to view a comprehensive list of available Science Classifications'>
						<Action
							PostBack='False' 
							URL='/Easygrants_v4_AHA_r1/Implementation/Modules/Application/Help/Councils - Science Classification.pdf'
							Target='Blank'>
						</Action>		
					</Control>
				</DisplayProperty>	
				
				<DisplayProperty PropertyKey='ScienceCategoryID'>
					<Control ID='ctlCategory'
						Container='spnCategory'
						Type='cDropDown'
						DataObjectDefinitionKey='ScienceCategory'
						StoredValue='ScienceCategoryID'
						DisplayValue='Description'
						RequiredField='False'
						ErrorMessage='You must select a science classification.'>		
						<Filters>
						</Filters>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>		
												
				<DisplayProperty PropertyKey='ScienceID'>
					<Control ID='ctlScience'
						Container='spnScience'
						Type='cRadioButtonList'
						DataObjectDefinitionKey='ScienceKatz'
						StoredValue='ScienceKatzID'
						DisplayValue='Description'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						RequiredField='False'
						ErrorMessage='You must answer the faculty member question.'>
						<Filters>
							<Argument Type='QueryString' TypeKey='Category' PropertyKey='CategoryID' Value='' />
							<!-- <Argument Type='DataObjectCollection' TypeKey='GranteeProjectInfo' DataObjectPropertyKey='ScienceKatz.CategoryID' PropertyKey='CategoryID' /> --> 
						</Filters>
			
					</Control>
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey=''>
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
						Type='cButton' GoToNextPage='True' />
				</DisplayProperty>
								
			</DisplayProperties>
		</DataObject>
	</ModuleSection>		
<!-- End Embedded XML -->
</span>
