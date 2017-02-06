<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page.cConflictsAndPreferences_Main" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br>
      <span id='spnPageContent' runat='server' />
<br><br>
<asp:Panel runat="server" ID="IncompletePanel">
	<table  border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' id='TblIncomplete'>
		
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td class="SeparatorHdg"><b>Validation Summary</b>
			</td>
		</tr>
		<tr>
			<td><Core:cValidate id='ctlValidate' DisplayFormat='Summary' 
				runat='server'/>
			</td>
		</tr>
	</table>
</asp:Panel>
<asp:Panel runat="server" ID="CompletePanel">
	<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server' id='TblComplete'>
		<tr>
			<td class="SeparatorHdg"><b>Entered Conflicts and Preferences</b></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>
			 <span runat='server' id='spnDataList'></span>
			</td>
		</tr>
	</table>
</asp:Panel>

<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>
	<tr id='trSave1'>
		<td colspan='2'>
			<span runat='server' id='spnSave_and_Continue' />
		</td>
	</tr>
</table>

	
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='ReviewConflicts' DataObjectDefinitionKey='ReviewConflicts' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ReviewerID' Value='' />
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='RevWfTaskID' Value='' />
			</Filters>
			<Sort>
				<Argument PropertyKey='GranteeProjectID' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='ReviewConflicts'
						NoRecordMessage='No reviewer tasks.'
						SeparatorWidth='2'
						MaxPerPage='600'>
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='GrantId' ConfigurableHeader='True'>
							<Sortable>
								<Argument PropertyKey='GranteeProjectID'/>
							</Sortable>
							<Control ID='ctlLinkGrantID' Type='cLink' >
								<Action
									PostBack='True'
									AutoSave='True'
									Object='DataPresenter'
									Method='ViewParticipantSummary'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ParticipantSummary'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ApplicantName' ColumnHeader='Primary Contact/PI'>
							<Sortable>
								<Argument PropertyKey='ApplicantName'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.CommonOrganizationName' ColumnHeader='~~Organization~~'>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryOrganization' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RequestConflict' ColumnHeader='Preferences/Conflicts'>
							<Sortable>
								<Argument PropertyKey='RequestConflict' />
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton' 
						Image='Continue'
						Save='False'
						GoToNextPage='True' >
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
