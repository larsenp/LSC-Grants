<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.ReviewStage.PageContent.cAssignments" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ register tagprefix='Core' tagname='cCloseWindow' src='../../../../Core/Controls/Base/CloseWindow.ascx' %>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Assignment Details - By Reviewer</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td width='15%' nowrap='true'><b>Committee Name:</b></td><td><span id='spnReviewCommittee' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList' visible='true'></span>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table id='tblCloseWindow' visible='true' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr align='center'>
		<td><span runat='server' id='spnClose' visible='true'/></td>
	</tr>	
	<tr>
		<td><span runat='server' id='spnCloseControl' visible='false'/></td>
	</tr>	
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
	   
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Group='(' Bool=''/>
					<Argument Type='Data' 
						TypeKey=''
						PropertyKey='ReviewPreferenceTypeID' 
						Value='1'
						Bool=''/>
					<Argument Type='Data' 
						TypeKey=''
						PropertyKey='ReviewPreferenceTypeID' 
						Value='2' 
						Bool='Or'/>
					<Argument Type='Data' 
						TypeKey=''
						PropertyKey='ReviewPreferenceTypeID' 
						Value='3' 
						Bool='Or'/>
					<Argument Type='Data' 
						TypeKey=''
						PropertyKey='ReviewPreferenceTypeID' 
						Value='null' 
						Bool='Or'/>
				<Argument Group=')' Bool=''/>	
				<Argument Type='QueryString' 
					TypeKey='ReviewCommitteeID'
					PropertyKey='ReviewCommitteeID' 
					Value='' 
					Bool='And'/>
				<Argument Type='Data' 
					TypeKey='WfTaskID' 
					PropertyKey='WfTaskID' 
					Value='22' 
					Operator='NotEqual'
					Bool='And'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName'>	
					<RelatedProperty PropertyKey='Person'/>
				</Argument>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='ReviewCommitteeName.ReviewCommitteeDescription'>
					<Control ID='spnReviewCommittee'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader='Reviewer Name'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='Person'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewCommitteeName.ReviewCommitteeScience.ScienceClassification.Description' ColumnHeader='Reviewer Science' />
						<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstName' ColumnHeader='Applicant Name' />
						<DisplayProperty PropertyKey='GranteeProjectInfo.ScienceClassification.Description' ColumnHeader='Applicant Science' />						
						<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.CommonOrganizationName' ColumnHeader='Applicant ~~Organization~~' />						
						<DisplayProperty PropertyKey='ReviewAssignmentType.Description' ColumnHeader='Assignment' />						
						<DisplayProperty PropertyKey='ReviewPreferenceType.Description' ColumnHeader='Preference' />						
						<DisplayProperty PropertyKey='WfTaskAssignmentID' ColumnHeader='WFTAID' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CloseWindow' />
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCloseControl'
						Container='spnCloseControl'
						Type='cCloseWindow' />
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
