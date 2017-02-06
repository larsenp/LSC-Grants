<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cConflictDetailByApp" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="ConflictDetailByApp.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<p>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewPages.ascx'
	runat='server'/>
<p>
<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Relative' Key='ResultsDetailsByApplicant' LinkTitle='Conflicts and Preferences Processing' runat='server'/>

<Core:cUserCtlLoader CtlID='ReviewCycleInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewCycleInfo.ascx'
	runat='server'/>
	
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Participant Information</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='0' runat='server'>
	<tr>
		<td width='200'><b>Participant</b></td>
		<td><span runat='server' id='spnName' visible='true'></span></td>
	</tr>
	<tr>
		<td><b>Primary <%=GetLabel("Organization")%></b>&nbsp;&nbsp;</td>
		<td><span runat='server' id='spnInst' visible='true'></span></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Conflicts and Preferences by Participant</b></td>
	</tr>
</table>
<br>
<!--This page lists all conflict/preference results for the selected applicant. Click the <b>Add</b> button
to add a new conflict for the participant.  --> <span id='spnMore' runat='server' visible='false'/><!--<br><br> -->
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAdd'></span>
		</td>		
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList' visible='true'></span>
		</td>
	</tr>	
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td><span runat='server' id='spnCancel'/></td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<!--
		This DataObject must be first in order to remove the AppPersonID filter
		when "All" is selected.
		-->
		<DataObject Key='ReviewCycleConflictList' DataObjectDefinitionKey='ReviewCycleConflict'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' />
				<Argument Type='QueryString' TypeKey='AppPersonID' PropertyKey='AppPersonID' />
				<Argument Type='' TypeKey='' PropertyKey='RequestConflictID' Operator='GreaterThan' Value='0'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName'>
					<RelatedProperty PropertyKey='RevPerson'/>
				</Argument>
				<Argument PropertyKey='FirstName'>
					<RelatedProperty PropertyKey='RevPerson'/>
				</Argument>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='ConflictDetailByAppEditor'/>
									<Argument Type='' TypeKey='ReviewCycleConflictID' Value='ReviewCycleConflictID=0'/>
									<Argument Type='QueryString' TypeKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
									<Argument Type='QueryString' TypeKey='AppPersonID' BaseValue='AppPersonID='/>
									<Argument Type='' TypeKey='CommitteeID' Value='CommitteeID=-1'/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						MaxPerPage='10'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='RevPerson.LastNameFirstName' ColumnHeader='Reviewer'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='RevPerson'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RevPerson.PersonPrimaryAffiliation.Organization.CommonOrganizationName' ColumnHeader='Reviewer ~~Organization~~'>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='RevPerson.PersonPrimaryAffiliation.Organization'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RequestConflict.Description' ColumnHeader='Conflict/Preference'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='RequestConflict'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ConflictType.Description' ColumnHeader='Type'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='ConflictType'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewSource.Description' ColumnHeader='Source'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='ReviewSource'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ConflictDetailByAppEditor'/>
										<Argument Type='DataObject' TypeKey='ReviewCycleConflictID' AttributeName='ReviewCycleConflictID' BaseValue='ReviewCycleConflictID='/>
										<Argument Type='DataObject' TypeKey='ReviewCycleID' AttributeName='ReviewCycleID' BaseValue='ReviewCycleID='/>
										<Argument Type='DataObject' TypeKey='RevPersonID' AttributeName='RevPersonID' BaseValue='RevPersonID='/>
										<Argument Type='DataObject' TypeKey='AppPersonID' AttributeName='AppPersonID' BaseValue='AppPersonID='/>
										<Argument Type='DataObject' TypeKey='ReviewCommitteeID' AttributeName='ReviewCommitteeID' BaseValue='CommitteeID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
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
		<DataObject Key='Applicant' DataObjectDefinitionKey='Person'>
			<Filters>
				<Argument Type='QueryString' TypeKey='AppPersonID' PropertyKey='PersonID'/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='LastNameFirstNameMiddleName'>
					<Control ID='spnName' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.CommonOrganizationName'>
					<Control ID='spnInst' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>	
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlMore'
						Container='spnMore'
						Type='cTextPopUp'
						PopUpCloseImage='Close'
						Height='300'
						Width='400'
						Caption='Source Definition'>
						<InstructionHtml>
							<p>The Source definitions are as follows:</p>
							<ul>
								<li><b>Internal Auto:</b>  The conflict/preference records that were generated based on the Conflicts and Preferences automatic process (on the Conflicts and Preferences main page).</li>
								<li><b>Internal Manual:</b>  The conflict/preference records that were created and edited by staff members.</li>
								<li><b>External:</b>  The conflict/preference records that were created and edited by Reviewers.</li>
							</ul>
						</InstructionHtml>
						<Action PostBack='False'>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
