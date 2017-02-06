<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.cPaymentImportViewHtml" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="PaymentImportViewHtml.ascx.vb" %>
<%@ register tagprefix='Core' tagname='cCloseWindow' src='../../../../../../Core/Controls/Base/CloseWindow.ascx' %>
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server' ID="Table1">
	<tr>
		<td colspan='4' class="SeparatorHdg">
			<p>Payments	Import</p>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
			<b>File Name:</b> &nbsp;&nbsp;&nbsp;<span id='spnFileName' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
			<b>Import Date:</b> &nbsp;&nbsp;&nbsp;<span id='spnSubmitDate' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
			<b>Import Result:</b> &nbsp;&nbsp;&nbsp;<span id='spnImportResult' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->
<table id='tblCloseWindow' align='center' visible='true' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr align='center'>
		<td><span runat='server' id='spnClose' visible='true'/></td>
	</tr>	
	<tr align='center'>
		<td><span runat='server' id='spnCloseControl' visible='false'/></td>
	</tr>	
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCloseControl'
						Container='spnCloseControl'
						Type='cCloseWindow' />
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close Window'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CloseWindow'>
							<Parameters>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>			
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='ImportedFile' DataObjectDefinitionKey='ImportedFile'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ImportedFileID' PropertyKey='ImportedFileID' Value='' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SourceFileName'>
					<Control ID='ctlFileName' Container='spnFileName' Type='cLabel' />
				</DisplayProperty>			
				<DisplayProperty PropertyKey='SubmitDate'>
					<Control ID='ctlSubmitDate' Container='spnSubmitDate' Type='cLabel' Format='M/d/yyyy' />
				</DisplayProperty>			
				<DisplayProperty PropertyKey='ImportResult'>
					<Control ID='spnImportResult' Type='HtmlGenericControl' />
				</DisplayProperty>			
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='PaymentImport' DataObjectDefinitionKey='PaymentImport'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ImportedFileID' PropertyKey='ImportedFileID' Value='' />
			</Filters>
			<Sort>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='PaymentImport'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='PaymentID' ColumnHeader='Payment ID'/>
						<DisplayProperty PropertyKey='RelatedPaymentID' ColumnHeader='Related Payment ID'/>
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='Grantee Project ID'/>
						<DisplayProperty PropertyKey='CheckPaymentNumber' ColumnHeader='Check Number'/>
						<DisplayProperty PropertyKey='PaymentAmount' ColumnHeader='Payment Amount'/>
						<DisplayProperty PropertyKey='TransactionDate' Format='M/d/yyyy' ColumnHeader='Payment Date'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
