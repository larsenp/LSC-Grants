<%@ Control Language="vb" AutoEventWireup="true" CodeBehind='ProgressReportTimeLineEditor.ascx.vb' Inherits="Easygrants_Web.Modules.ProgressReport.PageContent.cProgressReportTimeLineEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Controls -->
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr><td class="SeparatorHdg"><b>Instructions</b></td></tr>	
	<tr><td><span id='spnPageContent' runat='server' /></td></tr>	
</table>
<br>
<table id="Table2" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    
    <tr>
		<td class="SeparatorHdg" colspan='2' ><b>Add or Edit Milestone/Activity</b></td>
	</tr>
	<tr>
	    <td colspan='2'>&nbsp;</td>
	</tr>    
<tr>
	<td width='15%'><b>Milestone/Activity</b>&nbsp;<%=kDenoteRequiredField%></td>	
	<td><span runat='server' id='spnMilestone' /></td>
</tr>

<tr>
    <td><b>Description</b></td>
    <td><span runat='server' id='spnDescription' /></td>
</tr>
<tr>
    <td><b>Expected Date</b>&nbsp;<%=kDenoteRequiredField%></td>
    <td><span runat='server' id='spnTargetDate' /><span runat='server' id='spnTargetDateView' /></td>
</tr>
<tr>
	<td>&nbsp;</td>
	<td class='FieldLabel'>mm/dd/yyyy</td>
</tr>
<tr>
    <td><b>Modified Date</b></td>
    <td><span runat='server' id='spnModifiedDate' /></td>
</tr>
<tr>
	<td>&nbsp;</td>
	<td class='FieldLabel'>mm/dd/yyyy</td>
</tr>
<tr>
    <td><b>Status</b>&nbsp;<%=kDenoteRequiredField%></td>
    <td><span runat='server' id='spnStatus' /></td>
</tr>
<tr>
    <td><b>Deliverable</b></td>
    <td><span runat='server' id='spnIsDeliverable' /></td>
</tr>
</table>
<table id="Table3" border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
<tr>
	<td>
		<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;
		<span runat='server' id='spnSaveClose'/>&nbsp;&nbsp;&nbsp;&nbsp;
		<span runat='server' id='spnCancel'/>		
	</td>
</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='ProjectTimelineEditor' DataObjectDefinitionKey='GranteeProjectTimeline' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='QueryString' TypeKey='ProjectTimelineID' PropertyKey='ProjectTimelineID' Value=''/>
			</Filters>
			<DefaultValues>
			    <Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
			   <DisplayProperty PropertyKey='Milestone'>
					<Control ID='ctlMilestone'
						Container='spnMilestone'
						Type='cTextBox'
						Size='45'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Milestone/Activity is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlDescription'
						Container='spnDescription'
						Type='cTextArea'
						MaxLength='500'
						Rows='3'
						Cols='50'>					
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TargetDate'>
					<Control ID='ctlTargetDate'
						Type='cDateTextBox'
						Container='spnTargetDate'
						Size='10'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						NotSupportedDateErrorMessage="Expected Date must be in MM/DD/YYYY format."
						RequiredField='True'
						ErrorMessage='Expected Date is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TargetDate' Format='MM/dd/yyyy'>
					<Control ID='spnTargetDateView'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ModifiedDate'>
					<Control ID='ctlModifiedDate'
						Type='cDateTextBox'
						Container='spnModifiedDate'
						Size='10'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						NotSupportedDateErrorMessage="Expected Date must be in MM/DD/YYYY format."
						RequiredField='False'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TimelineStatusID'>
					<Control ID='ctlStatus'
						Container='spnStatus'
						Type='cDropDown'
						DataObjectDefinitionKey='TimelineStatus'
						StoredValue='TimelineStatusID'
						DisplayValue='TimelineStatusDesc'
						DisplayNone='False'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Status is required.'>
						<Sort>
							<Argument PropertyKey='TimelineStatusDesc' />
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsDeliverable'>
					<Control ID='ctlIsDeliverable'
						Container='spnIsDeliverable'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						DefaultValue='False'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
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
						Image='Save'
						EnterKey='True'>
						<Action PostBack='True' AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>							
							        <Argument AttributeName='PageKey' Value='ProjectTimelineEditor'/>
									<Argument Type='' TypeKey='ProjectTimelineID' AttributeName='ProjectTimelineID' BaseValue='ProjectTimelineID='/>
									<Argument Type='DataObjectCollection' TypeKey='ProjectTimelineEditor' DataObjectPropertyKey='ProjectTimelineID' PropertyKey='ProjectTimelineID' BaseValue='ProjectTimelineID='/>
									<Argument Type='ModuleUser' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>																		
							</Parameters>							    					
						
						</Action>
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClose'
						Container='spnSaveClose'
						Type='cButton'
						Image='Save and Close'>
						<Action PostBack='True'  AutoSave='True' Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
							    <Argument AttributeName='PageKey' Value='ProjectTimeline'/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>					
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action PostBack='True' Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
							    <Argument AttributeName='PageKey' Value='ProjectTimeline'/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>			

	</ModuleSection>
<!-- End Embedded XML -->
</span>

