<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<b>You must generate your final PDF before you can submit your project report.</b>
<table width='100%'>
	<tr>
		<td class='SeparatorHdg'>Final Report Generation</td>
	</tr>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlApplicantReportLink' Type='cReportOutputLink' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg'>
			Validation Summary
		</td>
	</tr>
	<tr>
		<td>
			<Core:cValidate id='ctlValidate' DisplayFormat='Detail' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<center>
<table>	
	<tr>
		<td>
			<span runat='server' id='spnSave_and_Continue'/>&nbsp;&nbsp;
			<span runat='server' id='spnClose'/>
		</td>
	</tr>
</table>
</center>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='Click the View PDF button to view your Progress Report in PDF format. Easygrants&reg; uses pop-up functionality. This functionality must be enabled. (i.e., turn off pop-up blockers.)'>
						<Parameters>
							<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityID' Value=''/>
							<Argument PropertyKey='DefinitionID' 
								Value='17'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Image='Save_and_Continue'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Submission'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>

				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
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
	</ModuleSection>
</span>
