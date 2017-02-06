<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/TIG_Application/Forms/ApplicationInfo.ascx'
	runat='server'/>
<br />
<div style="width:100%" class="SeparatorHdg">
	Instructions
</div>
<p>In the text box at the bottom of the page, explain how the proposed project builds on knowledge or expertise gained from any prior TIG grants received by the program.</p>
  
<div width='600' class='SeparatorHdg'>Prior TIG Awards</div>
<br />
<span runat='server' id='spnDPL' /><br />

<b>How does the proposed project build on knowledge or expertise gained from any prior TIG grants received by the program?</b><font color='red'>*</font><br />
<span runat='server' id='spnPriorTigAwards' />
<br /><br />

<div width='600' style="text-align:center">
	<span runat='server' id='spnSave' />
	<span runat='server' id='spnContinue' />
</div>
  
  
  <!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
		<DataObject Key='CurrentGranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='PriorTIGAwards' DataObjectDefinitionKey='GranteeProject' Updatable='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='CurrentGranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='PrimaryOrganizationID' />
				<Argument PropertyKey='ProgramID' Value='2'>
					<RelatedProperty PropertyKey='WfProject.WfCompetition' />
				</Argument>
				<Argument Group='(' Bool='And' />
					<Argument PropertyKey='GrantStatusID' Value='1' Bool='' />
					<Argument PropertyKey='GrantStatusID' Value='4' Bool='Or' />
				<Argument Group=')' Bool='' />
			</Filters>
			<Sort>
				<Argument PropertyKey='LegacyGrantID' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDPL' Container='spnDPL' Type='cDataPresenterList' DataPresenterID='DPL' DataPresenterURL='Implementation/Modules/TIG_Application/Forms/PriorTIGAwardsChild.ascx' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscTigApp' DataObjectDefinitionKey='LscTigApp' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PriorTigAwards'>
					<Control ID='txtPriorTigAwards'
						Type='cTextArea'
						Container='spnPriorTigAwards'
						Rows='8'
						Cols='80' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

    </ModuleSection>
  </span>