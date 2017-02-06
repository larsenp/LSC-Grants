<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Edit Task Outcome</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>	
</table>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
<tr>
		<td><b>Program</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnProgram' runat='server'/>
		</td>		
	</tr>
	<tr>
		<td><b>Funding Opportunity</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnCompetition' runat='server'/>
		</td>		
	</tr>
	<tr>
		<td><b>Funding Cycle</b>	</td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnProject' runat='server'/>
		</td>	
	</tr>
<tr>
	<td><b>Task</b></td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnTask' runat='server'/>
	</td>	
</tr>
<tr>
	<td><b>Role</b></td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnRole' runat='server'/>
	</td>	
</tr>
<tr>
	<td><b>Outcome&nbsp;</b><%=kDenoteRequiredField%></td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnOutcome' runat='server'/>
	</td>	
</tr>
<tr>
	<td><b>Description&nbsp;</b><%=kDenoteRequiredField%></td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnDescription' runat='server'/>
	</td>	
</tr>
<tr>
	<td><b>Order&nbsp;</b><%=kDenoteRequiredField%></td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnOrder' runat='server'/>
	</td>	
</tr>
</table>
<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr><td>&nbsp;</td></tr>		
<tr>
	<td colspan='4' align='center'>
		<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnSave'/>
		<!-- Cancel Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnCancel'/>
	</td>
</tr>

</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='Program' DataObjectDefinitionKey='Program' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ProgramID' PropertyKey='ProgramID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ProgramDisplayName'>
					<Control ID='lblProgram'
						Container='spnProgram'
						Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Competition' DataObjectDefinitionKey='Competition' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='CompetitionID' PropertyKey='CompetitionID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CompetitionDisplayName'>
					<Control ID='lblCompetition'
						Container='spnCompetition'
						Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfProject' DataObjectDefinitionKey='WfProject' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfProjectName'>
					<Control ID='lblProject'
						Container='spnProject'
						Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTaskOutcomeList' DataObjectDefinitionKey='WfTaskOutcome' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='WfTaskOutcomeID'
					PropertyKey='WfTaskOutcomeID'
					Value='' 
					bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfTaskID' PropertyKey='WfTaskID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTask.WfTask'>
					<Control ID='spnTask'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>													

				<!--
				<DisplayProperty PropertyKey='WfTaskRoleID'>
					<Control ID='ctlRole'
						Container='spnRole'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskRole'
						StoredValue='WfTaskRoleID'
						DisplayValue='WfTaskRole'
						DisplayNone='True'>
					</Control>	
				</DisplayProperty>	
				-->
				<DisplayProperty PropertyKey='WfTaskRole.WfTaskRole'>
					<Control ID='spnRole'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>													

				
				<DisplayProperty PropertyKey='WfTaskOutcome'>
					<Control ID='ctlOutcome'
						Container='spnOutcome'
						Type='cTextBox'
						Size='65'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Outcome is required.'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTaskOutcome'>
					<Control ID='ctlDescription'
						Container='spnDescription'
						Type='cTextBox'
						Size='65'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Outcome Description is required.'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='SortOrder'>
					<Control ID='ctlOrder'
						Container='spnOrder'
						Type='cTextBox'
						Size='5'
						MaxLength='3'
						RequiredField='True'
						ErrorMessage='Order is required.'>
					<Validation Type='RegularExpression' ValidationExpression='^\d{0,}$' ErrorMessage='Task Order must be a number.' />
					</Control>					
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton' EnterKey='True'
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
