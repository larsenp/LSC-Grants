<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->

<table border='0' cellpadding='0' cellspacing='0' width='100%'>
	<tr>
		<td>
			<span runat='server' id='spnGranteeProjectResearchCategory'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='WfTaskID' Value=''>
					<RelatedProperty PropertyKey='WfProjectTask'/>
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProjectResearchCategories'>
					<Control ID='ctlGranteeProjectResearchCategory'
						Container='spnGranteeProjectResearchCategory'
						Type='cDoubleListBox'
						DataObjectDefinitionKey='ResearchCategory'
						DisplayValue='Description'
						StoredValue='ResearchCategoryID'
						StoredDisplayValue='ResearchCategory.Description' 
						Height='9'
						DisplayNone='False'
						DisplayMoveAll='True'>
						<DefaultValues>
							<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
							<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='WfTaskID' Value=''/>
						</DefaultValues>
						<Filters>
						</Filters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>		
<!-- End Embedded XML -->
</span>
