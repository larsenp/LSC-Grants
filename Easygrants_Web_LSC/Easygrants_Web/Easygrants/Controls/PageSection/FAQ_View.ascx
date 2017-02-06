<%@ Control Language="vb" AutoEventWireup="True" CodeBehind="FAQ_View.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cFAQ_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br>
<asp:Panel runat="server" ID="Available">
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server' ID="Table1" >
	<tr>
		<td width='2%'><b><span id="spnRowNumber" runat='server'/></b></td>
		<td><b><span id="spnQuestion" runat='server'/></b></td>
	</tr>
	<tr>
		<td width='2%'>&nbsp;</td>
		<td><span id="spnAnswer" runat='server'/></td>
	</tr>
		
</table>
</asp:Panel>
<asp:Panel runat="server" ID="NotAvailable">
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server' id='Table2'>
		<tr>
			<td><span runat='server' id='spnDataList'>Frequently Asked Questions Not Available</span>
			</td>
		</tr>
	</table>
</asp:Panel>


<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
<!-- End Embedded XML -->
	<ModuleSection>
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='FAQ' Key='FAQ'>		
			<DisplayProperties>
				<%--
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlRowNumber'
						Container='spnRowNumber'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>
				--%>
				<DisplayProperty PropertyKey='Question'>
					<Control ID='ctlQuestion'
						Container='spnQuestion'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='Answer'>
					<Control ID='ctlAnswer'
						Container='spnAnswer'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>	
	</ModuleSection>
</span>