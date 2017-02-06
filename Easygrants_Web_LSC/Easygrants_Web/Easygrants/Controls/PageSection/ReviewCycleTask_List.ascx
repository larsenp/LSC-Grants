<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cReviewCycleTask_List" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../Core/Controls/Base/NewWindowOpener.ascx' %>

	
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->

<table border='0' cellpadding='0' cellspacing='0' width='100%'>
	<tr>
		<td>
			<span runat='server' id='spnReviewCycleProjectTask'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr runat='server' visible='true'><td><span id='spnViewApplicantPool' runat='server'/></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr runat='server' visible='false'>
		<td colspan="2">
			<Core:cUserCtlLoader CtlID='lnkView' Type='cLink' Properties='Caption=View of Selected Applicant Pool in HTML&CausesValidation=False' runat='server'/>

		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>		
<tr>
	<td>
		<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnSave' visible='false'/>	
		<!-- Cancel Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnCancel' visible='false'/>	
	</td>
</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->
<Core:cUserCtlLoader CtlID='ctlViewResults' Src='Core/Controls/Base/NewWindowOpener.ascx' runat='server'/>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewCycle' DataObjectDefinitionKey='ReviewCycle' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='ReviewCycleID'
					PropertyKey='ReviewCycleID' 
					Value='' 
					bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ReviewCycleProjectTask'>
					<Control ID='ctlReviewCycleProjectTask'
						Container='spnReviewCycleProjectTask'
						Type='cDoubleListBox2'
						DataObjectDefinitionKey='WfProjectTask'
						DisplayValue='Description'
						StoredValue='WfProjectTaskID'
						StoredDisplayValue='ProjectTask.Description' 
						Height='9'
						DisplayNone='False'>
						<DefaultValues>
							<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' Value=''/>
						</DefaultValues>
						<Filters>
							<Argument Type='QueryString' 
								TypeKey='CmptType'
								PropertyKey='CompetitionTypeID' 
								Value='' 
								bool=''>
								<RelatedProperty PropertyKey='WfProject.WfCompetition'/>
							</Argument>
							<Argument Type='' 
								TypeKey=''
								PropertyKey='WfTaskTypeID' 
								Value='1' 
								bool=''>
								<RelatedProperty PropertyKey='WfTask'/>
							</Argument>
						</Filters>
						<RelatedDataObjects>
							<RelatedDataObject DataObjectDefinitionKey='ReviewCycleProjectTaskOutcome'>
								<RelationshipProperties>
									<RelationshipProperty parentProperty='ReviewCycleProjectTaskID' childProperty='ReviewCycleProjectTaskID' />
								</RelationshipProperties>
							</RelatedDataObject>
						</RelatedDataObjects>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control Container='spnViewApplicantPool' 
						ID='ctlViewApplicantPool'
						Type='cLink'
						Caption='View of Selected Applicant Pool in HTML'>
						<Action
							PostBack='True'
							AutoSave='True'>
							<Parameters>
							</Parameters>
						</Action>		
					</Control>
				</DisplayProperty>
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
								<Argument AttributeName='PageKey' Value='Committees'/>
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
								<Argument AttributeName='PageKey' Value='Committees'/>
							</Parameters>						
						</Action>
					</Control>	
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>
	</ModuleSection>		
<!-- End Embedded XML -->
</span>
