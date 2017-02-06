<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div style='width:100%' class='SeparatorHdg'>
	Grantee Information
</div>
<br />
<table width='600'>
	<tr>
		<td width='30'>&nbsp;</td>
		<td width='120'>
			<b>Recipient Number</b>
		</td>
		<td width='120'>
			<span runat='server' id='spnRecipientNumber' />
		</td>
		<td width='120'>
			<b>Recipient Name</b>
		</td>
		<td width ='200'>
			<span runat='server' id='spnRecipientName' />
		</td>
		
	</tr>
	<tr>
	    <td>&nbsp;</td>
	    <td>
			<b><%=GetLabel("LegacyGrantId")%></b>
		</td>
		<td>
			<span runat='server' id='spnLegacyGrantID' />
		</td>
		<td>
			<b>Category</b>
		</td>
		<td>
			<span runat='server' id='spnCategory' />
		</td>
		
	</tr>
	<tr>
	    <td>&nbsp;</td>
	    <td>
			<b>Grant Cycle</b>
		</td>
		<td>
			<span runat='server' id='spnWfTAYear' />
		</td>
    </tr>
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False' >
		  <Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
		  </Filters>
		</DataObject>
		
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment'  DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryOrganization.LegacyOrganizationID'>
					<Control ID='spnRecipientNumber'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryOrganization.OrganizationName'>
					<Control ID='spnRecipientName'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LegacyGrantID'>
					<Control ID='spnLegacyGrantID'
						Type='HtmlGenericControl'>
					</Control>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='LscGranteeProjectTig.LscTigGrantType.Description'>
					<Control ID='spnCategory'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTACompetitionYear' DataObjectDefinitionKey='WfTACompetitionYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTAYear'>
					<Control ID='spnWfTAYear'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>


