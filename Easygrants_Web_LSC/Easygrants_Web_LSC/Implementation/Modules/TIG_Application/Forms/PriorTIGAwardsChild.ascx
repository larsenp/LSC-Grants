<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<table width='800px' border='0' cellpadding='1'>
	<tr>
		<td width='200px' valign='top'>
			<b>TIG</b> <span runat='server' id='spnTIG' /><br />
			<b>Amount Awarded</b> <span runat='server' id='spnAwardAmount' /><br />
			<b>Amount Received</b> <span runat='server' id='spnReceivedAmount' />
		</td>
		<td valign='top' width='600px'>
			<b>Grant Description</b><br />
			<span runat='server' id='spnGrantDescription' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<hr style="width:100%; border:1px" />
  
  
  
  
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='PriorTIGAwards' Key='PriorTIGAwards'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LegacyGrantID'>
					<Control ID='spnTIG'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='TotalPayment.AwardAmount' Format='$0,#'>
					<Control ID='spnAwardAmount'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='TotalPayment.PaymentAmount' Format='$0,#'>
					<Control ID='spnReceivedAmount'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscGranteeProjectHtml.CommentsUpdated' HtmlEncode='False'>
					<Control ID='lblGrantDescription'
						Container='spnGrantDescription'
						Type='cLabel' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
    </ModuleSection>
  </span>