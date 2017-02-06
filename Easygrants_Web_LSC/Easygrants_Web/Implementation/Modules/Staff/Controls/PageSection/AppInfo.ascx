<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.PageSection.cAppInfo" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="5" class="SeparatorHdg"><b>Participant Information</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='0' runat='server'>
	<tr>
		<td width='200'>
			<b>Participant Name</b>
		</td>
		<td>
			<span runat='server' id='spnName' visible='true'></span>
			<span runat='server' id='spnNameNoConflict' visible='false'></span>
		</td>
	</tr>
	<tr>
		<td width='200'>
			<b>Primary <%=GetLabel("Organization")%></b>&nbsp;&nbsp;
		</td>
		<td>
			<span runat='server' id='spnInst' visible='true'></span>
			<span runat='server' id='spnInstNoConflict' visible='false'></span>
		</td>
	</tr>	
	<tr>
		<td width='200'>
			<b>Committee</b>&nbsp;&nbsp;
		</td>
		<td>
			<span runat='server' id='spnCmt' visible='true'></span>
			<span runat='server' id='spnCmtNoConflict' visible='false'></span>
		</td>
	</tr>	
<tr><td>&nbsp;</td></tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
	
		<DataObject Key='ReviewCycleProjectTask' DataObjectDefinitionKey='ReviewCycleProjectTask'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='ReviewCycleID' 
					PropertyKey='ReviewCycleID' 
					Value='' 
					/>
			</Filters>
		</DataObject>
		<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewCycleProjectTask' DataObjectPropertyKey='WfProjectTaskID' PropertyKey='WfProjectTaskID'/>
			</Filters>
		</DataObject>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='AppPersonID' 
					PropertyKey='PrimaryPersonID' 
					Value='' />
				<Argument Type='DataObjectCollection' TypeKey='WfProjectTask' DataObjectPropertyKey='WfProjectID' PropertyKey='WfProjectID'/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='PrimaryOrganization.CommonOrganizationName'>
					<Control ID='spnInstNoConflict'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryPersonID' PropertyKey='PersonID'/>
				<Argument Type='Data' TypeKey='WfTaskRoleID' PropertyKey='WfTaskRoleID' Value='1' />
				<Argument Type='Data' TypeKey='WfTaskTypeID' PropertyKey='WfTaskTypeID' Value='1'>
					<RelatedProperty PropertyKey='WfTask'/>
				</Argument>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='Person.LastNameFirstNameMiddleName'>
					<Control ID='spnNameNoConflict'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>	
	
		<DataObject Key='ReviewCycleConflict' DataObjectDefinitionKey='ReviewCycleConflict'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='ReviewCycleID' 
					PropertyKey='ReviewCycleID' 
					Value='' 
					Bool=''/>
				<Argument Type='QueryString' 
					TypeKey='AppPersonID' 
					PropertyKey='AppPersonID' 
					Value='' />
					/>
				<Argument Type='QueryString' 
					TypeKey='CommitteeID' 
					PropertyKey='ReviewCommitteeID' 
					Value='' 
					/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='AppPerson.LastNameFirstNameMiddleName'>
					<Control ID='spnName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTaskAssignment.GranteeProject.PrimaryOrganization.CommonOrganizationName'>
					<Control ID='spnInst'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReviewCommittee.ReviewCommitteeDescription'>
					<Control ID='spnCmt'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
<!-- End Embedded XML -->
</span>
