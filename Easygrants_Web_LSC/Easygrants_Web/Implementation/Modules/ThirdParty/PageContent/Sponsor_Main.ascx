<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br>
<span id='spnPageContent' runat='server'/>
<p>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><!--
			Please describe the facilities to be used for the conduct of the proposed research.  
			Indicate the performance sites and describe capacities, pertinent capabilities, 
			relative proximity, and extent of availability to the project.  Each section is 
			limited to 7000 characters or approximately 700 words.  All fields require a response.  
			If you have nothing to report for a section, type "N/A" in the field.     All fields 
			marked with a red asterisk (<font color='red'>*</font>) are required.
			<ul>
				<li>Click on the <b>Save</b> button to save and remain on this page.</li>
				<li>Click on the <b>Save and Continue</b> button to save the information on this page 
					and navigate to the next page.  Note that clicking the <b>Save and Continue</b> button requires 
					that all fields are complete</li>
				<li>You can also use the navigation links to the left to navigate to another page.  
					<b>IMPORTANT:</b> navigating away from this page before clicking <b>Save</b> will cause you to 
					lose any unsaved information.</li>
			</ul>-->
		</td>
	</tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Project Environment</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><b>Laboratory:</b>&nbsp;<font color='red'>*</font></td></tr>
	<tr><td><span id='spnLaboratory' runat='server'/></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><b>Clinical:</b>&nbsp;<font color='red'>*</font></td></tr>
	<tr><td><span id='spnClinical' runat='server'/></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><b>Animal:</b>&nbsp;<font color='red'>*</font></td></tr>
	<tr><td><span id='spnAnimal' runat='server'/></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><b>Computer:</b>&nbsp;<font color='red'>*</font></td></tr>
	<tr><td><span id='spnComputer' runat='server'/></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><b>Office:</b>&nbsp;<font color='red'>*</font></td></tr>
	<tr><td><span id='spnOffice' runat='server'/></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><b>Other:</b>&nbsp;<font color='red'>*</font></td></tr>
	<tr><td>Please identify support services and specify the extent to which they will be available to the project.</td></tr>
	<tr><td><span id='spnOther' runat='server'/></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><b>Major Equipment:</b>&nbsp;<font color='red'>*</font></td></tr>
	<tr><td>List the most important items already available for this project, noting the location and pertinent capabilities of each.</td></tr>
	<tr><td><span id='spnMajorEquipment' runat='server'/></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Buttons -->
<center>
	<table border='0'>	
		<tr>
			<td>
				<span runat='server' id='spnSave'/> 
			</td>
			<td width='10%'>&nbsp;</td>
			<td><span runat='server' id='spnSave_and_Continue'/>&nbsp;&nbsp;</td>
		</tr>
	</table>
</center>
	
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		 <DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' 
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
			</DisplayProperties>		
		</DataObject>
		
		<DataObject Key='GranteeProjectAHA' DataObjectDefinitionKey='GranteeProjectAHA' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='WfTaskID' Value='' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='WfTaskID' Value='' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskRoleID' PropertyKey='PersonRoleID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Laboratory'>
					<Control ID='ctlLaboratory'
						Container='spnLaboratory'
						Type='cTextArea'
						Rows='5'
						Cols='90'
						MaxLength='7000'
						RequiredField='True'
						ErrorMessage='Description of the Laboratory project environment is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,7000}$' ErrorMessage='Limit your Laborary notes to 7000 characters (approximately 700 words) or less.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Clinical'>
					<Control ID='ctlClinical'
						Container='spnClinical'
						Type='cTextArea'
						Rows='5'
						Cols='90'
						MaxLength='7000'
						RequiredField='True'
						ErrorMessage='Description of the Clinical project environment is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,7000}$' ErrorMessage='Limit your Clinical notes to 7000 characters (approximately 700 words) or less.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Animal'>
					<Control ID='ctlAnimal'
						Container='spnAnimal'
						Type='cTextArea'
						Rows='5'
						Cols='90'
						MaxLength='7000'
						RequiredField='True'
						ErrorMessage='Description of the Animal project environment is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,7000}$' ErrorMessage='Limit your Animal notes to 7000 characters (approximately 700 words) or less.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Computer'>
					<Control ID='ctlComputer'
						Container='spnComputer'
						Type='cTextArea'
						Rows='5'
						Cols='90'
						MaxLength='7000'
						RequiredField='True'
						ErrorMessage='Description of the Computer project environment is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,7000}$' ErrorMessage='Limit your Computer notes to 7000 characters (approximately 700 words) or less.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Office'>
					<Control ID='ctlOffice'
						Container='spnOffice'
						Type='cTextArea'
						Rows='5'
						Cols='90'
						MaxLength='7000'
						RequiredField='True'
						ErrorMessage='Description of the Office project environment is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,7000}$' ErrorMessage='Limit your Office notes to 7000 characters (approximately 700 words) or less.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other'>
					<Control ID='ctlOther'
						Container='spnOther'
						Type='cTextArea'
						Rows='5'
						Cols='90'
						MaxLength='7000'
						RequiredField='True'
						ErrorMessage='Description of the Other project environment is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,7000}$' ErrorMessage='Limit your Other notes to 7000 characters (approximately 700 words) or less.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MajorEquipment'>
					<Control ID='ctlMajorEquipment'
						Container='spnMajorEquipment'
						Type='cTextArea'
						Rows='5'
						Cols='90'
						MaxLength='7000'
						RequiredField='True'
						ErrorMessage='Description of the Major Equipment project environment is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,7000}$' ErrorMessage='Limit your Major Equipment notes to 7000 characters (approximately 700 words) or less.' />
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
							Object='EventController'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton' GoToNextPage='True' >
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
