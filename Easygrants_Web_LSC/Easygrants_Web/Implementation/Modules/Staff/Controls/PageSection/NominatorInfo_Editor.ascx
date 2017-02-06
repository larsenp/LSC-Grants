<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cNominatorInfo_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<P>Enter the requested information into the Nomination Criteria Editor and click 
on the <B>Save</B> button. All fields marked with <FONT color=red>*</FONT> are 
required.</P>
<P>To cancel and return to the Nominator Info page, click on 
the <B>Cancel</B> button. </P>
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Nomination Criteria Editor</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td><b>Primary <%=GetLabel("Organization")%></b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td><span id='ctlInstitution' runat='server'/></td>	
	</tr>
	<tr>
		<td><b>Project</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnProject' runat='server'/></td>	
	</tr>
	<tr>
		<td><b>Number of Nominations</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnNumberPermited' runat='server'/></td>	
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PersonPrimaryAffiliation.Organization.CommonOrganizationName'>
					<Control ID='ctlInstitution' Type='HtmlGenericControl'/>
				</DisplayProperty>			
			</DisplayProperties>
		</DataObject>
		<DataObject Key='NominationCriteria' DataObjectDefinitionKey='NominationCriteria' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='NominationCriteriaID' PropertyKey='NominationCriteriaID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='NominatorPersonID' Value=''/>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonPrimaryAffiliation.Organization.OrganizationID' PropertyKey='NominatorOrganizationID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='NumberPermited'>
					<Control ID='ctlNumberPermited'
						Container='spnNumberPermited'
						Type='cTextBox'
						Size='10'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='Number of Nominations is required.'>
						<Validation Type='Custom' Object='EventController' Method='ValidatePrimaryInstitution' ErrorMessage='This nominator has no Primary ~~Organization~~ assigned.' />
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProjectID'>
					<Control ID='ctlProject'
						Container='spnProject'
						Type='cDropDown'
						DataObjectDefinitionKey='WfProject'
						StoredValue='WfProjectID'
						DisplayValue='WfProjectName'
						DisplayNone='True'
						RequiredField='True'
						ErrorMessage='Project is required.'>
						<Validation Type='Custom' Object='EventController' Method='ValidateDuplicateCriteria' ErrorMessage='The Project you selected is already assigned to this Nominator or ~~Organization~~.' />
						<Filters>
							<Argument Type='' TypeKey='' PropertyKey='ProjectTypeID' Value='2' Bool=''/>
						</Filters>
						<Sort>
							<Argument PropertyKey='WfProjectName'/>
						</Sort>
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
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Cancel'>
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
</span>
<!-- End Embedded XML -->
