<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ProgramEditor_content.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cProgramEditor_content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3' class="SeparatorHdg" width='100%'><b>Add or Edit Program</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
<tr>
	<td>&nbsp;<b><%=GetLabel("ProgramName")%> <%=kDenoteRequiredField%></b></td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnProgramName' runat='server'/>		
	</td>	
</tr>
<tr>
	<td colspan='2'></td>	
	<td>Limit: 50 characters</td>	
</tr>
<tr>
	<td>&nbsp;<b><%=GetLabel("ProgramDisplayName")%> <%=kDenoteRequiredField%></b></td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnProgramDisplayName' runat='server'/>		
	</td>	
</tr>
<tr>
	<td colspan='2'></td>	
	<td>Limit: 200 characters</td>	
</tr>
<tr>
	<td>&nbsp;<b>Program Abbreviation <%=kDenoteRequiredField%></b></td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnProgramAbbr' runat='server'/>		
	</td>	
</tr>
<tr>
	<td colspan='2'></td>	
	<td>Limit: 10 characters</td>	
</tr>

<tr visible='false'>
	<td><b>Grant Number Part</b>&nbsp;<%=kDenoteRequiredField%></td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnGrantNumberPart' runat='server'/>
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
		<span runat='server' id='spnSaveAndClose'/>
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
		<DataObject Key='Program' DataObjectDefinitionKey='Program' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ProgramID'
					PropertyKey='ProgramID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>			
				<DisplayProperty PropertyKey='ProgramName'>
					<Control ID='ctlProgramName'
						Container='spnProgramName'
						Type='cTextBox'
						Size='65'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='~~ProgramName~~ is required.'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProgramDisplayName'>
					<Control ID='ctlProgramDisplayName'
						Container='spnProgramDisplayName'
						Type='cTextBox'
						Size='65'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='~~ProgramDisplayName~~ is required.'>
					</Control>					
				</DisplayProperty>	
				<DisplayProperty PropertyKey='ShortName'>
					<Control ID='ctlProgramAbbr'
						Container='spnProgramAbbr'
						Type='cTextBox'
						Size='10'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='Program Abbreviation is required.'>
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
						EnterKey='True'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='Program' DataObjectPropertyKey='ProgramID' PropertyKey='ProgramID' BaseValue='ProgramID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'>
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
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ProgramManagement'/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>								
	</ModuleSection>
<!-- End Embedded XML -->
</span>
