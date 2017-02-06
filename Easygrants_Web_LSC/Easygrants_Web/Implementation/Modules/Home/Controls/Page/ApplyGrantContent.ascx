<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Implementation.Modules.Home.Controls.Page.cApplyGrantContentImpl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<br>
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<table border='0' cellpadding='0' cellspacing='0'>
    
	<tr><td>Listed below are the current funding opportunities accepting applications. 
	To view more details on the funding opportunity, click <b>Guidelines</b> next to the opportunity.</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>
	    <ul>
            <li>To apply to a funding opportunity, select the opportunity and click <b>Continue</b>. </li>
            <li>To return to the Home page, click <b>Cancel</b>.</li>
        </ul>
     </td></tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellpadding='2' cellspacing='0' width="100%">
	<tr>
		<td class="SeparatorHdg"><b>Available Funding Opportunities</b></td>
	</tr>
	<tr>
		<td >
			<span id='spnWfProjectDataList' runat='server' />
			<asp:CustomValidator id="valRequiredField" runat="server"
				OnServerValidate="ValidateRequiredField"
				Display="None"
				ErrorMessage="Grant Program is required."/>
		</td>
		<td width='20'>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>		
	<tr>
		<td align='center'>
			<span runat='server' id='spnSaveAndContinue'/>
		</td>
		<td align='center'>
			<span runat='server' id='spnCancel'/>			
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	
		<DataObject Key='WfProject' DataObjectDefinitionKey='WfProject'>
			<Filters>
				<Argument Type='CurrentDateTime' TypeKey='Date' Operator='LessThanEqual' PropertyKey='StartDate'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' Operator='GreaterThanEqual' PropertyKey='EndDate'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='ProgramDisplayName'>
					<RelatedProperty PropertyKey='WfCompetition.WfProgram' />
				</Argument>
				<Argument PropertyKey='WfProjectName'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlWfProjectDataList'
						Container='spnWfProjectDataList'
						Type='cDataListCtl'
						GroupPropertyKey='WfCompetition.WfProgram.ProgramDisplayName'>
						<DisplayProperty PropertyKey='WfProjectID' ColumnHeader=' ' Width='2%'>
							<Control ID='ctlWfProject'									
								Type='cRadioButton'									
								RequiredField='True'
								ErrorMessage='Grant Program is required.'	>
								<AddScript Name='ResetDatalistRadioBtns' Event='onClick'>
									<Parameter Key='ControlID'/>
								</AddScript>
							</Control>
						</DisplayProperty>	
						<DisplayProperty PropertyKey='WfProjectName' ColumnHeader=' ' DataAlign='Left' Width='25%'/>
						<%--<DisplayProperty PropertyKey='WfCompetition.CompetitionDisplayName' ColumnHeader=' ' DataAlign='Left' Width='25%'/>--%>
						<DisplayProperty PropertyKey='Guideline' ColumnHeader=' ' DataAlign='Left' Width='68%'>
							<Control ID='ctlGuideline' Type='cLink'>
								<Action PostBack='False' URL='Web' Target='_blank'></Action>
							</Control>							
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>			
		</DataObject>
						
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>						
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndContinue'
						Container='spnSaveAndContinue'
						Type='cButton'
						Image='Continue' 
						Confirmation='Are you sure you want to apply for this Program?' >
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Type='Object' ObjectType = 'DataObject' ObjectKey='WfProject' />
								<Argument Type='' TypeKey = '' Value='Eligibility' />
								<Argument Type='' TypeKey = ''  Value='EligibilityModuleConfig' />
								<Argument Type='' TypeKey = '' Value='' />	
								<Argument Type='' TypeKey = '' Value='' />														
								
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
							Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument Value='Home'/>
									<Argument Type='DataObject' TypeKey='WfProjectID' AttributeName='WfProjectID' BaseValue='WfProjectID=' Value=''/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' Value=''/>
								</Parameters>						
						</Action>
					</Control>	
				</DisplayProperty>		
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>	
</span>
<!-- End Embedded XML -->