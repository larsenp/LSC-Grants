<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="FundingSourcesSummary.ascx.vb" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Fund Allocation Summary</b></td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnFundingSourceSumList'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

		<DataObject Key='FundingSourcesSummaryList' DataObjectDefinitionKey='FundingSourcesSummary'>
			<Sort>
				<Argument PropertyKey='Description'/>
			</Sort>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlFundingSourceSumList'
						Container='spnFundingSourceSumList'
						Type='cDataListCtl'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='Description' ColumnHeader=' ' Width='25%'>
							
					    </DisplayProperty>
						<DisplayProperty PropertyKey='Amount' ColumnHeader=' ' Format='$#,0.00' Width='75%'>
							
						</DisplayProperty>
						
				    </Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>