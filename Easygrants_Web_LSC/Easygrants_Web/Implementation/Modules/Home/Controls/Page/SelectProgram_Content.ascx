<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Implementation.Modules.Home.Controls.Page.cSelectProgram_Content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>


<Easygrants:ValSumm id='ctlValSumm' runat='server' />
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<table border='0' cellpadding='0' cellspacing='0' width='100%'>
	<tr>
		<td>To apply for a new grant, choose one of the grant programs below. For 
			information about each grant program, click on the Guidelines link to the right 
			of the program name. To view a list of available awards, select the Portfolio 
			and Affiliate to view a list of awards and click <b>Save and Continue</b> button.</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Grant Program</b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellpadding='0' cellspacing='0' width='100%'>
	<tr>
		<td width='15%'><b><%=GetLabel("ProgramName")%></b></td>
		<td><span id='spnFundingComp' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
</TABLE> 
<!-- END USER MODIFIABLE CONTENT AREA -->
<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center' ID="Table1">
	<tr>
		<td align='center'>
			<span runat='server' id='spnSaveAndContinue'/>
		</td>
		<td>&nbsp;</td>
		<td align='center'>
			<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
			<span runat='server' id='spnCancel' />
		</td>
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='FundingComponent' DataObjectDefinitionKey='Program'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ProgramID' PropertyKey='ProgramID' Value=''/>
			</Filters>	
			<DisplayProperties>
				<DisplayProperty PropertyKey='ProgramID'>
					<Control ID='ctlFundingComp' 
						Container='spnFundingComp' 
						Type='cDropDown' 
						DataObjectDefinitionKey='Program'
						StoredValue='ProgramID' 
						DisplayValue='ProgramDisplayName' 
						DisplayNone='True'
						RequiredField='True'
						PostBack='True' 
						ErrorMessage='~~ProgramName~~ of the Grant Program is required.'>
						<Filters></Filters>
						<Sort></Sort>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='ControlFundingCompSelected'>
							<Parameters>
								<Argument Type='Control' TypeKey = 'ctlFundingComp' ControlPropertyKey='SelectedValue' Value='' />
								<Argument Type='URL' TypeKey='PathAndQuery' Value=''/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Competition' DataObjectDefinitionKey='Competition'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ProgramID' PropertyKey='ProgramID' Value=''/>
			</Filters>
			<DisplayProperties>
			<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndContinue' Container='spnSaveAndContinue' Type='cButton' Image='Save_and_Continue'>
						<Action PostBack='True' AutoSave='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='ApplyGrant' />
								<Argument Type='Control' TypeKey='ctlFundingComp' ControlPropertyKey='SelectedValue' BaseValue='ProgramID=' />
								<Argument Type='DataObjectCollection' TypeKey='Competition' DataObjectPropertyKey='CompetitionTypeID' BaseValue='CompetitionTypeID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='
									Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				</DisplayProperties>
		</DataObject>
		
			
		<!-- <DataObject Key='WfProject' DataObjectDefinitionKey='WfProject'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfProjectName'>
					<Control ID='ctlWfProject'
						Container='spnWfProject'
						Type='cRadioButtonList'
						RepeatDirection='Vertical'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='You must choose a program.'
						DataObjectDefinitionKey='WfProject'
						StoredValue='WfProjectID'
						DisplayValue='WfProjectName'>
						<Filters>
							<Argument Type='CurrentDateTime' TypeKey='Date' 
								Operator='LessThanEqual' PropertyKey='StartDate'/>
							<Argument Type='CurrentDateTime' TypeKey='Date' 
								Operator='GreaterThanEqual' PropertyKey='EndDate'/>
							<Argument Type='' TypeKey='' PropertyKey='ProjectTypeID' Value='1'/>
						</Filters>
						<Validation Type='Custom' Object='EventController' Method='ValidateCriteria' 
							ErrorMessage='Our records indicate that you have an active LOI or already received a Senior Scholar award from the Ellison Medical Foundation.  If you feel that this result is an error, please contact us using the contact information at the bottom of the page.' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>			
		</DataObject> -->
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel' Container='spnCancel' Type='cButton' Confirmation='Are you sure you want to cancel?' Image='Cancel'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Home' />
								<Argument Type='DataObject' TypeKey='WfProjectID' AttributeName='WfProjectID' BaseValue='WfProjectID='
									Value='' />
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='
									Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
