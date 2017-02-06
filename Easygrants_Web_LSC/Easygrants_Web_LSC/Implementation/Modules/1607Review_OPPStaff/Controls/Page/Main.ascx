<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<div style="width:600px">
	<div class='SeparatorHdg' width='100%'>
		Instructions
	</div>
	TBD<BR />
	<Core:cUserCtlLoader CtlID='ctlAppInfo'
		Src='Implementation/Modules/1607Review_OPPStaff/Controls/PageSection/1607Information.ascx'
		runat='server'/>
	<div class='SeparatorHdg' width='100%'>
		Program Follow-up
	</div>
	<p>What follow-up steps were taken with the program? Check one or more boxes.</p>
	<span runat='server' id='spnLscWfTA1607FollowUpSteps'/>
	<p>Describe the results of the follow-up: </p>
	<span runat='server' id='spnFollowUpResults'/>
	<br /><br />
	<div style="text-align:center">
		<span runat='server' id='spnSave'/>&nbsp;&nbsp;
		<span runat='server' id='spnContinue'/>
	</div>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscWfTA1607Review' DataObjectDefinitionKey='LscWfTA1607Review' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscWfTA1607FollowUpSteps'>
					<Control ID='ctlLscWfTA1607FollowUpSteps'
						Type='cCheckBoxList'
						Container='spnLscWfTA1607FollowUpSteps'
						DataObjectDefinitionKey='Lsc1607FollowUpStep'
						DisplayValue='Description'
						StoredValue='Lsc1607FollowUpStepID'
						RepeatColumns='0'
						CellSpacing='3'
						RepeatDirection='Vertical'>
						<Sort>
							<Argument PropertyKey="SortOrder"/>
						</Sort>
						<DefaultValues>
							<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
						</DefaultValues>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FollowUpResults'>
					<Control ID='txtFollowUpResults'
						Type='cTextArea'
						Container='spnFollowUpResults'
						Rows='3'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Caption='Save'
						Type='cButton'>
						<Action PostBack='True'
							AutoSave='True'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Caption='Save and Continue'
						Save='True'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
