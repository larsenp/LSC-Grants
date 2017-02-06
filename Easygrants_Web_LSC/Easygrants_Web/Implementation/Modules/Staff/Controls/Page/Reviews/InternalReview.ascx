<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cInternalReview" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='Crumb' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<Crumb:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='' visible='true'
	AutoVDateType='Root' Key='InternalReview' LinkTitle='Internal Review' runat='server'/>

<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<table width='100%' border='0' cellpadding='2' cellspacing='0'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Internal Review Manager</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>	
	<tr>
		<td><b>Internal Review Stage</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnProgram' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnSubmitProgram' runat='server'/></td>
	</tr>
	<tr id='trCmpt' visible='false'>
		<td><b><span id='spnCmpt' runat='server'>Competition</span></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlCmpt' Type='cDropDown' runat='server' /></td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='btnCmpt' Type='cButton' Properties='Caption=Go&CausesValidation=False' runat='server'/></td>
	</tr>
	<tr id='trProject' visible='false'>
		<td><b><span id='spnProject' runat='server'>Project</span></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlProject' Type='cDropDown' runat='server' /></td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='btnProject' Type='cButton' Properties='Caption=Go&CausesValidation=False' runat='server' /></td>
	</tr>
	<tr id='trTask' visible='false'>
		<td><b><span id='spnTask' runat='server'>Task</span></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlTask' Type='cDropDown' runat='server' /></td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='btnTask' Type='cButton' Properties='Caption=Go&CausesValidation=False' runat='server' /></td>
	</tr>
	
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server' >
<tr><td>&nbsp;</td></tr>		

</table>

<Core:cUserCtlLoader CtlID='ctlWfTaskAssignListing' 
	Src='Implementation/Modules/Staff/Controls/Base/InternalTaskAssignListing.ascx'
	runat='server' />

<!-- Page Content - Controls -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProgram'
						Container='spnProgram'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTask'
						StoredValue='WfTaskID'
						DisplayValue='WfTask'>
						<Filters>
							<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='7'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTask'/>
						</Sort>
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmitProgram'
						Container='spnSubmitProgram'
						Type='cButton'
						visible='false' 
						Image='Go'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='InternalReview'/>
								<Argument Type='Control' TypeKey='ctlProgram' ControlPropertyKey='SelectedValue' BaseValue='WfTaskID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
								
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
