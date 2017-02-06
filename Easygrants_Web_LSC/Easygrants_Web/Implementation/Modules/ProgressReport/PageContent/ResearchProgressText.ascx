<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ResearchProgressText.ascx.vb" Inherits="Easygrants_Web.Modules.ProgressReport.PageContent.cResearchProgressText" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server'/>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>
<br>
      <span id='spnPageContent' runat='server' />
<br>
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' Width='100%'>	
	<tr>
		<td class="SeparatorHdg"><b>Research Progress Text</b></td>
	</tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td>
			1. List the original specific project objectives and milestones, and describe progress 
			towards achieving them since the beginning of this Award.  Describe and explain any 
			significant changes to the research plan that occurred during this period. 
			(Please limit your response to 500 words.)
		</td>
	</tr>
	<tr>
		<td><span id='spnDesc1' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			2. List any project-related presentations or manuscripts submitted or published during 
			the report period.  (Please limit your response to 125 words.)
		</td>
	</tr>
	<tr>
		<td><span id='spnDesc2' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			3. List and describe any invention disclosure or patent activity during the report 
			period. (Please limit your response to 125 words.)
		</td>
	</tr>
	<tr>
		<td><span id='spnDesc3' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			4. Describe any progress toward project-related commercialization, licensing, or 
			technology transfer activity during the report period.  (Please limit your response to 125 words.)
		</td>
	</tr>
	<tr>
		<td><span id='spnDesc4' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			5. Describe any project-related grants or other funding applications or awards during 
			the project period. (Please limit your response to 125 words.)
		</td>
	</tr>
	<tr>
		<td><span id='spnDesc5' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>							
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' Width='100%'>	
	<tr>
		<td align='center'>
			<span runat='server' id='spnSave_and_Continue'/>&nbsp;<span runat='server' id='spnClose'/>

		</td>
	</tr>	
</table>


<!-- Page Content - Controls -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
        <DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Save='True'
						Image='Save_and_Continue'
						GoToNextPage='True'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'
						Confirmation='Select OK to close the page without saving the data. Select Cancel to return.'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Main'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>						
			</DisplayProperties>
		</DataObject>
		<DataObject Key='GranteeProjectDescriptionEG2' DataObjectDefinitionKey='GranteeProjectDescriptionEG2' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser'
					TypeKey='GranteeProjectID'
					PropertyKey='GranteeProjectID'
					Value='' />
				<Argument Type='ModuleUser'
					TypeKey='WfTaskID'
					PropertyKey='TaskID'
					Value='' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser'
					TypeKey='GranteeProjectID'
					PropertyKey='GranteeProjectID'
					Value='' />
				<Argument Type='ModuleUser'
					TypeKey='WfTaskID'
					PropertyKey='TaskID'
					Value='' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Desc1'>
					<Control ID='ctlDesc1'
						Container='spnDesc1'
						Type='cTextArea'
						Rows='5'
						Cols='60'
						MaxLength='3000'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,3000}$' ErrorMessage='Description 1: Limit your original objectives description to 500 words or less.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Desc2'>
					<Control ID='ctlDesc2'
						Container='spnDesc2'
						Type='cTextArea'
						Rows='5'
						Cols='60'
						MaxLength='1600'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,1600}$' ErrorMessage='Description 2: Limit your general objectives description to 125 words or less.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Desc3'>
					<Control ID='ctlDesc3'
						Container='spnDesc3'
						Type='cTextArea'
						Rows='5'
						Cols='60'
						MaxLength='1600'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,1600}$' ErrorMessage='Description 3: Limit your detailed research plans description to 125 words or less.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Desc4'>
					<Control ID='ctlDesc4'
						Container='spnDesc4'
						Type='cTextArea'
						Rows='5'
						Cols='60'
						MaxLength='1600'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,1600}$' ErrorMessage='Description 4: Limit your envisioned product(s) description to 125 words or less.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Desc5'>
					<Control ID='ctlDesc5'
						Container='spnDesc5'
						Type='cTextArea'
						Rows='5'
						Cols='60'
						MaxLength='1600'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,1600}$' ErrorMessage='Description 5: Limit your progress toward project-related commercialization description to 125 words or less.' />
					</Control>
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>