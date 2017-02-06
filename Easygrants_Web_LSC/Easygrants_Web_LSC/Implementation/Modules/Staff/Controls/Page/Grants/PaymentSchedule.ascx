<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width='600' cellpadding='1'>
	<tr>
		<td align=center>
			<b>Legal Services Corporation</b>
		</td>
	</tr>
	<tr>
		<td align=center>
			<b><span runat='server' id='spnOrganizationName' /></b>
		</td>
	</tr>
	<tr>
		<td align=center>
			<b>Payment Schedule</b>
		</td>
	</tr>
	<tr>
		<td align=center>
			TIG Number: <span runat='server' id='spnTIG' />
		</td>
	</tr>
	<tr>
		<td align=center>
			Grantee Number: <span runat='server' id='spnLegacyOrganizationID' />
		</td>
	</tr>
	<tr>
		<td align=center>
			Grant Amount: <span runat='server' id='spnGrantAmount' />
		</td>
	</tr>
</table>

<table width='600' cellpadding='1'>
	<tr>
		<td width='100'>
			<b>Period</b>
		</td>
		<td width='400'>
			<b>Milestone Description</b>
		</td>
		<td width='100'>
			<b>Amount</b>
		</td>
	</tr>
</table>

<span runat='server' id='spnPaymentList' />

<table width='600' cellpadding='1'>
	<tr>
		<td width='100'>
			&nbsp;
		</td>
		<td width='400' align='right'>
			<b>Total Payment Request</b>
		</td>
		<td width='100'>
			<b><span runat='server' id='spnTotalRequest' /></b>
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryOrganization.OrganizationName'>
					<Control ID='spnOrganizationName'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LegacyGrantID'>
					<Control ID='spnTIG'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryOrganization.LegacyOrganizationID'>
					<Control ID='spnLegacyOrganizationID'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProjectInfo.AwardAmount' Format='$#,0'>
					<Control ID='spnGrantAmount'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Payment' DataObjectDefinitionKey='Payment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='PaymentNumber' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPaymentList'
						Type='cDataPresenterList'
						Container='spnPaymentList'
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/Staff/Controls/Page/Grants/PaymentScheduleItem.ascx'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscPaymentTotal' DataObjectDefinitionKey='LscPaymentTotal' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='RequestTotal' Format='$#,0'>
					<Control ID='spnTotalRequest'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
