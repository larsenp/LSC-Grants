<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

  
<div style="width:100%" class='SeparatorHdg' >Application Info</div>
<table width='600px' cellpadding='1' border='0'>
	<tr>
		<td>
			<b>Organization</b> <span runat='server' id='spnOrganization' /> (<span runat='server' id='spnRecipientID' />)
		</td>
		<td>
			<b>TIG</b> <span runat='server' id='spnTIG' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Category</b> <span runat='server' id='spnCategory' />
		</td>
	</tr>
</table>
  
  
  
  <!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryOrganization.OrganizationName'>
					<Control ID='spnOrganization'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryOrganization.LegacyOrganizationID'>
					<Control ID='spnRecipientID'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LegacyGrantID'>
					<Control ID='spnTIG'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscGranteeProjectTig.LscTigGrantType.Description'>
					<Control ID='spnCategory'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
    </ModuleSection>
  </span>