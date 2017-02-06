<%@ Control Language="vb" AutoEventWireup="true" Codebehind="CompetitionEditor_content.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cCompetitionEditor_content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>

<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->

<!-- Control Label (for Education information) -->
<br></br>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
<tr>
	<td><b><%=GetLabel("FundingOpportunity")%> </b><%=kDenoteRequiredField%></td>
	<td width='10'>&nbsp;</td>
	<td><span id='spnCompetitionName' runat='server'/></td>	
</tr>
<tr>
	<td colspan='2'></td>	
	<td>Limit: 50 characters</td>	
</tr>
<tr>
	<td><b><%=GetLabel("FundingOpportunityDisplayName")%> </b><%=kDenoteRequiredField%></td>
	<td width='10'>&nbsp;</td>
	<td><span id='spnCompetitionDisplayName' runat='server'/></td>	
</tr>
<tr>
	<td colspan='2'></td>	
	<td>Limit: 200 characters</td>	
</tr>
<tr>
	<td><b>Funding Opportunity Abbreviation <%=kDenoteRequiredField%></b></td>
	<td width='10'>&nbsp;</td>
	<td><span id='spnFOAbbr' runat='server'/></td>	
</tr>
<tr>
	<td colspan='2'></td>	
	<td>Limit: 10 characters</td>	
</tr>
</table>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlCompetitionEditor_contentImpl'
Src='Implementation\Modules\Staff\Controls\Page\Administration\CompetitionEditor_contentImpl.ascx' 
runat='server'/>


<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr><td>&nbsp;</td></tr>		
<tr>
	<td colspan='4' align='center'>
		<span runat='server' id='spnSave'/>
		<span runat='server' id='spnSaveAndClose'/>
		<span runat='server' id='spnCancel'/>
	</td>
</tr>

</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Competition' DataObjectDefinitionKey='Competition' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='CompetitionID'
					PropertyKey='CompetitionID'	Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='ProgramID' PropertyKey='ProgramID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CompetitionName'>
					<Control ID='ctlCompetitionName'
						Container='spnCompetitionName'
						Type='cTextBox'
						Size='65'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='~~FundingOpportunity~~ is required.'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='CompetitionDisplayName'>
					<Control ID='ctlCompetitionDisplayName'
						Container='spnCompetitionDisplayName'
						Type='cTextBox'
						Size='65'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='~~FundingOpportunityDisplayName~~ is required.'>
					</Control>					
				</DisplayProperty>	
				<DisplayProperty PropertyKey='ShortName'>
					<Control ID='ctlFOAbbr'
						Container='spnFOAbbr'
						Type='cTextBox'
						Size='10'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='Funding Opportunity Abbreviation is required.'>
					</Control>					
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
						<Control ID='ctlCompetitionEditor_contentImpl' Type='cUserCtlLoader' />
				</DisplayProperty>
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
								<Argument Type='DataObjectCollection' TypeKey='Competition' DataObjectPropertyKey='CompetitionID' PropertyKey='CompetitionID' BaseValue='CompetitionID='/>
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
