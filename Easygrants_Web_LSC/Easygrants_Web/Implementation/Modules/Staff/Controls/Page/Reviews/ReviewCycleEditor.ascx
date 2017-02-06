<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cReviewCycleEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="ReviewCycleEditor.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<br /><br />
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewPages.ascx'
	runat='server' visible='false'/>
<p>
<EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Root' Key='ReviewCycle' LinkTitle='Review Cycle Setup' runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Edit Review Cycle</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b><%=GetLabel("ProgramName")%></b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnProgram' runat='server'/></td>
	</tr>
	<%--<tr><td>&nbsp;</td></tr>--%>
	<tr>
		<td valign='top'><b><%=GetLabel("FundingOpportunity")%></b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnCompetition' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Review Cycle Name</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnName' runat='server'/></td>
	</tr>	
	<%--<tr><td>&nbsp;</td></tr>--%>
	<tr>
		<td valign='top' width='200'><b>Time Period/Award Cycle</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnTimePeriod' runat='server'/></td>
	</tr>
	<%--<tr><td>&nbsp;</td></tr>--%>
	<%--<tr>
		<td width='200'><b>Previous Award Cycle</b></td>
		<td><span id="spnPreviousCycle" runat='server'/></td>
	</tr>--%>
	<%--<tr><td>&nbsp;</td></tr>--%>
	
	<%--<tr><td>&nbsp;</td></tr>--%>
	<tr>
		<td valign='top'><b>Description</b></td>
		<td><span id='spnDescription' runat='server'/></td>
	</tr>
	<tr>
		<td valign='top'>&nbsp;</td>
		<td>Limit: 300 characters</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Scoring Scale</b></td>
		<td>1-5 (5 Low)</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>		
	<tr>
		<td>
			<span runat='server' id='spnSave'/>&nbsp;
			<span runat='server' id='spnSaveAndContinue'/>&nbsp;
			<span runat='server' id='spnCancel'/>	
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewCycle' DataObjectDefinitionKey='ReviewCycle' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ProgramID'>
					<Control ID='ctlProgram'
						Container='spnProgram'
						Type='cDropDown'
						DataObjectDefinitionKey='Program'
						StoredValue='ProgramID'
						DisplayValue='ProgramDisplayName'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='~~ProgramName~~ is required.'>
						<Sort>
							<Argument PropertyKey='ProgramDisplayName' />
						</Sort>
						<SelectedValue>
							<Argument Type='QueryString' TypeKey='ProgramID' PropertyKey='ProgramID' Value=''/>
						</SelectedValue>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='DataPresenter'
							Method='OnProgramChange'>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='ReviewCycleCompetition' DataObjectDefinitionKey='ReviewCycle' Updatable='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewCycle' DataObjectPropertyKey='ReviewCycleID' PropertyKey='ReviewCycleID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ReviewCycleCompetitions'>
					<Control ID='ctlCompetition'
						Container='spnCompetition'
						Type='cDoubleListBox2'
						DataObjectDefinitionKey='Competition'
						DisplayValue='CompetitionDisplayName'
						StoredValue='CompetitionID'
						StoredDisplayValue='Competition.CompetitionDisplayName' 
						Height='15'
						DisplaySort='False'
						DisplayNone='False'
						DisplayMoveAll='True'
						MinSelected='1'
						TooFewMessage='~~FundingOpportunity~~ is required.'>
						<Filters>
							<Argument Type='QueryString' TypeKey='ProgramID' PropertyKey='ProgramID' />
						</Filters>
						<Sort>
	                        <Argument PropertyKey='CompetitionDisplayName' Direction='Ascending' />
	                    </Sort>
						<DefaultValues>
							<Argument Type='DataObjectCollection' TypeKey='ReviewCycle' DataObjectPropertyKey='ReviewCycleID' PropertyKey='ReviewCycleID' />
						</DefaultValues>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlDescription'
						Type='cTextArea'
						MaxLength='300'
						Cols='40'
						Rows='5'
						RequiredField='False'
						Container='spnDescription'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,300}$' ErrorMessage='Limit your description to 300 characters or less.' />					
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Name'>
					<Control ID='ctlName'
						Type='cTextBox'
						Container='spnName'
						Size='50'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Review Cycle Name is required.'>
					</Control>
				</DisplayProperty>
				<%-- 
				<DisplayProperty PropertyKey='TimePeriodID'>
					<Control ID='ctlTimePeriod'
						Container='spnTimePeriod'
						Type='cDropDown'
						DataObjectDefinitionKey='TimePeriod'
						StoredValue='TimePeriodID'
						DisplayValue='Description'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Time Period/Award Cycle is required.'>
					</Control>
				</DisplayProperty>
				--%>
				
				<DisplayProperty PropertyKey='ReviewCycleTimePeriods'>
					<Control ID='ctlTimePeriod'
						Container='spnTimePeriod'
						Type='cDoubleListBox2'
						DataObjectDefinitionKey='TimePeriod'
						DisplayValue='Description'
						StoredValue='TimePeriodID'
						StoredDisplayValue='TimePeriod.Description' 
						Height='10'
						DisplaySort='False'
						DisplayNone='False'
						DisplayMoveAll='True'
						MinSelected='1'
						TooFewMessage='Time Period/Award Cycle is required.'>
						<Sort>
	                        <Argument PropertyKey='Description' Direction='Ascending' />
	                    </Sort>
						<DefaultValues>
							<Argument Type='DataObjectCollection' TypeKey='ReviewCycle' DataObjectPropertyKey='ReviewCycleID' PropertyKey='ReviewCycleID' />
						</DefaultValues>
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
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ReviewCycleEditor'/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCycle' DataObjectPropertyKey='ReviewCycleID' PropertyKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
							    <Argument Type='Control' TypeKey = 'ctlProgram' ControlPropertyKey='SelectedValue' BaseValue='ProgramID=' />
							    <Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
							</Parameters>						
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndContinue'
						Container='spnSaveAndContinue'
						Type='cButton'
						Image='Save_and_Continue'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ReviewCycleManager'/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCycle' DataObjectPropertyKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCycle' DataObjectPropertyKey='CompetitionID' BaseValue='CompetitionID='/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCycle' DataObjectPropertyKey='ProgramID' BaseValue='ProgramID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>

					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ReviewCycle'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>
	</ModuleSection>		
</span>
<!-- End Embedded XML -->
